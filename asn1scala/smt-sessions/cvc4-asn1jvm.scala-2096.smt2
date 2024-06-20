; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53136 () Bool)

(assert start!53136)

(declare-fun b!246975 () Bool)

(declare-fun res!206662 () Bool)

(declare-fun e!171102 () Bool)

(assert (=> b!246975 (=> (not res!206662) (not e!171102))))

(declare-datatypes ((array!13464 0))(
  ( (array!13465 (arr!6891 (Array (_ BitVec 32) (_ BitVec 8))) (size!5904 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10730 0))(
  ( (BitStream!10731 (buf!6385 array!13464) (currentByte!11781 (_ BitVec 32)) (currentBit!11776 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17920 0))(
  ( (Unit!17921) )
))
(declare-datatypes ((tuple2!21204 0))(
  ( (tuple2!21205 (_1!11524 Unit!17920) (_2!11524 BitStream!10730)) )
))
(declare-fun lt!385169 () tuple2!21204)

(declare-fun lt!385184 () tuple2!21204)

(declare-fun isPrefixOf!0 (BitStream!10730 BitStream!10730) Bool)

(assert (=> b!246975 (= res!206662 (isPrefixOf!0 (_2!11524 lt!385169) (_2!11524 lt!385184)))))

(declare-fun b!246976 () Bool)

(declare-fun e!171110 () Bool)

(declare-fun e!171111 () Bool)

(assert (=> b!246976 (= e!171110 e!171111)))

(declare-fun res!206666 () Bool)

(assert (=> b!246976 (=> res!206666 e!171111)))

(declare-fun thiss!1005 () BitStream!10730)

(assert (=> b!246976 (= res!206666 (not (= (size!5904 (buf!6385 thiss!1005)) (size!5904 (buf!6385 (_2!11524 lt!385184))))))))

(declare-datatypes ((tuple2!21206 0))(
  ( (tuple2!21207 (_1!11525 BitStream!10730) (_2!11525 Bool)) )
))
(declare-fun lt!385180 () tuple2!21206)

(declare-fun lt!385178 () tuple2!21206)

(declare-datatypes ((tuple2!21208 0))(
  ( (tuple2!21209 (_1!11526 BitStream!10730) (_2!11526 BitStream!10730)) )
))
(declare-fun lt!385177 () tuple2!21208)

(assert (=> b!246976 (and (= (_2!11525 lt!385180) (_2!11525 lt!385178)) (= (_1!11525 lt!385180) (_2!11526 lt!385177)))))

(declare-fun b!246978 () Bool)

(declare-fun lt!385182 () tuple2!21206)

(declare-fun lt!385172 () tuple2!21208)

(assert (=> b!246978 (= e!171102 (not (or (not (_2!11525 lt!385182)) (not (= (_1!11525 lt!385182) (_2!11526 lt!385172))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10730 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21206)

(assert (=> b!246978 (= lt!385182 (checkBitsLoopPure!0 (_1!11526 lt!385172) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!385173 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246978 (validate_offset_bits!1 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385184)))) ((_ sign_extend 32) (currentByte!11781 (_2!11524 lt!385169))) ((_ sign_extend 32) (currentBit!11776 (_2!11524 lt!385169))) lt!385173)))

(declare-fun lt!385171 () Unit!17920)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10730 array!13464 (_ BitVec 64)) Unit!17920)

(assert (=> b!246978 (= lt!385171 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11524 lt!385169) (buf!6385 (_2!11524 lt!385184)) lt!385173))))

(declare-fun reader!0 (BitStream!10730 BitStream!10730) tuple2!21208)

(assert (=> b!246978 (= lt!385172 (reader!0 (_2!11524 lt!385169) (_2!11524 lt!385184)))))

(declare-fun b!246979 () Bool)

(declare-fun e!171109 () Bool)

(declare-fun lt!385167 () tuple2!21206)

(declare-fun lt!385176 () tuple2!21206)

(assert (=> b!246979 (= e!171109 (= (_2!11525 lt!385167) (_2!11525 lt!385176)))))

(declare-fun b!246980 () Bool)

(declare-fun res!206668 () Bool)

(assert (=> b!246980 (=> res!206668 e!171111)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246980 (= res!206668 (not (= (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385184))) (currentByte!11781 (_2!11524 lt!385184)) (currentBit!11776 (_2!11524 lt!385184))) (bvadd (bitIndex!0 (size!5904 (buf!6385 thiss!1005)) (currentByte!11781 thiss!1005) (currentBit!11776 thiss!1005)) (bvsub nBits!297 from!289)))))))

(declare-fun b!246981 () Bool)

(declare-fun e!171108 () Bool)

(declare-fun e!171104 () Bool)

(assert (=> b!246981 (= e!171108 e!171104)))

(declare-fun res!206672 () Bool)

(assert (=> b!246981 (=> (not res!206672) (not e!171104))))

(declare-fun lt!385174 () (_ BitVec 64))

(declare-fun lt!385186 () (_ BitVec 64))

(assert (=> b!246981 (= res!206672 (= lt!385174 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!385186)))))

(assert (=> b!246981 (= lt!385174 (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385169))) (currentByte!11781 (_2!11524 lt!385169)) (currentBit!11776 (_2!11524 lt!385169))))))

(assert (=> b!246981 (= lt!385186 (bitIndex!0 (size!5904 (buf!6385 thiss!1005)) (currentByte!11781 thiss!1005) (currentBit!11776 thiss!1005)))))

(declare-fun b!246982 () Bool)

(declare-fun e!171103 () Bool)

(assert (=> b!246982 (= e!171103 (not e!171110))))

(declare-fun res!206674 () Bool)

(assert (=> b!246982 (=> res!206674 e!171110)))

(declare-fun lt!385175 () tuple2!21208)

(assert (=> b!246982 (= res!206674 (not (= (_1!11525 lt!385178) (_2!11526 lt!385175))))))

(assert (=> b!246982 (= lt!385178 (checkBitsLoopPure!0 (_1!11526 lt!385175) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!385168 () (_ BitVec 64))

(assert (=> b!246982 (validate_offset_bits!1 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385184)))) ((_ sign_extend 32) (currentByte!11781 (_2!11524 lt!385169))) ((_ sign_extend 32) (currentBit!11776 (_2!11524 lt!385169))) lt!385168)))

(declare-fun lt!385181 () Unit!17920)

(assert (=> b!246982 (= lt!385181 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11524 lt!385169) (buf!6385 (_2!11524 lt!385184)) lt!385168))))

(assert (=> b!246982 (= lt!385180 (checkBitsLoopPure!0 (_1!11526 lt!385177) nBits!297 bit!26 from!289))))

(assert (=> b!246982 (validate_offset_bits!1 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385184)))) ((_ sign_extend 32) (currentByte!11781 thiss!1005)) ((_ sign_extend 32) (currentBit!11776 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!385179 () Unit!17920)

(assert (=> b!246982 (= lt!385179 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6385 (_2!11524 lt!385184)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10730) tuple2!21206)

(assert (=> b!246982 (= (_2!11525 (readBitPure!0 (_1!11526 lt!385177))) bit!26)))

(assert (=> b!246982 (= lt!385175 (reader!0 (_2!11524 lt!385169) (_2!11524 lt!385184)))))

(assert (=> b!246982 (= lt!385177 (reader!0 thiss!1005 (_2!11524 lt!385184)))))

(assert (=> b!246982 e!171109))

(declare-fun res!206660 () Bool)

(assert (=> b!246982 (=> (not res!206660) (not e!171109))))

(assert (=> b!246982 (= res!206660 (= (bitIndex!0 (size!5904 (buf!6385 (_1!11525 lt!385167))) (currentByte!11781 (_1!11525 lt!385167)) (currentBit!11776 (_1!11525 lt!385167))) (bitIndex!0 (size!5904 (buf!6385 (_1!11525 lt!385176))) (currentByte!11781 (_1!11525 lt!385176)) (currentBit!11776 (_1!11525 lt!385176)))))))

(declare-fun lt!385183 () Unit!17920)

(declare-fun lt!385187 () BitStream!10730)

(declare-fun readBitPrefixLemma!0 (BitStream!10730 BitStream!10730) Unit!17920)

(assert (=> b!246982 (= lt!385183 (readBitPrefixLemma!0 lt!385187 (_2!11524 lt!385184)))))

(assert (=> b!246982 (= lt!385176 (readBitPure!0 (BitStream!10731 (buf!6385 (_2!11524 lt!385184)) (currentByte!11781 thiss!1005) (currentBit!11776 thiss!1005))))))

(assert (=> b!246982 (= lt!385167 (readBitPure!0 lt!385187))))

(assert (=> b!246982 (= lt!385187 (BitStream!10731 (buf!6385 (_2!11524 lt!385169)) (currentByte!11781 thiss!1005) (currentBit!11776 thiss!1005)))))

(declare-fun e!171105 () Bool)

(assert (=> b!246982 e!171105))

(declare-fun res!206676 () Bool)

(assert (=> b!246982 (=> (not res!206676) (not e!171105))))

(assert (=> b!246982 (= res!206676 (isPrefixOf!0 thiss!1005 (_2!11524 lt!385184)))))

(declare-fun lt!385185 () Unit!17920)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10730 BitStream!10730 BitStream!10730) Unit!17920)

(assert (=> b!246982 (= lt!385185 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11524 lt!385169) (_2!11524 lt!385184)))))

(declare-fun e!171106 () Bool)

(assert (=> b!246982 e!171106))

(declare-fun res!206671 () Bool)

(assert (=> b!246982 (=> (not res!206671) (not e!171106))))

