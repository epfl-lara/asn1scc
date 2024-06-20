; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52358 () Bool)

(assert start!52358)

(declare-fun b!240975 () Bool)

(declare-fun res!201174 () Bool)

(declare-fun e!166976 () Bool)

(assert (=> b!240975 (=> (not res!201174) (not e!166976))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-datatypes ((array!13187 0))(
  ( (array!13188 (arr!6762 (Array (_ BitVec 32) (_ BitVec 8))) (size!5775 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10472 0))(
  ( (BitStream!10473 (buf!6241 array!13187) (currentByte!11601 (_ BitVec 32)) (currentBit!11596 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17651 0))(
  ( (Unit!17652) )
))
(declare-datatypes ((tuple2!20496 0))(
  ( (tuple2!20497 (_1!11170 Unit!17651) (_2!11170 BitStream!10472)) )
))
(declare-fun lt!376542 () tuple2!20496)

(declare-fun thiss!982 () BitStream!10472)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240975 (= res!201174 (= (bitIndex!0 (size!5775 (buf!6241 (_2!11170 lt!376542))) (currentByte!11601 (_2!11170 lt!376542)) (currentBit!11596 (_2!11170 lt!376542))) (bvadd (bitIndex!0 (size!5775 (buf!6241 thiss!982)) (currentByte!11601 thiss!982) (currentBit!11596 thiss!982)) nBits!288)))))

(declare-fun b!240976 () Bool)

(declare-fun res!201172 () Bool)

(declare-fun e!166979 () Bool)

(assert (=> b!240976 (=> (not res!201172) (not e!166979))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240976 (= res!201172 (validate_offset_bits!1 ((_ sign_extend 32) (size!5775 (buf!6241 thiss!982))) ((_ sign_extend 32) (currentByte!11601 thiss!982)) ((_ sign_extend 32) (currentBit!11596 thiss!982)) nBits!288))))

(declare-fun b!240977 () Bool)

(declare-fun res!201170 () Bool)

(assert (=> b!240977 (=> (not res!201170) (not e!166976))))

(declare-fun isPrefixOf!0 (BitStream!10472 BitStream!10472) Bool)

(assert (=> b!240977 (= res!201170 (isPrefixOf!0 thiss!982 (_2!11170 lt!376542)))))

(declare-fun b!240978 () Bool)

(declare-fun e!166977 () Bool)

(declare-fun array_inv!5516 (array!13187) Bool)

(assert (=> b!240978 (= e!166977 (array_inv!5516 (buf!6241 thiss!982)))))

(declare-fun b!240979 () Bool)

(declare-datatypes ((tuple2!20498 0))(
  ( (tuple2!20499 (_1!11171 BitStream!10472) (_2!11171 Bool)) )
))
(declare-fun lt!376548 () tuple2!20498)

(declare-datatypes ((tuple2!20500 0))(
  ( (tuple2!20501 (_1!11172 BitStream!10472) (_2!11172 BitStream!10472)) )
))
(declare-fun lt!376546 () tuple2!20500)

(assert (=> b!240979 (= e!166976 (not (or (not (_2!11171 lt!376548)) (not (= (_1!11171 lt!376548) (_2!11172 lt!376546))))))))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10472 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20498)

(assert (=> b!240979 (= lt!376548 (checkBitsLoopPure!0 (_1!11172 lt!376546) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240979 (validate_offset_bits!1 ((_ sign_extend 32) (size!5775 (buf!6241 (_2!11170 lt!376542)))) ((_ sign_extend 32) (currentByte!11601 thiss!982)) ((_ sign_extend 32) (currentBit!11596 thiss!982)) nBits!288)))

(declare-fun lt!376547 () Unit!17651)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10472 array!13187 (_ BitVec 64)) Unit!17651)

(assert (=> b!240979 (= lt!376547 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6241 (_2!11170 lt!376542)) nBits!288))))

(declare-fun reader!0 (BitStream!10472 BitStream!10472) tuple2!20500)

(assert (=> b!240979 (= lt!376546 (reader!0 thiss!982 (_2!11170 lt!376542)))))

(declare-fun b!240980 () Bool)

(assert (=> b!240980 (= e!166979 (not true))))

(declare-fun lt!376541 () tuple2!20500)

(assert (=> b!240980 (= lt!376541 (reader!0 thiss!982 (_2!11170 lt!376542)))))

(declare-fun lt!376545 () Bool)

(assert (=> b!240980 (= lt!376545 (isPrefixOf!0 thiss!982 (_2!11170 lt!376542)))))

(declare-fun lt!376544 () (_ BitVec 64))

(assert (=> b!240980 (= lt!376544 (bitIndex!0 (size!5775 (buf!6241 (_2!11170 lt!376542))) (currentByte!11601 (_2!11170 lt!376542)) (currentBit!11596 (_2!11170 lt!376542))))))

(declare-fun lt!376543 () (_ BitVec 64))

(assert (=> b!240980 (= lt!376543 (bitIndex!0 (size!5775 (buf!6241 thiss!982)) (currentByte!11601 thiss!982) (currentBit!11596 thiss!982)))))

(assert (=> b!240980 e!166976))

(declare-fun res!201171 () Bool)

(assert (=> b!240980 (=> (not res!201171) (not e!166976))))

(assert (=> b!240980 (= res!201171 (= (size!5775 (buf!6241 thiss!982)) (size!5775 (buf!6241 (_2!11170 lt!376542)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10472 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20496)

(assert (=> b!240980 (= lt!376542 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!201173 () Bool)

(assert (=> start!52358 (=> (not res!201173) (not e!166979))))

(assert (=> start!52358 (= res!201173 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52358 e!166979))

(assert (=> start!52358 true))

(declare-fun inv!12 (BitStream!10472) Bool)

(assert (=> start!52358 (and (inv!12 thiss!982) e!166977)))

(assert (= (and start!52358 res!201173) b!240976))

(assert (= (and b!240976 res!201172) b!240980))

(assert (= (and b!240980 res!201171) b!240975))

(assert (= (and b!240975 res!201174) b!240977))

(assert (= (and b!240977 res!201170) b!240979))

(assert (= start!52358 b!240978))

(declare-fun m!363635 () Bool)

(assert (=> b!240977 m!363635))

(declare-fun m!363637 () Bool)

(assert (=> b!240978 m!363637))

(declare-fun m!363639 () Bool)

(assert (=> b!240980 m!363639))

(declare-fun m!363641 () Bool)

(assert (=> b!240980 m!363641))

(declare-fun m!363643 () Bool)

(assert (=> b!240980 m!363643))

(assert (=> b!240980 m!363635))

(declare-fun m!363645 () Bool)

(assert (=> b!240980 m!363645))

(assert (=> b!240975 m!363645))

(assert (=> b!240975 m!363639))

(declare-fun m!363647 () Bool)

(assert (=> b!240976 m!363647))

(declare-fun m!363649 () Bool)

(assert (=> start!52358 m!363649))

(declare-fun m!363651 () Bool)

(assert (=> b!240979 m!363651))

(declare-fun m!363653 () Bool)

(assert (=> b!240979 m!363653))

(declare-fun m!363655 () Bool)

(assert (=> b!240979 m!363655))

(assert (=> b!240979 m!363641))

(push 1)

(assert (not b!240979))

(assert (not b!240977))

(assert (not b!240976))

(assert (not b!240978))

