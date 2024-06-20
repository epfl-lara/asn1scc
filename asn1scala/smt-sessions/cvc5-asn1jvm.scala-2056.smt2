; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52372 () Bool)

(assert start!52372)

(declare-fun b!241101 () Bool)

(declare-fun e!167060 () Bool)

(declare-datatypes ((array!13201 0))(
  ( (array!13202 (arr!6769 (Array (_ BitVec 32) (_ BitVec 8))) (size!5782 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10486 0))(
  ( (BitStream!10487 (buf!6248 array!13201) (currentByte!11608 (_ BitVec 32)) (currentBit!11603 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20538 0))(
  ( (tuple2!20539 (_1!11191 BitStream!10486) (_2!11191 Bool)) )
))
(declare-fun lt!376722 () tuple2!20538)

(declare-datatypes ((tuple2!20540 0))(
  ( (tuple2!20541 (_1!11192 BitStream!10486) (_2!11192 BitStream!10486)) )
))
(declare-fun lt!376715 () tuple2!20540)

(assert (=> b!241101 (= e!167060 (not (or (not (_2!11191 lt!376722)) (not (= (_1!11191 lt!376722) (_2!11192 lt!376715))))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10486 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20538)

(assert (=> b!241101 (= lt!376722 (checkBitsLoopPure!0 (_1!11192 lt!376715) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!17665 0))(
  ( (Unit!17666) )
))
(declare-datatypes ((tuple2!20542 0))(
  ( (tuple2!20543 (_1!11193 Unit!17665) (_2!11193 BitStream!10486)) )
))
(declare-fun lt!376720 () tuple2!20542)

(declare-fun thiss!982 () BitStream!10486)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241101 (validate_offset_bits!1 ((_ sign_extend 32) (size!5782 (buf!6248 (_2!11193 lt!376720)))) ((_ sign_extend 32) (currentByte!11608 thiss!982)) ((_ sign_extend 32) (currentBit!11603 thiss!982)) nBits!288)))

(declare-fun lt!376721 () Unit!17665)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10486 array!13201 (_ BitVec 64)) Unit!17665)

(assert (=> b!241101 (= lt!376721 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6248 (_2!11193 lt!376720)) nBits!288))))

(declare-fun reader!0 (BitStream!10486 BitStream!10486) tuple2!20540)

(assert (=> b!241101 (= lt!376715 (reader!0 thiss!982 (_2!11193 lt!376720)))))

(declare-fun res!201276 () Bool)

(declare-fun e!167063 () Bool)

(assert (=> start!52372 (=> (not res!201276) (not e!167063))))

(assert (=> start!52372 (= res!201276 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52372 e!167063))

(assert (=> start!52372 true))

(declare-fun e!167061 () Bool)

(declare-fun inv!12 (BitStream!10486) Bool)

(assert (=> start!52372 (and (inv!12 thiss!982) e!167061)))

(declare-fun b!241102 () Bool)

(declare-fun res!201278 () Bool)

(assert (=> b!241102 (=> (not res!201278) (not e!167063))))

(assert (=> b!241102 (= res!201278 (validate_offset_bits!1 ((_ sign_extend 32) (size!5782 (buf!6248 thiss!982))) ((_ sign_extend 32) (currentByte!11608 thiss!982)) ((_ sign_extend 32) (currentBit!11603 thiss!982)) nBits!288))))

(declare-fun b!241103 () Bool)

(declare-fun array_inv!5523 (array!13201) Bool)

(assert (=> b!241103 (= e!167061 (array_inv!5523 (buf!6248 thiss!982)))))

(declare-fun b!241104 () Bool)

(declare-fun res!201277 () Bool)

(assert (=> b!241104 (=> (not res!201277) (not e!167060))))

(declare-fun isPrefixOf!0 (BitStream!10486 BitStream!10486) Bool)

(assert (=> b!241104 (= res!201277 (isPrefixOf!0 thiss!982 (_2!11193 lt!376720)))))

(declare-fun b!241105 () Bool)

(declare-fun res!201279 () Bool)

(assert (=> b!241105 (=> (not res!201279) (not e!167060))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241105 (= res!201279 (= (bitIndex!0 (size!5782 (buf!6248 (_2!11193 lt!376720))) (currentByte!11608 (_2!11193 lt!376720)) (currentBit!11603 (_2!11193 lt!376720))) (bvadd (bitIndex!0 (size!5782 (buf!6248 thiss!982)) (currentByte!11608 thiss!982) (currentBit!11603 thiss!982)) nBits!288)))))

(declare-fun b!241106 () Bool)

(declare-fun lt!376719 () tuple2!20538)

(declare-fun lt!376713 () tuple2!20540)

(assert (=> b!241106 (= e!167063 (not (and (_2!11191 lt!376719) (= (_1!11191 lt!376719) (_2!11192 lt!376713)))))))

(assert (=> b!241106 (= lt!376719 (checkBitsLoopPure!0 (_1!11192 lt!376713) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241106 (validate_offset_bits!1 ((_ sign_extend 32) (size!5782 (buf!6248 (_2!11193 lt!376720)))) ((_ sign_extend 32) (currentByte!11608 thiss!982)) ((_ sign_extend 32) (currentBit!11603 thiss!982)) nBits!288)))

(declare-fun lt!376716 () Unit!17665)

(assert (=> b!241106 (= lt!376716 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6248 (_2!11193 lt!376720)) nBits!288))))

(assert (=> b!241106 (= lt!376713 (reader!0 thiss!982 (_2!11193 lt!376720)))))

(declare-fun lt!376717 () Bool)

(assert (=> b!241106 (= lt!376717 (isPrefixOf!0 thiss!982 (_2!11193 lt!376720)))))

(declare-fun lt!376718 () (_ BitVec 64))

(assert (=> b!241106 (= lt!376718 (bitIndex!0 (size!5782 (buf!6248 (_2!11193 lt!376720))) (currentByte!11608 (_2!11193 lt!376720)) (currentBit!11603 (_2!11193 lt!376720))))))

(declare-fun lt!376714 () (_ BitVec 64))

(assert (=> b!241106 (= lt!376714 (bitIndex!0 (size!5782 (buf!6248 thiss!982)) (currentByte!11608 thiss!982) (currentBit!11603 thiss!982)))))

(assert (=> b!241106 e!167060))

(declare-fun res!201275 () Bool)

(assert (=> b!241106 (=> (not res!201275) (not e!167060))))

(assert (=> b!241106 (= res!201275 (= (size!5782 (buf!6248 thiss!982)) (size!5782 (buf!6248 (_2!11193 lt!376720)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10486 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20542)

(assert (=> b!241106 (= lt!376720 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!52372 res!201276) b!241102))

(assert (= (and b!241102 res!201278) b!241106))

(assert (= (and b!241106 res!201275) b!241105))

(assert (= (and b!241105 res!201279) b!241104))

(assert (= (and b!241104 res!201277) b!241101))

(assert (= start!52372 b!241103))

(declare-fun m!363789 () Bool)

(assert (=> b!241103 m!363789))

(declare-fun m!363791 () Bool)

(assert (=> b!241104 m!363791))

(declare-fun m!363793 () Bool)

(assert (=> b!241101 m!363793))

(declare-fun m!363795 () Bool)

(assert (=> b!241101 m!363795))

(declare-fun m!363797 () Bool)

(assert (=> b!241101 m!363797))

(declare-fun m!363799 () Bool)

(assert (=> b!241101 m!363799))

(declare-fun m!363801 () Bool)

(assert (=> b!241105 m!363801))

(declare-fun m!363803 () Bool)

(assert (=> b!241105 m!363803))

(declare-fun m!363805 () Bool)

(assert (=> start!52372 m!363805))

(declare-fun m!363807 () Bool)

(assert (=> b!241102 m!363807))

(assert (=> b!241106 m!363799))

(assert (=> b!241106 m!363797))

(assert (=> b!241106 m!363803))

(declare-fun m!363809 () Bool)

(assert (=> b!241106 m!363809))

(assert (=> b!241106 m!363791))

(assert (=> b!241106 m!363801))

(assert (=> b!241106 m!363795))

(declare-fun m!363811 () Bool)

(assert (=> b!241106 m!363811))

(push 1)

(assert (not start!52372))

(assert (not b!241104))

(assert (not b!241101))

(assert (not b!241106))

(assert (not b!241105))

(assert (not b!241103))

(assert (not b!241102))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