(assert (=> b!246982 (= res!206671 (= (size!5904 (buf!6385 (_2!11524 lt!385169))) (size!5904 (buf!6385 (_2!11524 lt!385184)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10730 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21204)

(assert (=> b!246982 (= lt!385184 (appendNBitsLoop!0 (_2!11524 lt!385169) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246982 (validate_offset_bits!1 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385169)))) ((_ sign_extend 32) (currentByte!11781 (_2!11524 lt!385169))) ((_ sign_extend 32) (currentBit!11776 (_2!11524 lt!385169))) lt!385168)))

(assert (=> b!246982 (= lt!385168 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!385188 () Unit!17920)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10730 BitStream!10730 (_ BitVec 64) (_ BitVec 64)) Unit!17920)

(assert (=> b!246982 (= lt!385188 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11524 lt!385169) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!246982 e!171108))

(declare-fun res!206664 () Bool)

(assert (=> b!246982 (=> (not res!206664) (not e!171108))))

(assert (=> b!246982 (= res!206664 (= (size!5904 (buf!6385 thiss!1005)) (size!5904 (buf!6385 (_2!11524 lt!385169)))))))

(declare-fun appendBit!0 (BitStream!10730 Bool) tuple2!21204)

(assert (=> b!246982 (= lt!385169 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246983 () Bool)

(declare-fun e!171113 () Bool)

(declare-fun array_inv!5645 (array!13464) Bool)

(assert (=> b!246983 (= e!171113 (array_inv!5645 (buf!6385 thiss!1005)))))

(declare-fun b!246977 () Bool)

(assert (=> b!246977 (= e!171111 (validate_offset_bits!1 ((_ sign_extend 32) (size!5904 (buf!6385 (_1!11526 lt!385177)))) ((_ sign_extend 32) (currentByte!11781 (_1!11526 lt!385177))) ((_ sign_extend 32) (currentBit!11776 (_1!11526 lt!385177))) (bvsub nBits!297 from!289)))))

(declare-fun res!206670 () Bool)

(assert (=> start!53136 (=> (not res!206670) (not e!171103))))

(assert (=> start!53136 (= res!206670 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53136 e!171103))

(assert (=> start!53136 true))

(declare-fun inv!12 (BitStream!10730) Bool)

(assert (=> start!53136 (and (inv!12 thiss!1005) e!171113)))

(declare-fun b!246984 () Bool)

(declare-fun res!206675 () Bool)

(assert (=> b!246984 (=> res!206675 e!171110)))

(declare-fun withMovedBitIndex!0 (BitStream!10730 (_ BitVec 64)) BitStream!10730)

(assert (=> b!246984 (= res!206675 (not (= (_1!11526 lt!385175) (withMovedBitIndex!0 (_1!11526 lt!385177) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!246985 () Bool)

(declare-fun res!206663 () Bool)

(assert (=> b!246985 (=> (not res!206663) (not e!171103))))

(assert (=> b!246985 (= res!206663 (validate_offset_bits!1 ((_ sign_extend 32) (size!5904 (buf!6385 thiss!1005))) ((_ sign_extend 32) (currentByte!11781 thiss!1005)) ((_ sign_extend 32) (currentBit!11776 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!246986 () Bool)

(declare-fun res!206667 () Bool)

(assert (=> b!246986 (=> (not res!206667) (not e!171103))))

(assert (=> b!246986 (= res!206667 (bvslt from!289 nBits!297))))

(declare-fun b!246987 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246987 (= e!171105 (invariant!0 (currentBit!11776 thiss!1005) (currentByte!11781 thiss!1005) (size!5904 (buf!6385 (_2!11524 lt!385184)))))))

(declare-fun b!246988 () Bool)

(declare-fun e!171112 () Bool)

(assert (=> b!246988 (= e!171104 e!171112)))

(declare-fun res!206669 () Bool)

(assert (=> b!246988 (=> (not res!206669) (not e!171112))))

(declare-fun lt!385170 () tuple2!21206)

(assert (=> b!246988 (= res!206669 (and (= (_2!11525 lt!385170) bit!26) (= (_1!11525 lt!385170) (_2!11524 lt!385169))))))

(declare-fun readerFrom!0 (BitStream!10730 (_ BitVec 32) (_ BitVec 32)) BitStream!10730)

(assert (=> b!246988 (= lt!385170 (readBitPure!0 (readerFrom!0 (_2!11524 lt!385169) (currentBit!11776 thiss!1005) (currentByte!11781 thiss!1005))))))

(declare-fun b!246989 () Bool)

(declare-fun res!206665 () Bool)

(assert (=> b!246989 (=> (not res!206665) (not e!171104))))

(assert (=> b!246989 (= res!206665 (isPrefixOf!0 thiss!1005 (_2!11524 lt!385169)))))

(declare-fun b!246990 () Bool)

(assert (=> b!246990 (= e!171106 e!171102)))

(declare-fun res!206661 () Bool)

(assert (=> b!246990 (=> (not res!206661) (not e!171102))))

(assert (=> b!246990 (= res!206661 (= (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385184))) (currentByte!11781 (_2!11524 lt!385184)) (currentBit!11776 (_2!11524 lt!385184))) (bvadd (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385169))) (currentByte!11781 (_2!11524 lt!385169)) (currentBit!11776 (_2!11524 lt!385169))) lt!385173)))))

(assert (=> b!246990 (= lt!385173 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246991 () Bool)

(assert (=> b!246991 (= e!171112 (= (bitIndex!0 (size!5904 (buf!6385 (_1!11525 lt!385170))) (currentByte!11781 (_1!11525 lt!385170)) (currentBit!11776 (_1!11525 lt!385170))) lt!385174))))

(declare-fun b!246992 () Bool)

(declare-fun res!206673 () Bool)

(assert (=> b!246992 (=> (not res!206673) (not e!171105))))

(assert (=> b!246992 (= res!206673 (invariant!0 (currentBit!11776 thiss!1005) (currentByte!11781 thiss!1005) (size!5904 (buf!6385 (_2!11524 lt!385169)))))))

(assert (= (and start!53136 res!206670) b!246985))

(assert (= (and b!246985 res!206663) b!246986))

(assert (= (and b!246986 res!206667) b!246982))

(assert (= (and b!246982 res!206664) b!246981))

(assert (= (and b!246981 res!206672) b!246989))

(assert (= (and b!246989 res!206665) b!246988))

(assert (= (and b!246988 res!206669) b!246991))

(assert (= (and b!246982 res!206671) b!246990))

(assert (= (and b!246990 res!206661) b!246975))

(assert (= (and b!246975 res!206662) b!246978))

(assert (= (and b!246982 res!206676) b!246992))

(assert (= (and b!246992 res!206673) b!246987))

(assert (= (and b!246982 res!206660) b!246979))

(assert (= (and b!246982 (not res!206674)) b!246984))

(assert (= (and b!246984 (not res!206675)) b!246976))

(assert (= (and b!246976 (not res!206666)) b!246980))

(assert (= (and b!246980 (not res!206668)) b!246977))

(assert (= start!53136 b!246983))

(declare-fun m!372445 () Bool)

(assert (=> b!246992 m!372445))

(declare-fun m!372447 () Bool)

(assert (=> b!246985 m!372447))

(declare-fun m!372449 () Bool)

(assert (=> b!246983 m!372449))

(declare-fun m!372451 () Bool)

(assert (=> b!246978 m!372451))

(declare-fun m!372453 () Bool)

(assert (=> b!246978 m!372453))

(declare-fun m!372455 () Bool)

(assert (=> b!246978 m!372455))

(declare-fun m!372457 () Bool)

(assert (=> b!246978 m!372457))

(declare-fun m!372459 () Bool)

(assert (=> b!246981 m!372459))

(declare-fun m!372461 () Bool)

(assert (=> b!246981 m!372461))

(declare-fun m!372463 () Bool)

(assert (=> b!246988 m!372463))

(assert (=> b!246988 m!372463))

(declare-fun m!372465 () Bool)

(assert (=> b!246988 m!372465))

(assert (=> b!246982 m!372457))

(declare-fun m!372467 () Bool)

(assert (=> b!246982 m!372467))

(declare-fun m!372469 () Bool)

(assert (=> b!246982 m!372469))

(declare-fun m!372471 () Bool)

(assert (=> b!246982 m!372471))

(declare-fun m!372473 () Bool)

(assert (=> b!246982 m!372473))

(declare-fun m!372475 () Bool)

(assert (=> b!246982 m!372475))

(declare-fun m!372477 () Bool)

(assert (=> b!246982 m!372477))

(declare-fun m!372479 () Bool)

(assert (=> b!246982 m!372479))

(declare-fun m!372481 () Bool)

(assert (=> b!246982 m!372481))

(declare-fun m!372483 () Bool)

(assert (=> b!246982 m!372483))

(declare-fun m!372485 () Bool)

(assert (=> b!246982 m!372485))

(declare-fun m!372487 () Bool)

(assert (=> b!246982 m!372487))

(declare-fun m!372489 () Bool)

(assert (=> b!246982 m!372489))

(declare-fun m!372491 () Bool)

(assert (=> b!246982 m!372491))

(declare-fun m!372493 () Bool)

(assert (=> b!246982 m!372493))

(declare-fun m!372495 () Bool)

(assert (=> b!246982 m!372495))

(declare-fun m!372497 () Bool)

(assert (=> b!246982 m!372497))

(declare-fun m!372499 () Bool)

(assert (=> b!246982 m!372499))

(declare-fun m!372501 () Bool)

(assert (=> b!246982 m!372501))

(declare-fun m!372503 () Bool)

(assert (=> b!246982 m!372503))

(declare-fun m!372505 () Bool)

(assert (=> b!246980 m!372505))

(assert (=> b!246980 m!372461))

(declare-fun m!372507 () Bool)

(assert (=> b!246984 m!372507))

(declare-fun m!372509 () Bool)

(assert (=> b!246975 m!372509))

(declare-fun m!372511 () Bool)

(assert (=> b!246987 m!372511))

(declare-fun m!372513 () Bool)

(assert (=> b!246989 m!372513))

(declare-fun m!372515 () Bool)

(assert (=> b!246991 m!372515))

(declare-fun m!372517 () Bool)

(assert (=> b!246977 m!372517))

(declare-fun m!372519 () Bool)

(assert (=> start!53136 m!372519))

(assert (=> b!246990 m!372505))

(assert (=> b!246990 m!372459))

(push 1)

(assert (not b!246982))

(assert (not start!53136))

(assert (not b!246977))

(assert (not b!246981))

(assert (not b!246988))

(assert (not b!246980))

(assert (not b!246990))

(assert (not b!246991))

(assert (not b!246984))

(assert (not b!246992))

(assert (not b!246975))

(assert (not b!246978))

(assert (not b!246987))

(assert (not b!246983))

(assert (not b!246985))

(assert (not b!246989))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82762 () Bool)

(declare-fun res!206843 () Bool)

(declare-fun e!171219 () Bool)

(assert (=> d!82762 (=> (not res!206843) (not e!171219))))

(assert (=> d!82762 (= res!206843 (= (size!5904 (buf!6385 (_2!11524 lt!385169))) (size!5904 (buf!6385 (_2!11524 lt!385184)))))))

(assert (=> d!82762 (= (isPrefixOf!0 (_2!11524 lt!385169) (_2!11524 lt!385184)) e!171219)))

(declare-fun b!247175 () Bool)

(declare-fun res!206844 () Bool)

(assert (=> b!247175 (=> (not res!206844) (not e!171219))))

(assert (=> b!247175 (= res!206844 (bvsle (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385169))) (currentByte!11781 (_2!11524 lt!385169)) (currentBit!11776 (_2!11524 lt!385169))) (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385184))) (currentByte!11781 (_2!11524 lt!385184)) (currentBit!11776 (_2!11524 lt!385184)))))))

(declare-fun b!247176 () Bool)

(declare-fun e!171218 () Bool)

(assert (=> b!247176 (= e!171219 e!171218)))

(declare-fun res!206845 () Bool)

(assert (=> b!247176 (=> res!206845 e!171218)))

(assert (=> b!247176 (= res!206845 (= (size!5904 (buf!6385 (_2!11524 lt!385169))) #b00000000000000000000000000000000))))

(declare-fun b!247177 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13464 array!13464 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247177 (= e!171218 (arrayBitRangesEq!0 (buf!6385 (_2!11524 lt!385169)) (buf!6385 (_2!11524 lt!385184)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385169))) (currentByte!11781 (_2!11524 lt!385169)) (currentBit!11776 (_2!11524 lt!385169)))))))

(assert (= (and d!82762 res!206843) b!247175))

(assert (= (and b!247175 res!206844) b!247176))

(assert (= (and b!247176 (not res!206845)) b!247177))

(assert (=> b!247175 m!372459))

(assert (=> b!247175 m!372505))

(assert (=> b!247177 m!372459))

(assert (=> b!247177 m!372459))

(declare-fun m!372853 () Bool)

(assert (=> b!247177 m!372853))

(assert (=> b!246975 d!82762))

(declare-fun d!82764 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!82764 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5904 (buf!6385 thiss!1005))) ((_ sign_extend 32) (currentByte!11781 thiss!1005)) ((_ sign_extend 32) (currentBit!11776 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5904 (buf!6385 thiss!1005))) ((_ sign_extend 32) (currentByte!11781 thiss!1005)) ((_ sign_extend 32) (currentBit!11776 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20952 () Bool)

(assert (= bs!20952 d!82764))

(declare-fun m!372855 () Bool)

(assert (=> bs!20952 m!372855))

(assert (=> b!246985 d!82764))

(declare-fun d!82766 () Bool)

(declare-fun e!171222 () Bool)

(assert (=> d!82766 e!171222))

(declare-fun res!206848 () Bool)

(assert (=> d!82766 (=> (not res!206848) (not e!171222))))

(declare-fun lt!385602 () (_ BitVec 64))

(declare-fun lt!385601 () BitStream!10730)

(assert (=> d!82766 (= res!206848 (= (bvadd lt!385602 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5904 (buf!6385 lt!385601)) (currentByte!11781 lt!385601) (currentBit!11776 lt!385601))))))

(assert (=> d!82766 (or (not (= (bvand lt!385602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!385602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!385602 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82766 (= lt!385602 (bitIndex!0 (size!5904 (buf!6385 (_1!11526 lt!385177))) (currentByte!11781 (_1!11526 lt!385177)) (currentBit!11776 (_1!11526 lt!385177))))))

(declare-fun moveBitIndex!0 (BitStream!10730 (_ BitVec 64)) tuple2!21204)

(assert (=> d!82766 (= lt!385601 (_2!11524 (moveBitIndex!0 (_1!11526 lt!385177) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!10730 (_ BitVec 64)) Bool)

(assert (=> d!82766 (moveBitIndexPrecond!0 (_1!11526 lt!385177) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!82766 (= (withMovedBitIndex!0 (_1!11526 lt!385177) #b0000000000000000000000000000000000000000000000000000000000000001) lt!385601)))

(declare-fun b!247180 () Bool)

(assert (=> b!247180 (= e!171222 (= (size!5904 (buf!6385 (_1!11526 lt!385177))) (size!5904 (buf!6385 lt!385601))))))

(assert (= (and d!82766 res!206848) b!247180))

(declare-fun m!372857 () Bool)

(assert (=> d!82766 m!372857))

(declare-fun m!372859 () Bool)

(assert (=> d!82766 m!372859))

(declare-fun m!372861 () Bool)

(assert (=> d!82766 m!372861))

(declare-fun m!372863 () Bool)

(assert (=> d!82766 m!372863))

(assert (=> b!246984 d!82766))

(declare-fun d!82768 () Bool)

(assert (=> d!82768 (= (array_inv!5645 (buf!6385 thiss!1005)) (bvsge (size!5904 (buf!6385 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!246983 d!82768))

(declare-fun d!82770 () Bool)

(assert (=> d!82770 (isPrefixOf!0 thiss!1005 (_2!11524 lt!385184))))

(declare-fun lt!385605 () Unit!17920)

(declare-fun choose!30 (BitStream!10730 BitStream!10730 BitStream!10730) Unit!17920)

(assert (=> d!82770 (= lt!385605 (choose!30 thiss!1005 (_2!11524 lt!385169) (_2!11524 lt!385184)))))

(assert (=> d!82770 (isPrefixOf!0 thiss!1005 (_2!11524 lt!385169))))

(assert (=> d!82770 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11524 lt!385169) (_2!11524 lt!385184)) lt!385605)))

(declare-fun bs!20953 () Bool)

(assert (= bs!20953 d!82770))

(assert (=> bs!20953 m!372479))

(declare-fun m!372865 () Bool)

(assert (=> bs!20953 m!372865))

(assert (=> bs!20953 m!372513))

(assert (=> b!246982 d!82770))

(declare-fun d!82772 () Bool)

(declare-fun e!171225 () Bool)

(assert (=> d!82772 e!171225))

(declare-fun res!206851 () Bool)

(assert (=> d!82772 (=> (not res!206851) (not e!171225))))

(declare-fun lt!385614 () tuple2!21206)

(declare-fun lt!385617 () tuple2!21206)

(assert (=> d!82772 (= res!206851 (= (bitIndex!0 (size!5904 (buf!6385 (_1!11525 lt!385614))) (currentByte!11781 (_1!11525 lt!385614)) (currentBit!11776 (_1!11525 lt!385614))) (bitIndex!0 (size!5904 (buf!6385 (_1!11525 lt!385617))) (currentByte!11781 (_1!11525 lt!385617)) (currentBit!11776 (_1!11525 lt!385617)))))))

(declare-fun lt!385616 () BitStream!10730)

(declare-fun lt!385615 () Unit!17920)

(declare-fun choose!50 (BitStream!10730 BitStream!10730 BitStream!10730 tuple2!21206 tuple2!21206 BitStream!10730 Bool tuple2!21206 tuple2!21206 BitStream!10730 Bool) Unit!17920)

(assert (=> d!82772 (= lt!385615 (choose!50 lt!385187 (_2!11524 lt!385184) lt!385616 lt!385614 (tuple2!21207 (_1!11525 lt!385614) (_2!11525 lt!385614)) (_1!11525 lt!385614) (_2!11525 lt!385614) lt!385617 (tuple2!21207 (_1!11525 lt!385617) (_2!11525 lt!385617)) (_1!11525 lt!385617) (_2!11525 lt!385617)))))

(assert (=> d!82772 (= lt!385617 (readBitPure!0 lt!385616))))

(assert (=> d!82772 (= lt!385614 (readBitPure!0 lt!385187))))

(assert (=> d!82772 (= lt!385616 (BitStream!10731 (buf!6385 (_2!11524 lt!385184)) (currentByte!11781 lt!385187) (currentBit!11776 lt!385187)))))

(assert (=> d!82772 (invariant!0 (currentBit!11776 lt!385187) (currentByte!11781 lt!385187) (size!5904 (buf!6385 (_2!11524 lt!385184))))))

(assert (=> d!82772 (= (readBitPrefixLemma!0 lt!385187 (_2!11524 lt!385184)) lt!385615)))

(declare-fun b!247183 () Bool)

(assert (=> b!247183 (= e!171225 (= (_2!11525 lt!385614) (_2!11525 lt!385617)))))

(assert (= (and d!82772 res!206851) b!247183))

(declare-fun m!372867 () Bool)

(assert (=> d!82772 m!372867))

(declare-fun m!372869 () Bool)

(assert (=> d!82772 m!372869))

(declare-fun m!372871 () Bool)

(assert (=> d!82772 m!372871))

(assert (=> d!82772 m!372491))

(declare-fun m!372873 () Bool)

(assert (=> d!82772 m!372873))

(declare-fun m!372875 () Bool)

(assert (=> d!82772 m!372875))

(assert (=> b!246982 d!82772))

(declare-fun b!247193 () Bool)

(declare-fun res!206861 () Bool)

(declare-fun e!171230 () Bool)

(assert (=> b!247193 (=> (not res!206861) (not e!171230))))

(declare-fun lt!385641 () tuple2!21204)

(assert (=> b!247193 (= res!206861 (isPrefixOf!0 (_2!11524 lt!385169) (_2!11524 lt!385641)))))

(declare-fun b!247192 () Bool)

(declare-fun res!206860 () Bool)

(assert (=> b!247192 (=> (not res!206860) (not e!171230))))

(declare-fun lt!385634 () (_ BitVec 64))

(declare-fun lt!385639 () (_ BitVec 64))

(assert (=> b!247192 (= res!206860 (= (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385641))) (currentByte!11781 (_2!11524 lt!385641)) (currentBit!11776 (_2!11524 lt!385641))) (bvadd lt!385639 lt!385634)))))

(assert (=> b!247192 (or (not (= (bvand lt!385639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385634 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!385639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!385639 lt!385634) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247192 (= lt!385634 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!247192 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247192 (= lt!385639 (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385169))) (currentByte!11781 (_2!11524 lt!385169)) (currentBit!11776 (_2!11524 lt!385169))))))

(declare-fun d!82774 () Bool)

(assert (=> d!82774 e!171230))

(declare-fun res!206863 () Bool)

(assert (=> d!82774 (=> (not res!206863) (not e!171230))))

(assert (=> d!82774 (= res!206863 (= (size!5904 (buf!6385 (_2!11524 lt!385169))) (size!5904 (buf!6385 (_2!11524 lt!385641)))))))

(declare-fun choose!51 (BitStream!10730 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21204)

(assert (=> d!82774 (= lt!385641 (choose!51 (_2!11524 lt!385169) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82774 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!82774 (= (appendNBitsLoop!0 (_2!11524 lt!385169) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!385641)))

(declare-fun b!247194 () Bool)

(declare-fun lt!385640 () tuple2!21206)

(declare-fun lt!385636 () tuple2!21208)

(assert (=> b!247194 (= e!171230 (and (_2!11525 lt!385640) (= (_1!11525 lt!385640) (_2!11526 lt!385636))))))

(assert (=> b!247194 (= lt!385640 (checkBitsLoopPure!0 (_1!11526 lt!385636) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!385637 () Unit!17920)

(declare-fun lt!385638 () Unit!17920)

(assert (=> b!247194 (= lt!385637 lt!385638)))

(declare-fun lt!385635 () (_ BitVec 64))

(assert (=> b!247194 (validate_offset_bits!1 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385641)))) ((_ sign_extend 32) (currentByte!11781 (_2!11524 lt!385169))) ((_ sign_extend 32) (currentBit!11776 (_2!11524 lt!385169))) lt!385635)))

(assert (=> b!247194 (= lt!385638 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11524 lt!385169) (buf!6385 (_2!11524 lt!385641)) lt!385635))))

(declare-fun e!171231 () Bool)

(assert (=> b!247194 e!171231))

(declare-fun res!206862 () Bool)

(assert (=> b!247194 (=> (not res!206862) (not e!171231))))

(assert (=> b!247194 (= res!206862 (and (= (size!5904 (buf!6385 (_2!11524 lt!385169))) (size!5904 (buf!6385 (_2!11524 lt!385641)))) (bvsge lt!385635 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247194 (= lt!385635 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!247194 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247194 (= lt!385636 (reader!0 (_2!11524 lt!385169) (_2!11524 lt!385641)))))

(declare-fun b!247195 () Bool)

(assert (=> b!247195 (= e!171231 (validate_offset_bits!1 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385169)))) ((_ sign_extend 32) (currentByte!11781 (_2!11524 lt!385169))) ((_ sign_extend 32) (currentBit!11776 (_2!11524 lt!385169))) lt!385635))))

(assert (= (and d!82774 res!206863) b!247192))

(assert (= (and b!247192 res!206860) b!247193))

(assert (= (and b!247193 res!206861) b!247194))

(assert (= (and b!247194 res!206862) b!247195))

(declare-fun m!372877 () Bool)

(assert (=> d!82774 m!372877))

(declare-fun m!372879 () Bool)

(assert (=> b!247194 m!372879))

(declare-fun m!372881 () Bool)

(assert (=> b!247194 m!372881))

(declare-fun m!372883 () Bool)

(assert (=> b!247194 m!372883))

(declare-fun m!372885 () Bool)

(assert (=> b!247194 m!372885))

(declare-fun m!372887 () Bool)

(assert (=> b!247193 m!372887))

(declare-fun m!372889 () Bool)

(assert (=> b!247195 m!372889))

(declare-fun m!372891 () Bool)

(assert (=> b!247192 m!372891))

(assert (=> b!247192 m!372459))

(assert (=> b!246982 d!82774))

(declare-fun b!247205 () Bool)

(declare-fun res!206875 () Bool)

(declare-fun e!171237 () Bool)

(assert (=> b!247205 (=> (not res!206875) (not e!171237))))

(declare-fun lt!385651 () tuple2!21204)

(declare-fun lt!385650 () (_ BitVec 64))

(declare-fun lt!385653 () (_ BitVec 64))

(assert (=> b!247205 (= res!206875 (= (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385651))) (currentByte!11781 (_2!11524 lt!385651)) (currentBit!11776 (_2!11524 lt!385651))) (bvadd lt!385650 lt!385653)))))

(assert (=> b!247205 (or (not (= (bvand lt!385650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385653 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!385650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!385650 lt!385653) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247205 (= lt!385653 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!247205 (= lt!385650 (bitIndex!0 (size!5904 (buf!6385 thiss!1005)) (currentByte!11781 thiss!1005) (currentBit!11776 thiss!1005)))))

(declare-fun b!247207 () Bool)

(declare-fun e!171236 () Bool)

(assert (=> b!247207 (= e!171237 e!171236)))

(declare-fun res!206874 () Bool)

(assert (=> b!247207 (=> (not res!206874) (not e!171236))))

(declare-fun lt!385652 () tuple2!21206)

(assert (=> b!247207 (= res!206874 (and (= (_2!11525 lt!385652) bit!26) (= (_1!11525 lt!385652) (_2!11524 lt!385651))))))

(assert (=> b!247207 (= lt!385652 (readBitPure!0 (readerFrom!0 (_2!11524 lt!385651) (currentBit!11776 thiss!1005) (currentByte!11781 thiss!1005))))))

(declare-fun b!247206 () Bool)

(declare-fun res!206872 () Bool)

(assert (=> b!247206 (=> (not res!206872) (not e!171237))))

(assert (=> b!247206 (= res!206872 (isPrefixOf!0 thiss!1005 (_2!11524 lt!385651)))))

(declare-fun d!82776 () Bool)

(assert (=> d!82776 e!171237))

(declare-fun res!206873 () Bool)

(assert (=> d!82776 (=> (not res!206873) (not e!171237))))

(assert (=> d!82776 (= res!206873 (= (size!5904 (buf!6385 thiss!1005)) (size!5904 (buf!6385 (_2!11524 lt!385651)))))))

(declare-fun choose!16 (BitStream!10730 Bool) tuple2!21204)

(assert (=> d!82776 (= lt!385651 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!82776 (validate_offset_bit!0 ((_ sign_extend 32) (size!5904 (buf!6385 thiss!1005))) ((_ sign_extend 32) (currentByte!11781 thiss!1005)) ((_ sign_extend 32) (currentBit!11776 thiss!1005)))))

(assert (=> d!82776 (= (appendBit!0 thiss!1005 bit!26) lt!385651)))

(declare-fun b!247208 () Bool)

(assert (=> b!247208 (= e!171236 (= (bitIndex!0 (size!5904 (buf!6385 (_1!11525 lt!385652))) (currentByte!11781 (_1!11525 lt!385652)) (currentBit!11776 (_1!11525 lt!385652))) (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385651))) (currentByte!11781 (_2!11524 lt!385651)) (currentBit!11776 (_2!11524 lt!385651)))))))

(assert (= (and d!82776 res!206873) b!247205))

(assert (= (and b!247205 res!206875) b!247206))

(assert (= (and b!247206 res!206872) b!247207))

(assert (= (and b!247207 res!206874) b!247208))

(declare-fun m!372893 () Bool)

(assert (=> b!247207 m!372893))

(assert (=> b!247207 m!372893))

(declare-fun m!372895 () Bool)

(assert (=> b!247207 m!372895))

(declare-fun m!372897 () Bool)

(assert (=> b!247208 m!372897))

(declare-fun m!372899 () Bool)

(assert (=> b!247208 m!372899))

(declare-fun m!372901 () Bool)

(assert (=> d!82776 m!372901))

(declare-fun m!372903 () Bool)

(assert (=> d!82776 m!372903))

(assert (=> b!247205 m!372899))

(assert (=> b!247205 m!372461))

(declare-fun m!372905 () Bool)

(assert (=> b!247206 m!372905))

(assert (=> b!246982 d!82776))

(declare-fun d!82778 () Bool)

(assert (=> d!82778 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385169)))) ((_ sign_extend 32) (currentByte!11781 (_2!11524 lt!385169))) ((_ sign_extend 32) (currentBit!11776 (_2!11524 lt!385169))) lt!385168) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385169)))) ((_ sign_extend 32) (currentByte!11781 (_2!11524 lt!385169))) ((_ sign_extend 32) (currentBit!11776 (_2!11524 lt!385169)))) lt!385168))))

(declare-fun bs!20954 () Bool)

(assert (= bs!20954 d!82778))

(declare-fun m!372907 () Bool)

(assert (=> bs!20954 m!372907))

(assert (=> b!246982 d!82778))

(declare-fun d!82780 () Bool)

(assert (=> d!82780 (validate_offset_bits!1 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385184)))) ((_ sign_extend 32) (currentByte!11781 (_2!11524 lt!385169))) ((_ sign_extend 32) (currentBit!11776 (_2!11524 lt!385169))) lt!385168)))

