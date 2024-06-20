; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2356 () Bool)

(assert start!2356)

(declare-fun b!11041 () Bool)

(declare-fun res!10885 () Bool)

(declare-fun e!6743 () Bool)

(assert (=> b!11041 (=> res!10885 e!6743)))

(declare-datatypes ((List!157 0))(
  ( (Nil!154) (Cons!153 (h!272 Bool) (t!907 List!157)) )
))
(declare-fun lt!17536 () List!157)

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!647 0))(
  ( (array!648 (arr!698 (Array (_ BitVec 32) (_ BitVec 8))) (size!278 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!647)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((BitStream!522 0))(
  ( (BitStream!523 (buf!623 array!647) (currentByte!1695 (_ BitVec 32)) (currentBit!1690 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!952 0))(
  ( (Unit!953) )
))
(declare-datatypes ((tuple2!1342 0))(
  ( (tuple2!1343 (_1!717 Unit!952) (_2!717 BitStream!522)) )
))
(declare-fun lt!17538 () tuple2!1342)

(declare-fun byteArrayBitContentToList!0 (BitStream!522 array!647 (_ BitVec 64) (_ BitVec 64)) List!157)

(assert (=> b!11041 (= res!10885 (not (= lt!17536 (byteArrayBitContentToList!0 (_2!717 lt!17538) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!11043 () Bool)

(declare-fun res!10884 () Bool)

(declare-fun e!6741 () Bool)

(assert (=> b!11043 (=> (not res!10884) (not e!6741))))

(declare-fun thiss!1486 () BitStream!522)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!11043 (= res!10884 (validate_offset_bits!1 ((_ sign_extend 32) (size!278 (buf!623 thiss!1486))) ((_ sign_extend 32) (currentByte!1695 thiss!1486)) ((_ sign_extend 32) (currentBit!1690 thiss!1486)) nBits!460))))

(declare-fun b!11044 () Bool)

(declare-fun res!10881 () Bool)

(declare-fun e!6740 () Bool)

(assert (=> b!11044 (=> (not res!10881) (not e!6740))))

(assert (=> b!11044 (= res!10881 (= (size!278 (buf!623 thiss!1486)) (size!278 (buf!623 (_2!717 lt!17538)))))))

(declare-fun b!11045 () Bool)

(declare-fun res!10882 () Bool)

(assert (=> b!11045 (=> (not res!10882) (not e!6740))))

(declare-fun isPrefixOf!0 (BitStream!522 BitStream!522) Bool)

(assert (=> b!11045 (= res!10882 (isPrefixOf!0 thiss!1486 (_2!717 lt!17538)))))

(declare-fun b!11046 () Bool)

(declare-fun res!10883 () Bool)

(assert (=> b!11046 (=> (not res!10883) (not e!6740))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!11046 (= res!10883 (= (bitIndex!0 (size!278 (buf!623 (_2!717 lt!17538))) (currentByte!1695 (_2!717 lt!17538)) (currentBit!1690 (_2!717 lt!17538))) (bvadd (bitIndex!0 (size!278 (buf!623 thiss!1486)) (currentByte!1695 thiss!1486) (currentBit!1690 thiss!1486)) nBits!460)))))

(declare-fun b!11047 () Bool)

(assert (=> b!11047 (= e!6741 e!6740)))

(declare-fun res!10886 () Bool)

(assert (=> b!11047 (=> (not res!10886) (not e!6740))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!11047 (= res!10886 (invariant!0 (currentBit!1690 (_2!717 lt!17538)) (currentByte!1695 (_2!717 lt!17538)) (size!278 (buf!623 (_2!717 lt!17538)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!522 array!647 (_ BitVec 64) (_ BitVec 64)) tuple2!1342)

(assert (=> b!11047 (= lt!17538 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!10887 () Bool)

(assert (=> start!2356 (=> (not res!10887) (not e!6741))))

(assert (=> start!2356 (= res!10887 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!278 srcBuffer!6))))))))

(assert (=> start!2356 e!6741))

(assert (=> start!2356 true))

(declare-fun array_inv!270 (array!647) Bool)

(assert (=> start!2356 (array_inv!270 srcBuffer!6)))

(declare-fun e!6739 () Bool)

(declare-fun inv!12 (BitStream!522) Bool)

(assert (=> start!2356 (and (inv!12 thiss!1486) e!6739)))

(declare-fun b!11042 () Bool)

(assert (=> b!11042 (= e!6739 (array_inv!270 (buf!623 thiss!1486)))))

(declare-fun b!11048 () Bool)

(assert (=> b!11048 (= e!6743 true)))

(declare-datatypes ((tuple2!1344 0))(
  ( (tuple2!1345 (_1!718 array!647) (_2!718 BitStream!522)) )
))
(declare-fun lt!17535 () tuple2!1344)

(declare-fun lt!17537 () Unit!952)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!522 array!647 array!647 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!952)

(assert (=> b!11048 (= lt!17537 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!717 lt!17538) srcBuffer!6 (_1!718 lt!17535) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!11049 () Bool)

(assert (=> b!11049 (= e!6740 (not e!6743))))

(declare-fun res!10888 () Bool)

(assert (=> b!11049 (=> res!10888 e!6743)))

(assert (=> b!11049 (= res!10888 (not (= (byteArrayBitContentToList!0 (_2!717 lt!17538) (_1!718 lt!17535) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!17536)))))

(declare-datatypes ((tuple2!1346 0))(
  ( (tuple2!1347 (_1!719 BitStream!522) (_2!719 BitStream!522)) )
))
(declare-fun lt!17539 () tuple2!1346)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!522 BitStream!522 (_ BitVec 64)) List!157)

(assert (=> b!11049 (= lt!17536 (bitStreamReadBitsIntoList!0 (_2!717 lt!17538) (_1!719 lt!17539) nBits!460))))

(declare-fun readBits!0 (BitStream!522 (_ BitVec 64)) tuple2!1344)

(assert (=> b!11049 (= lt!17535 (readBits!0 (_1!719 lt!17539) nBits!460))))

(assert (=> b!11049 (validate_offset_bits!1 ((_ sign_extend 32) (size!278 (buf!623 (_2!717 lt!17538)))) ((_ sign_extend 32) (currentByte!1695 thiss!1486)) ((_ sign_extend 32) (currentBit!1690 thiss!1486)) nBits!460)))

(declare-fun lt!17540 () Unit!952)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!522 array!647 (_ BitVec 64)) Unit!952)

(assert (=> b!11049 (= lt!17540 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!623 (_2!717 lt!17538)) nBits!460))))

(declare-fun reader!0 (BitStream!522 BitStream!522) tuple2!1346)

(assert (=> b!11049 (= lt!17539 (reader!0 thiss!1486 (_2!717 lt!17538)))))

(assert (= (and start!2356 res!10887) b!11043))

(assert (= (and b!11043 res!10884) b!11047))

(assert (= (and b!11047 res!10886) b!11044))

(assert (= (and b!11044 res!10881) b!11046))

(assert (= (and b!11046 res!10883) b!11045))

(assert (= (and b!11045 res!10882) b!11049))

(assert (= (and b!11049 (not res!10888)) b!11041))

(assert (= (and b!11041 (not res!10885)) b!11048))

(assert (= start!2356 b!11042))

(declare-fun m!16161 () Bool)

(assert (=> b!11043 m!16161))

(declare-fun m!16163 () Bool)

(assert (=> b!11048 m!16163))

(declare-fun m!16165 () Bool)

(assert (=> start!2356 m!16165))

(declare-fun m!16167 () Bool)

(assert (=> start!2356 m!16167))

(declare-fun m!16169 () Bool)

(assert (=> b!11049 m!16169))

(declare-fun m!16171 () Bool)

(assert (=> b!11049 m!16171))

(declare-fun m!16173 () Bool)

(assert (=> b!11049 m!16173))

(declare-fun m!16175 () Bool)

(assert (=> b!11049 m!16175))

(declare-fun m!16177 () Bool)

(assert (=> b!11049 m!16177))

(declare-fun m!16179 () Bool)

(assert (=> b!11049 m!16179))

(declare-fun m!16181 () Bool)

(assert (=> b!11041 m!16181))

(declare-fun m!16183 () Bool)

(assert (=> b!11042 m!16183))

(declare-fun m!16185 () Bool)

(assert (=> b!11045 m!16185))

(declare-fun m!16187 () Bool)

(assert (=> b!11046 m!16187))

(declare-fun m!16189 () Bool)

(assert (=> b!11046 m!16189))

(declare-fun m!16191 () Bool)

(assert (=> b!11047 m!16191))

(declare-fun m!16193 () Bool)

(assert (=> b!11047 m!16193))

(check-sat (not b!11042) (not b!11041) (not b!11048) (not b!11043) (not b!11049) (not start!2356) (not b!11047) (not b!11046) (not b!11045))
