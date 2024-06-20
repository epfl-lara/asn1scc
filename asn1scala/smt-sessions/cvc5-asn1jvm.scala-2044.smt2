; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52192 () Bool)

(assert start!52192)

(declare-fun res!200537 () Bool)

(declare-fun e!166505 () Bool)

(assert (=> start!52192 (=> (not res!200537) (not e!166505))))

(declare-fun nBits!288 () (_ BitVec 64))

(assert (=> start!52192 (= res!200537 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52192 e!166505))

(assert (=> start!52192 true))

(declare-datatypes ((array!13123 0))(
  ( (array!13124 (arr!6733 (Array (_ BitVec 32) (_ BitVec 8))) (size!5746 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10414 0))(
  ( (BitStream!10415 (buf!6206 array!13123) (currentByte!11560 (_ BitVec 32)) (currentBit!11555 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10414)

(declare-fun e!166508 () Bool)

(declare-fun inv!12 (BitStream!10414) Bool)

(assert (=> start!52192 (and (inv!12 thiss!982) e!166508)))

(declare-fun b!240216 () Bool)

(assert (=> b!240216 (= e!166505 (not true))))

(declare-fun lt!375233 () Bool)

(declare-datatypes ((Unit!17593 0))(
  ( (Unit!17594) )
))
(declare-datatypes ((tuple2!20328 0))(
  ( (tuple2!20329 (_1!11086 Unit!17593) (_2!11086 BitStream!10414)) )
))
(declare-fun lt!375236 () tuple2!20328)

(declare-fun isPrefixOf!0 (BitStream!10414 BitStream!10414) Bool)

(assert (=> b!240216 (= lt!375233 (isPrefixOf!0 thiss!982 (_2!11086 lt!375236)))))

(declare-fun lt!375234 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240216 (= lt!375234 (bitIndex!0 (size!5746 (buf!6206 (_2!11086 lt!375236))) (currentByte!11560 (_2!11086 lt!375236)) (currentBit!11555 (_2!11086 lt!375236))))))

(declare-fun lt!375235 () (_ BitVec 64))

(assert (=> b!240216 (= lt!375235 (bitIndex!0 (size!5746 (buf!6206 thiss!982)) (currentByte!11560 thiss!982) (currentBit!11555 thiss!982)))))

(declare-fun e!166507 () Bool)

(assert (=> b!240216 e!166507))

(declare-fun res!200536 () Bool)

(assert (=> b!240216 (=> (not res!200536) (not e!166507))))

(assert (=> b!240216 (= res!200536 (= (size!5746 (buf!6206 thiss!982)) (size!5746 (buf!6206 (_2!11086 lt!375236)))))))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10414 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20328)

(assert (=> b!240216 (= lt!375236 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240217 () Bool)

(declare-fun array_inv!5487 (array!13123) Bool)

(assert (=> b!240217 (= e!166508 (array_inv!5487 (buf!6206 thiss!982)))))

(declare-fun b!240218 () Bool)

(declare-datatypes ((tuple2!20330 0))(
  ( (tuple2!20331 (_1!11087 BitStream!10414) (_2!11087 Bool)) )
))
(declare-fun lt!375231 () tuple2!20330)

(declare-datatypes ((tuple2!20332 0))(
  ( (tuple2!20333 (_1!11088 BitStream!10414) (_2!11088 BitStream!10414)) )
))
(declare-fun lt!375237 () tuple2!20332)

(assert (=> b!240218 (= e!166507 (not (or (not (_2!11087 lt!375231)) (not (= (_1!11087 lt!375231) (_2!11088 lt!375237))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10414 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20330)

(assert (=> b!240218 (= lt!375231 (checkBitsLoopPure!0 (_1!11088 lt!375237) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240218 (validate_offset_bits!1 ((_ sign_extend 32) (size!5746 (buf!6206 (_2!11086 lt!375236)))) ((_ sign_extend 32) (currentByte!11560 thiss!982)) ((_ sign_extend 32) (currentBit!11555 thiss!982)) nBits!288)))

(declare-fun lt!375232 () Unit!17593)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10414 array!13123 (_ BitVec 64)) Unit!17593)

(assert (=> b!240218 (= lt!375232 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6206 (_2!11086 lt!375236)) nBits!288))))

(declare-fun reader!0 (BitStream!10414 BitStream!10414) tuple2!20332)

(assert (=> b!240218 (= lt!375237 (reader!0 thiss!982 (_2!11086 lt!375236)))))

(declare-fun b!240219 () Bool)

(declare-fun res!200538 () Bool)

(assert (=> b!240219 (=> (not res!200538) (not e!166507))))

(assert (=> b!240219 (= res!200538 (= (bitIndex!0 (size!5746 (buf!6206 (_2!11086 lt!375236))) (currentByte!11560 (_2!11086 lt!375236)) (currentBit!11555 (_2!11086 lt!375236))) (bvadd (bitIndex!0 (size!5746 (buf!6206 thiss!982)) (currentByte!11560 thiss!982) (currentBit!11555 thiss!982)) nBits!288)))))

(declare-fun b!240220 () Bool)

(declare-fun res!200534 () Bool)

(assert (=> b!240220 (=> (not res!200534) (not e!166507))))

(assert (=> b!240220 (= res!200534 (isPrefixOf!0 thiss!982 (_2!11086 lt!375236)))))

(declare-fun b!240221 () Bool)

(declare-fun res!200535 () Bool)

(assert (=> b!240221 (=> (not res!200535) (not e!166505))))

(assert (=> b!240221 (= res!200535 (validate_offset_bits!1 ((_ sign_extend 32) (size!5746 (buf!6206 thiss!982))) ((_ sign_extend 32) (currentByte!11560 thiss!982)) ((_ sign_extend 32) (currentBit!11555 thiss!982)) nBits!288))))

(assert (= (and start!52192 res!200537) b!240221))

(assert (= (and b!240221 res!200535) b!240216))

(assert (= (and b!240216 res!200536) b!240219))

(assert (= (and b!240219 res!200538) b!240220))

(assert (= (and b!240220 res!200534) b!240218))

(assert (= start!52192 b!240217))

(declare-fun m!362661 () Bool)

(assert (=> b!240221 m!362661))

(declare-fun m!362663 () Bool)

(assert (=> b!240217 m!362663))

(declare-fun m!362665 () Bool)

(assert (=> b!240218 m!362665))

(declare-fun m!362667 () Bool)

(assert (=> b!240218 m!362667))

(declare-fun m!362669 () Bool)

(assert (=> b!240218 m!362669))

(declare-fun m!362671 () Bool)

(assert (=> b!240218 m!362671))

(declare-fun m!362673 () Bool)

(assert (=> b!240216 m!362673))

(declare-fun m!362675 () Bool)

(assert (=> b!240216 m!362675))

(declare-fun m!362677 () Bool)

(assert (=> b!240216 m!362677))

(declare-fun m!362679 () Bool)

(assert (=> b!240216 m!362679))

(declare-fun m!362681 () Bool)

(assert (=> start!52192 m!362681))

(assert (=> b!240219 m!362675))

(assert (=> b!240219 m!362677))

(assert (=> b!240220 m!362673))

(push 1)

(assert (not b!240218))

(assert (not b!240220))

(assert (not b!240221))

(assert (not b!240219))

(assert (not b!240217))

(assert (not start!52192))

(assert (not b!240216))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