(declare-fun lt!385656 () Unit!17920)

(declare-fun choose!9 (BitStream!10730 array!13464 (_ BitVec 64) BitStream!10730) Unit!17920)

(assert (=> d!82780 (= lt!385656 (choose!9 (_2!11524 lt!385169) (buf!6385 (_2!11524 lt!385184)) lt!385168 (BitStream!10731 (buf!6385 (_2!11524 lt!385184)) (currentByte!11781 (_2!11524 lt!385169)) (currentBit!11776 (_2!11524 lt!385169)))))))

(assert (=> d!82780 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11524 lt!385169) (buf!6385 (_2!11524 lt!385184)) lt!385168) lt!385656)))

(declare-fun bs!20955 () Bool)

(assert (= bs!20955 d!82780))

(assert (=> bs!20955 m!372483))

(declare-fun m!372909 () Bool)

(assert (=> bs!20955 m!372909))

(assert (=> b!246982 d!82780))

(declare-fun d!82782 () Bool)

(assert (=> d!82782 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385184)))) ((_ sign_extend 32) (currentByte!11781 thiss!1005)) ((_ sign_extend 32) (currentBit!11776 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385184)))) ((_ sign_extend 32) (currentByte!11781 thiss!1005)) ((_ sign_extend 32) (currentBit!11776 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20956 () Bool)

(assert (= bs!20956 d!82782))

(declare-fun m!372911 () Bool)

(assert (=> bs!20956 m!372911))

(assert (=> b!246982 d!82782))

(declare-fun d!82784 () Bool)

(declare-datatypes ((tuple2!21214 0))(
  ( (tuple2!21215 (_1!11529 Bool) (_2!11529 BitStream!10730)) )
))
(declare-fun lt!385659 () tuple2!21214)

(declare-fun readBit!0 (BitStream!10730) tuple2!21214)

(assert (=> d!82784 (= lt!385659 (readBit!0 (BitStream!10731 (buf!6385 (_2!11524 lt!385184)) (currentByte!11781 thiss!1005) (currentBit!11776 thiss!1005))))))

(assert (=> d!82784 (= (readBitPure!0 (BitStream!10731 (buf!6385 (_2!11524 lt!385184)) (currentByte!11781 thiss!1005) (currentBit!11776 thiss!1005))) (tuple2!21207 (_2!11529 lt!385659) (_1!11529 lt!385659)))))

(declare-fun bs!20957 () Bool)

(assert (= bs!20957 d!82784))

(declare-fun m!372913 () Bool)

(assert (=> bs!20957 m!372913))

(assert (=> b!246982 d!82784))

(declare-fun d!82786 () Bool)

(declare-fun res!206876 () Bool)

(declare-fun e!171239 () Bool)

(assert (=> d!82786 (=> (not res!206876) (not e!171239))))

(assert (=> d!82786 (= res!206876 (= (size!5904 (buf!6385 thiss!1005)) (size!5904 (buf!6385 (_2!11524 lt!385184)))))))

(assert (=> d!82786 (= (isPrefixOf!0 thiss!1005 (_2!11524 lt!385184)) e!171239)))

(declare-fun b!247209 () Bool)

(declare-fun res!206877 () Bool)

(assert (=> b!247209 (=> (not res!206877) (not e!171239))))

(assert (=> b!247209 (= res!206877 (bvsle (bitIndex!0 (size!5904 (buf!6385 thiss!1005)) (currentByte!11781 thiss!1005) (currentBit!11776 thiss!1005)) (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385184))) (currentByte!11781 (_2!11524 lt!385184)) (currentBit!11776 (_2!11524 lt!385184)))))))

