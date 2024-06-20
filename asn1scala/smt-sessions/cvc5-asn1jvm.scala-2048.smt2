; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52216 () Bool)

(assert start!52216)

(declare-fun b!240432 () Bool)

(declare-fun res!200716 () Bool)

(declare-fun e!166650 () Bool)

(assert (=> b!240432 (=> (not res!200716) (not e!166650))))

(declare-datatypes ((array!13147 0))(
  ( (array!13148 (arr!6745 (Array (_ BitVec 32) (_ BitVec 8))) (size!5758 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10438 0))(
  ( (BitStream!10439 (buf!6218 array!13147) (currentByte!11572 (_ BitVec 32)) (currentBit!11567 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10438)

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240432 (= res!200716 (validate_offset_bits!1 ((_ sign_extend 32) (size!5758 (buf!6218 thiss!982))) ((_ sign_extend 32) (currentByte!11572 thiss!982)) ((_ sign_extend 32) (currentBit!11567 thiss!982)) nBits!288))))

(declare-fun b!240433 () Bool)

(declare-fun res!200714 () Bool)

(declare-fun e!166649 () Bool)

(assert (=> b!240433 (=> (not res!200714) (not e!166649))))

(declare-datatypes ((Unit!17617 0))(
  ( (Unit!17618) )
))
(declare-datatypes ((tuple2!20400 0))(
  ( (tuple2!20401 (_1!11122 Unit!17617) (_2!11122 BitStream!10438)) )
))
(declare-fun lt!375518 () tuple2!20400)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240433 (= res!200714 (= (bitIndex!0 (size!5758 (buf!6218 (_2!11122 lt!375518))) (currentByte!11572 (_2!11122 lt!375518)) (currentBit!11567 (_2!11122 lt!375518))) (bvadd (bitIndex!0 (size!5758 (buf!6218 thiss!982)) (currentByte!11572 thiss!982) (currentBit!11567 thiss!982)) nBits!288)))))

(declare-fun b!240434 () Bool)

(declare-fun res!200715 () Bool)

(assert (=> b!240434 (=> (not res!200715) (not e!166649))))

(declare-fun isPrefixOf!0 (BitStream!10438 BitStream!10438) Bool)

(assert (=> b!240434 (= res!200715 (isPrefixOf!0 thiss!982 (_2!11122 lt!375518)))))

(declare-fun b!240435 () Bool)

(declare-datatypes ((tuple2!20402 0))(
  ( (tuple2!20403 (_1!11123 BitStream!10438) (_2!11123 Bool)) )
))
(declare-fun lt!375514 () tuple2!20402)

(declare-datatypes ((tuple2!20404 0))(
  ( (tuple2!20405 (_1!11124 BitStream!10438) (_2!11124 BitStream!10438)) )
))
(declare-fun lt!375517 () tuple2!20404)

(assert (=> b!240435 (= e!166649 (not (or (not (_2!11123 lt!375514)) (not (= (_1!11123 lt!375514) (_2!11124 lt!375517))))))))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10438 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20402)

(assert (=> b!240435 (= lt!375514 (checkBitsLoopPure!0 (_1!11124 lt!375517) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240435 (validate_offset_bits!1 ((_ sign_extend 32) (size!5758 (buf!6218 (_2!11122 lt!375518)))) ((_ sign_extend 32) (currentByte!11572 thiss!982)) ((_ sign_extend 32) (currentBit!11567 thiss!982)) nBits!288)))

(declare-fun lt!375516 () Unit!17617)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10438 array!13147 (_ BitVec 64)) Unit!17617)

(assert (=> b!240435 (= lt!375516 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6218 (_2!11122 lt!375518)) nBits!288))))

(declare-fun reader!0 (BitStream!10438 BitStream!10438) tuple2!20404)

(assert (=> b!240435 (= lt!375517 (reader!0 thiss!982 (_2!11122 lt!375518)))))

(declare-fun res!200717 () Bool)

(assert (=> start!52216 (=> (not res!200717) (not e!166650))))

