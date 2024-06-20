; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32134 () Bool)

(assert start!32134)

(declare-fun b!159029 () Bool)

(declare-fun e!108462 () Bool)

(assert (=> b!159029 (= e!108462 true)))

(declare-fun lt!250850 () (_ BitVec 8))

(declare-fun lt!250857 () (_ BitVec 8))

(declare-datatypes ((array!7539 0))(
  ( (array!7540 (arr!4336 (Array (_ BitVec 32) (_ BitVec 8))) (size!3415 (_ BitVec 32))) )
))
(declare-fun lt!250852 () array!7539)

(declare-datatypes ((BitStream!5998 0))(
  ( (BitStream!5999 (buf!3873 array!7539) (currentByte!7098 (_ BitVec 32)) (currentBit!7093 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5998)

(declare-datatypes ((Unit!10751 0))(
  ( (Unit!10752) )
))
(declare-datatypes ((tuple3!732 0))(
  ( (tuple3!733 (_1!7714 Unit!10751) (_2!7714 (_ BitVec 8)) (_3!483 BitStream!5998)) )
))
(declare-fun lt!250855 () tuple3!732)

(declare-fun arrayRangesEq!466 (array!7539 array!7539 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159029 (arrayRangesEq!466 lt!250852 (array!7540 (store (store (store (arr!4336 (buf!3873 thiss!1602)) (currentByte!7098 thiss!1602) lt!250850) (currentByte!7098 thiss!1602) lt!250857) (currentByte!7098 (_3!483 lt!250855)) (select (arr!4336 (buf!3873 (_3!483 lt!250855))) (currentByte!7098 (_3!483 lt!250855)))) (size!3415 (buf!3873 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7098 (_3!483 lt!250855)))))

(declare-fun lt!250847 () Unit!10751)

(declare-fun arrayUpdatedAtPrefixLemma!74 (array!7539 (_ BitVec 32) (_ BitVec 8)) Unit!10751)

(assert (=> b!159029 (= lt!250847 (arrayUpdatedAtPrefixLemma!74 lt!250852 (currentByte!7098 (_3!483 lt!250855)) (select (arr!4336 (buf!3873 (_3!483 lt!250855))) (currentByte!7098 (_3!483 lt!250855)))))))

(assert (=> b!159029 (arrayRangesEq!466 (buf!3873 thiss!1602) (array!7540 (store (arr!4336 (buf!3873 thiss!1602)) (currentByte!7098 (_3!483 lt!250855)) (select (arr!4336 (buf!3873 (_3!483 lt!250855))) (currentByte!7098 (_3!483 lt!250855)))) (size!3415 (buf!3873 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7098 (_3!483 lt!250855)))))

(declare-fun lt!250849 () Unit!10751)

(assert (=> b!159029 (= lt!250849 (arrayUpdatedAtPrefixLemma!74 (buf!3873 thiss!1602) (currentByte!7098 (_3!483 lt!250855)) (select (arr!4336 (buf!3873 (_3!483 lt!250855))) (currentByte!7098 (_3!483 lt!250855)))))))

(declare-fun res!132742 () Bool)

(declare-fun e!108463 () Bool)

(assert (=> start!32134 (=> (not res!132742) (not e!108463))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32134 (= res!132742 (validate_offset_byte!0 ((_ sign_extend 32) (size!3415 (buf!3873 thiss!1602))) ((_ sign_extend 32) (currentByte!7098 thiss!1602)) ((_ sign_extend 32) (currentBit!7093 thiss!1602))))))

(assert (=> start!32134 e!108463))

(declare-fun e!108464 () Bool)

(declare-fun inv!12 (BitStream!5998) Bool)

(assert (=> start!32134 (and (inv!12 thiss!1602) e!108464)))

(assert (=> start!32134 true))

(declare-fun b!159030 () Bool)

(declare-fun res!132741 () Bool)

(assert (=> b!159030 (=> res!132741 e!108462)))

(declare-fun lt!250853 () (_ BitVec 32))

(assert (=> b!159030 (= res!132741 (bvsle lt!250853 #b00000000000000000000000000000000))))

(declare-fun b!159031 () Bool)

(declare-fun e!108465 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159031 (= e!108465 (byteRangesEq!0 (select (arr!4336 (buf!3873 thiss!1602)) (currentByte!7098 thiss!1602)) lt!250857 #b00000000000000000000000000000000 (currentBit!7093 thiss!1602)))))

(declare-fun b!159032 () Bool)

(assert (=> b!159032 (= e!108463 (not e!108462))))

(declare-fun res!132743 () Bool)

(assert (=> b!159032 (=> res!132743 e!108462)))

(assert (=> b!159032 (= res!132743 (not (arrayRangesEq!466 (buf!3873 thiss!1602) lt!250852 #b00000000000000000000000000000000 (bvsub (currentByte!7098 (_3!483 lt!250855)) #b00000000000000000000000000000001))))))

(declare-fun lt!250854 () (_ BitVec 8))

(assert (=> b!159032 (arrayRangesEq!466 (buf!3873 thiss!1602) (array!7540 (store (arr!4336 (buf!3873 thiss!1602)) (bvsub (currentByte!7098 (_3!483 lt!250855)) #b00000000000000000000000000000001) lt!250854) (size!3415 (buf!3873 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7098 (_3!483 lt!250855)) #b00000000000000000000000000000001))))

(declare-fun lt!250848 () Unit!10751)

(assert (=> b!159032 (= lt!250848 (arrayUpdatedAtPrefixLemma!74 (buf!3873 thiss!1602) (bvsub (currentByte!7098 (_3!483 lt!250855)) #b00000000000000000000000000000001) lt!250854))))

(assert (=> b!159032 (= lt!250854 (select (arr!4336 (buf!3873 (_3!483 lt!250855))) (bvsub (currentByte!7098 (_3!483 lt!250855)) #b00000000000000000000000000000001)))))

(declare-fun lt!250851 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250846 () (_ BitVec 32))

(declare-fun lt!250856 () (_ BitVec 32))

(declare-fun Unit!10753 () Unit!10751)

(declare-fun Unit!10754 () Unit!10751)

(assert (=> b!159032 (= lt!250855 (ite (bvsgt lt!250853 #b00000000000000000000000000000000) (let ((bdg!9279 ((_ extract 7 0) (bvnot lt!250846)))) (let ((bdg!9280 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4336 (buf!3873 thiss!1602)) (currentByte!7098 thiss!1602) lt!250850) (currentByte!7098 thiss!1602) lt!250857) (bvadd #b00000000000000000000000000000001 (currentByte!7098 thiss!1602)))) ((_ sign_extend 24) bdg!9279))))) (tuple3!733 Unit!10753 bdg!9279 (BitStream!5999 (array!7540 (store (arr!4336 (array!7540 (store (arr!4336 lt!250852) (bvadd #b00000000000000000000000000000001 (currentByte!7098 thiss!1602)) bdg!9280) (size!3415 lt!250852))) (bvadd #b00000000000000000000000000000001 (currentByte!7098 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9280) (bvshl ((_ sign_extend 24) v!222) lt!250856)))) (size!3415 (array!7540 (store (arr!4336 lt!250852) (bvadd #b00000000000000000000000000000001 (currentByte!7098 thiss!1602)) bdg!9280) (size!3415 lt!250852)))) (bvadd #b00000000000000000000000000000001 (currentByte!7098 thiss!1602)) (currentBit!7093 thiss!1602))))) (tuple3!733 Unit!10754 lt!250851 (BitStream!5999 lt!250852 (bvadd #b00000000000000000000000000000001 (currentByte!7098 thiss!1602)) (currentBit!7093 thiss!1602)))))))

(assert (=> b!159032 e!108465))

(declare-fun res!132740 () Bool)

(assert (=> b!159032 (=> res!132740 e!108465)))

(assert (=> b!159032 (= res!132740 (bvsge (currentByte!7098 thiss!1602) (size!3415 (buf!3873 thiss!1602))))))

(assert (=> b!159032 (= lt!250852 (array!7540 (store (store (arr!4336 (buf!3873 thiss!1602)) (currentByte!7098 thiss!1602) lt!250850) (currentByte!7098 thiss!1602) lt!250857) (size!3415 (buf!3873 thiss!1602))))))

(assert (=> b!159032 (= lt!250857 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250850) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250853))))))

(assert (=> b!159032 (= lt!250850 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4336 (buf!3873 thiss!1602)) (currentByte!7098 thiss!1602))) lt!250846)))))

(assert (=> b!159032 (= lt!250846 ((_ sign_extend 24) lt!250851))))

(assert (=> b!159032 (= lt!250851 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250856)))))))

(assert (=> b!159032 (= lt!250856 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250853))))))

(assert (=> b!159032 (= lt!250853 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7093 thiss!1602))))))

(declare-fun b!159033 () Bool)

(declare-fun array_inv!3162 (array!7539) Bool)

(assert (=> b!159033 (= e!108464 (array_inv!3162 (buf!3873 thiss!1602)))))

(assert (= (and start!32134 res!132742) b!159032))

(assert (= (and b!159032 (not res!132740)) b!159031))

(assert (= (and b!159032 (not res!132743)) b!159030))

(assert (= (and b!159030 (not res!132741)) b!159029))

(assert (= start!32134 b!159033))

(declare-fun m!250045 () Bool)

(assert (=> b!159029 m!250045))

(declare-fun m!250047 () Bool)

(assert (=> b!159029 m!250047))

(declare-fun m!250049 () Bool)

(assert (=> b!159029 m!250049))

(declare-fun m!250051 () Bool)

(assert (=> b!159029 m!250051))

(assert (=> b!159029 m!250047))

(declare-fun m!250053 () Bool)

(assert (=> b!159029 m!250053))

(assert (=> b!159029 m!250047))

(declare-fun m!250055 () Bool)

(assert (=> b!159029 m!250055))

(declare-fun m!250057 () Bool)

(assert (=> b!159029 m!250057))

(declare-fun m!250059 () Bool)

(assert (=> b!159029 m!250059))

(declare-fun m!250061 () Bool)

(assert (=> b!159029 m!250061))

(declare-fun m!250063 () Bool)

(assert (=> b!159033 m!250063))

(declare-fun m!250065 () Bool)

(assert (=> start!32134 m!250065))

(declare-fun m!250067 () Bool)

(assert (=> start!32134 m!250067))

(declare-fun m!250069 () Bool)

(assert (=> b!159032 m!250069))

(declare-fun m!250071 () Bool)

(assert (=> b!159032 m!250071))

(declare-fun m!250073 () Bool)

(assert (=> b!159032 m!250073))

(declare-fun m!250075 () Bool)

(assert (=> b!159032 m!250075))

(declare-fun m!250077 () Bool)

(assert (=> b!159032 m!250077))

(declare-fun m!250079 () Bool)

(assert (=> b!159032 m!250079))

(declare-fun m!250081 () Bool)

(assert (=> b!159032 m!250081))

(declare-fun m!250083 () Bool)

(assert (=> b!159032 m!250083))

(declare-fun m!250085 () Bool)

(assert (=> b!159032 m!250085))

(declare-fun m!250087 () Bool)

(assert (=> b!159032 m!250087))

(assert (=> b!159032 m!250059))

(assert (=> b!159032 m!250061))

(assert (=> b!159031 m!250075))

(assert (=> b!159031 m!250075))

(declare-fun m!250089 () Bool)

(assert (=> b!159031 m!250089))

(push 1)

(assert (not b!159031))

(assert (not b!159032))

(assert (not b!159033))

(assert (not start!32134))

(assert (not b!159029))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

