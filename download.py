#!/usr/local/bin/python
# -*- coding: utf-8 -*-
from ftplib import FTP as FTP
import os
import os.path
import sys

class secretDownload( object ):

    def __init__( self , config ):

        self.config = config
        self.path = self.config['localPath']
        self.bufsize = 1024

        self.ftp = FTP()
        #self.ftp.set_debuglevel(2)

        try:
            self.ftp.connect(self.config['host'],self.config['port'], 600)
            print( 'success' )
        except Exception as  e:
            print ( sys.stderr, "conncet failed - %s" % e )
        else:
            try:
                self.ftp.login(self.config['user'],self.config['password'])
                print('login success')
            except Exception as e:
                print ( sys.stderr, 'login failed - %s' % e )
            else:
                print( 'return 1' )


        self.mkdir()

        return


    def  mkdir( self, relPath ='' ):
        if not os.path.exists( os.path.join(self.path,relPath) ):
            os.mkdir( os.path.join(self.path,relPath) )

        return

    def  listFile( self, relPath = '' ):

        return self.ftp.mlsd(path= os.path.join(self.config['path'],relPath)  )



    def writeFile( self, path , subpath , filename ):

        print( path )
        print( filename )
        fp = open( os.path.join(self.path ,subpath, filename ) , 'wb' ).write
        self.ftp.retrbinary( 'RETR %s' % os.path.join( self.config['path'] ,subpath, filename ) , fp , self.bufsize )
        #self.ftp.set_debuglevel( 8 )
        return



    def  download( self ):

        fileList = self.listFile()
        for f in fileList:
            if f[0] != '.' :
                if f[1]['type'] == 'dir':
                    for ff in self.listFile( f[0] ) :
                        if ff[0] != '.':
                            self.mkdir( f[0] )
                            print( 'sub path' )
                            self.writeFile( os.path.join( self.path, f[0]) ,f[0], ff[0] )

                elif f[1]['type'] == 'file':

                    self.writeFile( self.path, '', f[0] )

        self.ftp.quit()





if __name__ == '__main__':

    config = {'host':'ftp.dolby.co.uk',
                'port':21,
                'user':'drcadmin',
                'password':'6wa5ucrE',
                'path':'/FTPFiles/Private/dolbyrootcertificates/SHA256/China',
                'localPath' : 'dolby'
                }

    sd = secretDownload( config )
    sd.download()

    print( "ftp down OK" )
