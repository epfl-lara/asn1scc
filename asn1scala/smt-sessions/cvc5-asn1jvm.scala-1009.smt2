; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28758 () Bool)

(assert start!28758)

(declare-fun b!148980 () Bool)

(declare-fun res!124749 () Bool)

(declare-fun e!99429 () Bool)

(assert (=> b!148980 (=> (not res!124749) (not e!99429))))

(declare-datatypes ((array!6680 0))(
  ( (array!6681 (arr!3806 (Array (_ BitVec 32) (_ BitVec 8))) (size!3022 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5302 0))(
  ( (BitStream!5303 (buf!3497 array!6680) (currentByte!6411 (_ BitVec 32)) (currentBit!6406 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9435 0))(
  ( (Unit!9436) )
))
(declare-datatypes ((tuple2!13254 0))(
  ( (tuple2!13255 (_1!6991 Unit!9435) (_2!6991 BitStream!5302)) )
))
(declare-fun lt!232341 () tuple2!13254)

(declare-fun thiss!1634 () BitStream!5302)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!148980 (= res!124749 (= (bitIndex!0 (size!3022 (buf!3497 (_2!6991 lt!232341))) (currentByte!6411 (_2!6991 lt!232341)) (currentBit!6406 (_2!6991 lt!232341))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3022 (buf!3497 thiss!1634)) (currentByte!6411 thiss!1634) (currentBit!6406 thiss!1634)))))))

(declare-fun b!148981 () Bool)

(declare-fun res!124744 () Bool)

(assert (=> b!148981 (=> (not res!124744) (not e!99429))))

(declare-fun isPrefixOf!0 (BitStream!5302 BitStream!5302) Bool)

(assert (=> b!148981 (= res!124744 (isPrefixOf!0 thiss!1634 (_2!6991 lt!232341)))))

(declare-fun b!148982 () Bool)

(declare-fun res!124746 () Bool)

(declare-fun e!99428 () Bool)

(assert (=> b!148982 (=> (not res!124746) (not e!99428))))

(declare-fun lt!232362 () tuple2!13254)

(assert (=> b!148982 (= res!124746 (isPrefixOf!0 (_2!6991 lt!232341) (_2!6991 lt!232362)))))

(declare-datatypes ((tuple2!13256 0))(
  ( (tuple2!13257 (_1!6992 BitStream!5302) (_2!6992 array!6680)) )
))
(declare-fun lt!232365 () tuple2!13256)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6680)

(declare-fun e!99425 () Bool)

(declare-fun b!148984 () Bool)

