; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!956 () Bool)

(assert start!956)

(declare-fun b!3534 () Bool)

(declare-fun res!5074 () Bool)

(declare-fun e!2336 () Bool)

(assert (=> b!3534 (=> (not res!5074) (not e!2336))))

(declare-datatypes ((array!288 0))(
  ( (array!289 (arr!505 (Array (_ BitVec 32) (_ BitVec 8))) (size!118 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!214 0))(
  ( (BitStream!215 (buf!436 array!288) (currentByte!1409 (_ BitVec 32)) (currentBit!1404 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!214)

(declare-datatypes ((Unit!262 0))(
  ( (Unit!263) )
))
(declare-datatypes ((tuple2!340 0))(
  ( (tuple2!341 (_1!183 Unit!262) (_2!183 BitStream!214)) )
))
(declare-fun lt!4249 () tuple2!340)

(assert (=> b!3534 (= res!5074 (= (size!118 (buf!436 thiss!1486)) (size!118 (buf!436 (_2!183 lt!4249)))))))

(declare-fun res!5073 () Bool)

(declare-fun e!2333 () Bool)

(assert (=> start!956 (=> (not res!5073) (not e!2333))))

(declare-fun srcBuffer!6 () array!288)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun from!367 () (_ BitVec 64))

(assert (=> start!956 (= res!5073 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!118 srcBuffer!6))))))))

(assert (=> start!956 e!2333))

(assert (=> start!956 true))

(declare-fun array_inv!113 (array!288) Bool)

(assert (=> start!956 (array_inv!113 srcBuffer!6)))

(declare-fun e!2335 () Bool)

(declare-fun inv!12 (BitStream!214) Bool)

(assert (=> start!956 (and (inv!12 thiss!1486) e!2335)))

(declare-fun b!3535 () Bool)

(assert (=> b!3535 (= e!2333 e!2336)))

(declare-fun res!5069 () Bool)

(assert (=> b!3535 (=> (not res!5069) (not e!2336))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!3535 (= res!5069 (invariant!0 (currentBit!1404 (_2!183 lt!4249)) (currentByte!1409 (_2!183 lt!4249)) (size!118 (buf!436 (_2!183 lt!4249)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!214 array!288 (_ BitVec 64) (_ BitVec 64)) tuple2!340)

(assert (=> b!3535 (= lt!4249 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!3536 () Bool)

(assert (=> b!3536 (= e!2335 (array_inv!113 (buf!436 thiss!1486)))))

(declare-fun b!3537 () Bool)

(declare-fun res!5071 () Bool)

(assert (=> b!3537 (=> (not res!5071) (not e!2333))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3537 (= res!5071 (validate_offset_bits!1 ((_ sign_extend 32) (size!118 (buf!436 thiss!1486))) ((_ sign_extend 32) (currentByte!1409 thiss!1486)) ((_ sign_extend 32) (currentBit!1404 thiss!1486)) nBits!460))))

(declare-fun b!3538 () Bool)

(assert (=> b!3538 (= e!2336 (not true))))

(declare-datatypes ((List!18 0))(
  ( (Nil!15) (Cons!14 (h!133 Bool) (t!768 List!18)) )
))
(declare-fun lt!4252 () List!18)

(declare-datatypes ((tuple2!342 0))(
  ( (tuple2!343 (_1!184 BitStream!214) (_2!184 BitStream!214)) )
))
(declare-fun lt!4250 () tuple2!342)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!214 BitStream!214 (_ BitVec 64)) List!18)

(assert (=> b!3538 (= lt!4252 (bitStreamReadBitsIntoList!0 (_2!183 lt!4249) (_1!184 lt!4250) nBits!460))))

(declare-datatypes ((tuple2!344 0))(
  ( (tuple2!345 (_1!185 array!288) (_2!185 BitStream!214)) )
))
(declare-fun lt!4251 () tuple2!344)

(declare-fun readBits!0 (BitStream!214 (_ BitVec 64)) tuple2!344)

(assert (=> b!3538 (= lt!4251 (readBits!0 (_1!184 lt!4250) nBits!460))))

(assert (=> b!3538 (validate_offset_bits!1 ((_ sign_extend 32) (size!118 (buf!436 (_2!183 lt!4249)))) ((_ sign_extend 32) (currentByte!1409 thiss!1486)) ((_ sign_extend 32) (currentBit!1404 thiss!1486)) nBits!460)))

(declare-fun lt!4253 () Unit!262)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!214 array!288 (_ BitVec 64)) Unit!262)

(assert (=> b!3538 (= lt!4253 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!436 (_2!183 lt!4249)) nBits!460))))

(declare-fun reader!0 (BitStream!214 BitStream!214) tuple2!342)

(assert (=> b!3538 (= lt!4250 (reader!0 thiss!1486 (_2!183 lt!4249)))))

(declare-fun b!3539 () Bool)

(declare-fun res!5072 () Bool)

(assert (=> b!3539 (=> (not res!5072) (not e!2336))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!3539 (= res!5072 (= (bitIndex!0 (size!118 (buf!436 (_2!183 lt!4249))) (currentByte!1409 (_2!183 lt!4249)) (currentBit!1404 (_2!183 lt!4249))) (bvadd (bitIndex!0 (size!118 (buf!436 thiss!1486)) (currentByte!1409 thiss!1486) (currentBit!1404 thiss!1486)) nBits!460)))))

(declare-fun b!3540 () Bool)

(declare-fun res!5070 () Bool)

(assert (=> b!3540 (=> (not res!5070) (not e!2336))))

(declare-fun isPrefixOf!0 (BitStream!214 BitStream!214) Bool)

(assert (=> b!3540 (= res!5070 (isPrefixOf!0 thiss!1486 (_2!183 lt!4249)))))

(assert (= (and start!956 res!5073) b!3537))

(assert (= (and b!3537 res!5071) b!3535))

(assert (= (and b!3535 res!5069) b!3534))

(assert (= (and b!3534 res!5074) b!3539))

(assert (= (and b!3539 res!5072) b!3540))

(assert (= (and b!3540 res!5070) b!3538))

(assert (= start!956 b!3536))

(declare-fun m!3933 () Bool)

(assert (=> b!3535 m!3933))

(declare-fun m!3935 () Bool)

(assert (=> b!3535 m!3935))

(declare-fun m!3937 () Bool)

(assert (=> b!3540 m!3937))

(declare-fun m!3939 () Bool)

(assert (=> b!3536 m!3939))

(declare-fun m!3941 () Bool)

(assert (=> b!3539 m!3941))

(declare-fun m!3943 () Bool)

(assert (=> b!3539 m!3943))

(declare-fun m!3945 () Bool)

(assert (=> b!3538 m!3945))

(declare-fun m!3947 () Bool)

(assert (=> b!3538 m!3947))

(declare-fun m!3949 () Bool)

(assert (=> b!3538 m!3949))

(declare-fun m!3951 () Bool)

(assert (=> b!3538 m!3951))

(declare-fun m!3953 () Bool)

(assert (=> b!3538 m!3953))

(declare-fun m!3955 () Bool)

(assert (=> b!3537 m!3955))

(declare-fun m!3957 () Bool)

(assert (=> start!956 m!3957))

(declare-fun m!3959 () Bool)

(assert (=> start!956 m!3959))

(push 1)

(assert (not start!956))

(assert (not b!3539))

(assert (not b!3535))

(assert (not b!3537))

(assert (not b!3538))

(assert (not b!3540))

(assert (not b!3536))

(check-sat)

(pop 1)

