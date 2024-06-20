; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15056 () Bool)

(assert start!15056)

(declare-fun b!77107 () Bool)

(declare-fun res!63711 () Bool)

(declare-fun e!50580 () Bool)

(assert (=> b!77107 (=> (not res!63711) (not e!50580))))

(declare-datatypes ((array!3218 0))(
  ( (array!3219 (arr!2097 (Array (_ BitVec 32) (_ BitVec 8))) (size!1496 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2566 0))(
  ( (BitStream!2567 (buf!1886 array!3218) (currentByte!3697 (_ BitVec 32)) (currentBit!3692 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2566)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77107 (= res!63711 (validate_offset_bits!1 ((_ sign_extend 32) (size!1496 (buf!1886 thiss!1090))) ((_ sign_extend 32) (currentByte!3697 thiss!1090)) ((_ sign_extend 32) (currentBit!3692 thiss!1090)) nBits!322))))

(declare-fun b!77108 () Bool)

(declare-fun e!50579 () Bool)

(declare-fun array_inv!1342 (array!3218) Bool)

(assert (=> b!77108 (= e!50579 (array_inv!1342 (buf!1886 thiss!1090)))))

(declare-fun b!77109 () Bool)

(declare-fun res!63715 () Bool)

(declare-fun e!50577 () Bool)

(assert (=> b!77109 (=> (not res!63715) (not e!50577))))

(declare-datatypes ((Unit!5083 0))(
  ( (Unit!5084) )
))
(declare-datatypes ((tuple2!6758 0))(
  ( (tuple2!6759 (_1!3513 Unit!5083) (_2!3513 BitStream!2566)) )
))
(declare-fun lt!123539 () tuple2!6758)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77109 (= res!63715 (= (bitIndex!0 (size!1496 (buf!1886 (_2!3513 lt!123539))) (currentByte!3697 (_2!3513 lt!123539)) (currentBit!3692 (_2!3513 lt!123539))) (bvadd (bitIndex!0 (size!1496 (buf!1886 thiss!1090)) (currentByte!3697 thiss!1090) (currentBit!3692 thiss!1090)) nBits!322)))))

(declare-fun b!77110 () Bool)

(assert (=> b!77110 (= e!50580 (not true))))

(declare-datatypes ((tuple2!6760 0))(
  ( (tuple2!6761 (_1!3514 BitStream!2566) (_2!3514 BitStream!2566)) )
))
(declare-fun lt!123540 () tuple2!6760)

(declare-fun reader!0 (BitStream!2566 BitStream!2566) tuple2!6760)

(assert (=> b!77110 (= lt!123540 (reader!0 thiss!1090 (_2!3513 lt!123539)))))

(declare-fun lt!123536 () Bool)

(declare-fun isPrefixOf!0 (BitStream!2566 BitStream!2566) Bool)

(assert (=> b!77110 (= lt!123536 (isPrefixOf!0 thiss!1090 (_2!3513 lt!123539)))))

(declare-fun lt!123537 () (_ BitVec 64))

(assert (=> b!77110 (= lt!123537 (bitIndex!0 (size!1496 (buf!1886 (_2!3513 lt!123539))) (currentByte!3697 (_2!3513 lt!123539)) (currentBit!3692 (_2!3513 lt!123539))))))

(declare-fun lt!123538 () (_ BitVec 64))

(assert (=> b!77110 (= lt!123538 (bitIndex!0 (size!1496 (buf!1886 thiss!1090)) (currentByte!3697 thiss!1090) (currentBit!3692 thiss!1090)))))

(assert (=> b!77110 e!50577))

(declare-fun res!63712 () Bool)

(assert (=> b!77110 (=> (not res!63712) (not e!50577))))

(assert (=> b!77110 (= res!63712 (= (size!1496 (buf!1886 thiss!1090)) (size!1496 (buf!1886 (_2!3513 lt!123539)))))))

(declare-fun appendNBits!0 (BitStream!2566 (_ BitVec 64) Bool) tuple2!6758)

(assert (=> b!77110 (= lt!123539 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77111 () Bool)

(declare-fun res!63714 () Bool)

(assert (=> b!77111 (=> (not res!63714) (not e!50577))))

(assert (=> b!77111 (= res!63714 (isPrefixOf!0 thiss!1090 (_2!3513 lt!123539)))))

(declare-fun b!77112 () Bool)

(declare-datatypes ((tuple2!6762 0))(
  ( (tuple2!6763 (_1!3515 BitStream!2566) (_2!3515 Bool)) )
))
(declare-fun lt!123534 () tuple2!6762)

(declare-fun lt!123533 () tuple2!6760)

(assert (=> b!77112 (= e!50577 (not (or (not (_2!3515 lt!123534)) (not (= (_1!3515 lt!123534) (_2!3514 lt!123533))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2566 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6762)

(assert (=> b!77112 (= lt!123534 (checkBitsLoopPure!0 (_1!3514 lt!123533) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77112 (validate_offset_bits!1 ((_ sign_extend 32) (size!1496 (buf!1886 (_2!3513 lt!123539)))) ((_ sign_extend 32) (currentByte!3697 thiss!1090)) ((_ sign_extend 32) (currentBit!3692 thiss!1090)) nBits!322)))

(declare-fun lt!123535 () Unit!5083)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2566 array!3218 (_ BitVec 64)) Unit!5083)

(assert (=> b!77112 (= lt!123535 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1886 (_2!3513 lt!123539)) nBits!322))))

(assert (=> b!77112 (= lt!123533 (reader!0 thiss!1090 (_2!3513 lt!123539)))))

(declare-fun res!63713 () Bool)

(assert (=> start!15056 (=> (not res!63713) (not e!50580))))

(assert (=> start!15056 (= res!63713 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15056 e!50580))

(assert (=> start!15056 true))

(declare-fun inv!12 (BitStream!2566) Bool)

(assert (=> start!15056 (and (inv!12 thiss!1090) e!50579)))

(assert (= (and start!15056 res!63713) b!77107))

(assert (= (and b!77107 res!63711) b!77110))

(assert (= (and b!77110 res!63712) b!77109))

(assert (= (and b!77109 res!63715) b!77111))

(assert (= (and b!77111 res!63714) b!77112))

(assert (= start!15056 b!77108))

(declare-fun m!122501 () Bool)

(assert (=> b!77107 m!122501))

(declare-fun m!122503 () Bool)

(assert (=> b!77111 m!122503))

(declare-fun m!122505 () Bool)

(assert (=> b!77108 m!122505))

(declare-fun m!122507 () Bool)

(assert (=> b!77109 m!122507))

(declare-fun m!122509 () Bool)

(assert (=> b!77109 m!122509))

(declare-fun m!122511 () Bool)

(assert (=> b!77112 m!122511))

(declare-fun m!122513 () Bool)

(assert (=> b!77112 m!122513))

(declare-fun m!122515 () Bool)

(assert (=> b!77112 m!122515))

(declare-fun m!122517 () Bool)

(assert (=> b!77112 m!122517))

(declare-fun m!122519 () Bool)

(assert (=> start!15056 m!122519))

(assert (=> b!77110 m!122503))

(assert (=> b!77110 m!122509))

(declare-fun m!122521 () Bool)

(assert (=> b!77110 m!122521))

(assert (=> b!77110 m!122517))

(assert (=> b!77110 m!122507))

(push 1)

(assert (not b!77107))

(assert (not start!15056))

(assert (not b!77110))

(assert (not b!77112))

(assert (not b!77109))

(assert (not b!77108))

(assert (not b!77111))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

