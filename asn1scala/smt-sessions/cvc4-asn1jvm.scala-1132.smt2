; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32126 () Bool)

(assert start!32126)

(declare-fun b!158969 () Bool)

(declare-fun e!108401 () Bool)

(declare-datatypes ((array!7531 0))(
  ( (array!7532 (arr!4332 (Array (_ BitVec 32) (_ BitVec 8))) (size!3411 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5990 0))(
  ( (BitStream!5991 (buf!3869 array!7531) (currentByte!7094 (_ BitVec 32)) (currentBit!7089 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5990)

(declare-fun array_inv!3158 (array!7531) Bool)

(assert (=> b!158969 (= e!108401 (array_inv!3158 (buf!3869 thiss!1602)))))

(declare-fun res!132692 () Bool)

(declare-fun e!108402 () Bool)

(assert (=> start!32126 (=> (not res!132692) (not e!108402))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32126 (= res!132692 (validate_offset_byte!0 ((_ sign_extend 32) (size!3411 (buf!3869 thiss!1602))) ((_ sign_extend 32) (currentByte!7094 thiss!1602)) ((_ sign_extend 32) (currentBit!7089 thiss!1602))))))

(assert (=> start!32126 e!108402))

(declare-fun inv!12 (BitStream!5990) Bool)

(assert (=> start!32126 (and (inv!12 thiss!1602) e!108401)))

(assert (=> start!32126 true))

(declare-fun b!158970 () Bool)

(declare-fun e!108404 () Bool)

(declare-fun lt!250712 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158970 (= e!108404 (byteRangesEq!0 (select (arr!4332 (buf!3869 thiss!1602)) (currentByte!7094 thiss!1602)) lt!250712 #b00000000000000000000000000000000 (currentBit!7089 thiss!1602)))))

(declare-fun b!158971 () Bool)

(declare-fun e!108405 () Bool)

(assert (=> b!158971 (= e!108402 (not e!108405))))

(declare-fun res!132693 () Bool)

(assert (=> b!158971 (=> res!132693 e!108405)))

(declare-datatypes ((Unit!10735 0))(
  ( (Unit!10736) )
))
(declare-datatypes ((tuple3!724 0))(
  ( (tuple3!725 (_1!7710 Unit!10735) (_2!7710 (_ BitVec 8)) (_3!479 BitStream!5990)) )
))
(declare-fun lt!250707 () tuple3!724)

(declare-fun lt!250703 () array!7531)

(declare-fun arrayRangesEq!462 (array!7531 array!7531 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158971 (= res!132693 (not (arrayRangesEq!462 (buf!3869 thiss!1602) lt!250703 #b00000000000000000000000000000000 (bvsub (currentByte!7094 (_3!479 lt!250707)) #b00000000000000000000000000000001))))))

(declare-fun lt!250711 () (_ BitVec 8))

(assert (=> b!158971 (arrayRangesEq!462 (buf!3869 thiss!1602) (array!7532 (store (arr!4332 (buf!3869 thiss!1602)) (bvsub (currentByte!7094 (_3!479 lt!250707)) #b00000000000000000000000000000001) lt!250711) (size!3411 (buf!3869 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7094 (_3!479 lt!250707)) #b00000000000000000000000000000001))))

(declare-fun lt!250708 () Unit!10735)

(declare-fun arrayUpdatedAtPrefixLemma!70 (array!7531 (_ BitVec 32) (_ BitVec 8)) Unit!10735)

(assert (=> b!158971 (= lt!250708 (arrayUpdatedAtPrefixLemma!70 (buf!3869 thiss!1602) (bvsub (currentByte!7094 (_3!479 lt!250707)) #b00000000000000000000000000000001) lt!250711))))

(assert (=> b!158971 (= lt!250711 (select (arr!4332 (buf!3869 (_3!479 lt!250707))) (bvsub (currentByte!7094 (_3!479 lt!250707)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250704 () (_ BitVec 32))

(declare-fun lt!250709 () (_ BitVec 32))

(declare-fun lt!250705 () (_ BitVec 32))

(declare-fun lt!250706 () (_ BitVec 8))

(declare-fun lt!250710 () (_ BitVec 8))

(declare-fun Unit!10737 () Unit!10735)

(declare-fun Unit!10738 () Unit!10735)

(assert (=> b!158971 (= lt!250707 (ite (bvsgt lt!250705 #b00000000000000000000000000000000) (let ((bdg!9252 ((_ extract 7 0) (bvnot lt!250709)))) (let ((bdg!9253 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4332 (buf!3869 thiss!1602)) (currentByte!7094 thiss!1602) lt!250706) (currentByte!7094 thiss!1602) lt!250712) (bvadd #b00000000000000000000000000000001 (currentByte!7094 thiss!1602)))) ((_ sign_extend 24) bdg!9252))))) (tuple3!725 Unit!10737 bdg!9252 (BitStream!5991 (array!7532 (store (arr!4332 (array!7532 (store (arr!4332 lt!250703) (bvadd #b00000000000000000000000000000001 (currentByte!7094 thiss!1602)) bdg!9253) (size!3411 lt!250703))) (bvadd #b00000000000000000000000000000001 (currentByte!7094 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9253) (bvshl ((_ sign_extend 24) v!222) lt!250704)))) (size!3411 (array!7532 (store (arr!4332 lt!250703) (bvadd #b00000000000000000000000000000001 (currentByte!7094 thiss!1602)) bdg!9253) (size!3411 lt!250703)))) (bvadd #b00000000000000000000000000000001 (currentByte!7094 thiss!1602)) (currentBit!7089 thiss!1602))))) (tuple3!725 Unit!10738 lt!250710 (BitStream!5991 lt!250703 (bvadd #b00000000000000000000000000000001 (currentByte!7094 thiss!1602)) (currentBit!7089 thiss!1602)))))))

(assert (=> b!158971 e!108404))

(declare-fun res!132694 () Bool)

(assert (=> b!158971 (=> res!132694 e!108404)))

(assert (=> b!158971 (= res!132694 (bvsge (currentByte!7094 thiss!1602) (size!3411 (buf!3869 thiss!1602))))))

(assert (=> b!158971 (= lt!250703 (array!7532 (store (store (arr!4332 (buf!3869 thiss!1602)) (currentByte!7094 thiss!1602) lt!250706) (currentByte!7094 thiss!1602) lt!250712) (size!3411 (buf!3869 thiss!1602))))))

(assert (=> b!158971 (= lt!250712 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250706) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250705))))))

(assert (=> b!158971 (= lt!250706 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4332 (buf!3869 thiss!1602)) (currentByte!7094 thiss!1602))) lt!250709)))))

(assert (=> b!158971 (= lt!250709 ((_ sign_extend 24) lt!250710))))

(assert (=> b!158971 (= lt!250710 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250704)))))))

(assert (=> b!158971 (= lt!250704 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250705))))))

(assert (=> b!158971 (= lt!250705 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7089 thiss!1602))))))

(declare-fun b!158972 () Bool)

(assert (=> b!158972 (= e!108405 true)))

(assert (=> b!158972 (arrayRangesEq!462 (buf!3869 thiss!1602) (array!7532 (store (arr!4332 (buf!3869 thiss!1602)) (currentByte!7094 (_3!479 lt!250707)) (select (arr!4332 (buf!3869 (_3!479 lt!250707))) (currentByte!7094 (_3!479 lt!250707)))) (size!3411 (buf!3869 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7094 (_3!479 lt!250707)))))

(declare-fun lt!250713 () Unit!10735)

(assert (=> b!158972 (= lt!250713 (arrayUpdatedAtPrefixLemma!70 (buf!3869 thiss!1602) (currentByte!7094 (_3!479 lt!250707)) (select (arr!4332 (buf!3869 (_3!479 lt!250707))) (currentByte!7094 (_3!479 lt!250707)))))))

(declare-fun b!158973 () Bool)

(declare-fun res!132695 () Bool)

(assert (=> b!158973 (=> res!132695 e!108405)))

(assert (=> b!158973 (= res!132695 (bvsle lt!250705 #b00000000000000000000000000000000))))

(assert (= (and start!32126 res!132692) b!158971))

(assert (= (and b!158971 (not res!132694)) b!158970))

(assert (= (and b!158971 (not res!132693)) b!158973))

(assert (= (and b!158973 (not res!132695)) b!158972))

(assert (= start!32126 b!158969))

(declare-fun m!249867 () Bool)

(assert (=> b!158972 m!249867))

(declare-fun m!249869 () Bool)

(assert (=> b!158972 m!249869))

(declare-fun m!249871 () Bool)

(assert (=> b!158972 m!249871))

(assert (=> b!158972 m!249867))

(declare-fun m!249873 () Bool)

(assert (=> b!158972 m!249873))

(declare-fun m!249875 () Bool)

(assert (=> b!158969 m!249875))

(declare-fun m!249877 () Bool)

(assert (=> b!158971 m!249877))

(declare-fun m!249879 () Bool)

(assert (=> b!158971 m!249879))

(declare-fun m!249881 () Bool)

(assert (=> b!158971 m!249881))

(declare-fun m!249883 () Bool)

(assert (=> b!158971 m!249883))

(declare-fun m!249885 () Bool)

(assert (=> b!158971 m!249885))

(declare-fun m!249887 () Bool)

(assert (=> b!158971 m!249887))

(declare-fun m!249889 () Bool)

(assert (=> b!158971 m!249889))

(declare-fun m!249891 () Bool)

(assert (=> b!158971 m!249891))

(declare-fun m!249893 () Bool)

(assert (=> b!158971 m!249893))

(declare-fun m!249895 () Bool)

(assert (=> b!158971 m!249895))

(declare-fun m!249897 () Bool)

(assert (=> b!158971 m!249897))

(declare-fun m!249899 () Bool)

(assert (=> b!158971 m!249899))

(assert (=> b!158970 m!249895))

(assert (=> b!158970 m!249895))

(declare-fun m!249901 () Bool)

(assert (=> b!158970 m!249901))

(declare-fun m!249903 () Bool)

(assert (=> start!32126 m!249903))

(declare-fun m!249905 () Bool)

(assert (=> start!32126 m!249905))

(push 1)

(assert (not start!32126))

(assert (not b!158970))

(assert (not b!158971))

(assert (not b!158972))

(assert (not b!158969))

(check-sat)

(pop 1)