(declare-fun b!247210 () Bool)

(declare-fun e!171238 () Bool)

(assert (=> b!247210 (= e!171239 e!171238)))

(declare-fun res!206878 () Bool)

(assert (=> b!247210 (=> res!206878 e!171238)))

(assert (=> b!247210 (= res!206878 (= (size!5904 (buf!6385 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!247211 () Bool)

(assert (=> b!247211 (= e!171238 (arrayBitRangesEq!0 (buf!6385 thiss!1005) (buf!6385 (_2!11524 lt!385184)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5904 (buf!6385 thiss!1005)) (currentByte!11781 thiss!1005) (currentBit!11776 thiss!1005))))))

(assert (= (and d!82786 res!206876) b!247209))

(assert (= (and b!247209 res!206877) b!247210))

(assert (= (and b!247210 (not res!206878)) b!247211))

(assert (=> b!247209 m!372461))

(assert (=> b!247209 m!372505))

(assert (=> b!247211 m!372461))

(assert (=> b!247211 m!372461))

(declare-fun m!372915 () Bool)

(assert (=> b!247211 m!372915))

(assert (=> b!246982 d!82786))

(declare-fun d!82788 () Bool)

(declare-fun lt!385660 () tuple2!21214)

(assert (=> d!82788 (= lt!385660 (readBit!0 (_1!11526 lt!385177)))))

(assert (=> d!82788 (= (readBitPure!0 (_1!11526 lt!385177)) (tuple2!21207 (_2!11529 lt!385660) (_1!11529 lt!385660)))))

(declare-fun bs!20958 () Bool)

(assert (= bs!20958 d!82788))

(declare-fun m!372917 () Bool)

(assert (=> bs!20958 m!372917))

(assert (=> b!246982 d!82788))

(declare-fun lt!385663 () tuple2!21214)

(declare-fun d!82790 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10730 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21214)

(assert (=> d!82790 (= lt!385663 (checkBitsLoop!0 (_1!11526 lt!385175) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82790 (= (checkBitsLoopPure!0 (_1!11526 lt!385175) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21207 (_2!11529 lt!385663) (_1!11529 lt!385663)))))

(declare-fun bs!20959 () Bool)

(assert (= bs!20959 d!82790))

(declare-fun m!372919 () Bool)

(assert (=> bs!20959 m!372919))

(assert (=> b!246982 d!82790))

(declare-fun d!82792 () Bool)

(assert (=> d!82792 (validate_offset_bits!1 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385184)))) ((_ sign_extend 32) (currentByte!11781 thiss!1005)) ((_ sign_extend 32) (currentBit!11776 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!385664 () Unit!17920)

(assert (=> d!82792 (= lt!385664 (choose!9 thiss!1005 (buf!6385 (_2!11524 lt!385184)) (bvsub nBits!297 from!289) (BitStream!10731 (buf!6385 (_2!11524 lt!385184)) (currentByte!11781 thiss!1005) (currentBit!11776 thiss!1005))))))

(assert (=> d!82792 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6385 (_2!11524 lt!385184)) (bvsub nBits!297 from!289)) lt!385664)))

(declare-fun bs!20960 () Bool)

(assert (= bs!20960 d!82792))

(assert (=> bs!20960 m!372481))

(declare-fun m!372921 () Bool)

(assert (=> bs!20960 m!372921))

(assert (=> b!246982 d!82792))

(declare-fun lt!385665 () tuple2!21214)

(declare-fun d!82794 () Bool)

(assert (=> d!82794 (= lt!385665 (checkBitsLoop!0 (_1!11526 lt!385177) nBits!297 bit!26 from!289))))

(assert (=> d!82794 (= (checkBitsLoopPure!0 (_1!11526 lt!385177) nBits!297 bit!26 from!289) (tuple2!21207 (_2!11529 lt!385665) (_1!11529 lt!385665)))))

(declare-fun bs!20961 () Bool)

(assert (= bs!20961 d!82794))

(declare-fun m!372923 () Bool)

(assert (=> bs!20961 m!372923))

(assert (=> b!246982 d!82794))

(declare-fun b!247222 () Bool)

(declare-fun res!206885 () Bool)

(declare-fun e!171244 () Bool)

(assert (=> b!247222 (=> (not res!206885) (not e!171244))))

(declare-fun lt!385718 () tuple2!21208)

(assert (=> b!247222 (= res!206885 (isPrefixOf!0 (_1!11526 lt!385718) (_2!11524 lt!385169)))))

(declare-fun d!82796 () Bool)

(assert (=> d!82796 e!171244))

(declare-fun res!206887 () Bool)

(assert (=> d!82796 (=> (not res!206887) (not e!171244))))

(assert (=> d!82796 (= res!206887 (isPrefixOf!0 (_1!11526 lt!385718) (_2!11526 lt!385718)))))

(declare-fun lt!385716 () BitStream!10730)

(assert (=> d!82796 (= lt!385718 (tuple2!21209 lt!385716 (_2!11524 lt!385184)))))

(declare-fun lt!385721 () Unit!17920)

(declare-fun lt!385712 () Unit!17920)

(assert (=> d!82796 (= lt!385721 lt!385712)))

(assert (=> d!82796 (isPrefixOf!0 lt!385716 (_2!11524 lt!385184))))

(assert (=> d!82796 (= lt!385712 (lemmaIsPrefixTransitive!0 lt!385716 (_2!11524 lt!385184) (_2!11524 lt!385184)))))

(declare-fun lt!385707 () Unit!17920)

(declare-fun lt!385722 () Unit!17920)

(assert (=> d!82796 (= lt!385707 lt!385722)))

(assert (=> d!82796 (isPrefixOf!0 lt!385716 (_2!11524 lt!385184))))

(assert (=> d!82796 (= lt!385722 (lemmaIsPrefixTransitive!0 lt!385716 (_2!11524 lt!385169) (_2!11524 lt!385184)))))

(declare-fun lt!385706 () Unit!17920)

(declare-fun e!171245 () Unit!17920)

(assert (=> d!82796 (= lt!385706 e!171245)))

(declare-fun c!11511 () Bool)

(assert (=> d!82796 (= c!11511 (not (= (size!5904 (buf!6385 (_2!11524 lt!385169))) #b00000000000000000000000000000000)))))

(declare-fun lt!385724 () Unit!17920)

(declare-fun lt!385711 () Unit!17920)

(assert (=> d!82796 (= lt!385724 lt!385711)))

(assert (=> d!82796 (isPrefixOf!0 (_2!11524 lt!385184) (_2!11524 lt!385184))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10730) Unit!17920)

(assert (=> d!82796 (= lt!385711 (lemmaIsPrefixRefl!0 (_2!11524 lt!385184)))))

(declare-fun lt!385715 () Unit!17920)

(declare-fun lt!385713 () Unit!17920)

(assert (=> d!82796 (= lt!385715 lt!385713)))

(assert (=> d!82796 (= lt!385713 (lemmaIsPrefixRefl!0 (_2!11524 lt!385184)))))

(declare-fun lt!385725 () Unit!17920)

(declare-fun lt!385708 () Unit!17920)

(assert (=> d!82796 (= lt!385725 lt!385708)))

(assert (=> d!82796 (isPrefixOf!0 lt!385716 lt!385716)))

(assert (=> d!82796 (= lt!385708 (lemmaIsPrefixRefl!0 lt!385716))))

(declare-fun lt!385710 () Unit!17920)

(declare-fun lt!385717 () Unit!17920)

(assert (=> d!82796 (= lt!385710 lt!385717)))

(assert (=> d!82796 (isPrefixOf!0 (_2!11524 lt!385169) (_2!11524 lt!385169))))

(assert (=> d!82796 (= lt!385717 (lemmaIsPrefixRefl!0 (_2!11524 lt!385169)))))

(assert (=> d!82796 (= lt!385716 (BitStream!10731 (buf!6385 (_2!11524 lt!385184)) (currentByte!11781 (_2!11524 lt!385169)) (currentBit!11776 (_2!11524 lt!385169))))))

(assert (=> d!82796 (isPrefixOf!0 (_2!11524 lt!385169) (_2!11524 lt!385184))))

(assert (=> d!82796 (= (reader!0 (_2!11524 lt!385169) (_2!11524 lt!385184)) lt!385718)))

(declare-fun b!247223 () Bool)

(declare-fun Unit!17926 () Unit!17920)

(assert (=> b!247223 (= e!171245 Unit!17926)))

(declare-fun b!247224 () Bool)

(declare-fun res!206886 () Bool)

(assert (=> b!247224 (=> (not res!206886) (not e!171244))))

(assert (=> b!247224 (= res!206886 (isPrefixOf!0 (_2!11526 lt!385718) (_2!11524 lt!385184)))))

(declare-fun lt!385723 () (_ BitVec 64))

(declare-fun b!247225 () Bool)

(declare-fun lt!385720 () (_ BitVec 64))

(assert (=> b!247225 (= e!171244 (= (_1!11526 lt!385718) (withMovedBitIndex!0 (_2!11526 lt!385718) (bvsub lt!385723 lt!385720))))))

(assert (=> b!247225 (or (= (bvand lt!385723 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385720 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385723 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385723 lt!385720) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247225 (= lt!385720 (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385184))) (currentByte!11781 (_2!11524 lt!385184)) (currentBit!11776 (_2!11524 lt!385184))))))

(assert (=> b!247225 (= lt!385723 (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385169))) (currentByte!11781 (_2!11524 lt!385169)) (currentBit!11776 (_2!11524 lt!385169))))))

(declare-fun b!247226 () Bool)

(declare-fun lt!385709 () Unit!17920)

(assert (=> b!247226 (= e!171245 lt!385709)))

(declare-fun lt!385719 () (_ BitVec 64))

(assert (=> b!247226 (= lt!385719 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!385714 () (_ BitVec 64))

(assert (=> b!247226 (= lt!385714 (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385169))) (currentByte!11781 (_2!11524 lt!385169)) (currentBit!11776 (_2!11524 lt!385169))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13464 array!13464 (_ BitVec 64) (_ BitVec 64)) Unit!17920)

(assert (=> b!247226 (= lt!385709 (arrayBitRangesEqSymmetric!0 (buf!6385 (_2!11524 lt!385169)) (buf!6385 (_2!11524 lt!385184)) lt!385719 lt!385714))))

(assert (=> b!247226 (arrayBitRangesEq!0 (buf!6385 (_2!11524 lt!385184)) (buf!6385 (_2!11524 lt!385169)) lt!385719 lt!385714)))

(assert (= (and d!82796 c!11511) b!247226))

(assert (= (and d!82796 (not c!11511)) b!247223))

(assert (= (and d!82796 res!206887) b!247222))

(assert (= (and b!247222 res!206885) b!247224))

(assert (= (and b!247224 res!206886) b!247225))

(declare-fun m!372925 () Bool)

(assert (=> d!82796 m!372925))

(declare-fun m!372927 () Bool)

(assert (=> d!82796 m!372927))

(declare-fun m!372929 () Bool)

(assert (=> d!82796 m!372929))

(declare-fun m!372931 () Bool)

(assert (=> d!82796 m!372931))

(declare-fun m!372933 () Bool)

(assert (=> d!82796 m!372933))

(assert (=> d!82796 m!372509))

(declare-fun m!372935 () Bool)

(assert (=> d!82796 m!372935))

(declare-fun m!372937 () Bool)

(assert (=> d!82796 m!372937))

(declare-fun m!372939 () Bool)

(assert (=> d!82796 m!372939))

(declare-fun m!372941 () Bool)

(assert (=> d!82796 m!372941))

(declare-fun m!372943 () Bool)

(assert (=> d!82796 m!372943))

(declare-fun m!372945 () Bool)

(assert (=> b!247222 m!372945))

(declare-fun m!372947 () Bool)

(assert (=> b!247225 m!372947))

(assert (=> b!247225 m!372505))

(assert (=> b!247225 m!372459))

(assert (=> b!247226 m!372459))

(declare-fun m!372949 () Bool)

(assert (=> b!247226 m!372949))

(declare-fun m!372951 () Bool)

(assert (=> b!247226 m!372951))

(declare-fun m!372953 () Bool)

(assert (=> b!247224 m!372953))

(assert (=> b!246982 d!82796))

(declare-fun d!82798 () Bool)

(declare-fun e!171248 () Bool)

(assert (=> d!82798 e!171248))

(declare-fun res!206890 () Bool)

(assert (=> d!82798 (=> (not res!206890) (not e!171248))))

(assert (=> d!82798 (= res!206890 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!385728 () Unit!17920)

(declare-fun choose!27 (BitStream!10730 BitStream!10730 (_ BitVec 64) (_ BitVec 64)) Unit!17920)

(assert (=> d!82798 (= lt!385728 (choose!27 thiss!1005 (_2!11524 lt!385169) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!82798 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!82798 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11524 lt!385169) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!385728)))

(declare-fun b!247229 () Bool)

(assert (=> b!247229 (= e!171248 (validate_offset_bits!1 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385169)))) ((_ sign_extend 32) (currentByte!11781 (_2!11524 lt!385169))) ((_ sign_extend 32) (currentBit!11776 (_2!11524 lt!385169))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!82798 res!206890) b!247229))

(declare-fun m!372955 () Bool)

(assert (=> d!82798 m!372955))

(declare-fun m!372957 () Bool)

(assert (=> b!247229 m!372957))

(assert (=> b!246982 d!82798))

(declare-fun d!82800 () Bool)

(declare-fun e!171251 () Bool)

(assert (=> d!82800 e!171251))

(declare-fun res!206895 () Bool)

(assert (=> d!82800 (=> (not res!206895) (not e!171251))))

(declare-fun lt!385744 () (_ BitVec 64))

(declare-fun lt!385741 () (_ BitVec 64))

(declare-fun lt!385745 () (_ BitVec 64))

(assert (=> d!82800 (= res!206895 (= lt!385744 (bvsub lt!385745 lt!385741)))))

(assert (=> d!82800 (or (= (bvand lt!385745 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385741 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385745 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385745 lt!385741) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82800 (= lt!385741 (remainingBits!0 ((_ sign_extend 32) (size!5904 (buf!6385 (_1!11525 lt!385167)))) ((_ sign_extend 32) (currentByte!11781 (_1!11525 lt!385167))) ((_ sign_extend 32) (currentBit!11776 (_1!11525 lt!385167)))))))

(declare-fun lt!385746 () (_ BitVec 64))

(declare-fun lt!385742 () (_ BitVec 64))

(assert (=> d!82800 (= lt!385745 (bvmul lt!385746 lt!385742))))

(assert (=> d!82800 (or (= lt!385746 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!385742 (bvsdiv (bvmul lt!385746 lt!385742) lt!385746)))))

(assert (=> d!82800 (= lt!385742 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82800 (= lt!385746 ((_ sign_extend 32) (size!5904 (buf!6385 (_1!11525 lt!385167)))))))

(assert (=> d!82800 (= lt!385744 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11781 (_1!11525 lt!385167))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11776 (_1!11525 lt!385167)))))))

(assert (=> d!82800 (invariant!0 (currentBit!11776 (_1!11525 lt!385167)) (currentByte!11781 (_1!11525 lt!385167)) (size!5904 (buf!6385 (_1!11525 lt!385167))))))

(assert (=> d!82800 (= (bitIndex!0 (size!5904 (buf!6385 (_1!11525 lt!385167))) (currentByte!11781 (_1!11525 lt!385167)) (currentBit!11776 (_1!11525 lt!385167))) lt!385744)))

(declare-fun b!247234 () Bool)

(declare-fun res!206896 () Bool)

(assert (=> b!247234 (=> (not res!206896) (not e!171251))))

(assert (=> b!247234 (= res!206896 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!385744))))

(declare-fun b!247235 () Bool)

(declare-fun lt!385743 () (_ BitVec 64))

(assert (=> b!247235 (= e!171251 (bvsle lt!385744 (bvmul lt!385743 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247235 (or (= lt!385743 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!385743 #b0000000000000000000000000000000000000000000000000000000000001000) lt!385743)))))

(assert (=> b!247235 (= lt!385743 ((_ sign_extend 32) (size!5904 (buf!6385 (_1!11525 lt!385167)))))))

(assert (= (and d!82800 res!206895) b!247234))

(assert (= (and b!247234 res!206896) b!247235))

(declare-fun m!372959 () Bool)

(assert (=> d!82800 m!372959))

(declare-fun m!372961 () Bool)

(assert (=> d!82800 m!372961))

(assert (=> b!246982 d!82800))

(declare-fun b!247236 () Bool)

(declare-fun res!206897 () Bool)

(declare-fun e!171252 () Bool)

(assert (=> b!247236 (=> (not res!206897) (not e!171252))))

(declare-fun lt!385759 () tuple2!21208)

(assert (=> b!247236 (= res!206897 (isPrefixOf!0 (_1!11526 lt!385759) thiss!1005))))

(declare-fun d!82802 () Bool)

(assert (=> d!82802 e!171252))

(declare-fun res!206899 () Bool)

(assert (=> d!82802 (=> (not res!206899) (not e!171252))))

(assert (=> d!82802 (= res!206899 (isPrefixOf!0 (_1!11526 lt!385759) (_2!11526 lt!385759)))))

(declare-fun lt!385757 () BitStream!10730)

(assert (=> d!82802 (= lt!385759 (tuple2!21209 lt!385757 (_2!11524 lt!385184)))))

(declare-fun lt!385762 () Unit!17920)

(declare-fun lt!385753 () Unit!17920)

(assert (=> d!82802 (= lt!385762 lt!385753)))

(assert (=> d!82802 (isPrefixOf!0 lt!385757 (_2!11524 lt!385184))))

(assert (=> d!82802 (= lt!385753 (lemmaIsPrefixTransitive!0 lt!385757 (_2!11524 lt!385184) (_2!11524 lt!385184)))))

(declare-fun lt!385748 () Unit!17920)

(declare-fun lt!385763 () Unit!17920)

(assert (=> d!82802 (= lt!385748 lt!385763)))

(assert (=> d!82802 (isPrefixOf!0 lt!385757 (_2!11524 lt!385184))))

(assert (=> d!82802 (= lt!385763 (lemmaIsPrefixTransitive!0 lt!385757 thiss!1005 (_2!11524 lt!385184)))))

(declare-fun lt!385747 () Unit!17920)

(declare-fun e!171253 () Unit!17920)

(assert (=> d!82802 (= lt!385747 e!171253)))

(declare-fun c!11512 () Bool)

(assert (=> d!82802 (= c!11512 (not (= (size!5904 (buf!6385 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!385765 () Unit!17920)

(declare-fun lt!385752 () Unit!17920)

(assert (=> d!82802 (= lt!385765 lt!385752)))

(assert (=> d!82802 (isPrefixOf!0 (_2!11524 lt!385184) (_2!11524 lt!385184))))

(assert (=> d!82802 (= lt!385752 (lemmaIsPrefixRefl!0 (_2!11524 lt!385184)))))

(declare-fun lt!385756 () Unit!17920)

(declare-fun lt!385754 () Unit!17920)

(assert (=> d!82802 (= lt!385756 lt!385754)))

(assert (=> d!82802 (= lt!385754 (lemmaIsPrefixRefl!0 (_2!11524 lt!385184)))))

(declare-fun lt!385766 () Unit!17920)

(declare-fun lt!385749 () Unit!17920)

(assert (=> d!82802 (= lt!385766 lt!385749)))

(assert (=> d!82802 (isPrefixOf!0 lt!385757 lt!385757)))

(assert (=> d!82802 (= lt!385749 (lemmaIsPrefixRefl!0 lt!385757))))

(declare-fun lt!385751 () Unit!17920)

(declare-fun lt!385758 () Unit!17920)

(assert (=> d!82802 (= lt!385751 lt!385758)))

(assert (=> d!82802 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82802 (= lt!385758 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!82802 (= lt!385757 (BitStream!10731 (buf!6385 (_2!11524 lt!385184)) (currentByte!11781 thiss!1005) (currentBit!11776 thiss!1005)))))

(assert (=> d!82802 (isPrefixOf!0 thiss!1005 (_2!11524 lt!385184))))

(assert (=> d!82802 (= (reader!0 thiss!1005 (_2!11524 lt!385184)) lt!385759)))

(declare-fun b!247237 () Bool)

(declare-fun Unit!17927 () Unit!17920)

(assert (=> b!247237 (= e!171253 Unit!17927)))

(declare-fun b!247238 () Bool)

(declare-fun res!206898 () Bool)

(assert (=> b!247238 (=> (not res!206898) (not e!171252))))

(assert (=> b!247238 (= res!206898 (isPrefixOf!0 (_2!11526 lt!385759) (_2!11524 lt!385184)))))

(declare-fun b!247239 () Bool)

(declare-fun lt!385761 () (_ BitVec 64))

(declare-fun lt!385764 () (_ BitVec 64))

(assert (=> b!247239 (= e!171252 (= (_1!11526 lt!385759) (withMovedBitIndex!0 (_2!11526 lt!385759) (bvsub lt!385764 lt!385761))))))

(assert (=> b!247239 (or (= (bvand lt!385764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385761 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385764 lt!385761) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247239 (= lt!385761 (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385184))) (currentByte!11781 (_2!11524 lt!385184)) (currentBit!11776 (_2!11524 lt!385184))))))

(assert (=> b!247239 (= lt!385764 (bitIndex!0 (size!5904 (buf!6385 thiss!1005)) (currentByte!11781 thiss!1005) (currentBit!11776 thiss!1005)))))

(declare-fun b!247240 () Bool)

(declare-fun lt!385750 () Unit!17920)

(assert (=> b!247240 (= e!171253 lt!385750)))

(declare-fun lt!385760 () (_ BitVec 64))

(assert (=> b!247240 (= lt!385760 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!385755 () (_ BitVec 64))

(assert (=> b!247240 (= lt!385755 (bitIndex!0 (size!5904 (buf!6385 thiss!1005)) (currentByte!11781 thiss!1005) (currentBit!11776 thiss!1005)))))

(assert (=> b!247240 (= lt!385750 (arrayBitRangesEqSymmetric!0 (buf!6385 thiss!1005) (buf!6385 (_2!11524 lt!385184)) lt!385760 lt!385755))))

(assert (=> b!247240 (arrayBitRangesEq!0 (buf!6385 (_2!11524 lt!385184)) (buf!6385 thiss!1005) lt!385760 lt!385755)))

(assert (= (and d!82802 c!11512) b!247240))

(assert (= (and d!82802 (not c!11512)) b!247237))

(assert (= (and d!82802 res!206899) b!247236))

(assert (= (and b!247236 res!206897) b!247238))

(assert (= (and b!247238 res!206898) b!247239))

(declare-fun m!372963 () Bool)

(assert (=> d!82802 m!372963))

(assert (=> d!82802 m!372927))

(declare-fun m!372965 () Bool)

(assert (=> d!82802 m!372965))

(declare-fun m!372967 () Bool)

(assert (=> d!82802 m!372967))

(declare-fun m!372969 () Bool)

(assert (=> d!82802 m!372969))

(assert (=> d!82802 m!372479))

(declare-fun m!372971 () Bool)

(assert (=> d!82802 m!372971))

(declare-fun m!372973 () Bool)

(assert (=> d!82802 m!372973))

(declare-fun m!372975 () Bool)

(assert (=> d!82802 m!372975))

(assert (=> d!82802 m!372941))

(declare-fun m!372977 () Bool)

(assert (=> d!82802 m!372977))

(declare-fun m!372979 () Bool)

(assert (=> b!247236 m!372979))

(declare-fun m!372981 () Bool)

(assert (=> b!247239 m!372981))

(assert (=> b!247239 m!372505))

(assert (=> b!247239 m!372461))

(assert (=> b!247240 m!372461))

(declare-fun m!372983 () Bool)

(assert (=> b!247240 m!372983))

(declare-fun m!372985 () Bool)

(assert (=> b!247240 m!372985))

(declare-fun m!372987 () Bool)

(assert (=> b!247238 m!372987))

(assert (=> b!246982 d!82802))

(declare-fun d!82804 () Bool)

(assert (=> d!82804 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385184)))) ((_ sign_extend 32) (currentByte!11781 (_2!11524 lt!385169))) ((_ sign_extend 32) (currentBit!11776 (_2!11524 lt!385169))) lt!385168) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385184)))) ((_ sign_extend 32) (currentByte!11781 (_2!11524 lt!385169))) ((_ sign_extend 32) (currentBit!11776 (_2!11524 lt!385169)))) lt!385168))))

(declare-fun bs!20962 () Bool)

(assert (= bs!20962 d!82804))

(declare-fun m!372989 () Bool)

(assert (=> bs!20962 m!372989))

(assert (=> b!246982 d!82804))

(declare-fun d!82806 () Bool)

(declare-fun lt!385767 () tuple2!21214)

(assert (=> d!82806 (= lt!385767 (readBit!0 lt!385187))))

(assert (=> d!82806 (= (readBitPure!0 lt!385187) (tuple2!21207 (_2!11529 lt!385767) (_1!11529 lt!385767)))))

(declare-fun bs!20963 () Bool)

(assert (= bs!20963 d!82806))

(declare-fun m!372991 () Bool)

(assert (=> bs!20963 m!372991))

(assert (=> b!246982 d!82806))

(declare-fun d!82808 () Bool)

(declare-fun e!171254 () Bool)

(assert (=> d!82808 e!171254))

(declare-fun res!206900 () Bool)

(assert (=> d!82808 (=> (not res!206900) (not e!171254))))

(declare-fun lt!385768 () (_ BitVec 64))

(declare-fun lt!385771 () (_ BitVec 64))

(declare-fun lt!385772 () (_ BitVec 64))

(assert (=> d!82808 (= res!206900 (= lt!385771 (bvsub lt!385772 lt!385768)))))

(assert (=> d!82808 (or (= (bvand lt!385772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385768 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385772 lt!385768) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82808 (= lt!385768 (remainingBits!0 ((_ sign_extend 32) (size!5904 (buf!6385 (_1!11525 lt!385176)))) ((_ sign_extend 32) (currentByte!11781 (_1!11525 lt!385176))) ((_ sign_extend 32) (currentBit!11776 (_1!11525 lt!385176)))))))

(declare-fun lt!385773 () (_ BitVec 64))

(declare-fun lt!385769 () (_ BitVec 64))

(assert (=> d!82808 (= lt!385772 (bvmul lt!385773 lt!385769))))

(assert (=> d!82808 (or (= lt!385773 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!385769 (bvsdiv (bvmul lt!385773 lt!385769) lt!385773)))))

(assert (=> d!82808 (= lt!385769 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82808 (= lt!385773 ((_ sign_extend 32) (size!5904 (buf!6385 (_1!11525 lt!385176)))))))

(assert (=> d!82808 (= lt!385771 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11781 (_1!11525 lt!385176))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11776 (_1!11525 lt!385176)))))))

(assert (=> d!82808 (invariant!0 (currentBit!11776 (_1!11525 lt!385176)) (currentByte!11781 (_1!11525 lt!385176)) (size!5904 (buf!6385 (_1!11525 lt!385176))))))

(assert (=> d!82808 (= (bitIndex!0 (size!5904 (buf!6385 (_1!11525 lt!385176))) (currentByte!11781 (_1!11525 lt!385176)) (currentBit!11776 (_1!11525 lt!385176))) lt!385771)))

(declare-fun b!247241 () Bool)

(declare-fun res!206901 () Bool)

(assert (=> b!247241 (=> (not res!206901) (not e!171254))))

(assert (=> b!247241 (= res!206901 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!385771))))

(declare-fun b!247242 () Bool)

(declare-fun lt!385770 () (_ BitVec 64))

(assert (=> b!247242 (= e!171254 (bvsle lt!385771 (bvmul lt!385770 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247242 (or (= lt!385770 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!385770 #b0000000000000000000000000000000000000000000000000000000000001000) lt!385770)))))

(assert (=> b!247242 (= lt!385770 ((_ sign_extend 32) (size!5904 (buf!6385 (_1!11525 lt!385176)))))))

(assert (= (and d!82808 res!206900) b!247241))

(assert (= (and b!247241 res!206901) b!247242))

(declare-fun m!372993 () Bool)

(assert (=> d!82808 m!372993))

(declare-fun m!372995 () Bool)

(assert (=> d!82808 m!372995))

(assert (=> b!246982 d!82808))

(declare-fun d!82810 () Bool)

(assert (=> d!82810 (= (invariant!0 (currentBit!11776 thiss!1005) (currentByte!11781 thiss!1005) (size!5904 (buf!6385 (_2!11524 lt!385169)))) (and (bvsge (currentBit!11776 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11776 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11781 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11781 thiss!1005) (size!5904 (buf!6385 (_2!11524 lt!385169)))) (and (= (currentBit!11776 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11781 thiss!1005) (size!5904 (buf!6385 (_2!11524 lt!385169))))))))))

(assert (=> b!246992 d!82810))

(declare-fun d!82812 () Bool)

(declare-fun e!171255 () Bool)

(assert (=> d!82812 e!171255))

(declare-fun res!206902 () Bool)

(assert (=> d!82812 (=> (not res!206902) (not e!171255))))

(declare-fun lt!385778 () (_ BitVec 64))

(declare-fun lt!385777 () (_ BitVec 64))

(declare-fun lt!385774 () (_ BitVec 64))

(assert (=> d!82812 (= res!206902 (= lt!385777 (bvsub lt!385778 lt!385774)))))

(assert (=> d!82812 (or (= (bvand lt!385778 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385774 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385778 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385778 lt!385774) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82812 (= lt!385774 (remainingBits!0 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385169)))) ((_ sign_extend 32) (currentByte!11781 (_2!11524 lt!385169))) ((_ sign_extend 32) (currentBit!11776 (_2!11524 lt!385169)))))))

(declare-fun lt!385779 () (_ BitVec 64))

(declare-fun lt!385775 () (_ BitVec 64))

(assert (=> d!82812 (= lt!385778 (bvmul lt!385779 lt!385775))))

(assert (=> d!82812 (or (= lt!385779 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!385775 (bvsdiv (bvmul lt!385779 lt!385775) lt!385779)))))

(assert (=> d!82812 (= lt!385775 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82812 (= lt!385779 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385169)))))))

(assert (=> d!82812 (= lt!385777 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11781 (_2!11524 lt!385169))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11776 (_2!11524 lt!385169)))))))

(assert (=> d!82812 (invariant!0 (currentBit!11776 (_2!11524 lt!385169)) (currentByte!11781 (_2!11524 lt!385169)) (size!5904 (buf!6385 (_2!11524 lt!385169))))))

(assert (=> d!82812 (= (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385169))) (currentByte!11781 (_2!11524 lt!385169)) (currentBit!11776 (_2!11524 lt!385169))) lt!385777)))

