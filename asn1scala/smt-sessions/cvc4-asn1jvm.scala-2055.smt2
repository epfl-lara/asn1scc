; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52370 () Bool)

(assert start!52370)

(declare-fun b!241083 () Bool)

(declare-fun res!201264 () Bool)

(declare-fun e!167048 () Bool)

(assert (=> b!241083 (=> (not res!201264) (not e!167048))))

(declare-datatypes ((array!13199 0))(
  ( (array!13200 (arr!6768 (Array (_ BitVec 32) (_ BitVec 8))) (size!5781 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10484 0))(
  ( (BitStream!10485 (buf!6247 array!13199) (currentByte!11607 (_ BitVec 32)) (currentBit!11602 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10484)

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241083 (= res!201264 (validate_offset_bits!1 ((_ sign_extend 32) (size!5781 (buf!6247 thiss!982))) ((_ sign_extend 32) (currentByte!11607 thiss!982)) ((_ sign_extend 32) (currentBit!11602 thiss!982)) nBits!288))))

(declare-fun b!241084 () Bool)

(assert (=> b!241084 (= e!167048 (not true))))

(declare-datatypes ((tuple2!20532 0))(
  ( (tuple2!20533 (_1!11188 BitStream!10484) (_2!11188 BitStream!10484)) )
))
(declare-fun lt!376686 () tuple2!20532)

(declare-datatypes ((Unit!17663 0))(
  ( (Unit!17664) )
))
(declare-datatypes ((tuple2!20534 0))(
  ( (tuple2!20535 (_1!11189 Unit!17663) (_2!11189 BitStream!10484)) )
))
(declare-fun lt!376690 () tuple2!20534)

(declare-fun reader!0 (BitStream!10484 BitStream!10484) tuple2!20532)

(assert (=> b!241084 (= lt!376686 (reader!0 thiss!982 (_2!11189 lt!376690)))))

(declare-fun lt!376688 () Bool)

(declare-fun isPrefixOf!0 (BitStream!10484 BitStream!10484) Bool)

(assert (=> b!241084 (= lt!376688 (isPrefixOf!0 thiss!982 (_2!11189 lt!376690)))))

(declare-fun lt!376687 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241084 (= lt!376687 (bitIndex!0 (size!5781 (buf!6247 (_2!11189 lt!376690))) (currentByte!11607 (_2!11189 lt!376690)) (currentBit!11602 (_2!11189 lt!376690))))))

(declare-fun lt!376691 () (_ BitVec 64))

(assert (=> b!241084 (= lt!376691 (bitIndex!0 (size!5781 (buf!6247 thiss!982)) (currentByte!11607 thiss!982) (currentBit!11602 thiss!982)))))

(declare-fun e!167051 () Bool)

(assert (=> b!241084 e!167051))

(declare-fun res!201263 () Bool)

(assert (=> b!241084 (=> (not res!201263) (not e!167051))))

(assert (=> b!241084 (= res!201263 (= (size!5781 (buf!6247 thiss!982)) (size!5781 (buf!6247 (_2!11189 lt!376690)))))))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10484 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20534)

(assert (=> b!241084 (= lt!376690 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!201262 () Bool)

(assert (=> start!52370 (=> (not res!201262) (not e!167048))))

(assert (=> start!52370 (= res!201262 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52370 e!167048))

(assert (=> start!52370 true))

(declare-fun e!167049 () Bool)

(declare-fun inv!12 (BitStream!10484) Bool)

(assert (=> start!52370 (and (inv!12 thiss!982) e!167049)))

(declare-fun b!241085 () Bool)

(declare-datatypes ((tuple2!20536 0))(
  ( (tuple2!20537 (_1!11190 BitStream!10484) (_2!11190 Bool)) )
))
(declare-fun lt!376689 () tuple2!20536)

(declare-fun lt!376692 () tuple2!20532)

(assert (=> b!241085 (= e!167051 (not (or (not (_2!11190 lt!376689)) (not (= (_1!11190 lt!376689) (_2!11188 lt!376692))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10484 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20536)

(assert (=> b!241085 (= lt!376689 (checkBitsLoopPure!0 (_1!11188 lt!376692) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241085 (validate_offset_bits!1 ((_ sign_extend 32) (size!5781 (buf!6247 (_2!11189 lt!376690)))) ((_ sign_extend 32) (currentByte!11607 thiss!982)) ((_ sign_extend 32) (currentBit!11602 thiss!982)) nBits!288)))

(declare-fun lt!376685 () Unit!17663)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10484 array!13199 (_ BitVec 64)) Unit!17663)

(assert (=> b!241085 (= lt!376685 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6247 (_2!11189 lt!376690)) nBits!288))))

(assert (=> b!241085 (= lt!376692 (reader!0 thiss!982 (_2!11189 lt!376690)))))

(declare-fun b!241086 () Bool)

(declare-fun res!201260 () Bool)

(assert (=> b!241086 (=> (not res!201260) (not e!167051))))

(assert (=> b!241086 (= res!201260 (isPrefixOf!0 thiss!982 (_2!11189 lt!376690)))))

(declare-fun b!241087 () Bool)

(declare-fun res!201261 () Bool)

(assert (=> b!241087 (=> (not res!201261) (not e!167051))))

(assert (=> b!241087 (= res!201261 (= (bitIndex!0 (size!5781 (buf!6247 (_2!11189 lt!376690))) (currentByte!11607 (_2!11189 lt!376690)) (currentBit!11602 (_2!11189 lt!376690))) (bvadd (bitIndex!0 (size!5781 (buf!6247 thiss!982)) (currentByte!11607 thiss!982) (currentBit!11602 thiss!982)) nBits!288)))))

(declare-fun b!241088 () Bool)

(declare-fun array_inv!5522 (array!13199) Bool)

(assert (=> b!241088 (= e!167049 (array_inv!5522 (buf!6247 thiss!982)))))

(assert (= (and start!52370 res!201262) b!241083))

(assert (= (and b!241083 res!201264) b!241084))

(assert (= (and b!241084 res!201263) b!241087))

(assert (= (and b!241087 res!201261) b!241086))

(assert (= (and b!241086 res!201260) b!241085))

(assert (= start!52370 b!241088))

(declare-fun m!363767 () Bool)

(assert (=> b!241088 m!363767))

(declare-fun m!363769 () Bool)

(assert (=> b!241085 m!363769))

(declare-fun m!363771 () Bool)

(assert (=> b!241085 m!363771))

(declare-fun m!363773 () Bool)

(assert (=> b!241085 m!363773))

(declare-fun m!363775 () Bool)

(assert (=> b!241085 m!363775))

(declare-fun m!363777 () Bool)

(assert (=> b!241086 m!363777))

(declare-fun m!363779 () Bool)

(assert (=> start!52370 m!363779))

(declare-fun m!363781 () Bool)

(assert (=> b!241083 m!363781))

(declare-fun m!363783 () Bool)

(assert (=> b!241087 m!363783))

(declare-fun m!363785 () Bool)

(assert (=> b!241087 m!363785))

(assert (=> b!241084 m!363783))

(assert (=> b!241084 m!363785))

(assert (=> b!241084 m!363775))

(declare-fun m!363787 () Bool)

(assert (=> b!241084 m!363787))

(assert (=> b!241084 m!363777))

(push 1)

