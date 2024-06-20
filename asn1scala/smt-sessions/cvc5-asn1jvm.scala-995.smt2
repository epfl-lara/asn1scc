; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27992 () Bool)

(assert start!27992)

(declare-datatypes ((array!6584 0))(
  ( (array!6585 (arr!3713 (Array (_ BitVec 32) (_ BitVec 8))) (size!2980 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6584)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((BitStream!5218 0))(
  ( (BitStream!5219 (buf!3419 array!6584) (currentByte!6309 (_ BitVec 32)) (currentBit!6304 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12882 0))(
  ( (tuple2!12883 (_1!6787 BitStream!5218) (_2!6787 BitStream!5218)) )
))
(declare-fun lt!224255 () tuple2!12882)

(declare-datatypes ((tuple2!12884 0))(
  ( (tuple2!12885 (_1!6788 BitStream!5218) (_2!6788 (_ BitVec 8))) )
))
(declare-fun lt!224257 () tuple2!12884)

(declare-fun b!144620 () Bool)

(declare-fun e!96374 () Bool)

(assert (=> b!144620 (= e!96374 (and (= (_2!6788 lt!224257) (select (arr!3713 arr!237) from!447)) (= (_1!6788 lt!224257) (_2!6787 lt!224255))))))

(declare-fun readBytePure!0 (BitStream!5218) tuple2!12884)

(assert (=> b!144620 (= lt!224257 (readBytePure!0 (_1!6787 lt!224255)))))

(declare-fun thiss!1634 () BitStream!5218)

(declare-datatypes ((Unit!9033 0))(
  ( (Unit!9034) )
))
(declare-datatypes ((tuple2!12886 0))(
  ( (tuple2!12887 (_1!6789 Unit!9033) (_2!6789 BitStream!5218)) )
))
(declare-fun lt!224252 () tuple2!12886)

(declare-fun reader!0 (BitStream!5218 BitStream!5218) tuple2!12882)

(assert (=> b!144620 (= lt!224255 (reader!0 thiss!1634 (_2!6789 lt!224252)))))

(declare-fun b!144621 () Bool)

(declare-fun e!96379 () Bool)

(declare-fun e!96380 () Bool)

(assert (=> b!144621 (= e!96379 e!96380)))

(declare-fun res!120856 () Bool)

(assert (=> b!144621 (=> (not res!120856) (not e!96380))))

(declare-fun lt!224259 () (_ BitVec 64))

(declare-fun lt!224268 () tuple2!12886)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!144621 (= res!120856 (= (bitIndex!0 (size!2980 (buf!3419 (_2!6789 lt!224268))) (currentByte!6309 (_2!6789 lt!224268)) (currentBit!6304 (_2!6789 lt!224268))) (bvadd (bitIndex!0 (size!2980 (buf!3419 (_2!6789 lt!224252))) (currentByte!6309 (_2!6789 lt!224252)) (currentBit!6304 (_2!6789 lt!224252))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!224259))))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!144621 (= lt!224259 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!144622 () Bool)

(declare-fun e!96371 () Bool)

(assert (=> b!144622 (= e!96380 (not e!96371))))

(declare-fun res!120857 () Bool)

(assert (=> b!144622 (=> res!120857 e!96371)))

(declare-datatypes ((tuple2!12888 0))(
  ( (tuple2!12889 (_1!6790 BitStream!5218) (_2!6790 array!6584)) )
))
(declare-fun lt!224266 () tuple2!12888)

(declare-fun lt!224260 () tuple2!12882)

(assert (=> b!144622 (= res!120857 (or (not (= (size!2980 (_2!6790 lt!224266)) (size!2980 arr!237))) (not (= (_1!6790 lt!224266) (_2!6787 lt!224260)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5218 array!6584 (_ BitVec 32) (_ BitVec 32)) tuple2!12888)

(assert (=> b!144622 (= lt!224266 (readByteArrayLoopPure!0 (_1!6787 lt!224260) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!144622 (validate_offset_bits!1 ((_ sign_extend 32) (size!2980 (buf!3419 (_2!6789 lt!224268)))) ((_ sign_extend 32) (currentByte!6309 (_2!6789 lt!224252))) ((_ sign_extend 32) (currentBit!6304 (_2!6789 lt!224252))) lt!224259)))

(declare-fun lt!224267 () Unit!9033)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5218 array!6584 (_ BitVec 64)) Unit!9033)

(assert (=> b!144622 (= lt!224267 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6789 lt!224252) (buf!3419 (_2!6789 lt!224268)) lt!224259))))

(assert (=> b!144622 (= lt!224260 (reader!0 (_2!6789 lt!224252) (_2!6789 lt!224268)))))

(declare-fun b!144623 () Bool)

(declare-fun e!96377 () Bool)

(declare-fun lt!224262 () tuple2!12884)

(declare-fun lt!224261 () tuple2!12884)

(assert (=> b!144623 (= e!96377 (= (_2!6788 lt!224262) (_2!6788 lt!224261)))))

(declare-fun b!144624 () Bool)

(declare-fun e!96381 () Bool)

(assert (=> b!144624 (= e!96381 (not true))))

(declare-fun e!96376 () Bool)

(assert (=> b!144624 e!96376))

(declare-fun res!120860 () Bool)

(assert (=> b!144624 (=> (not res!120860) (not e!96376))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144624 (= res!120860 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2980 (buf!3419 (_2!6789 lt!224268)))) ((_ sign_extend 32) (currentByte!6309 thiss!1634)) ((_ sign_extend 32) (currentBit!6304 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!224258 () Unit!9033)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5218 array!6584 (_ BitVec 32)) Unit!9033)

(assert (=> b!144624 (= lt!224258 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3419 (_2!6789 lt!224268)) (bvsub to!404 from!447)))))

(declare-fun lt!224256 () tuple2!12882)

(assert (=> b!144624 (= (_2!6788 (readBytePure!0 (_1!6787 lt!224256))) (select (arr!3713 arr!237) from!447))))

(declare-fun lt!224263 () tuple2!12882)

(assert (=> b!144624 (= lt!224263 (reader!0 (_2!6789 lt!224252) (_2!6789 lt!224268)))))

(assert (=> b!144624 (= lt!224256 (reader!0 thiss!1634 (_2!6789 lt!224268)))))

(assert (=> b!144624 e!96377))

(declare-fun res!120850 () Bool)

(assert (=> b!144624 (=> (not res!120850) (not e!96377))))

(assert (=> b!144624 (= res!120850 (= (bitIndex!0 (size!2980 (buf!3419 (_1!6788 lt!224262))) (currentByte!6309 (_1!6788 lt!224262)) (currentBit!6304 (_1!6788 lt!224262))) (bitIndex!0 (size!2980 (buf!3419 (_1!6788 lt!224261))) (currentByte!6309 (_1!6788 lt!224261)) (currentBit!6304 (_1!6788 lt!224261)))))))

(declare-fun lt!224264 () Unit!9033)

(declare-fun lt!224265 () BitStream!5218)

(declare-fun readBytePrefixLemma!0 (BitStream!5218 BitStream!5218) Unit!9033)

(assert (=> b!144624 (= lt!224264 (readBytePrefixLemma!0 lt!224265 (_2!6789 lt!224268)))))

(assert (=> b!144624 (= lt!224261 (readBytePure!0 (BitStream!5219 (buf!3419 (_2!6789 lt!224268)) (currentByte!6309 thiss!1634) (currentBit!6304 thiss!1634))))))

(assert (=> b!144624 (= lt!224262 (readBytePure!0 lt!224265))))

(assert (=> b!144624 (= lt!224265 (BitStream!5219 (buf!3419 (_2!6789 lt!224252)) (currentByte!6309 thiss!1634) (currentBit!6304 thiss!1634)))))

(declare-fun e!96378 () Bool)

(assert (=> b!144624 e!96378))

(declare-fun res!120859 () Bool)

(assert (=> b!144624 (=> (not res!120859) (not e!96378))))

(declare-fun isPrefixOf!0 (BitStream!5218 BitStream!5218) Bool)

(assert (=> b!144624 (= res!120859 (isPrefixOf!0 thiss!1634 (_2!6789 lt!224268)))))

(declare-fun lt!224253 () Unit!9033)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5218 BitStream!5218 BitStream!5218) Unit!9033)

(assert (=> b!144624 (= lt!224253 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6789 lt!224252) (_2!6789 lt!224268)))))

(assert (=> b!144624 e!96379))

(declare-fun res!120851 () Bool)

(assert (=> b!144624 (=> (not res!120851) (not e!96379))))

(assert (=> b!144624 (= res!120851 (= (size!2980 (buf!3419 (_2!6789 lt!224252))) (size!2980 (buf!3419 (_2!6789 lt!224268)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5218 array!6584 (_ BitVec 32) (_ BitVec 32)) tuple2!12886)

(assert (=> b!144624 (= lt!224268 (appendByteArrayLoop!0 (_2!6789 lt!224252) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!144624 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2980 (buf!3419 (_2!6789 lt!224252)))) ((_ sign_extend 32) (currentByte!6309 (_2!6789 lt!224252))) ((_ sign_extend 32) (currentBit!6304 (_2!6789 lt!224252))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!224254 () Unit!9033)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5218 BitStream!5218 (_ BitVec 64) (_ BitVec 32)) Unit!9033)

(assert (=> b!144624 (= lt!224254 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6789 lt!224252) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!144624 e!96374))

(declare-fun res!120855 () Bool)

(assert (=> b!144624 (=> (not res!120855) (not e!96374))))

(assert (=> b!144624 (= res!120855 (= (size!2980 (buf!3419 thiss!1634)) (size!2980 (buf!3419 (_2!6789 lt!224252)))))))

(declare-fun appendByte!0 (BitStream!5218 (_ BitVec 8)) tuple2!12886)

(assert (=> b!144624 (= lt!224252 (appendByte!0 thiss!1634 (select (arr!3713 arr!237) from!447)))))

(declare-fun b!144625 () Bool)

(declare-fun e!96373 () Bool)

(declare-fun array_inv!2769 (array!6584) Bool)

(assert (=> b!144625 (= e!96373 (array_inv!2769 (buf!3419 thiss!1634)))))

(declare-fun b!144626 () Bool)

(assert (=> b!144626 (= e!96376 (= (_1!6790 (readByteArrayLoopPure!0 (_1!6787 lt!224256) arr!237 from!447 to!404)) (_2!6787 lt!224256)))))

(declare-fun b!144627 () Bool)

(declare-fun res!120849 () Bool)

(assert (=> b!144627 (=> (not res!120849) (not e!96381))))

(assert (=> b!144627 (= res!120849 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2980 (buf!3419 thiss!1634))) ((_ sign_extend 32) (currentByte!6309 thiss!1634)) ((_ sign_extend 32) (currentBit!6304 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!144628 () Bool)

(declare-fun res!120852 () Bool)

(assert (=> b!144628 (=> (not res!120852) (not e!96374))))

(assert (=> b!144628 (= res!120852 (isPrefixOf!0 thiss!1634 (_2!6789 lt!224252)))))

(declare-fun b!144629 () Bool)

(declare-fun arrayRangesEq!296 (array!6584 array!6584 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144629 (= e!96371 (not (arrayRangesEq!296 arr!237 (_2!6790 lt!224266) #b00000000000000000000000000000000 to!404)))))

(declare-fun res!120853 () Bool)

(assert (=> start!27992 (=> (not res!120853) (not e!96381))))

(assert (=> start!27992 (= res!120853 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2980 arr!237))))))

(assert (=> start!27992 e!96381))

(assert (=> start!27992 true))

(assert (=> start!27992 (array_inv!2769 arr!237)))

(declare-fun inv!12 (BitStream!5218) Bool)

(assert (=> start!27992 (and (inv!12 thiss!1634) e!96373)))

(declare-fun b!144630 () Bool)

(declare-fun res!120854 () Bool)

(assert (=> b!144630 (=> (not res!120854) (not e!96381))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144630 (= res!120854 (invariant!0 (currentBit!6304 thiss!1634) (currentByte!6309 thiss!1634) (size!2980 (buf!3419 thiss!1634))))))

(declare-fun b!144631 () Bool)

(assert (=> b!144631 (= e!96378 (invariant!0 (currentBit!6304 thiss!1634) (currentByte!6309 thiss!1634) (size!2980 (buf!3419 (_2!6789 lt!224252)))))))

(declare-fun b!144632 () Bool)

(declare-fun res!120858 () Bool)

(assert (=> b!144632 (=> (not res!120858) (not e!96380))))

(assert (=> b!144632 (= res!120858 (isPrefixOf!0 (_2!6789 lt!224252) (_2!6789 lt!224268)))))

(declare-fun b!144633 () Bool)

(declare-fun res!120861 () Bool)

(assert (=> b!144633 (=> (not res!120861) (not e!96374))))

(assert (=> b!144633 (= res!120861 (= (bitIndex!0 (size!2980 (buf!3419 (_2!6789 lt!224252))) (currentByte!6309 (_2!6789 lt!224252)) (currentBit!6304 (_2!6789 lt!224252))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2980 (buf!3419 thiss!1634)) (currentByte!6309 thiss!1634) (currentBit!6304 thiss!1634)))))))

(declare-fun b!144634 () Bool)

(declare-fun res!120862 () Bool)

(assert (=> b!144634 (=> (not res!120862) (not e!96381))))

(assert (=> b!144634 (= res!120862 (bvslt from!447 to!404))))

(assert (= (and start!27992 res!120853) b!144627))

(assert (= (and b!144627 res!120849) b!144634))

(assert (= (and b!144634 res!120862) b!144630))

(assert (= (and b!144630 res!120854) b!144624))

(assert (= (and b!144624 res!120855) b!144633))

(assert (= (and b!144633 res!120861) b!144628))

(assert (= (and b!144628 res!120852) b!144620))

(assert (= (and b!144624 res!120851) b!144621))

(assert (= (and b!144621 res!120856) b!144632))

(assert (= (and b!144632 res!120858) b!144622))

(assert (= (and b!144622 (not res!120857)) b!144629))

(assert (= (and b!144624 res!120859) b!144631))

(assert (= (and b!144624 res!120850) b!144623))

(assert (= (and b!144624 res!120860) b!144626))

(assert (= start!27992 b!144625))

(declare-fun m!222431 () Bool)

(assert (=> b!144630 m!222431))

(declare-fun m!222433 () Bool)

(assert (=> b!144621 m!222433))

(declare-fun m!222435 () Bool)

(assert (=> b!144621 m!222435))

(assert (=> b!144633 m!222435))

(declare-fun m!222437 () Bool)

(assert (=> b!144633 m!222437))

(declare-fun m!222439 () Bool)

(assert (=> b!144622 m!222439))

(declare-fun m!222441 () Bool)

(assert (=> b!144622 m!222441))

(declare-fun m!222443 () Bool)

(assert (=> b!144622 m!222443))

(declare-fun m!222445 () Bool)

(assert (=> b!144622 m!222445))

(declare-fun m!222447 () Bool)

(assert (=> b!144626 m!222447))

(declare-fun m!222449 () Bool)

(assert (=> b!144632 m!222449))

(declare-fun m!222451 () Bool)

(assert (=> b!144627 m!222451))

(declare-fun m!222453 () Bool)

(assert (=> b!144624 m!222453))

(declare-fun m!222455 () Bool)

(assert (=> b!144624 m!222455))

(declare-fun m!222457 () Bool)

(assert (=> b!144624 m!222457))

(declare-fun m!222459 () Bool)

(assert (=> b!144624 m!222459))

(declare-fun m!222461 () Bool)

(assert (=> b!144624 m!222461))

(declare-fun m!222463 () Bool)

(assert (=> b!144624 m!222463))

(assert (=> b!144624 m!222445))

(declare-fun m!222465 () Bool)

(assert (=> b!144624 m!222465))

(declare-fun m!222467 () Bool)

(assert (=> b!144624 m!222467))

(declare-fun m!222469 () Bool)

(assert (=> b!144624 m!222469))

(declare-fun m!222471 () Bool)

(assert (=> b!144624 m!222471))

(declare-fun m!222473 () Bool)

(assert (=> b!144624 m!222473))

(assert (=> b!144624 m!222471))

(declare-fun m!222475 () Bool)

(assert (=> b!144624 m!222475))

(declare-fun m!222477 () Bool)

(assert (=> b!144624 m!222477))

(declare-fun m!222479 () Bool)

(assert (=> b!144624 m!222479))

(declare-fun m!222481 () Bool)

(assert (=> b!144624 m!222481))

(declare-fun m!222483 () Bool)

(assert (=> b!144624 m!222483))

(declare-fun m!222485 () Bool)

(assert (=> b!144631 m!222485))

(declare-fun m!222487 () Bool)

(assert (=> b!144625 m!222487))

(assert (=> b!144620 m!222471))

(declare-fun m!222489 () Bool)

(assert (=> b!144620 m!222489))

(declare-fun m!222491 () Bool)

(assert (=> b!144620 m!222491))

(declare-fun m!222493 () Bool)

(assert (=> b!144629 m!222493))

(declare-fun m!222495 () Bool)

(assert (=> start!27992 m!222495))

(declare-fun m!222497 () Bool)

(assert (=> start!27992 m!222497))

(declare-fun m!222499 () Bool)

(assert (=> b!144628 m!222499))

(push 1)

(assert (not b!144620))

(assert (not b!144633))

(assert (not b!144621))

(assert (not b!144624))

(assert (not b!144631))

(assert (not b!144632))

(assert (not b!144622))

(assert (not b!144630))

(assert (not b!144629))

(assert (not start!27992))

(assert (not b!144626))

(assert (not b!144627))

(assert (not b!144625))

(assert (not b!144628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

