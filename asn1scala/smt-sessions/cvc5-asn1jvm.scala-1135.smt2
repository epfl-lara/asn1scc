; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32140 () Bool)

(assert start!32140)

(declare-fun b!159075 () Bool)

(declare-fun res!132778 () Bool)

(declare-fun e!108508 () Bool)

(assert (=> b!159075 (=> res!132778 e!108508)))

(declare-fun lt!250955 () (_ BitVec 32))

(assert (=> b!159075 (= res!132778 (bvsle lt!250955 #b00000000000000000000000000000000))))

(declare-fun b!159076 () Bool)

(declare-fun e!108510 () Bool)

(declare-datatypes ((array!7545 0))(
  ( (array!7546 (arr!4339 (Array (_ BitVec 32) (_ BitVec 8))) (size!3418 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6004 0))(
  ( (BitStream!6005 (buf!3876 array!7545) (currentByte!7101 (_ BitVec 32)) (currentBit!7096 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6004)

(declare-fun lt!250965 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159076 (= e!108510 (byteRangesEq!0 (select (arr!4339 (buf!3876 thiss!1602)) (currentByte!7101 thiss!1602)) lt!250965 #b00000000000000000000000000000000 (currentBit!7096 thiss!1602)))))

(declare-fun b!159077 () Bool)

(declare-fun e!108509 () Bool)

(assert (=> b!159077 (= e!108509 (not e!108508))))

(declare-fun res!132779 () Bool)

(assert (=> b!159077 (=> res!132779 e!108508)))

(declare-fun lt!250963 () array!7545)

(declare-datatypes ((Unit!10763 0))(
  ( (Unit!10764) )
))
(declare-datatypes ((tuple3!738 0))(
  ( (tuple3!739 (_1!7717 Unit!10763) (_2!7717 (_ BitVec 8)) (_3!486 BitStream!6004)) )
))
(declare-fun lt!250962 () tuple3!738)

(declare-fun arrayRangesEq!469 (array!7545 array!7545 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159077 (= res!132779 (not (arrayRangesEq!469 (buf!3876 thiss!1602) lt!250963 #b00000000000000000000000000000000 (bvsub (currentByte!7101 (_3!486 lt!250962)) #b00000000000000000000000000000001))))))

(declare-fun lt!250959 () (_ BitVec 8))

(assert (=> b!159077 (arrayRangesEq!469 (buf!3876 thiss!1602) (array!7546 (store (arr!4339 (buf!3876 thiss!1602)) (bvsub (currentByte!7101 (_3!486 lt!250962)) #b00000000000000000000000000000001) lt!250959) (size!3418 (buf!3876 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7101 (_3!486 lt!250962)) #b00000000000000000000000000000001))))

(declare-fun lt!250960 () Unit!10763)

(declare-fun arrayUpdatedAtPrefixLemma!77 (array!7545 (_ BitVec 32) (_ BitVec 8)) Unit!10763)

(assert (=> b!159077 (= lt!250960 (arrayUpdatedAtPrefixLemma!77 (buf!3876 thiss!1602) (bvsub (currentByte!7101 (_3!486 lt!250962)) #b00000000000000000000000000000001) lt!250959))))

(assert (=> b!159077 (= lt!250959 (select (arr!4339 (buf!3876 (_3!486 lt!250962))) (bvsub (currentByte!7101 (_3!486 lt!250962)) #b00000000000000000000000000000001)))))

(declare-fun lt!250956 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250957 () (_ BitVec 8))

(declare-fun lt!250954 () (_ BitVec 32))

(declare-fun lt!250958 () (_ BitVec 32))

(declare-fun Unit!10765 () Unit!10763)

(declare-fun Unit!10766 () Unit!10763)

(assert (=> b!159077 (= lt!250962 (ite (bvsgt lt!250955 #b00000000000000000000000000000000) (let ((bdg!9293 ((_ extract 7 0) (bvnot lt!250954)))) (let ((bdg!9294 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4339 (buf!3876 thiss!1602)) (currentByte!7101 thiss!1602) lt!250956) (currentByte!7101 thiss!1602) lt!250965) (bvadd #b00000000000000000000000000000001 (currentByte!7101 thiss!1602)))) ((_ sign_extend 24) bdg!9293))))) (tuple3!739 Unit!10765 bdg!9293 (BitStream!6005 (array!7546 (store (arr!4339 (array!7546 (store (arr!4339 lt!250963) (bvadd #b00000000000000000000000000000001 (currentByte!7101 thiss!1602)) bdg!9294) (size!3418 lt!250963))) (bvadd #b00000000000000000000000000000001 (currentByte!7101 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9294) (bvshl ((_ sign_extend 24) v!222) lt!250958)))) (size!3418 (array!7546 (store (arr!4339 lt!250963) (bvadd #b00000000000000000000000000000001 (currentByte!7101 thiss!1602)) bdg!9294) (size!3418 lt!250963)))) (bvadd #b00000000000000000000000000000001 (currentByte!7101 thiss!1602)) (currentBit!7096 thiss!1602))))) (tuple3!739 Unit!10766 lt!250957 (BitStream!6005 lt!250963 (bvadd #b00000000000000000000000000000001 (currentByte!7101 thiss!1602)) (currentBit!7096 thiss!1602)))))))

(assert (=> b!159077 e!108510))

(declare-fun res!132776 () Bool)

(assert (=> b!159077 (=> res!132776 e!108510)))

(assert (=> b!159077 (= res!132776 (bvsge (currentByte!7101 thiss!1602) (size!3418 (buf!3876 thiss!1602))))))

(assert (=> b!159077 (= lt!250963 (array!7546 (store (store (arr!4339 (buf!3876 thiss!1602)) (currentByte!7101 thiss!1602) lt!250956) (currentByte!7101 thiss!1602) lt!250965) (size!3418 (buf!3876 thiss!1602))))))

(assert (=> b!159077 (= lt!250965 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250956) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250955))))))

(assert (=> b!159077 (= lt!250956 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4339 (buf!3876 thiss!1602)) (currentByte!7101 thiss!1602))) lt!250954)))))

(assert (=> b!159077 (= lt!250954 ((_ sign_extend 24) lt!250957))))

(assert (=> b!159077 (= lt!250957 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250958)))))))

(assert (=> b!159077 (= lt!250958 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250955))))))

(assert (=> b!159077 (= lt!250955 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7096 thiss!1602))))))

(declare-fun b!159078 () Bool)

(declare-fun e!108506 () Bool)

(declare-fun array_inv!3165 (array!7545) Bool)

(assert (=> b!159078 (= e!108506 (array_inv!3165 (buf!3876 thiss!1602)))))

(declare-fun b!159074 () Bool)

(assert (=> b!159074 (= e!108508 true)))

(assert (=> b!159074 (arrayRangesEq!469 lt!250963 (array!7546 (store (store (store (arr!4339 (buf!3876 thiss!1602)) (currentByte!7101 thiss!1602) lt!250956) (currentByte!7101 thiss!1602) lt!250965) (currentByte!7101 (_3!486 lt!250962)) (select (arr!4339 (buf!3876 (_3!486 lt!250962))) (currentByte!7101 (_3!486 lt!250962)))) (size!3418 (buf!3876 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7101 (_3!486 lt!250962)))))

(declare-fun lt!250964 () Unit!10763)

(assert (=> b!159074 (= lt!250964 (arrayUpdatedAtPrefixLemma!77 lt!250963 (currentByte!7101 (_3!486 lt!250962)) (select (arr!4339 (buf!3876 (_3!486 lt!250962))) (currentByte!7101 (_3!486 lt!250962)))))))

(assert (=> b!159074 (arrayRangesEq!469 (buf!3876 thiss!1602) (array!7546 (store (arr!4339 (buf!3876 thiss!1602)) (currentByte!7101 (_3!486 lt!250962)) (select (arr!4339 (buf!3876 (_3!486 lt!250962))) (currentByte!7101 (_3!486 lt!250962)))) (size!3418 (buf!3876 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7101 (_3!486 lt!250962)))))

(declare-fun lt!250961 () Unit!10763)

(assert (=> b!159074 (= lt!250961 (arrayUpdatedAtPrefixLemma!77 (buf!3876 thiss!1602) (currentByte!7101 (_3!486 lt!250962)) (select (arr!4339 (buf!3876 (_3!486 lt!250962))) (currentByte!7101 (_3!486 lt!250962)))))))

(declare-fun res!132777 () Bool)

(assert (=> start!32140 (=> (not res!132777) (not e!108509))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32140 (= res!132777 (validate_offset_byte!0 ((_ sign_extend 32) (size!3418 (buf!3876 thiss!1602))) ((_ sign_extend 32) (currentByte!7101 thiss!1602)) ((_ sign_extend 32) (currentBit!7096 thiss!1602))))))

(assert (=> start!32140 e!108509))

(declare-fun inv!12 (BitStream!6004) Bool)

(assert (=> start!32140 (and (inv!12 thiss!1602) e!108506)))

(assert (=> start!32140 true))

(assert (= (and start!32140 res!132777) b!159077))

(assert (= (and b!159077 (not res!132776)) b!159076))

(assert (= (and b!159077 (not res!132779)) b!159075))

(assert (= (and b!159075 (not res!132778)) b!159074))

(assert (= start!32140 b!159078))

(declare-fun m!250183 () Bool)

(assert (=> b!159078 m!250183))

(declare-fun m!250185 () Bool)

(assert (=> b!159074 m!250185))

(declare-fun m!250187 () Bool)

(assert (=> b!159074 m!250187))

(declare-fun m!250189 () Bool)

(assert (=> b!159074 m!250189))

(declare-fun m!250191 () Bool)

(assert (=> b!159074 m!250191))

(declare-fun m!250193 () Bool)

(assert (=> b!159074 m!250193))

(assert (=> b!159074 m!250189))

(declare-fun m!250195 () Bool)

(assert (=> b!159074 m!250195))

(declare-fun m!250197 () Bool)

(assert (=> b!159074 m!250197))

(declare-fun m!250199 () Bool)

(assert (=> b!159074 m!250199))

(declare-fun m!250201 () Bool)

(assert (=> b!159074 m!250201))

(assert (=> b!159074 m!250189))

(declare-fun m!250203 () Bool)

(assert (=> b!159077 m!250203))

(assert (=> b!159077 m!250187))

(declare-fun m!250205 () Bool)

(assert (=> b!159077 m!250205))

(declare-fun m!250207 () Bool)

(assert (=> b!159077 m!250207))

(declare-fun m!250209 () Bool)

(assert (=> b!159077 m!250209))

(declare-fun m!250211 () Bool)

(assert (=> b!159077 m!250211))

(declare-fun m!250213 () Bool)

(assert (=> b!159077 m!250213))

(assert (=> b!159077 m!250197))

(declare-fun m!250215 () Bool)

(assert (=> b!159077 m!250215))

(declare-fun m!250217 () Bool)

(assert (=> b!159077 m!250217))

(declare-fun m!250219 () Bool)

(assert (=> b!159077 m!250219))

(declare-fun m!250221 () Bool)

(assert (=> b!159077 m!250221))

(assert (=> b!159076 m!250215))

(assert (=> b!159076 m!250215))

(declare-fun m!250223 () Bool)

(assert (=> b!159076 m!250223))

(declare-fun m!250225 () Bool)

(assert (=> start!32140 m!250225))

(declare-fun m!250227 () Bool)

(assert (=> start!32140 m!250227))

(push 1)

(assert (not b!159074))

(assert (not start!32140))

(assert (not b!159077))

(assert (not b!159076))

(assert (not b!159078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

