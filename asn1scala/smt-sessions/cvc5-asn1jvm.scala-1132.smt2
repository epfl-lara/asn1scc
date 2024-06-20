; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32122 () Bool)

(assert start!32122)

(declare-fun b!158939 () Bool)

(declare-fun e!108373 () Bool)

(declare-fun e!108372 () Bool)

(assert (=> b!158939 (= e!108373 (not e!108372))))

(declare-fun res!132668 () Bool)

(assert (=> b!158939 (=> res!132668 e!108372)))

(declare-datatypes ((array!7527 0))(
  ( (array!7528 (arr!4330 (Array (_ BitVec 32) (_ BitVec 8))) (size!3409 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5986 0))(
  ( (BitStream!5987 (buf!3867 array!7527) (currentByte!7092 (_ BitVec 32)) (currentBit!7087 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!10727 0))(
  ( (Unit!10728) )
))
(declare-datatypes ((tuple3!720 0))(
  ( (tuple3!721 (_1!7708 Unit!10727) (_2!7708 (_ BitVec 8)) (_3!477 BitStream!5986)) )
))
(declare-fun lt!250642 () tuple3!720)

(declare-fun lt!250638 () array!7527)

(declare-fun thiss!1602 () BitStream!5986)

(declare-fun arrayRangesEq!460 (array!7527 array!7527 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158939 (= res!132668 (not (arrayRangesEq!460 (buf!3867 thiss!1602) lt!250638 #b00000000000000000000000000000000 (bvsub (currentByte!7092 (_3!477 lt!250642)) #b00000000000000000000000000000001))))))

(declare-fun lt!250646 () (_ BitVec 8))

(assert (=> b!158939 (arrayRangesEq!460 (buf!3867 thiss!1602) (array!7528 (store (arr!4330 (buf!3867 thiss!1602)) (bvsub (currentByte!7092 (_3!477 lt!250642)) #b00000000000000000000000000000001) lt!250646) (size!3409 (buf!3867 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7092 (_3!477 lt!250642)) #b00000000000000000000000000000001))))

(declare-fun lt!250643 () Unit!10727)

(declare-fun arrayUpdatedAtPrefixLemma!68 (array!7527 (_ BitVec 32) (_ BitVec 8)) Unit!10727)

(assert (=> b!158939 (= lt!250643 (arrayUpdatedAtPrefixLemma!68 (buf!3867 thiss!1602) (bvsub (currentByte!7092 (_3!477 lt!250642)) #b00000000000000000000000000000001) lt!250646))))

(assert (=> b!158939 (= lt!250646 (select (arr!4330 (buf!3867 (_3!477 lt!250642))) (bvsub (currentByte!7092 (_3!477 lt!250642)) #b00000000000000000000000000000001)))))

(declare-fun lt!250644 () (_ BitVec 32))

(declare-fun lt!250637 () (_ BitVec 8))

(declare-fun lt!250640 () (_ BitVec 32))

(declare-fun lt!250641 () (_ BitVec 32))

(declare-fun lt!250647 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250639 () (_ BitVec 8))

(declare-fun Unit!10729 () Unit!10727)

(declare-fun Unit!10730 () Unit!10727)

(assert (=> b!158939 (= lt!250642 (ite (bvsgt lt!250644 #b00000000000000000000000000000000) (let ((bdg!9252 ((_ extract 7 0) (bvnot lt!250641)))) (let ((bdg!9253 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4330 (buf!3867 thiss!1602)) (currentByte!7092 thiss!1602) lt!250637) (currentByte!7092 thiss!1602) lt!250639) (bvadd #b00000000000000000000000000000001 (currentByte!7092 thiss!1602)))) ((_ sign_extend 24) bdg!9252))))) (tuple3!721 Unit!10729 bdg!9252 (BitStream!5987 (array!7528 (store (arr!4330 (array!7528 (store (arr!4330 lt!250638) (bvadd #b00000000000000000000000000000001 (currentByte!7092 thiss!1602)) bdg!9253) (size!3409 lt!250638))) (bvadd #b00000000000000000000000000000001 (currentByte!7092 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9253) (bvshl ((_ sign_extend 24) v!222) lt!250640)))) (size!3409 (array!7528 (store (arr!4330 lt!250638) (bvadd #b00000000000000000000000000000001 (currentByte!7092 thiss!1602)) bdg!9253) (size!3409 lt!250638)))) (bvadd #b00000000000000000000000000000001 (currentByte!7092 thiss!1602)) (currentBit!7087 thiss!1602))))) (tuple3!721 Unit!10730 lt!250647 (BitStream!5987 lt!250638 (bvadd #b00000000000000000000000000000001 (currentByte!7092 thiss!1602)) (currentBit!7087 thiss!1602)))))))

(declare-fun e!108371 () Bool)

(assert (=> b!158939 e!108371))

(declare-fun res!132669 () Bool)

(assert (=> b!158939 (=> res!132669 e!108371)))

(assert (=> b!158939 (= res!132669 (bvsge (currentByte!7092 thiss!1602) (size!3409 (buf!3867 thiss!1602))))))

(assert (=> b!158939 (= lt!250638 (array!7528 (store (store (arr!4330 (buf!3867 thiss!1602)) (currentByte!7092 thiss!1602) lt!250637) (currentByte!7092 thiss!1602) lt!250639) (size!3409 (buf!3867 thiss!1602))))))

(assert (=> b!158939 (= lt!250639 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250637) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250644))))))

(assert (=> b!158939 (= lt!250637 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4330 (buf!3867 thiss!1602)) (currentByte!7092 thiss!1602))) lt!250641)))))

(assert (=> b!158939 (= lt!250641 ((_ sign_extend 24) lt!250647))))

(assert (=> b!158939 (= lt!250647 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250640)))))))

(assert (=> b!158939 (= lt!250640 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250644))))))

(assert (=> b!158939 (= lt!250644 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7087 thiss!1602))))))

(declare-fun b!158940 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158940 (= e!108371 (byteRangesEq!0 (select (arr!4330 (buf!3867 thiss!1602)) (currentByte!7092 thiss!1602)) lt!250639 #b00000000000000000000000000000000 (currentBit!7087 thiss!1602)))))

(declare-fun b!158941 () Bool)

(assert (=> b!158941 (= e!108372 true)))

(assert (=> b!158941 (arrayRangesEq!460 (buf!3867 thiss!1602) (array!7528 (store (arr!4330 (buf!3867 thiss!1602)) (currentByte!7092 (_3!477 lt!250642)) (select (arr!4330 (buf!3867 (_3!477 lt!250642))) (currentByte!7092 (_3!477 lt!250642)))) (size!3409 (buf!3867 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7092 (_3!477 lt!250642)))))

(declare-fun lt!250645 () Unit!10727)

(assert (=> b!158941 (= lt!250645 (arrayUpdatedAtPrefixLemma!68 (buf!3867 thiss!1602) (currentByte!7092 (_3!477 lt!250642)) (select (arr!4330 (buf!3867 (_3!477 lt!250642))) (currentByte!7092 (_3!477 lt!250642)))))))

(declare-fun b!158942 () Bool)

(declare-fun res!132671 () Bool)

(assert (=> b!158942 (=> res!132671 e!108372)))

(assert (=> b!158942 (= res!132671 (bvsle lt!250644 #b00000000000000000000000000000000))))

(declare-fun b!158943 () Bool)

(declare-fun e!108374 () Bool)

(declare-fun array_inv!3156 (array!7527) Bool)

(assert (=> b!158943 (= e!108374 (array_inv!3156 (buf!3867 thiss!1602)))))

(declare-fun res!132670 () Bool)

(assert (=> start!32122 (=> (not res!132670) (not e!108373))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32122 (= res!132670 (validate_offset_byte!0 ((_ sign_extend 32) (size!3409 (buf!3867 thiss!1602))) ((_ sign_extend 32) (currentByte!7092 thiss!1602)) ((_ sign_extend 32) (currentBit!7087 thiss!1602))))))

(assert (=> start!32122 e!108373))

(declare-fun inv!12 (BitStream!5986) Bool)

(assert (=> start!32122 (and (inv!12 thiss!1602) e!108374)))

(assert (=> start!32122 true))

(assert (= (and start!32122 res!132670) b!158939))

(assert (= (and b!158939 (not res!132669)) b!158940))

(assert (= (and b!158939 (not res!132668)) b!158942))

(assert (= (and b!158942 (not res!132671)) b!158941))

(assert (= start!32122 b!158943))

(declare-fun m!249787 () Bool)

(assert (=> b!158941 m!249787))

(declare-fun m!249789 () Bool)

(assert (=> b!158941 m!249789))

(declare-fun m!249791 () Bool)

(assert (=> b!158941 m!249791))

(assert (=> b!158941 m!249787))

(declare-fun m!249793 () Bool)

(assert (=> b!158941 m!249793))

(declare-fun m!249795 () Bool)

(assert (=> b!158943 m!249795))

(declare-fun m!249797 () Bool)

(assert (=> start!32122 m!249797))

(declare-fun m!249799 () Bool)

(assert (=> start!32122 m!249799))

(declare-fun m!249801 () Bool)

(assert (=> b!158939 m!249801))

(declare-fun m!249803 () Bool)

(assert (=> b!158939 m!249803))

(declare-fun m!249805 () Bool)

(assert (=> b!158939 m!249805))

(declare-fun m!249807 () Bool)

(assert (=> b!158939 m!249807))

(declare-fun m!249809 () Bool)

(assert (=> b!158939 m!249809))

(declare-fun m!249811 () Bool)

(assert (=> b!158939 m!249811))

(declare-fun m!249813 () Bool)

(assert (=> b!158939 m!249813))

(declare-fun m!249815 () Bool)

(assert (=> b!158939 m!249815))

(declare-fun m!249817 () Bool)

(assert (=> b!158939 m!249817))

(declare-fun m!249819 () Bool)

(assert (=> b!158939 m!249819))

(declare-fun m!249821 () Bool)

(assert (=> b!158939 m!249821))

(declare-fun m!249823 () Bool)

(assert (=> b!158939 m!249823))

(assert (=> b!158940 m!249817))

(assert (=> b!158940 m!249817))

(declare-fun m!249825 () Bool)

(assert (=> b!158940 m!249825))

(push 1)

(assert (not b!158943))

(assert (not b!158939))

(assert (not b!158941))

(assert (not start!32122))

(assert (not b!158940))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

