; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43628 () Bool)

(assert start!43628)

(declare-fun b!207002 () Bool)

(declare-fun res!173634 () Bool)

(declare-fun e!141509 () Bool)

(assert (=> b!207002 (=> res!173634 e!141509)))

(declare-datatypes ((array!10411 0))(
  ( (array!10412 (arr!5507 (Array (_ BitVec 32) (_ BitVec 8))) (size!4577 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8262 0))(
  ( (BitStream!8263 (buf!5082 array!10411) (currentByte!9600 (_ BitVec 32)) (currentBit!9595 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14748 0))(
  ( (Unit!14749) )
))
(declare-datatypes ((tuple2!17722 0))(
  ( (tuple2!17723 (_1!9516 Unit!14748) (_2!9516 BitStream!8262)) )
))
(declare-fun lt!323246 () tuple2!17722)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!207002 (= res!173634 (not (invariant!0 (currentBit!9595 (_2!9516 lt!323246)) (currentByte!9600 (_2!9516 lt!323246)) (size!4577 (buf!5082 (_2!9516 lt!323246))))))))

(declare-fun b!207003 () Bool)

(declare-fun e!141518 () Bool)

(declare-fun e!141510 () Bool)

(assert (=> b!207003 (= e!141518 e!141510)))

(declare-fun res!173627 () Bool)

(assert (=> b!207003 (=> (not res!173627) (not e!141510))))

(declare-fun thiss!1204 () BitStream!8262)

(declare-fun lt!323247 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!207003 (= res!173627 (validate_offset_bits!1 ((_ sign_extend 32) (size!4577 (buf!5082 thiss!1204))) ((_ sign_extend 32) (currentByte!9600 thiss!1204)) ((_ sign_extend 32) (currentBit!9595 thiss!1204)) lt!323247))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!207003 (= lt!323247 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!207005 () Bool)

(declare-fun e!141512 () Bool)

(declare-fun array_inv!4318 (array!10411) Bool)

(assert (=> b!207005 (= e!141512 (array_inv!4318 (buf!5082 thiss!1204)))))

(declare-fun b!207006 () Bool)

(declare-fun e!141513 () Bool)

(declare-datatypes ((tuple2!17724 0))(
  ( (tuple2!17725 (_1!9517 BitStream!8262) (_2!9517 Bool)) )
))
(declare-fun lt!323233 () tuple2!17724)

(declare-fun lt!323248 () tuple2!17724)

(assert (=> b!207006 (= e!141513 (= (_2!9517 lt!323233) (_2!9517 lt!323248)))))

(declare-fun b!207007 () Bool)

(declare-fun res!173632 () Bool)

(assert (=> b!207007 (=> res!173632 e!141509)))

(declare-fun lt!323237 () (_ BitVec 64))

(declare-fun lt!323245 () (_ BitVec 64))

(assert (=> b!207007 (= res!173632 (or (not (= (size!4577 (buf!5082 (_2!9516 lt!323246))) (size!4577 (buf!5082 thiss!1204)))) (not (= lt!323245 (bvsub (bvadd lt!323237 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!207008 () Bool)

(declare-fun res!173639 () Bool)

(assert (=> b!207008 (=> (not res!173639) (not e!141510))))

(assert (=> b!207008 (= res!173639 (not (= i!590 nBits!348)))))

(declare-fun b!207009 () Bool)

(declare-fun e!141515 () Bool)

(declare-fun lt!323234 () tuple2!17724)

(declare-fun lt!323242 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207009 (= e!141515 (= (bitIndex!0 (size!4577 (buf!5082 (_1!9517 lt!323234))) (currentByte!9600 (_1!9517 lt!323234)) (currentBit!9595 (_1!9517 lt!323234))) lt!323242))))

(declare-fun b!207010 () Bool)

(declare-fun e!141514 () Bool)

(assert (=> b!207010 (= e!141510 (not e!141514))))

(declare-fun res!173640 () Bool)

(assert (=> b!207010 (=> res!173640 e!141514)))

(declare-fun lt!323249 () (_ BitVec 64))

(assert (=> b!207010 (= res!173640 (not (= lt!323249 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323237))))))

(declare-fun lt!323244 () tuple2!17722)

(assert (=> b!207010 (= lt!323249 (bitIndex!0 (size!4577 (buf!5082 (_2!9516 lt!323244))) (currentByte!9600 (_2!9516 lt!323244)) (currentBit!9595 (_2!9516 lt!323244))))))

(assert (=> b!207010 (= lt!323237 (bitIndex!0 (size!4577 (buf!5082 thiss!1204)) (currentByte!9600 thiss!1204) (currentBit!9595 thiss!1204)))))

(declare-fun e!141517 () Bool)

(assert (=> b!207010 e!141517))

(declare-fun res!173637 () Bool)

(assert (=> b!207010 (=> (not res!173637) (not e!141517))))

(assert (=> b!207010 (= res!173637 (= (size!4577 (buf!5082 thiss!1204)) (size!4577 (buf!5082 (_2!9516 lt!323244)))))))

(declare-fun lt!323243 () Bool)

(declare-fun appendBit!0 (BitStream!8262 Bool) tuple2!17722)

(assert (=> b!207010 (= lt!323244 (appendBit!0 thiss!1204 lt!323243))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!207010 (= lt!323243 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!207011 () Bool)

(declare-fun res!173636 () Bool)

(declare-fun e!141511 () Bool)

(assert (=> b!207011 (=> (not res!173636) (not e!141511))))

(declare-fun isPrefixOf!0 (BitStream!8262 BitStream!8262) Bool)

(assert (=> b!207011 (= res!173636 (isPrefixOf!0 thiss!1204 (_2!9516 lt!323244)))))

(declare-fun b!207012 () Bool)

(assert (=> b!207012 (= e!141514 e!141509)))

(declare-fun res!173628 () Bool)

(assert (=> b!207012 (=> res!173628 e!141509)))

(assert (=> b!207012 (= res!173628 (not (= lt!323245 (bvsub (bvsub (bvadd lt!323249 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!207012 (= lt!323245 (bitIndex!0 (size!4577 (buf!5082 (_2!9516 lt!323246))) (currentByte!9600 (_2!9516 lt!323246)) (currentBit!9595 (_2!9516 lt!323246))))))

(assert (=> b!207012 (isPrefixOf!0 thiss!1204 (_2!9516 lt!323246))))

(declare-fun lt!323240 () Unit!14748)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8262 BitStream!8262 BitStream!8262) Unit!14748)

(assert (=> b!207012 (= lt!323240 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9516 lt!323244) (_2!9516 lt!323246)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8262 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17722)

(assert (=> b!207012 (= lt!323246 (appendBitsLSBFirstLoopTR!0 (_2!9516 lt!323244) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!173629 () Bool)

(assert (=> start!43628 (=> (not res!173629) (not e!141518))))

(assert (=> start!43628 (= res!173629 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43628 e!141518))

(assert (=> start!43628 true))

(declare-fun inv!12 (BitStream!8262) Bool)

(assert (=> start!43628 (and (inv!12 thiss!1204) e!141512)))

(declare-fun b!207004 () Bool)

(declare-fun res!173638 () Bool)

(assert (=> b!207004 (=> (not res!173638) (not e!141510))))

(assert (=> b!207004 (= res!173638 (invariant!0 (currentBit!9595 thiss!1204) (currentByte!9600 thiss!1204) (size!4577 (buf!5082 thiss!1204))))))

(declare-fun b!207013 () Bool)

(declare-fun e!141516 () Bool)

(assert (=> b!207013 (= e!141516 (invariant!0 (currentBit!9595 thiss!1204) (currentByte!9600 thiss!1204) (size!4577 (buf!5082 (_2!9516 lt!323246)))))))

(declare-fun b!207014 () Bool)

(assert (=> b!207014 (= e!141517 e!141511)))

(declare-fun res!173635 () Bool)

(assert (=> b!207014 (=> (not res!173635) (not e!141511))))

(declare-fun lt!323250 () (_ BitVec 64))

(assert (=> b!207014 (= res!173635 (= lt!323242 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323250)))))

(assert (=> b!207014 (= lt!323242 (bitIndex!0 (size!4577 (buf!5082 (_2!9516 lt!323244))) (currentByte!9600 (_2!9516 lt!323244)) (currentBit!9595 (_2!9516 lt!323244))))))

(assert (=> b!207014 (= lt!323250 (bitIndex!0 (size!4577 (buf!5082 thiss!1204)) (currentByte!9600 thiss!1204) (currentBit!9595 thiss!1204)))))

(declare-fun b!207015 () Bool)

(declare-fun res!173633 () Bool)

(assert (=> b!207015 (=> res!173633 e!141509)))

(assert (=> b!207015 (= res!173633 (not (isPrefixOf!0 (_2!9516 lt!323244) (_2!9516 lt!323246))))))

(declare-fun b!207016 () Bool)

(declare-fun res!173631 () Bool)

(assert (=> b!207016 (=> res!173631 e!141509)))

(assert (=> b!207016 (= res!173631 (not (isPrefixOf!0 thiss!1204 (_2!9516 lt!323244))))))

(declare-fun b!207017 () Bool)

(declare-fun lt!323238 () (_ BitVec 32))

(assert (=> b!207017 (= e!141509 (or (= lt!323238 #b00000000000000000000000000000000) (= lt!323238 (bvand (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001) #b10000000000000000000000000000000))))))

(assert (=> b!207017 (= lt!323238 (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000))))

(declare-datatypes ((tuple2!17726 0))(
  ( (tuple2!17727 (_1!9518 BitStream!8262) (_2!9518 BitStream!8262)) )
))
(declare-fun lt!323236 () tuple2!17726)

(declare-datatypes ((tuple2!17728 0))(
  ( (tuple2!17729 (_1!9519 BitStream!8262) (_2!9519 (_ BitVec 64))) )
))
(declare-fun lt!323239 () tuple2!17728)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8262 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17728)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207017 (= lt!323239 (readNBitsLSBFirstsLoopPure!0 (_1!9518 lt!323236) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> b!207017 (validate_offset_bits!1 ((_ sign_extend 32) (size!4577 (buf!5082 (_2!9516 lt!323246)))) ((_ sign_extend 32) (currentByte!9600 thiss!1204)) ((_ sign_extend 32) (currentBit!9595 thiss!1204)) lt!323247)))

(declare-fun lt!323252 () Unit!14748)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8262 array!10411 (_ BitVec 64)) Unit!14748)

(assert (=> b!207017 (= lt!323252 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5082 (_2!9516 lt!323246)) lt!323247))))

(declare-fun readBitPure!0 (BitStream!8262) tuple2!17724)

(assert (=> b!207017 (= (_2!9517 (readBitPure!0 (_1!9518 lt!323236))) lt!323243)))

(declare-fun lt!323251 () tuple2!17726)

(declare-fun reader!0 (BitStream!8262 BitStream!8262) tuple2!17726)

(assert (=> b!207017 (= lt!323251 (reader!0 (_2!9516 lt!323244) (_2!9516 lt!323246)))))

(assert (=> b!207017 (= lt!323236 (reader!0 thiss!1204 (_2!9516 lt!323246)))))

(assert (=> b!207017 e!141513))

(declare-fun res!173641 () Bool)

(assert (=> b!207017 (=> (not res!173641) (not e!141513))))

(assert (=> b!207017 (= res!173641 (= (bitIndex!0 (size!4577 (buf!5082 (_1!9517 lt!323233))) (currentByte!9600 (_1!9517 lt!323233)) (currentBit!9595 (_1!9517 lt!323233))) (bitIndex!0 (size!4577 (buf!5082 (_1!9517 lt!323248))) (currentByte!9600 (_1!9517 lt!323248)) (currentBit!9595 (_1!9517 lt!323248)))))))

(declare-fun lt!323235 () Unit!14748)

(declare-fun lt!323241 () BitStream!8262)

(declare-fun readBitPrefixLemma!0 (BitStream!8262 BitStream!8262) Unit!14748)

(assert (=> b!207017 (= lt!323235 (readBitPrefixLemma!0 lt!323241 (_2!9516 lt!323246)))))

(assert (=> b!207017 (= lt!323248 (readBitPure!0 (BitStream!8263 (buf!5082 (_2!9516 lt!323246)) (currentByte!9600 thiss!1204) (currentBit!9595 thiss!1204))))))

(assert (=> b!207017 (= lt!323233 (readBitPure!0 lt!323241))))

(assert (=> b!207017 e!141516))

(declare-fun res!173642 () Bool)

(assert (=> b!207017 (=> (not res!173642) (not e!141516))))

(assert (=> b!207017 (= res!173642 (invariant!0 (currentBit!9595 thiss!1204) (currentByte!9600 thiss!1204) (size!4577 (buf!5082 (_2!9516 lt!323244)))))))

(assert (=> b!207017 (= lt!323241 (BitStream!8263 (buf!5082 (_2!9516 lt!323244)) (currentByte!9600 thiss!1204) (currentBit!9595 thiss!1204)))))

(declare-fun b!207018 () Bool)

(assert (=> b!207018 (= e!141511 e!141515)))

(declare-fun res!173630 () Bool)

(assert (=> b!207018 (=> (not res!173630) (not e!141515))))

(assert (=> b!207018 (= res!173630 (and (= (_2!9517 lt!323234) lt!323243) (= (_1!9517 lt!323234) (_2!9516 lt!323244))))))

(declare-fun readerFrom!0 (BitStream!8262 (_ BitVec 32) (_ BitVec 32)) BitStream!8262)

(assert (=> b!207018 (= lt!323234 (readBitPure!0 (readerFrom!0 (_2!9516 lt!323244) (currentBit!9595 thiss!1204) (currentByte!9600 thiss!1204))))))

(assert (= (and start!43628 res!173629) b!207003))

(assert (= (and b!207003 res!173627) b!207004))

(assert (= (and b!207004 res!173638) b!207008))

(assert (= (and b!207008 res!173639) b!207010))

(assert (= (and b!207010 res!173637) b!207014))

(assert (= (and b!207014 res!173635) b!207011))

(assert (= (and b!207011 res!173636) b!207018))

(assert (= (and b!207018 res!173630) b!207009))

(assert (= (and b!207010 (not res!173640)) b!207012))

(assert (= (and b!207012 (not res!173628)) b!207002))

(assert (= (and b!207002 (not res!173634)) b!207007))

(assert (= (and b!207007 (not res!173632)) b!207015))

(assert (= (and b!207015 (not res!173633)) b!207016))

(assert (= (and b!207016 (not res!173631)) b!207017))

(assert (= (and b!207017 res!173642) b!207013))

(assert (= (and b!207017 res!173641) b!207006))

(assert (= start!43628 b!207005))

(declare-fun m!318653 () Bool)

(assert (=> b!207017 m!318653))

(declare-fun m!318655 () Bool)

(assert (=> b!207017 m!318655))

(declare-fun m!318657 () Bool)

(assert (=> b!207017 m!318657))

(declare-fun m!318659 () Bool)

(assert (=> b!207017 m!318659))

(declare-fun m!318661 () Bool)

(assert (=> b!207017 m!318661))

(declare-fun m!318663 () Bool)

(assert (=> b!207017 m!318663))

(declare-fun m!318665 () Bool)

(assert (=> b!207017 m!318665))

(declare-fun m!318667 () Bool)

(assert (=> b!207017 m!318667))

(declare-fun m!318669 () Bool)

(assert (=> b!207017 m!318669))

(declare-fun m!318671 () Bool)

(assert (=> b!207017 m!318671))

(declare-fun m!318673 () Bool)

(assert (=> b!207017 m!318673))

(declare-fun m!318675 () Bool)

(assert (=> b!207017 m!318675))

(declare-fun m!318677 () Bool)

(assert (=> b!207017 m!318677))

(declare-fun m!318679 () Bool)

(assert (=> b!207005 m!318679))

(declare-fun m!318681 () Bool)

(assert (=> b!207011 m!318681))

(declare-fun m!318683 () Bool)

(assert (=> b!207014 m!318683))

(declare-fun m!318685 () Bool)

(assert (=> b!207014 m!318685))

(assert (=> b!207010 m!318683))

(assert (=> b!207010 m!318685))

(declare-fun m!318687 () Bool)

(assert (=> b!207010 m!318687))

(assert (=> b!207016 m!318681))

(declare-fun m!318689 () Bool)

(assert (=> b!207013 m!318689))

(declare-fun m!318691 () Bool)

(assert (=> b!207015 m!318691))

(declare-fun m!318693 () Bool)

(assert (=> b!207003 m!318693))

(declare-fun m!318695 () Bool)

(assert (=> b!207009 m!318695))

(declare-fun m!318697 () Bool)

(assert (=> b!207004 m!318697))

(declare-fun m!318699 () Bool)

(assert (=> b!207002 m!318699))

(declare-fun m!318701 () Bool)

(assert (=> start!43628 m!318701))

(declare-fun m!318703 () Bool)

(assert (=> b!207012 m!318703))

(declare-fun m!318705 () Bool)

(assert (=> b!207012 m!318705))

(declare-fun m!318707 () Bool)

(assert (=> b!207012 m!318707))

(declare-fun m!318709 () Bool)

(assert (=> b!207012 m!318709))

(declare-fun m!318711 () Bool)

(assert (=> b!207018 m!318711))

(assert (=> b!207018 m!318711))

(declare-fun m!318713 () Bool)

(assert (=> b!207018 m!318713))

(check-sat (not b!207015) (not b!207005) (not b!207010) (not b!207009) (not start!43628) (not b!207012) (not b!207018) (not b!207017) (not b!207011) (not b!207002) (not b!207003) (not b!207016) (not b!207013) (not b!207014) (not b!207004))
(check-sat)
