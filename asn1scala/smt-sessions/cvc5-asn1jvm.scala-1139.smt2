; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32206 () Bool)

(assert start!32206)

(declare-fun b!159311 () Bool)

(declare-fun e!108745 () Bool)

(declare-datatypes ((array!7572 0))(
  ( (array!7573 (arr!4351 (Array (_ BitVec 32) (_ BitVec 8))) (size!3430 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6028 0))(
  ( (BitStream!6029 (buf!3888 array!7572) (currentByte!7116 (_ BitVec 32)) (currentBit!7111 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6028)

(declare-fun lt!251424 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159311 (= e!108745 (byteRangesEq!0 (select (arr!4351 (buf!3888 thiss!1602)) (currentByte!7116 thiss!1602)) lt!251424 #b00000000000000000000000000000000 (currentBit!7111 thiss!1602)))))

(declare-fun b!159312 () Bool)

(declare-fun e!108747 () Bool)

(declare-datatypes ((Unit!10811 0))(
  ( (Unit!10812) )
))
(declare-datatypes ((tuple3!762 0))(
  ( (tuple3!763 (_1!7729 Unit!10811) (_2!7729 (_ BitVec 8)) (_3!498 BitStream!6028)) )
))
(declare-fun lt!251429 () tuple3!762)

(assert (=> b!159312 (= e!108747 (or (bvsgt #b00000000000000000000000000000000 (currentByte!7116 thiss!1602)) (bvsle (size!3430 (buf!3888 thiss!1602)) (size!3430 (buf!3888 (_3!498 lt!251429))))))))

(declare-fun arrayRangesEq!481 (array!7572 array!7572 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159312 (arrayRangesEq!481 (buf!3888 thiss!1602) (buf!3888 (_3!498 lt!251429)) #b00000000000000000000000000000000 (bvsub (currentByte!7116 (_3!498 lt!251429)) #b00000000000000000000000000000001))))

(declare-fun lt!251421 () Unit!10811)

(declare-fun lt!251423 () array!7572)

(declare-fun arrayRangesEqTransitive!124 (array!7572 array!7572 array!7572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10811)

(assert (=> b!159312 (= lt!251421 (arrayRangesEqTransitive!124 (buf!3888 thiss!1602) lt!251423 (buf!3888 (_3!498 lt!251429)) #b00000000000000000000000000000000 (bvsub (currentByte!7116 (_3!498 lt!251429)) #b00000000000000000000000000000001) (currentByte!7116 (_3!498 lt!251429))))))

(declare-fun lt!251428 () (_ BitVec 8))

(assert (=> b!159312 (arrayRangesEq!481 lt!251423 (array!7573 (store (store (store (arr!4351 (buf!3888 thiss!1602)) (currentByte!7116 thiss!1602) lt!251428) (currentByte!7116 thiss!1602) lt!251424) (currentByte!7116 (_3!498 lt!251429)) (select (arr!4351 (buf!3888 (_3!498 lt!251429))) (currentByte!7116 (_3!498 lt!251429)))) (size!3430 (buf!3888 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7116 (_3!498 lt!251429)))))

(declare-fun lt!251422 () Unit!10811)

(declare-fun arrayUpdatedAtPrefixLemma!89 (array!7572 (_ BitVec 32) (_ BitVec 8)) Unit!10811)

(assert (=> b!159312 (= lt!251422 (arrayUpdatedAtPrefixLemma!89 lt!251423 (currentByte!7116 (_3!498 lt!251429)) (select (arr!4351 (buf!3888 (_3!498 lt!251429))) (currentByte!7116 (_3!498 lt!251429)))))))

(assert (=> b!159312 (arrayRangesEq!481 (buf!3888 thiss!1602) (array!7573 (store (arr!4351 (buf!3888 thiss!1602)) (currentByte!7116 (_3!498 lt!251429)) (select (arr!4351 (buf!3888 (_3!498 lt!251429))) (currentByte!7116 (_3!498 lt!251429)))) (size!3430 (buf!3888 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7116 (_3!498 lt!251429)))))

(declare-fun lt!251427 () Unit!10811)

(assert (=> b!159312 (= lt!251427 (arrayUpdatedAtPrefixLemma!89 (buf!3888 thiss!1602) (currentByte!7116 (_3!498 lt!251429)) (select (arr!4351 (buf!3888 (_3!498 lt!251429))) (currentByte!7116 (_3!498 lt!251429)))))))

(declare-fun res!132978 () Bool)

(declare-fun e!108744 () Bool)

(assert (=> start!32206 (=> (not res!132978) (not e!108744))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32206 (= res!132978 (validate_offset_byte!0 ((_ sign_extend 32) (size!3430 (buf!3888 thiss!1602))) ((_ sign_extend 32) (currentByte!7116 thiss!1602)) ((_ sign_extend 32) (currentBit!7111 thiss!1602))))))

(assert (=> start!32206 e!108744))

(declare-fun e!108746 () Bool)

(declare-fun inv!12 (BitStream!6028) Bool)

(assert (=> start!32206 (and (inv!12 thiss!1602) e!108746)))

(assert (=> start!32206 true))

(declare-fun b!159313 () Bool)

(declare-fun res!132979 () Bool)

(assert (=> b!159313 (=> res!132979 e!108747)))

(declare-fun lt!251432 () (_ BitVec 32))

(assert (=> b!159313 (= res!132979 (bvsle lt!251432 #b00000000000000000000000000000000))))

(declare-fun b!159314 () Bool)

(declare-fun array_inv!3177 (array!7572) Bool)

(assert (=> b!159314 (= e!108746 (array_inv!3177 (buf!3888 thiss!1602)))))

(declare-fun b!159315 () Bool)

(assert (=> b!159315 (= e!108744 (not e!108747))))

(declare-fun res!132980 () Bool)

(assert (=> b!159315 (=> res!132980 e!108747)))

(assert (=> b!159315 (= res!132980 (not (arrayRangesEq!481 (buf!3888 thiss!1602) lt!251423 #b00000000000000000000000000000000 (bvsub (currentByte!7116 (_3!498 lt!251429)) #b00000000000000000000000000000001))))))

(declare-fun lt!251430 () (_ BitVec 8))

(assert (=> b!159315 (arrayRangesEq!481 (buf!3888 thiss!1602) (array!7573 (store (arr!4351 (buf!3888 thiss!1602)) (bvsub (currentByte!7116 (_3!498 lt!251429)) #b00000000000000000000000000000001) lt!251430) (size!3430 (buf!3888 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7116 (_3!498 lt!251429)) #b00000000000000000000000000000001))))

(declare-fun lt!251431 () Unit!10811)

(assert (=> b!159315 (= lt!251431 (arrayUpdatedAtPrefixLemma!89 (buf!3888 thiss!1602) (bvsub (currentByte!7116 (_3!498 lt!251429)) #b00000000000000000000000000000001) lt!251430))))

(assert (=> b!159315 (= lt!251430 (select (arr!4351 (buf!3888 (_3!498 lt!251429))) (bvsub (currentByte!7116 (_3!498 lt!251429)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251426 () (_ BitVec 32))

(declare-fun lt!251425 () (_ BitVec 32))

(declare-fun lt!251433 () (_ BitVec 8))

(declare-fun Unit!10813 () Unit!10811)

(declare-fun Unit!10814 () Unit!10811)

(assert (=> b!159315 (= lt!251429 (ite (bvsgt lt!251432 #b00000000000000000000000000000000) (let ((bdg!9350 ((_ extract 7 0) (bvnot lt!251426)))) (let ((bdg!9351 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4351 (buf!3888 thiss!1602)) (currentByte!7116 thiss!1602) lt!251428) (currentByte!7116 thiss!1602) lt!251424) (bvadd #b00000000000000000000000000000001 (currentByte!7116 thiss!1602)))) ((_ sign_extend 24) bdg!9350))))) (tuple3!763 Unit!10813 bdg!9350 (BitStream!6029 (array!7573 (store (arr!4351 (array!7573 (store (arr!4351 lt!251423) (bvadd #b00000000000000000000000000000001 (currentByte!7116 thiss!1602)) bdg!9351) (size!3430 lt!251423))) (bvadd #b00000000000000000000000000000001 (currentByte!7116 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9351) (bvshl ((_ sign_extend 24) v!222) lt!251425)))) (size!3430 (array!7573 (store (arr!4351 lt!251423) (bvadd #b00000000000000000000000000000001 (currentByte!7116 thiss!1602)) bdg!9351) (size!3430 lt!251423)))) (bvadd #b00000000000000000000000000000001 (currentByte!7116 thiss!1602)) (currentBit!7111 thiss!1602))))) (tuple3!763 Unit!10814 lt!251433 (BitStream!6029 lt!251423 (bvadd #b00000000000000000000000000000001 (currentByte!7116 thiss!1602)) (currentBit!7111 thiss!1602)))))))

(assert (=> b!159315 e!108745))

(declare-fun res!132977 () Bool)

(assert (=> b!159315 (=> res!132977 e!108745)))

(assert (=> b!159315 (= res!132977 (bvsge (currentByte!7116 thiss!1602) (size!3430 (buf!3888 thiss!1602))))))

(assert (=> b!159315 (= lt!251423 (array!7573 (store (store (arr!4351 (buf!3888 thiss!1602)) (currentByte!7116 thiss!1602) lt!251428) (currentByte!7116 thiss!1602) lt!251424) (size!3430 (buf!3888 thiss!1602))))))

(assert (=> b!159315 (= lt!251424 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251428) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251432))))))

(assert (=> b!159315 (= lt!251428 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4351 (buf!3888 thiss!1602)) (currentByte!7116 thiss!1602))) lt!251426)))))

(assert (=> b!159315 (= lt!251426 ((_ sign_extend 24) lt!251433))))

(assert (=> b!159315 (= lt!251433 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251425)))))))

(assert (=> b!159315 (= lt!251425 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251432))))))

(assert (=> b!159315 (= lt!251432 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7111 thiss!1602))))))

(assert (= (and start!32206 res!132978) b!159315))

(assert (= (and b!159315 (not res!132977)) b!159311))

(assert (= (and b!159315 (not res!132980)) b!159313))

(assert (= (and b!159313 (not res!132979)) b!159312))

(assert (= start!32206 b!159314))

(declare-fun m!250873 () Bool)

(assert (=> start!32206 m!250873))

(declare-fun m!250875 () Bool)

(assert (=> start!32206 m!250875))

(declare-fun m!250877 () Bool)

(assert (=> b!159312 m!250877))

(declare-fun m!250879 () Bool)

(assert (=> b!159312 m!250879))

(declare-fun m!250881 () Bool)

(assert (=> b!159312 m!250881))

(declare-fun m!250883 () Bool)

(assert (=> b!159312 m!250883))

(declare-fun m!250885 () Bool)

(assert (=> b!159312 m!250885))

(declare-fun m!250887 () Bool)

(assert (=> b!159312 m!250887))

(declare-fun m!250889 () Bool)

(assert (=> b!159312 m!250889))

(declare-fun m!250891 () Bool)

(assert (=> b!159312 m!250891))

(assert (=> b!159312 m!250881))

(assert (=> b!159312 m!250881))

(declare-fun m!250893 () Bool)

(assert (=> b!159312 m!250893))

(declare-fun m!250895 () Bool)

(assert (=> b!159312 m!250895))

(declare-fun m!250897 () Bool)

(assert (=> b!159312 m!250897))

(declare-fun m!250899 () Bool)

(assert (=> b!159314 m!250899))

(declare-fun m!250901 () Bool)

(assert (=> b!159315 m!250901))

(declare-fun m!250903 () Bool)

(assert (=> b!159315 m!250903))

(declare-fun m!250905 () Bool)

(assert (=> b!159315 m!250905))

(declare-fun m!250907 () Bool)

(assert (=> b!159315 m!250907))

(declare-fun m!250909 () Bool)

(assert (=> b!159315 m!250909))

(declare-fun m!250911 () Bool)

(assert (=> b!159315 m!250911))

(assert (=> b!159315 m!250895))

(declare-fun m!250913 () Bool)

(assert (=> b!159315 m!250913))

(declare-fun m!250915 () Bool)

(assert (=> b!159315 m!250915))

(assert (=> b!159315 m!250887))

(declare-fun m!250917 () Bool)

(assert (=> b!159315 m!250917))

(declare-fun m!250919 () Bool)

(assert (=> b!159315 m!250919))

(assert (=> b!159311 m!250917))

(assert (=> b!159311 m!250917))

(declare-fun m!250921 () Bool)

(assert (=> b!159311 m!250921))

(push 1)

(assert (not b!159314))

(assert (not start!32206))

(assert (not b!159315))

(assert (not b!159312))

(assert (not b!159311))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