(assert (=> start!52216 (= res!200717 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52216 e!166650))

(assert (=> start!52216 true))

(declare-fun e!166652 () Bool)

(declare-fun inv!12 (BitStream!10438) Bool)

(assert (=> start!52216 (and (inv!12 thiss!982) e!166652)))

(declare-fun b!240436 () Bool)

(declare-fun array_inv!5499 (array!13147) Bool)

(assert (=> b!240436 (= e!166652 (array_inv!5499 (buf!6218 thiss!982)))))

(declare-fun b!240437 () Bool)

(assert (=> b!240437 (= e!166650 (not true))))

(assert (=> b!240437 (validate_offset_bits!1 ((_ sign_extend 32) (size!5758 (buf!6218 (_2!11122 lt!375518)))) ((_ sign_extend 32) (currentByte!11572 thiss!982)) ((_ sign_extend 32) (currentBit!11567 thiss!982)) nBits!288)))

(declare-fun lt!375515 () Unit!17617)

(assert (=> b!240437 (= lt!375515 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6218 (_2!11122 lt!375518)) nBits!288))))

(declare-fun lt!375519 () tuple2!20404)

(assert (=> b!240437 (= lt!375519 (reader!0 thiss!982 (_2!11122 lt!375518)))))

(declare-fun lt!375521 () Bool)

(assert (=> b!240437 (= lt!375521 (isPrefixOf!0 thiss!982 (_2!11122 lt!375518)))))

(declare-fun lt!375520 () (_ BitVec 64))

(assert (=> b!240437 (= lt!375520 (bitIndex!0 (size!5758 (buf!6218 (_2!11122 lt!375518))) (currentByte!11572 (_2!11122 lt!375518)) (currentBit!11567 (_2!11122 lt!375518))))))

(declare-fun lt!375522 () (_ BitVec 64))

(assert (=> b!240437 (= lt!375522 (bitIndex!0 (size!5758 (buf!6218 thiss!982)) (currentByte!11572 thiss!982) (currentBit!11567 thiss!982)))))

(assert (=> b!240437 e!166649))

(declare-fun res!200718 () Bool)

(assert (=> b!240437 (=> (not res!200718) (not e!166649))))

(assert (=> b!240437 (= res!200718 (= (size!5758 (buf!6218 thiss!982)) (size!5758 (buf!6218 (_2!11122 lt!375518)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10438 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20400)

(assert (=> b!240437 (= lt!375518 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!52216 res!200717) b!240432))

(assert (= (and b!240432 res!200716) b!240437))

(assert (= (and b!240437 res!200718) b!240433))

(assert (= (and b!240433 res!200714) b!240434))

(assert (= (and b!240434 res!200715) b!240435))

(assert (= start!52216 b!240436))

(declare-fun m!362925 () Bool)

(assert (=> b!240433 m!362925))

(declare-fun m!362927 () Bool)

(assert (=> b!240433 m!362927))

(declare-fun m!362929 () Bool)

(assert (=> b!240435 m!362929))

(declare-fun m!362931 () Bool)

(assert (=> b!240435 m!362931))

(declare-fun m!362933 () Bool)

(assert (=> b!240435 m!362933))

(declare-fun m!362935 () Bool)

(assert (=> b!240435 m!362935))

(declare-fun m!362937 () Bool)

(assert (=> b!240437 m!362937))

(assert (=> b!240437 m!362927))

(assert (=> b!240437 m!362931))

(declare-fun m!362939 () Bool)

(assert (=> b!240437 m!362939))

(assert (=> b!240437 m!362933))

(assert (=> b!240437 m!362925))

(assert (=> b!240437 m!362935))

(declare-fun m!362941 () Bool)

(assert (=> b!240436 m!362941))

(declare-fun m!362943 () Bool)

(assert (=> b!240432 m!362943))

(declare-fun m!362945 () Bool)

(assert (=> start!52216 m!362945))

(assert (=> b!240434 m!362937))

(push 1)

(assert (not b!240434))

(assert (not b!240437))

(assert (not start!52216))

(assert (not b!240432))

(assert (not b!240433))

(assert (not b!240435))

(assert (not b!240436))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