(declare-fun b!247243 () Bool)

(declare-fun res!206903 () Bool)

(assert (=> b!247243 (=> (not res!206903) (not e!171255))))

(assert (=> b!247243 (= res!206903 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!385777))))

(declare-fun b!247244 () Bool)

(declare-fun lt!385776 () (_ BitVec 64))

(assert (=> b!247244 (= e!171255 (bvsle lt!385777 (bvmul lt!385776 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247244 (or (= lt!385776 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!385776 #b0000000000000000000000000000000000000000000000000000000000001000) lt!385776)))))

(assert (=> b!247244 (= lt!385776 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385169)))))))

(assert (= (and d!82812 res!206902) b!247243))

(assert (= (and b!247243 res!206903) b!247244))

(assert (=> d!82812 m!372907))

(declare-fun m!372997 () Bool)

(assert (=> d!82812 m!372997))

(assert (=> b!246981 d!82812))

(declare-fun d!82814 () Bool)

(declare-fun e!171256 () Bool)

(assert (=> d!82814 e!171256))

(declare-fun res!206904 () Bool)

(assert (=> d!82814 (=> (not res!206904) (not e!171256))))

(declare-fun lt!385783 () (_ BitVec 64))

(declare-fun lt!385780 () (_ BitVec 64))

(declare-fun lt!385784 () (_ BitVec 64))

(assert (=> d!82814 (= res!206904 (= lt!385783 (bvsub lt!385784 lt!385780)))))

(assert (=> d!82814 (or (= (bvand lt!385784 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385780 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385784 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385784 lt!385780) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82814 (= lt!385780 (remainingBits!0 ((_ sign_extend 32) (size!5904 (buf!6385 thiss!1005))) ((_ sign_extend 32) (currentByte!11781 thiss!1005)) ((_ sign_extend 32) (currentBit!11776 thiss!1005))))))

(declare-fun lt!385785 () (_ BitVec 64))

(declare-fun lt!385781 () (_ BitVec 64))

(assert (=> d!82814 (= lt!385784 (bvmul lt!385785 lt!385781))))

(assert (=> d!82814 (or (= lt!385785 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!385781 (bvsdiv (bvmul lt!385785 lt!385781) lt!385785)))))

(assert (=> d!82814 (= lt!385781 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82814 (= lt!385785 ((_ sign_extend 32) (size!5904 (buf!6385 thiss!1005))))))

(assert (=> d!82814 (= lt!385783 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11781 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11776 thiss!1005))))))

(assert (=> d!82814 (invariant!0 (currentBit!11776 thiss!1005) (currentByte!11781 thiss!1005) (size!5904 (buf!6385 thiss!1005)))))

(assert (=> d!82814 (= (bitIndex!0 (size!5904 (buf!6385 thiss!1005)) (currentByte!11781 thiss!1005) (currentBit!11776 thiss!1005)) lt!385783)))

(declare-fun b!247245 () Bool)

(declare-fun res!206905 () Bool)

(assert (=> b!247245 (=> (not res!206905) (not e!171256))))

(assert (=> b!247245 (= res!206905 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!385783))))

(declare-fun b!247246 () Bool)

(declare-fun lt!385782 () (_ BitVec 64))

(assert (=> b!247246 (= e!171256 (bvsle lt!385783 (bvmul lt!385782 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247246 (or (= lt!385782 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!385782 #b0000000000000000000000000000000000000000000000000000000000001000) lt!385782)))))

(assert (=> b!247246 (= lt!385782 ((_ sign_extend 32) (size!5904 (buf!6385 thiss!1005))))))

(assert (= (and d!82814 res!206904) b!247245))

(assert (= (and b!247245 res!206905) b!247246))

(assert (=> d!82814 m!372855))

(declare-fun m!372999 () Bool)

(assert (=> d!82814 m!372999))

(assert (=> b!246981 d!82814))

(declare-fun d!82816 () Bool)

(declare-fun e!171257 () Bool)

(assert (=> d!82816 e!171257))

(declare-fun res!206906 () Bool)

(assert (=> d!82816 (=> (not res!206906) (not e!171257))))

(declare-fun lt!385786 () (_ BitVec 64))

(declare-fun lt!385790 () (_ BitVec 64))

(declare-fun lt!385789 () (_ BitVec 64))

(assert (=> d!82816 (= res!206906 (= lt!385789 (bvsub lt!385790 lt!385786)))))

(assert (=> d!82816 (or (= (bvand lt!385790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385786 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385790 lt!385786) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82816 (= lt!385786 (remainingBits!0 ((_ sign_extend 32) (size!5904 (buf!6385 (_1!11525 lt!385170)))) ((_ sign_extend 32) (currentByte!11781 (_1!11525 lt!385170))) ((_ sign_extend 32) (currentBit!11776 (_1!11525 lt!385170)))))))

(declare-fun lt!385791 () (_ BitVec 64))

(declare-fun lt!385787 () (_ BitVec 64))

(assert (=> d!82816 (= lt!385790 (bvmul lt!385791 lt!385787))))

(assert (=> d!82816 (or (= lt!385791 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!385787 (bvsdiv (bvmul lt!385791 lt!385787) lt!385791)))))

(assert (=> d!82816 (= lt!385787 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82816 (= lt!385791 ((_ sign_extend 32) (size!5904 (buf!6385 (_1!11525 lt!385170)))))))

(assert (=> d!82816 (= lt!385789 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11781 (_1!11525 lt!385170))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11776 (_1!11525 lt!385170)))))))

(assert (=> d!82816 (invariant!0 (currentBit!11776 (_1!11525 lt!385170)) (currentByte!11781 (_1!11525 lt!385170)) (size!5904 (buf!6385 (_1!11525 lt!385170))))))

(assert (=> d!82816 (= (bitIndex!0 (size!5904 (buf!6385 (_1!11525 lt!385170))) (currentByte!11781 (_1!11525 lt!385170)) (currentBit!11776 (_1!11525 lt!385170))) lt!385789)))

(declare-fun b!247247 () Bool)

(declare-fun res!206907 () Bool)

(assert (=> b!247247 (=> (not res!206907) (not e!171257))))

(assert (=> b!247247 (= res!206907 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!385789))))

(declare-fun b!247248 () Bool)

(declare-fun lt!385788 () (_ BitVec 64))

(assert (=> b!247248 (= e!171257 (bvsle lt!385789 (bvmul lt!385788 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247248 (or (= lt!385788 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!385788 #b0000000000000000000000000000000000000000000000000000000000001000) lt!385788)))))

(assert (=> b!247248 (= lt!385788 ((_ sign_extend 32) (size!5904 (buf!6385 (_1!11525 lt!385170)))))))

(assert (= (and d!82816 res!206906) b!247247))

(assert (= (and b!247247 res!206907) b!247248))

(declare-fun m!373001 () Bool)

(assert (=> d!82816 m!373001))

(declare-fun m!373003 () Bool)

(assert (=> d!82816 m!373003))

(assert (=> b!246991 d!82816))

(declare-fun d!82818 () Bool)

(declare-fun e!171258 () Bool)

(assert (=> d!82818 e!171258))

(declare-fun res!206908 () Bool)

(assert (=> d!82818 (=> (not res!206908) (not e!171258))))

(declare-fun lt!385792 () (_ BitVec 64))

(declare-fun lt!385796 () (_ BitVec 64))

(declare-fun lt!385795 () (_ BitVec 64))

(assert (=> d!82818 (= res!206908 (= lt!385795 (bvsub lt!385796 lt!385792)))))

(assert (=> d!82818 (or (= (bvand lt!385796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385792 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385796 lt!385792) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82818 (= lt!385792 (remainingBits!0 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385184)))) ((_ sign_extend 32) (currentByte!11781 (_2!11524 lt!385184))) ((_ sign_extend 32) (currentBit!11776 (_2!11524 lt!385184)))))))

(declare-fun lt!385797 () (_ BitVec 64))

(declare-fun lt!385793 () (_ BitVec 64))

(assert (=> d!82818 (= lt!385796 (bvmul lt!385797 lt!385793))))

(assert (=> d!82818 (or (= lt!385797 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!385793 (bvsdiv (bvmul lt!385797 lt!385793) lt!385797)))))

(assert (=> d!82818 (= lt!385793 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82818 (= lt!385797 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385184)))))))

(assert (=> d!82818 (= lt!385795 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11781 (_2!11524 lt!385184))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11776 (_2!11524 lt!385184)))))))

(assert (=> d!82818 (invariant!0 (currentBit!11776 (_2!11524 lt!385184)) (currentByte!11781 (_2!11524 lt!385184)) (size!5904 (buf!6385 (_2!11524 lt!385184))))))

(assert (=> d!82818 (= (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385184))) (currentByte!11781 (_2!11524 lt!385184)) (currentBit!11776 (_2!11524 lt!385184))) lt!385795)))

(declare-fun b!247249 () Bool)

(declare-fun res!206909 () Bool)

(assert (=> b!247249 (=> (not res!206909) (not e!171258))))

(assert (=> b!247249 (= res!206909 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!385795))))

(declare-fun b!247250 () Bool)

(declare-fun lt!385794 () (_ BitVec 64))

(assert (=> b!247250 (= e!171258 (bvsle lt!385795 (bvmul lt!385794 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247250 (or (= lt!385794 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!385794 #b0000000000000000000000000000000000000000000000000000000000001000) lt!385794)))))

(assert (=> b!247250 (= lt!385794 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385184)))))))

(assert (= (and d!82818 res!206908) b!247249))

(assert (= (and b!247249 res!206909) b!247250))

(declare-fun m!373005 () Bool)

(assert (=> d!82818 m!373005))

(declare-fun m!373007 () Bool)

(assert (=> d!82818 m!373007))

(assert (=> b!246980 d!82818))

(assert (=> b!246980 d!82814))

(assert (=> b!246990 d!82818))

(assert (=> b!246990 d!82812))

(declare-fun d!82820 () Bool)

(declare-fun res!206910 () Bool)

(declare-fun e!171260 () Bool)

(assert (=> d!82820 (=> (not res!206910) (not e!171260))))

(assert (=> d!82820 (= res!206910 (= (size!5904 (buf!6385 thiss!1005)) (size!5904 (buf!6385 (_2!11524 lt!385169)))))))

(assert (=> d!82820 (= (isPrefixOf!0 thiss!1005 (_2!11524 lt!385169)) e!171260)))

(declare-fun b!247251 () Bool)

(declare-fun res!206911 () Bool)

(assert (=> b!247251 (=> (not res!206911) (not e!171260))))

(assert (=> b!247251 (= res!206911 (bvsle (bitIndex!0 (size!5904 (buf!6385 thiss!1005)) (currentByte!11781 thiss!1005) (currentBit!11776 thiss!1005)) (bitIndex!0 (size!5904 (buf!6385 (_2!11524 lt!385169))) (currentByte!11781 (_2!11524 lt!385169)) (currentBit!11776 (_2!11524 lt!385169)))))))

(declare-fun b!247252 () Bool)

(declare-fun e!171259 () Bool)

(assert (=> b!247252 (= e!171260 e!171259)))

(declare-fun res!206912 () Bool)

(assert (=> b!247252 (=> res!206912 e!171259)))

(assert (=> b!247252 (= res!206912 (= (size!5904 (buf!6385 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!247253 () Bool)

(assert (=> b!247253 (= e!171259 (arrayBitRangesEq!0 (buf!6385 thiss!1005) (buf!6385 (_2!11524 lt!385169)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5904 (buf!6385 thiss!1005)) (currentByte!11781 thiss!1005) (currentBit!11776 thiss!1005))))))

(assert (= (and d!82820 res!206910) b!247251))

(assert (= (and b!247251 res!206911) b!247252))

(assert (= (and b!247252 (not res!206912)) b!247253))

(assert (=> b!247251 m!372461))

(assert (=> b!247251 m!372459))

(assert (=> b!247253 m!372461))

(assert (=> b!247253 m!372461))

(declare-fun m!373009 () Bool)

(assert (=> b!247253 m!373009))

(assert (=> b!246989 d!82820))

(declare-fun lt!385798 () tuple2!21214)

(declare-fun d!82822 () Bool)

(assert (=> d!82822 (= lt!385798 (checkBitsLoop!0 (_1!11526 lt!385172) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82822 (= (checkBitsLoopPure!0 (_1!11526 lt!385172) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21207 (_2!11529 lt!385798) (_1!11529 lt!385798)))))

(declare-fun bs!20964 () Bool)

(assert (= bs!20964 d!82822))

(declare-fun m!373011 () Bool)

(assert (=> bs!20964 m!373011))

(assert (=> b!246978 d!82822))

(declare-fun d!82824 () Bool)

(assert (=> d!82824 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385184)))) ((_ sign_extend 32) (currentByte!11781 (_2!11524 lt!385169))) ((_ sign_extend 32) (currentBit!11776 (_2!11524 lt!385169))) lt!385173) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385184)))) ((_ sign_extend 32) (currentByte!11781 (_2!11524 lt!385169))) ((_ sign_extend 32) (currentBit!11776 (_2!11524 lt!385169)))) lt!385173))))

