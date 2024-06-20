; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27996 () Bool)

(assert start!27996)

(declare-fun b!144710 () Bool)

(declare-fun res!120942 () Bool)

(declare-fun e!96442 () Bool)

(assert (=> b!144710 (=> (not res!120942) (not e!96442))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6588 0))(
  ( (array!6589 (arr!3715 (Array (_ BitVec 32) (_ BitVec 8))) (size!2982 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5222 0))(
  ( (BitStream!5223 (buf!3421 array!6588) (currentByte!6311 (_ BitVec 32)) (currentBit!6306 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5222)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144710 (= res!120942 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2982 (buf!3421 thiss!1634))) ((_ sign_extend 32) (currentByte!6311 thiss!1634)) ((_ sign_extend 32) (currentBit!6306 thiss!1634)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!12898 0))(
  ( (tuple2!12899 (_1!6795 BitStream!5222) (_2!6795 BitStream!5222)) )
))
(declare-fun lt!224363 () tuple2!12898)

(declare-fun b!144711 () Bool)

(declare-fun e!96446 () Bool)

(declare-fun arr!237 () array!6588)

(declare-datatypes ((tuple2!12900 0))(
  ( (tuple2!12901 (_1!6796 BitStream!5222) (_2!6796 (_ BitVec 8))) )
))
(declare-fun lt!224365 () tuple2!12900)

(assert (=> b!144711 (= e!96446 (and (= (_2!6796 lt!224365) (select (arr!3715 arr!237) from!447)) (= (_1!6796 lt!224365) (_2!6795 lt!224363))))))

(declare-fun readBytePure!0 (BitStream!5222) tuple2!12900)

(assert (=> b!144711 (= lt!224365 (readBytePure!0 (_1!6795 lt!224363)))))

(declare-datatypes ((Unit!9037 0))(
  ( (Unit!9038) )
))
(declare-datatypes ((tuple2!12902 0))(
  ( (tuple2!12903 (_1!6797 Unit!9037) (_2!6797 BitStream!5222)) )
))
(declare-fun lt!224356 () tuple2!12902)

(declare-fun reader!0 (BitStream!5222 BitStream!5222) tuple2!12898)

(assert (=> b!144711 (= lt!224363 (reader!0 thiss!1634 (_2!6797 lt!224356)))))

(declare-fun b!144712 () Bool)

(assert (=> b!144712 (= e!96442 (not true))))

(declare-fun e!96443 () Bool)

(assert (=> b!144712 e!96443))

(declare-fun res!120941 () Bool)

(assert (=> b!144712 (=> (not res!120941) (not e!96443))))

(declare-fun lt!224360 () tuple2!12902)

(assert (=> b!144712 (= res!120941 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2982 (buf!3421 (_2!6797 lt!224360)))) ((_ sign_extend 32) (currentByte!6311 thiss!1634)) ((_ sign_extend 32) (currentBit!6306 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!224362 () Unit!9037)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5222 array!6588 (_ BitVec 32)) Unit!9037)

(assert (=> b!144712 (= lt!224362 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3421 (_2!6797 lt!224360)) (bvsub to!404 from!447)))))

(declare-fun lt!224366 () tuple2!12898)

(assert (=> b!144712 (= (_2!6796 (readBytePure!0 (_1!6795 lt!224366))) (select (arr!3715 arr!237) from!447))))

(declare-fun lt!224359 () tuple2!12898)

(assert (=> b!144712 (= lt!224359 (reader!0 (_2!6797 lt!224356) (_2!6797 lt!224360)))))

(assert (=> b!144712 (= lt!224366 (reader!0 thiss!1634 (_2!6797 lt!224360)))))

(declare-fun e!96437 () Bool)

(assert (=> b!144712 e!96437))

(declare-fun res!120937 () Bool)

(assert (=> b!144712 (=> (not res!120937) (not e!96437))))

(declare-fun lt!224368 () tuple2!12900)

(declare-fun lt!224369 () tuple2!12900)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!144712 (= res!120937 (= (bitIndex!0 (size!2982 (buf!3421 (_1!6796 lt!224368))) (currentByte!6311 (_1!6796 lt!224368)) (currentBit!6306 (_1!6796 lt!224368))) (bitIndex!0 (size!2982 (buf!3421 (_1!6796 lt!224369))) (currentByte!6311 (_1!6796 lt!224369)) (currentBit!6306 (_1!6796 lt!224369)))))))

