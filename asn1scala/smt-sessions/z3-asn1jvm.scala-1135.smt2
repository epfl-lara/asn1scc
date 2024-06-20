; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32142 () Bool)

(assert start!32142)

(declare-fun b!159089 () Bool)

(declare-fun res!132789 () Bool)

(declare-fun e!108521 () Bool)

(assert (=> b!159089 (=> res!132789 e!108521)))

(declare-fun lt!250994 () (_ BitVec 32))

(assert (=> b!159089 (= res!132789 (bvsle lt!250994 #b00000000000000000000000000000000))))

(declare-fun b!159090 () Bool)

(assert (=> b!159090 (= e!108521 true)))

(declare-datatypes ((array!7547 0))(
  ( (array!7548 (arr!4340 (Array (_ BitVec 32) (_ BitVec 8))) (size!3419 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6006 0))(
  ( (BitStream!6007 (buf!3877 array!7547) (currentByte!7102 (_ BitVec 32)) (currentBit!7097 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6006)

(declare-datatypes ((Unit!10767 0))(
  ( (Unit!10768) )
))
(declare-datatypes ((tuple3!740 0))(
  ( (tuple3!741 (_1!7718 Unit!10767) (_2!7718 (_ BitVec 8)) (_3!487 BitStream!6006)) )
))
(declare-fun lt!250993 () tuple3!740)

(declare-fun lt!250991 () array!7547)

(declare-fun lt!250997 () (_ BitVec 8))

(declare-fun lt!251001 () (_ BitVec 8))

(declare-fun arrayRangesEq!470 (array!7547 array!7547 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159090 (arrayRangesEq!470 lt!250991 (array!7548 (store (store (store (arr!4340 (buf!3877 thiss!1602)) (currentByte!7102 thiss!1602) lt!250997) (currentByte!7102 thiss!1602) lt!251001) (currentByte!7102 (_3!487 lt!250993)) (select (arr!4340 (buf!3877 (_3!487 lt!250993))) (currentByte!7102 (_3!487 lt!250993)))) (size!3419 (buf!3877 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7102 (_3!487 lt!250993)))))

(declare-fun lt!250995 () Unit!10767)

(declare-fun arrayUpdatedAtPrefixLemma!78 (array!7547 (_ BitVec 32) (_ BitVec 8)) Unit!10767)

(assert (=> b!159090 (= lt!250995 (arrayUpdatedAtPrefixLemma!78 lt!250991 (currentByte!7102 (_3!487 lt!250993)) (select (arr!4340 (buf!3877 (_3!487 lt!250993))) (currentByte!7102 (_3!487 lt!250993)))))))

(assert (=> b!159090 (arrayRangesEq!470 (buf!3877 thiss!1602) (array!7548 (store (arr!4340 (buf!3877 thiss!1602)) (currentByte!7102 (_3!487 lt!250993)) (select (arr!4340 (buf!3877 (_3!487 lt!250993))) (currentByte!7102 (_3!487 lt!250993)))) (size!3419 (buf!3877 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7102 (_3!487 lt!250993)))))

(declare-fun lt!251000 () Unit!10767)

(assert (=> b!159090 (= lt!251000 (arrayUpdatedAtPrefixLemma!78 (buf!3877 thiss!1602) (currentByte!7102 (_3!487 lt!250993)) (select (arr!4340 (buf!3877 (_3!487 lt!250993))) (currentByte!7102 (_3!487 lt!250993)))))))

(declare-fun b!159091 () Bool)

(declare-fun e!108525 () Bool)

(assert (=> b!159091 (= e!108525 (not e!108521))))

(declare-fun res!132791 () Bool)

(assert (=> b!159091 (=> res!132791 e!108521)))

(assert (=> b!159091 (= res!132791 (not (arrayRangesEq!470 (buf!3877 thiss!1602) lt!250991 #b00000000000000000000000000000000 (bvsub (currentByte!7102 (_3!487 lt!250993)) #b00000000000000000000000000000001))))))

(declare-fun lt!250998 () (_ BitVec 8))

(assert (=> b!159091 (arrayRangesEq!470 (buf!3877 thiss!1602) (array!7548 (store (arr!4340 (buf!3877 thiss!1602)) (bvsub (currentByte!7102 (_3!487 lt!250993)) #b00000000000000000000000000000001) lt!250998) (size!3419 (buf!3877 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7102 (_3!487 lt!250993)) #b00000000000000000000000000000001))))

(declare-fun lt!250992 () Unit!10767)

(assert (=> b!159091 (= lt!250992 (arrayUpdatedAtPrefixLemma!78 (buf!3877 thiss!1602) (bvsub (currentByte!7102 (_3!487 lt!250993)) #b00000000000000000000000000000001) lt!250998))))

(assert (=> b!159091 (= lt!250998 (select (arr!4340 (buf!3877 (_3!487 lt!250993))) (bvsub (currentByte!7102 (_3!487 lt!250993)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250990 () (_ BitVec 32))

(declare-fun lt!250999 () (_ BitVec 32))

(declare-fun lt!250996 () (_ BitVec 8))

(declare-fun Unit!10769 () Unit!10767)

(declare-fun Unit!10770 () Unit!10767)

(assert (=> b!159091 (= lt!250993 (ite (bvsgt lt!250994 #b00000000000000000000000000000000) (let ((bdg!9293 ((_ extract 7 0) (bvnot lt!250999)))) (let ((bdg!9294 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4340 (buf!3877 thiss!1602)) (currentByte!7102 thiss!1602) lt!250997) (currentByte!7102 thiss!1602) lt!251001) (bvadd #b00000000000000000000000000000001 (currentByte!7102 thiss!1602)))) ((_ sign_extend 24) bdg!9293))))) (tuple3!741 Unit!10769 bdg!9293 (BitStream!6007 (array!7548 (store (arr!4340 (array!7548 (store (arr!4340 lt!250991) (bvadd #b00000000000000000000000000000001 (currentByte!7102 thiss!1602)) bdg!9294) (size!3419 lt!250991))) (bvadd #b00000000000000000000000000000001 (currentByte!7102 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9294) (bvshl ((_ sign_extend 24) v!222) lt!250990)))) (size!3419 (array!7548 (store (arr!4340 lt!250991) (bvadd #b00000000000000000000000000000001 (currentByte!7102 thiss!1602)) bdg!9294) (size!3419 lt!250991)))) (bvadd #b00000000000000000000000000000001 (currentByte!7102 thiss!1602)) (currentBit!7097 thiss!1602))))) (tuple3!741 Unit!10770 lt!250996 (BitStream!6007 lt!250991 (bvadd #b00000000000000000000000000000001 (currentByte!7102 thiss!1602)) (currentBit!7097 thiss!1602)))))))

(declare-fun e!108524 () Bool)

(assert (=> b!159091 e!108524))

(declare-fun res!132790 () Bool)

(assert (=> b!159091 (=> res!132790 e!108524)))

(assert (=> b!159091 (= res!132790 (bvsge (currentByte!7102 thiss!1602) (size!3419 (buf!3877 thiss!1602))))))

(assert (=> b!159091 (= lt!250991 (array!7548 (store (store (arr!4340 (buf!3877 thiss!1602)) (currentByte!7102 thiss!1602) lt!250997) (currentByte!7102 thiss!1602) lt!251001) (size!3419 (buf!3877 thiss!1602))))))

(assert (=> b!159091 (= lt!251001 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250997) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250994))))))

(assert (=> b!159091 (= lt!250997 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4340 (buf!3877 thiss!1602)) (currentByte!7102 thiss!1602))) lt!250999)))))

(assert (=> b!159091 (= lt!250999 ((_ sign_extend 24) lt!250996))))

(assert (=> b!159091 (= lt!250996 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250990)))))))

(assert (=> b!159091 (= lt!250990 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250994))))))

(assert (=> b!159091 (= lt!250994 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7097 thiss!1602))))))

(declare-fun res!132788 () Bool)

(assert (=> start!32142 (=> (not res!132788) (not e!108525))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32142 (= res!132788 (validate_offset_byte!0 ((_ sign_extend 32) (size!3419 (buf!3877 thiss!1602))) ((_ sign_extend 32) (currentByte!7102 thiss!1602)) ((_ sign_extend 32) (currentBit!7097 thiss!1602))))))

(assert (=> start!32142 e!108525))

(declare-fun e!108523 () Bool)

(declare-fun inv!12 (BitStream!6006) Bool)

(assert (=> start!32142 (and (inv!12 thiss!1602) e!108523)))

(assert (=> start!32142 true))

(declare-fun b!159092 () Bool)

(declare-fun array_inv!3166 (array!7547) Bool)

(assert (=> b!159092 (= e!108523 (array_inv!3166 (buf!3877 thiss!1602)))))

(declare-fun b!159093 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159093 (= e!108524 (byteRangesEq!0 (select (arr!4340 (buf!3877 thiss!1602)) (currentByte!7102 thiss!1602)) lt!251001 #b00000000000000000000000000000000 (currentBit!7097 thiss!1602)))))

(assert (= (and start!32142 res!132788) b!159091))

(assert (= (and b!159091 (not res!132790)) b!159093))

(assert (= (and b!159091 (not res!132791)) b!159089))

(assert (= (and b!159089 (not res!132789)) b!159090))

(assert (= start!32142 b!159092))

(declare-fun m!250229 () Bool)

(assert (=> b!159091 m!250229))

(declare-fun m!250231 () Bool)

(assert (=> b!159091 m!250231))

(declare-fun m!250233 () Bool)

(assert (=> b!159091 m!250233))

(declare-fun m!250235 () Bool)

(assert (=> b!159091 m!250235))

(declare-fun m!250237 () Bool)

(assert (=> b!159091 m!250237))

(declare-fun m!250239 () Bool)

(assert (=> b!159091 m!250239))

(declare-fun m!250241 () Bool)

(assert (=> b!159091 m!250241))

(declare-fun m!250243 () Bool)

(assert (=> b!159091 m!250243))

(declare-fun m!250245 () Bool)

(assert (=> b!159091 m!250245))

(declare-fun m!250247 () Bool)

(assert (=> b!159091 m!250247))

(declare-fun m!250249 () Bool)

(assert (=> b!159091 m!250249))

(declare-fun m!250251 () Bool)

(assert (=> b!159091 m!250251))

(declare-fun m!250253 () Bool)

(assert (=> b!159092 m!250253))

(declare-fun m!250255 () Bool)

(assert (=> start!32142 m!250255))

(declare-fun m!250257 () Bool)

(assert (=> start!32142 m!250257))

(assert (=> b!159093 m!250245))

(assert (=> b!159093 m!250245))

(declare-fun m!250259 () Bool)

(assert (=> b!159093 m!250259))

(declare-fun m!250261 () Bool)

(assert (=> b!159090 m!250261))

(declare-fun m!250263 () Bool)

(assert (=> b!159090 m!250263))

(declare-fun m!250265 () Bool)

(assert (=> b!159090 m!250265))

(assert (=> b!159090 m!250251))

(assert (=> b!159090 m!250241))

(declare-fun m!250267 () Bool)

(assert (=> b!159090 m!250267))

(declare-fun m!250269 () Bool)

(assert (=> b!159090 m!250269))

(declare-fun m!250271 () Bool)

(assert (=> b!159090 m!250271))

(assert (=> b!159090 m!250269))

(assert (=> b!159090 m!250269))

(declare-fun m!250273 () Bool)

(assert (=> b!159090 m!250273))

(check-sat (not b!159090) (not start!32142) (not b!159091) (not b!159093) (not b!159092))