(declare-fun bs!20965 () Bool)

(assert (= bs!20965 d!82824))

(assert (=> bs!20965 m!372989))

(assert (=> b!246978 d!82824))

(declare-fun d!82826 () Bool)

(assert (=> d!82826 (validate_offset_bits!1 ((_ sign_extend 32) (size!5904 (buf!6385 (_2!11524 lt!385184)))) ((_ sign_extend 32) (currentByte!11781 (_2!11524 lt!385169))) ((_ sign_extend 32) (currentBit!11776 (_2!11524 lt!385169))) lt!385173)))

(declare-fun lt!385799 () Unit!17920)

(assert (=> d!82826 (= lt!385799 (choose!9 (_2!11524 lt!385169) (buf!6385 (_2!11524 lt!385184)) lt!385173 (BitStream!10731 (buf!6385 (_2!11524 lt!385184)) (currentByte!11781 (_2!11524 lt!385169)) (currentBit!11776 (_2!11524 lt!385169)))))))

(assert (=> d!82826 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11524 lt!385169) (buf!6385 (_2!11524 lt!385184)) lt!385173) lt!385799)))

(declare-fun bs!20966 () Bool)

(assert (= bs!20966 d!82826))

(assert (=> bs!20966 m!372453))

(declare-fun m!373013 () Bool)