(declare-fun arrayRangesEq!338 (array!6680 array!6680 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!148984 (= e!99425 (not (arrayRangesEq!338 arr!237 (_2!6992 lt!232365) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!148985 () Bool)

(declare-fun e!99430 () Bool)

(declare-datatypes ((tuple2!13258 0))(
  ( (tuple2!13259 (_1!6993 BitStream!5302) (_2!6993 (_ BitVec 8))) )
))
(declare-fun lt!232355 () tuple2!13258)

(declare-fun lt!232342 () tuple2!13258)

(assert (=> b!148985 (= e!99430 (= (_2!6993 lt!232355) (_2!6993 lt!232342)))))

(declare-fun b!148986 () Bool)

(declare-fun e!99433 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!148986 (= e!99433 (invariant!0 (currentBit!6406 thiss!1634) (currentByte!6411 thiss!1634) (size!3022 (buf!3497 (_2!6991 lt!232341)))))))

(declare-fun b!148987 () Bool)

(declare-fun e!99432 () Bool)

(assert (=> b!148987 (= e!99432 e!99428)))

(declare-fun res!124750 () Bool)

(assert (=> b!148987 (=> (not res!124750) (not e!99428))))

(declare-fun lt!232350 () (_ BitVec 64))

(assert (=> b!148987 (= res!124750 (= (bitIndex!0 (size!3022 (buf!3497 (_2!6991 lt!232362))) (currentByte!6411 (_2!6991 lt!232362)) (currentBit!6406 (_2!6991 lt!232362))) (bvadd (bitIndex!0 (size!3022 (buf!3497 (_2!6991 lt!232341))) (currentByte!6411 (_2!6991 lt!232341)) (currentBit!6406 (_2!6991 lt!232341))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!232350))))))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!148987 (= lt!232350 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!148988 () Bool)

(declare-fun res!124754 () Bool)

(declare-fun e!99424 () Bool)

(assert (=> b!148988 (=> (not res!124754) (not e!99424))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!148988 (= res!124754 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3022 (buf!3497 thiss!1634))) ((_ sign_extend 32) (currentByte!6411 thiss!1634)) ((_ sign_extend 32) (currentBit!6406 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!148989 () Bool)

(assert (=> b!148989 (= e!99428 (not e!99425))))

(declare-fun res!124742 () Bool)

(assert (=> b!148989 (=> res!124742 e!99425)))

(declare-datatypes ((tuple2!13260 0))(
  ( (tuple2!13261 (_1!6994 BitStream!5302) (_2!6994 BitStream!5302)) )
))
(declare-fun lt!232343 () tuple2!13260)

(assert (=> b!148989 (= res!124742 (or (not (= (size!3022 (_2!6992 lt!232365)) (size!3022 arr!237))) (not (= (_1!6992 lt!232365) (_2!6994 lt!232343)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5302 array!6680 (_ BitVec 32) (_ BitVec 32)) tuple2!13256)

(assert (=> b!148989 (= lt!232365 (readByteArrayLoopPure!0 (_1!6994 lt!232343) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!148989 (validate_offset_bits!1 ((_ sign_extend 32) (size!3022 (buf!3497 (_2!6991 lt!232362)))) ((_ sign_extend 32) (currentByte!6411 (_2!6991 lt!232341))) ((_ sign_extend 32) (currentBit!6406 (_2!6991 lt!232341))) lt!232350)))

(declare-fun lt!232349 () Unit!9435)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5302 array!6680 (_ BitVec 64)) Unit!9435)

(assert (=> b!148989 (= lt!232349 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6991 lt!232341) (buf!3497 (_2!6991 lt!232362)) lt!232350))))

(declare-fun reader!0 (BitStream!5302 BitStream!5302) tuple2!13260)

(assert (=> b!148989 (= lt!232343 (reader!0 (_2!6991 lt!232341) (_2!6991 lt!232362)))))

(declare-fun b!148990 () Bool)

(declare-fun res!124751 () Bool)

(assert (=> b!148990 (=> (not res!124751) (not e!99424))))

(assert (=> b!148990 (= res!124751 (invariant!0 (currentBit!6406 thiss!1634) (currentByte!6411 thiss!1634) (size!3022 (buf!3497 thiss!1634))))))

(declare-fun b!148983 () Bool)

(declare-fun res!124753 () Bool)

(assert (=> b!148983 (=> (not res!124753) (not e!99424))))

(assert (=> b!148983 (= res!124753 (bvslt from!447 to!404))))

(declare-fun res!124752 () Bool)

(assert (=> start!28758 (=> (not res!124752) (not e!99424))))

(assert (=> start!28758 (= res!124752 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3022 arr!237))))))

(assert (=> start!28758 e!99424))

(assert (=> start!28758 true))

(declare-fun array_inv!2811 (array!6680) Bool)

(assert (=> start!28758 (array_inv!2811 arr!237)))

(declare-fun e!99426 () Bool)

(declare-fun inv!12 (BitStream!5302) Bool)

(assert (=> start!28758 (and (inv!12 thiss!1634) e!99426)))

(declare-fun b!148991 () Bool)

(assert (=> b!148991 (= e!99426 (array_inv!2811 (buf!3497 thiss!1634)))))

(declare-fun b!148992 () Bool)

(declare-fun e!99431 () Bool)

(assert (=> b!148992 (= e!99424 (not e!99431))))

(declare-fun res!124747 () Bool)

(assert (=> b!148992 (=> res!124747 e!99431)))

(declare-fun lt!232352 () tuple2!13256)

(declare-fun lt!232359 () tuple2!13256)

(assert (=> b!148992 (= res!124747 (not (arrayRangesEq!338 (_2!6992 lt!232359) (_2!6992 lt!232352) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!232351 () tuple2!13256)

(assert (=> b!148992 (arrayRangesEq!338 (_2!6992 lt!232359) (_2!6992 lt!232351) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232353 () Unit!9435)

(declare-fun lt!232357 () tuple2!13260)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5302 array!6680 (_ BitVec 32) (_ BitVec 32)) Unit!9435)

(assert (=> b!148992 (= lt!232353 (readByteArrayLoopArrayPrefixLemma!0 (_1!6994 lt!232357) arr!237 from!447 to!404))))

(declare-fun lt!232345 () array!6680)

(declare-fun withMovedByteIndex!0 (BitStream!5302 (_ BitVec 32)) BitStream!5302)

(assert (=> b!148992 (= lt!232351 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6994 lt!232357) #b00000000000000000000000000000001) lt!232345 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232346 () tuple2!13260)

(assert (=> b!148992 (= lt!232352 (readByteArrayLoopPure!0 (_1!6994 lt!232346) lt!232345 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232364 () tuple2!13258)

(assert (=> b!148992 (= lt!232345 (array!6681 (store (arr!3806 arr!237) from!447 (_2!6993 lt!232364)) (size!3022 arr!237)))))

(declare-fun lt!232361 () (_ BitVec 32))

(assert (=> b!148992 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3022 (buf!3497 (_2!6991 lt!232362)))) ((_ sign_extend 32) (currentByte!6411 (_2!6991 lt!232341))) ((_ sign_extend 32) (currentBit!6406 (_2!6991 lt!232341))) lt!232361)))

(declare-fun lt!232340 () Unit!9435)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5302 array!6680 (_ BitVec 32)) Unit!9435)

(assert (=> b!148992 (= lt!232340 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6991 lt!232341) (buf!3497 (_2!6991 lt!232362)) lt!232361))))

(assert (=> b!148992 (= (_1!6992 lt!232359) (_2!6994 lt!232357))))

(assert (=> b!148992 (= lt!232359 (readByteArrayLoopPure!0 (_1!6994 lt!232357) arr!237 from!447 to!404))))

(assert (=> b!148992 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3022 (buf!3497 (_2!6991 lt!232362)))) ((_ sign_extend 32) (currentByte!6411 thiss!1634)) ((_ sign_extend 32) (currentBit!6406 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!232344 () Unit!9435)

(assert (=> b!148992 (= lt!232344 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3497 (_2!6991 lt!232362)) (bvsub to!404 from!447)))))

(assert (=> b!148992 (= (_2!6993 lt!232364) (select (arr!3806 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5302) tuple2!13258)

(assert (=> b!148992 (= lt!232364 (readBytePure!0 (_1!6994 lt!232357)))))

(assert (=> b!148992 (= lt!232346 (reader!0 (_2!6991 lt!232341) (_2!6991 lt!232362)))))

(assert (=> b!148992 (= lt!232357 (reader!0 thiss!1634 (_2!6991 lt!232362)))))

(assert (=> b!148992 e!99430))

(declare-fun res!124741 () Bool)

(assert (=> b!148992 (=> (not res!124741) (not e!99430))))

(assert (=> b!148992 (= res!124741 (= (bitIndex!0 (size!3022 (buf!3497 (_1!6993 lt!232355))) (currentByte!6411 (_1!6993 lt!232355)) (currentBit!6406 (_1!6993 lt!232355))) (bitIndex!0 (size!3022 (buf!3497 (_1!6993 lt!232342))) (currentByte!6411 (_1!6993 lt!232342)) (currentBit!6406 (_1!6993 lt!232342)))))))

(declare-fun lt!232360 () Unit!9435)

(declare-fun lt!232347 () BitStream!5302)

(declare-fun readBytePrefixLemma!0 (BitStream!5302 BitStream!5302) Unit!9435)

(assert (=> b!148992 (= lt!232360 (readBytePrefixLemma!0 lt!232347 (_2!6991 lt!232362)))))

(assert (=> b!148992 (= lt!232342 (readBytePure!0 (BitStream!5303 (buf!3497 (_2!6991 lt!232362)) (currentByte!6411 thiss!1634) (currentBit!6406 thiss!1634))))))

(assert (=> b!148992 (= lt!232355 (readBytePure!0 lt!232347))))

(assert (=> b!148992 (= lt!232347 (BitStream!5303 (buf!3497 (_2!6991 lt!232341)) (currentByte!6411 thiss!1634) (currentBit!6406 thiss!1634)))))

(assert (=> b!148992 e!99433))

(declare-fun res!124745 () Bool)

(assert (=> b!148992 (=> (not res!124745) (not e!99433))))

(assert (=> b!148992 (= res!124745 (isPrefixOf!0 thiss!1634 (_2!6991 lt!232362)))))

(declare-fun lt!232356 () Unit!9435)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5302 BitStream!5302 BitStream!5302) Unit!9435)

(assert (=> b!148992 (= lt!232356 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6991 lt!232341) (_2!6991 lt!232362)))))

(assert (=> b!148992 e!99432))

(declare-fun res!124748 () Bool)

(assert (=> b!148992 (=> (not res!124748) (not e!99432))))

(assert (=> b!148992 (= res!124748 (= (size!3022 (buf!3497 (_2!6991 lt!232341))) (size!3022 (buf!3497 (_2!6991 lt!232362)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5302 array!6680 (_ BitVec 32) (_ BitVec 32)) tuple2!13254)

(assert (=> b!148992 (= lt!232362 (appendByteArrayLoop!0 (_2!6991 lt!232341) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!148992 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3022 (buf!3497 (_2!6991 lt!232341)))) ((_ sign_extend 32) (currentByte!6411 (_2!6991 lt!232341))) ((_ sign_extend 32) (currentBit!6406 (_2!6991 lt!232341))) lt!232361)))

(assert (=> b!148992 (= lt!232361 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!232358 () Unit!9435)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5302 BitStream!5302 (_ BitVec 64) (_ BitVec 32)) Unit!9435)

(assert (=> b!148992 (= lt!232358 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6991 lt!232341) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!148992 e!99429))

(declare-fun res!124743 () Bool)

(assert (=> b!148992 (=> (not res!124743) (not e!99429))))

(assert (=> b!148992 (= res!124743 (= (size!3022 (buf!3497 thiss!1634)) (size!3022 (buf!3497 (_2!6991 lt!232341)))))))

(declare-fun appendByte!0 (BitStream!5302 (_ BitVec 8)) tuple2!13254)

(assert (=> b!148992 (= lt!232341 (appendByte!0 thiss!1634 (select (arr!3806 arr!237) from!447)))))

(declare-fun lt!232363 () tuple2!13260)

(declare-fun lt!232348 () tuple2!13258)

(declare-fun b!148993 () Bool)

(assert (=> b!148993 (= e!99429 (and (= (_2!6993 lt!232348) (select (arr!3806 arr!237) from!447)) (= (_1!6993 lt!232348) (_2!6994 lt!232363))))))

(assert (=> b!148993 (= lt!232348 (readBytePure!0 (_1!6994 lt!232363)))))

(assert (=> b!148993 (= lt!232363 (reader!0 thiss!1634 (_2!6991 lt!232341)))))

(declare-fun b!148994 () Bool)

(assert (=> b!148994 (= e!99431 true)))

(assert (=> b!148994 (arrayRangesEq!338 (_2!6992 lt!232352) (_2!6992 lt!232359) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232354 () Unit!9435)

(declare-fun arrayRangesEqSymmetricLemma!70 (array!6680 array!6680 (_ BitVec 32) (_ BitVec 32)) Unit!9435)

(assert (=> b!148994 (= lt!232354 (arrayRangesEqSymmetricLemma!70 (_2!6992 lt!232359) (_2!6992 lt!232352) #b00000000000000000000000000000000 to!404))))

(assert (= (and start!28758 res!124752) b!148988))

(assert (= (and b!148988 res!124754) b!148983))

(assert (= (and b!148983 res!124753) b!148990))

(assert (= (and b!148990 res!124751) b!148992))

(assert (= (and b!148992 res!124743) b!148980))

(assert (= (and b!148980 res!124749) b!148981))

(assert (= (and b!148981 res!124744) b!148993))

(assert (= (and b!148992 res!124748) b!148987))

(assert (= (and b!148987 res!124750) b!148982))

(assert (= (and b!148982 res!124746) b!148989))

(assert (= (and b!148989 (not res!124742)) b!148984))

(assert (= (and b!148992 res!124745) b!148986))

(assert (= (and b!148992 res!124741) b!148985))

(assert (= (and b!148992 (not res!124747)) b!148994))

(assert (= start!28758 b!148991))

(declare-fun m!231579 () Bool)

(assert (=> b!148993 m!231579))

(declare-fun m!231581 () Bool)

(assert (=> b!148993 m!231581))

(declare-fun m!231583 () Bool)

(assert (=> b!148993 m!231583))

(declare-fun m!231585 () Bool)

(assert (=> b!148990 m!231585))

(declare-fun m!231587 () Bool)

(assert (=> b!148980 m!231587))

(declare-fun m!231589 () Bool)

(assert (=> b!148980 m!231589))

(declare-fun m!231591 () Bool)

(assert (=> b!148991 m!231591))

(declare-fun m!231593 () Bool)

(assert (=> b!148981 m!231593))

(declare-fun m!231595 () Bool)

(assert (=> b!148986 m!231595))

(declare-fun m!231597 () Bool)

(assert (=> b!148988 m!231597))

(declare-fun m!231599 () Bool)

(assert (=> b!148992 m!231599))

(declare-fun m!231601 () Bool)

(assert (=> b!148992 m!231601))

(declare-fun m!231603 () Bool)

(assert (=> b!148992 m!231603))

(declare-fun m!231605 () Bool)

(assert (=> b!148992 m!231605))

(declare-fun m!231607 () Bool)

(assert (=> b!148992 m!231607))

(declare-fun m!231609 () Bool)

(assert (=> b!148992 m!231609))

(declare-fun m!231611 () Bool)

(assert (=> b!148992 m!231611))

(assert (=> b!148992 m!231579))

(declare-fun m!231613 () Bool)

(assert (=> b!148992 m!231613))

(declare-fun m!231615 () Bool)

(assert (=> b!148992 m!231615))

(declare-fun m!231617 () Bool)

(assert (=> b!148992 m!231617))

(declare-fun m!231619 () Bool)

(assert (=> b!148992 m!231619))

(assert (=> b!148992 m!231615))

(declare-fun m!231621 () Bool)

(assert (=> b!148992 m!231621))

(declare-fun m!231623 () Bool)

(assert (=> b!148992 m!231623))

(declare-fun m!231625 () Bool)

(assert (=> b!148992 m!231625))

(declare-fun m!231627 () Bool)

(assert (=> b!148992 m!231627))

(declare-fun m!231629 () Bool)

(assert (=> b!148992 m!231629))

(declare-fun m!231631 () Bool)

(assert (=> b!148992 m!231631))

(declare-fun m!231633 () Bool)

(assert (=> b!148992 m!231633))

(declare-fun m!231635 () Bool)

(assert (=> b!148992 m!231635))

(declare-fun m!231637 () Bool)

(assert (=> b!148992 m!231637))

(declare-fun m!231639 () Bool)

(assert (=> b!148992 m!231639))

(declare-fun m!231641 () Bool)

(assert (=> b!148992 m!231641))

(declare-fun m!231643 () Bool)

(assert (=> b!148992 m!231643))

(declare-fun m!231645 () Bool)

(assert (=> b!148992 m!231645))

(declare-fun m!231647 () Bool)

(assert (=> b!148992 m!231647))

(assert (=> b!148992 m!231579))

(declare-fun m!231649 () Bool)

(assert (=> b!148992 m!231649))

(declare-fun m!231651 () Bool)

(assert (=> b!148982 m!231651))

(declare-fun m!231653 () Bool)

(assert (=> b!148984 m!231653))

(declare-fun m!231655 () Bool)

(assert (=> start!28758 m!231655))

(declare-fun m!231657 () Bool)

(assert (=> start!28758 m!231657))

(declare-fun m!231659 () Bool)

(assert (=> b!148987 m!231659))

(assert (=> b!148987 m!231587))

(declare-fun m!231661 () Bool)

(assert (=> b!148989 m!231661))

(declare-fun m!231663 () Bool)

(assert (=> b!148989 m!231663))

(declare-fun m!231665 () Bool)

(assert (=> b!148989 m!231665))

(assert (=> b!148989 m!231623))

(declare-fun m!231667 () Bool)

(assert (=> b!148994 m!231667))

(declare-fun m!231669 () Bool)

(assert (=> b!148994 m!231669))

(push 1)

(assert (not b!148993))

(assert (not b!148989))

(assert (not b!148984))

(assert (not b!148992))

(assert (not b!148988))

(assert (not b!148990))

(assert (not b!148991))

(assert (not start!28758))

(assert (not b!148987))

(assert (not b!148982))

(assert (not b!148986))

(assert (not b!148994))

(assert (not b!148981))

(assert (not b!148980))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

