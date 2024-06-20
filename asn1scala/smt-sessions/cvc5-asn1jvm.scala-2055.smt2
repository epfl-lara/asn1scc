; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52366 () Bool)

(assert start!52366)

(declare-fun b!241047 () Bool)

(declare-fun e!167026 () Bool)

(assert (=> b!241047 (= e!167026 (not true))))

(declare-datatypes ((array!13195 0))(
  ( (array!13196 (arr!6766 (Array (_ BitVec 32) (_ BitVec 8))) (size!5779 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10480 0))(
  ( (BitStream!10481 (buf!6245 array!13195) (currentByte!11605 (_ BitVec 32)) (currentBit!11600 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20520 0))(
  ( (tuple2!20521 (_1!11182 BitStream!10480) (_2!11182 BitStream!10480)) )
))
(declare-fun lt!376640 () tuple2!20520)

(declare-fun thiss!982 () BitStream!10480)

(declare-datatypes ((Unit!17659 0))(
  ( (Unit!17660) )
))
(declare-datatypes ((tuple2!20522 0))(
  ( (tuple2!20523 (_1!11183 Unit!17659) (_2!11183 BitStream!10480)) )
))
(declare-fun lt!376643 () tuple2!20522)

(declare-fun reader!0 (BitStream!10480 BitStream!10480) tuple2!20520)

(assert (=> b!241047 (= lt!376640 (reader!0 thiss!982 (_2!11183 lt!376643)))))

(declare-fun lt!376638 () Bool)

(declare-fun isPrefixOf!0 (BitStream!10480 BitStream!10480) Bool)

(assert (=> b!241047 (= lt!376638 (isPrefixOf!0 thiss!982 (_2!11183 lt!376643)))))

(declare-fun lt!376644 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241047 (= lt!376644 (bitIndex!0 (size!5779 (buf!6245 (_2!11183 lt!376643))) (currentByte!11605 (_2!11183 lt!376643)) (currentBit!11600 (_2!11183 lt!376643))))))

(declare-fun lt!376639 () (_ BitVec 64))

(assert (=> b!241047 (= lt!376639 (bitIndex!0 (size!5779 (buf!6245 thiss!982)) (currentByte!11605 thiss!982) (currentBit!11600 thiss!982)))))

(declare-fun e!167027 () Bool)

(assert (=> b!241047 e!167027))

(declare-fun res!201231 () Bool)

(assert (=> b!241047 (=> (not res!201231) (not e!167027))))

(assert (=> b!241047 (= res!201231 (= (size!5779 (buf!6245 thiss!982)) (size!5779 (buf!6245 (_2!11183 lt!376643)))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10480 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20522)

(assert (=> b!241047 (= lt!376643 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!201234 () Bool)

(assert (=> start!52366 (=> (not res!201234) (not e!167026))))

(assert (=> start!52366 (= res!201234 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52366 e!167026))

(assert (=> start!52366 true))

(declare-fun e!167025 () Bool)

(declare-fun inv!12 (BitStream!10480) Bool)

(assert (=> start!52366 (and (inv!12 thiss!982) e!167025)))

(declare-fun b!241048 () Bool)

(declare-fun res!201233 () Bool)

(assert (=> b!241048 (=> (not res!201233) (not e!167027))))

(assert (=> b!241048 (= res!201233 (isPrefixOf!0 thiss!982 (_2!11183 lt!376643)))))

(declare-fun b!241049 () Bool)

(declare-fun res!201230 () Bool)

(assert (=> b!241049 (=> (not res!201230) (not e!167026))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241049 (= res!201230 (validate_offset_bits!1 ((_ sign_extend 32) (size!5779 (buf!6245 thiss!982))) ((_ sign_extend 32) (currentByte!11605 thiss!982)) ((_ sign_extend 32) (currentBit!11600 thiss!982)) nBits!288))))

(declare-fun b!241050 () Bool)

(declare-fun res!201232 () Bool)

(assert (=> b!241050 (=> (not res!201232) (not e!167027))))

(assert (=> b!241050 (= res!201232 (= (bitIndex!0 (size!5779 (buf!6245 (_2!11183 lt!376643))) (currentByte!11605 (_2!11183 lt!376643)) (currentBit!11600 (_2!11183 lt!376643))) (bvadd (bitIndex!0 (size!5779 (buf!6245 thiss!982)) (currentByte!11605 thiss!982) (currentBit!11600 thiss!982)) nBits!288)))))

(declare-fun b!241051 () Bool)

(declare-datatypes ((tuple2!20524 0))(
  ( (tuple2!20525 (_1!11184 BitStream!10480) (_2!11184 Bool)) )
))
(declare-fun lt!376637 () tuple2!20524)

(declare-fun lt!376641 () tuple2!20520)

(assert (=> b!241051 (= e!167027 (not (or (not (_2!11184 lt!376637)) (not (= (_1!11184 lt!376637) (_2!11182 lt!376641))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10480 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20524)

(assert (=> b!241051 (= lt!376637 (checkBitsLoopPure!0 (_1!11182 lt!376641) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241051 (validate_offset_bits!1 ((_ sign_extend 32) (size!5779 (buf!6245 (_2!11183 lt!376643)))) ((_ sign_extend 32) (currentByte!11605 thiss!982)) ((_ sign_extend 32) (currentBit!11600 thiss!982)) nBits!288)))

(declare-fun lt!376642 () Unit!17659)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10480 array!13195 (_ BitVec 64)) Unit!17659)

(assert (=> b!241051 (= lt!376642 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6245 (_2!11183 lt!376643)) nBits!288))))

(assert (=> b!241051 (= lt!376641 (reader!0 thiss!982 (_2!11183 lt!376643)))))

(declare-fun b!241052 () Bool)

(declare-fun array_inv!5520 (array!13195) Bool)

(assert (=> b!241052 (= e!167025 (array_inv!5520 (buf!6245 thiss!982)))))

(assert (= (and start!52366 res!201234) b!241049))

(assert (= (and b!241049 res!201230) b!241047))

(assert (= (and b!241047 res!201231) b!241050))

(assert (= (and b!241050 res!201232) b!241048))

(assert (= (and b!241048 res!201233) b!241051))

(assert (= start!52366 b!241052))

(declare-fun m!363723 () Bool)

(assert (=> b!241048 m!363723))

(declare-fun m!363725 () Bool)

(assert (=> b!241050 m!363725))

(declare-fun m!363727 () Bool)

(assert (=> b!241050 m!363727))

(assert (=> b!241047 m!363723))

(declare-fun m!363729 () Bool)

(assert (=> b!241047 m!363729))

(declare-fun m!363731 () Bool)

(assert (=> b!241047 m!363731))

(assert (=> b!241047 m!363727))

(assert (=> b!241047 m!363725))

(declare-fun m!363733 () Bool)

(assert (=> b!241051 m!363733))

(declare-fun m!363735 () Bool)

(assert (=> b!241051 m!363735))

(declare-fun m!363737 () Bool)

(assert (=> b!241051 m!363737))

(assert (=> b!241051 m!363731))

(declare-fun m!363739 () Bool)

(assert (=> start!52366 m!363739))

(declare-fun m!363741 () Bool)

(assert (=> b!241049 m!363741))

(declare-fun m!363743 () Bool)

(assert (=> b!241052 m!363743))

(push 1)

(assert (not b!241049))

(assert (not b!241052))

(assert (not b!241048))

(assert (not b!241050))

(assert (not start!52366))

(assert (not b!241047))

(assert (not b!241051))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