(assert (=> bs!20966 m!373013))

(assert (=> b!246978 d!82826))

(assert (=> b!246978 d!82796))

(declare-fun d!82828 () Bool)

(declare-fun lt!385800 () tuple2!21214)

(assert (=> d!82828 (= lt!385800 (readBit!0 (readerFrom!0 (_2!11524 lt!385169) (currentBit!11776 thiss!1005) (currentByte!11781 thiss!1005))))))

(assert (=> d!82828 (= (readBitPure!0 (readerFrom!0 (_2!11524 lt!385169) (currentBit!11776 thiss!1005) (currentByte!11781 thiss!1005))) (tuple2!21207 (_2!11529 lt!385800) (_1!11529 lt!385800)))))

(declare-fun bs!20967 () Bool)

(assert (= bs!20967 d!82828))

(assert (=> bs!20967 m!372463))

(declare-fun m!373015 () Bool)

(assert (=> bs!20967 m!373015))

(assert (=> b!246988 d!82828))

(declare-fun d!82830 () Bool)

(declare-fun e!171263 () Bool)

(assert (=> d!82830 e!171263))

(declare-fun res!206916 () Bool)

(assert (=> d!82830 (=> (not res!206916) (not e!171263))))

(assert (=> d!82830 (= res!206916 (invariant!0 (currentBit!11776 (_2!11524 lt!385169)) (currentByte!11781 (_2!11524 lt!385169)) (size!5904 (buf!6385 (_2!11524 lt!385169)))))))