(declare-fun lt!224358 () Unit!9037)

(declare-fun lt!224357 () BitStream!5222)

(declare-fun readBytePrefixLemma!0 (BitStream!5222 BitStream!5222) Unit!9037)

(assert (=> b!144712 (= lt!224358 (readBytePrefixLemma!0 lt!224357 (_2!6797 lt!224360)))))

(assert (=> b!144712 (= lt!224369 (readBytePure!0 (BitStream!5223 (buf!3421 (_2!6797 lt!224360)) (currentByte!6311 thiss!1634) (currentBit!6306 thiss!1634))))))

(assert (=> b!144712 (= lt!224368 (readBytePure!0 lt!224357))))

(assert (=> b!144712 (= lt!224357 (BitStream!5223 (buf!3421 (_2!6797 lt!224356)) (currentByte!6311 thiss!1634) (currentBit!6306 thiss!1634)))))

(declare-fun e!96447 () Bool)

(assert (=> b!144712 e!96447))

(declare-fun res!120938 () Bool)

(assert (=> b!144712 (=> (not res!120938) (not e!96447))))

(declare-fun isPrefixOf!0 (BitStream!5222 BitStream!5222) Bool)

(assert (=> b!144712 (= res!120938 (isPrefixOf!0 thiss!1634 (_2!6797 lt!224360)))))

(declare-fun lt!224354 () Unit!9037)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5222 BitStream!5222 BitStream!5222) Unit!9037)

(assert (=> b!144712 (= lt!224354 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6797 lt!224356) (_2!6797 lt!224360)))))

(declare-fun e!96445 () Bool)

(assert (=> b!144712 e!96445))

(declare-fun res!120944 () Bool)

(assert (=> b!144712 (=> (not res!120944) (not e!96445))))