(assert (=> d!82830 (= (readerFrom!0 (_2!11524 lt!385169) (currentBit!11776 thiss!1005) (currentByte!11781 thiss!1005)) (BitStream!10731 (buf!6385 (_2!11524 lt!385169)) (currentByte!11781 thiss!1005) (currentBit!11776 thiss!1005)))))

(declare-fun b!247256 () Bool)

(assert (=> b!247256 (= e!171263 (invariant!0 (currentBit!11776 thiss!1005) (currentByte!11781 thiss!1005) (size!5904 (buf!6385 (_2!11524 lt!385169)))))))

(assert (= (and d!82830 res!206916) b!247256))

(assert (=> d!82830 m!372997))

(assert (=> b!247256 m!372445))

(assert (=> b!246988 d!82830))

(declare-fun d!82832 () Bool)

(assert (=> d!82832 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5904 (buf!6385 (_1!11526 lt!385177)))) ((_ sign_extend 32) (currentByte!11781 (_1!11526 lt!385177))) ((_ sign_extend 32) (currentBit!11776 (_1!11526 lt!385177))) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5904 (buf!6385 (_1!11526 lt!385177)))) ((_ sign_extend 32) (currentByte!11781 (_1!11526 lt!385177))) ((_ sign_extend 32) (currentBit!11776 (_1!11526 lt!385177)))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20968 () Bool)

(assert (= bs!20968 d!82832))

(declare-fun m!373017 () Bool)

(assert (=> bs!20968 m!373017))

(assert (=> b!246977 d!82832))

(declare-fun d!82834 () Bool)

(assert (=> d!82834 (= (invariant!0 (currentBit!11776 thiss!1005) (currentByte!11781 thiss!1005) (size!5904 (buf!6385 (_2!11524 lt!385184)))) (and (bvsge (currentBit!11776 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11776 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11781 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11781 thiss!1005) (size!5904 (buf!6385 (_2!11524 lt!385184)))) (and (= (currentBit!11776 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11781 thiss!1005) (size!5904 (buf!6385 (_2!11524 lt!385184))))))))))

(assert (=> b!246987 d!82834))

(declare-fun d!82836 () Bool)

(assert (=> d!82836 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11776 thiss!1005) (currentByte!11781 thiss!1005) (size!5904 (buf!6385 thiss!1005))))))

(declare-fun bs!20969 () Bool)

(assert (= bs!20969 d!82836))

(assert (=> bs!20969 m!372999))

(assert (=> start!53136 d!82836))

(push 1)

(assert (not b!247194))

(assert (not d!82836))

(assert (not d!82798))

(assert (not d!82826))

(assert (not d!82802))

(assert (not d!82818))

(assert (not d!82830))

(assert (not b!247177))

(assert (not b!247253))

(assert (not b!247236))

(assert (not b!247205))

(assert (not d!82812))

(assert (not d!82790))

(assert (not b!247240))

(assert (not b!247224))

(assert (not d!82800))

(assert (not b!247209))

(assert (not b!247208))

(assert (not d!82792))

(assert (not d!82788))

(assert (not d!82772))

(assert (not b!247222))

(assert (not d!82814))

(assert (not b!247211))

(assert (not b!247229))

(assert (not b!247193))

(assert (not d!82782))

(assert (not d!82764))

(assert (not d!82776))

(assert (not d!82824))

(assert (not b!247206))

(assert (not b!247226))

(assert (not d!82770))

(assert (not d!82822))

(assert (not d!82828))

(assert (not b!247251))

(assert (not d!82796))

(assert (not b!247195))

(assert (not d!82804))

(assert (not b!247207))

(assert (not d!82808))

(assert (not d!82784))

(assert (not b!247225))

(assert (not d!82806))

(assert (not d!82832))

(assert (not d!82774))

(assert (not d!82766))

(assert (not b!247192))

(assert (not d!82794))

(assert (not d!82780))

(assert (not d!82778))

(assert (not b!247256))

(assert (not b!247238))

(assert (not d!82816))

(assert (not b!247175))

(assert (not b!247239))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