(assert (=> b!144712 (= res!120944 (= (size!2982 (buf!3421 (_2!6797 lt!224356))) (size!2982 (buf!3421 (_2!6797 lt!224360)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5222 array!6588 (_ BitVec 32) (_ BitVec 32)) tuple2!12902)

(assert (=> b!144712 (= lt!224360 (appendByteArrayLoop!0 (_2!6797 lt!224356) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!144712 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2982 (buf!3421 (_2!6797 lt!224356)))) ((_ sign_extend 32) (currentByte!6311 (_2!6797 lt!224356))) ((_ sign_extend 32) (currentBit!6306 (_2!6797 lt!224356))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!224361 () Unit!9037)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5222 BitStream!5222 (_ BitVec 64) (_ BitVec 32)) Unit!9037)

(assert (=> b!144712 (= lt!224361 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6797 lt!224356) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!144712 e!96446))

(declare-fun res!120940 () Bool)

(assert (=> b!144712 (=> (not res!120940) (not e!96446))))

(assert (=> b!144712 (= res!120940 (= (size!2982 (buf!3421 thiss!1634)) (size!2982 (buf!3421 (_2!6797 lt!224356)))))))

(declare-fun appendByte!0 (BitStream!5222 (_ BitVec 8)) tuple2!12902)

(assert (=> b!144712 (= lt!224356 (appendByte!0 thiss!1634 (select (arr!3715 arr!237) from!447)))))

(declare-fun b!144713 () Bool)

(assert (=> b!144713 (= e!96437 (= (_2!6796 lt!224368) (_2!6796 lt!224369)))))

(declare-fun res!120933 () Bool)

(assert (=> start!27996 (=> (not res!120933) (not e!96442))))

(assert (=> start!27996 (= res!120933 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2982 arr!237))))))

(assert (=> start!27996 e!96442))

(assert (=> start!27996 true))

(declare-fun array_inv!2771 (array!6588) Bool)

(assert (=> start!27996 (array_inv!2771 arr!237)))

(declare-fun e!96440 () Bool)

(declare-fun inv!12 (BitStream!5222) Bool)

(assert (=> start!27996 (and (inv!12 thiss!1634) e!96440)))

(declare-fun b!144714 () Bool)

(declare-datatypes ((tuple2!12904 0))(
  ( (tuple2!12905 (_1!6798 BitStream!5222) (_2!6798 array!6588)) )
))
(declare-fun lt!224355 () tuple2!12904)

(declare-fun e!96438 () Bool)

(declare-fun arrayRangesEq!298 (array!6588 array!6588 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144714 (= e!96438 (not (arrayRangesEq!298 arr!237 (_2!6798 lt!224355) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!144715 () Bool)

(declare-fun res!120945 () Bool)

(assert (=> b!144715 (=> (not res!120945) (not e!96442))))

(assert (=> b!144715 (= res!120945 (bvslt from!447 to!404))))

(declare-fun b!144716 () Bool)

(declare-fun res!120934 () Bool)

(assert (=> b!144716 (=> (not res!120934) (not e!96446))))

(assert (=> b!144716 (= res!120934 (= (bitIndex!0 (size!2982 (buf!3421 (_2!6797 lt!224356))) (currentByte!6311 (_2!6797 lt!224356)) (currentBit!6306 (_2!6797 lt!224356))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2982 (buf!3421 thiss!1634)) (currentByte!6311 thiss!1634) (currentBit!6306 thiss!1634)))))))

(declare-fun b!144717 () Bool)

(declare-fun readByteArrayLoopPure!0 (BitStream!5222 array!6588 (_ BitVec 32) (_ BitVec 32)) tuple2!12904)

(assert (=> b!144717 (= e!96443 (= (_1!6798 (readByteArrayLoopPure!0 (_1!6795 lt!224366) arr!237 from!447 to!404)) (_2!6795 lt!224366)))))

(declare-fun b!144718 () Bool)

(declare-fun res!120935 () Bool)

(assert (=> b!144718 (=> (not res!120935) (not e!96446))))

(assert (=> b!144718 (= res!120935 (isPrefixOf!0 thiss!1634 (_2!6797 lt!224356)))))

(declare-fun b!144719 () Bool)

(declare-fun res!120939 () Bool)

(assert (=> b!144719 (=> (not res!120939) (not e!96442))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144719 (= res!120939 (invariant!0 (currentBit!6306 thiss!1634) (currentByte!6311 thiss!1634) (size!2982 (buf!3421 thiss!1634))))))

(declare-fun b!144720 () Bool)

(assert (=> b!144720 (= e!96440 (array_inv!2771 (buf!3421 thiss!1634)))))

(declare-fun b!144721 () Bool)

(declare-fun e!96441 () Bool)

(assert (=> b!144721 (= e!96441 (not e!96438))))

(declare-fun res!120943 () Bool)

(assert (=> b!144721 (=> res!120943 e!96438)))

(declare-fun lt!224364 () tuple2!12898)

(assert (=> b!144721 (= res!120943 (or (not (= (size!2982 (_2!6798 lt!224355)) (size!2982 arr!237))) (not (= (_1!6798 lt!224355) (_2!6795 lt!224364)))))))

(assert (=> b!144721 (= lt!224355 (readByteArrayLoopPure!0 (_1!6795 lt!224364) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!224367 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!144721 (validate_offset_bits!1 ((_ sign_extend 32) (size!2982 (buf!3421 (_2!6797 lt!224360)))) ((_ sign_extend 32) (currentByte!6311 (_2!6797 lt!224356))) ((_ sign_extend 32) (currentBit!6306 (_2!6797 lt!224356))) lt!224367)))

(declare-fun lt!224370 () Unit!9037)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5222 array!6588 (_ BitVec 64)) Unit!9037)

(assert (=> b!144721 (= lt!224370 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6797 lt!224356) (buf!3421 (_2!6797 lt!224360)) lt!224367))))

(assert (=> b!144721 (= lt!224364 (reader!0 (_2!6797 lt!224356) (_2!6797 lt!224360)))))

(declare-fun b!144722 () Bool)

(declare-fun res!120946 () Bool)

(assert (=> b!144722 (=> (not res!120946) (not e!96441))))

(assert (=> b!144722 (= res!120946 (isPrefixOf!0 (_2!6797 lt!224356) (_2!6797 lt!224360)))))

(declare-fun b!144723 () Bool)

(assert (=> b!144723 (= e!96447 (invariant!0 (currentBit!6306 thiss!1634) (currentByte!6311 thiss!1634) (size!2982 (buf!3421 (_2!6797 lt!224356)))))))

(declare-fun b!144724 () Bool)

(assert (=> b!144724 (= e!96445 e!96441)))

(declare-fun res!120936 () Bool)

(assert (=> b!144724 (=> (not res!120936) (not e!96441))))

(assert (=> b!144724 (= res!120936 (= (bitIndex!0 (size!2982 (buf!3421 (_2!6797 lt!224360))) (currentByte!6311 (_2!6797 lt!224360)) (currentBit!6306 (_2!6797 lt!224360))) (bvadd (bitIndex!0 (size!2982 (buf!3421 (_2!6797 lt!224356))) (currentByte!6311 (_2!6797 lt!224356)) (currentBit!6306 (_2!6797 lt!224356))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!224367))))))

(assert (=> b!144724 (= lt!224367 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!27996 res!120933) b!144710))

(assert (= (and b!144710 res!120942) b!144715))

(assert (= (and b!144715 res!120945) b!144719))

(assert (= (and b!144719 res!120939) b!144712))

(assert (= (and b!144712 res!120940) b!144716))

(assert (= (and b!144716 res!120934) b!144718))

(assert (= (and b!144718 res!120935) b!144711))

(assert (= (and b!144712 res!120944) b!144724))

(assert (= (and b!144724 res!120936) b!144722))

(assert (= (and b!144722 res!120946) b!144721))

(assert (= (and b!144721 (not res!120943)) b!144714))

(assert (= (and b!144712 res!120938) b!144723))

(assert (= (and b!144712 res!120937) b!144713))

(assert (= (and b!144712 res!120941) b!144717))

(assert (= start!27996 b!144720))

(declare-fun m!222571 () Bool)

(assert (=> b!144720 m!222571))

(declare-fun m!222573 () Bool)

(assert (=> b!144723 m!222573))

(declare-fun m!222575 () Bool)

(assert (=> b!144712 m!222575))

(declare-fun m!222577 () Bool)

(assert (=> b!144712 m!222577))

(declare-fun m!222579 () Bool)

(assert (=> b!144712 m!222579))

(declare-fun m!222581 () Bool)

(assert (=> b!144712 m!222581))

(declare-fun m!222583 () Bool)

(assert (=> b!144712 m!222583))

(declare-fun m!222585 () Bool)

(assert (=> b!144712 m!222585))

(declare-fun m!222587 () Bool)

(assert (=> b!144712 m!222587))

(declare-fun m!222589 () Bool)

(assert (=> b!144712 m!222589))

(declare-fun m!222591 () Bool)

(assert (=> b!144712 m!222591))

(declare-fun m!222593 () Bool)

(assert (=> b!144712 m!222593))

(declare-fun m!222595 () Bool)

(assert (=> b!144712 m!222595))

(declare-fun m!222597 () Bool)

(assert (=> b!144712 m!222597))

(declare-fun m!222599 () Bool)

(assert (=> b!144712 m!222599))

(declare-fun m!222601 () Bool)

(assert (=> b!144712 m!222601))

(declare-fun m!222603 () Bool)

(assert (=> b!144712 m!222603))

(declare-fun m!222605 () Bool)

(assert (=> b!144712 m!222605))

(declare-fun m!222607 () Bool)

(assert (=> b!144712 m!222607))

(assert (=> b!144712 m!222601))

(declare-fun m!222609 () Bool)

(assert (=> b!144714 m!222609))

(declare-fun m!222611 () Bool)

(assert (=> b!144719 m!222611))

(declare-fun m!222613 () Bool)

(assert (=> b!144718 m!222613))

(declare-fun m!222615 () Bool)

(assert (=> b!144721 m!222615))

(declare-fun m!222617 () Bool)

(assert (=> b!144721 m!222617))

(declare-fun m!222619 () Bool)

(assert (=> b!144721 m!222619))

(assert (=> b!144721 m!222579))

(declare-fun m!222621 () Bool)

(assert (=> b!144716 m!222621))

(declare-fun m!222623 () Bool)

(assert (=> b!144716 m!222623))

(declare-fun m!222625 () Bool)

(assert (=> b!144717 m!222625))

(declare-fun m!222627 () Bool)

(assert (=> start!27996 m!222627))

(declare-fun m!222629 () Bool)

(assert (=> start!27996 m!222629))

(declare-fun m!222631 () Bool)

(assert (=> b!144710 m!222631))

(declare-fun m!222633 () Bool)

(assert (=> b!144724 m!222633))

(assert (=> b!144724 m!222621))

(declare-fun m!222635 () Bool)

(assert (=> b!144722 m!222635))

(assert (=> b!144711 m!222601))

(declare-fun m!222637 () Bool)

(assert (=> b!144711 m!222637))

(declare-fun m!222639 () Bool)

(assert (=> b!144711 m!222639))

(push 1)

