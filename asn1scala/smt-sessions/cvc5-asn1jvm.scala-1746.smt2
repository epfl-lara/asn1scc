; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47936 () Bool)

(assert start!47936)

(declare-fun b!228035 () Bool)

(declare-fun e!156199 () Bool)

(declare-fun lt!365364 () (_ BitVec 64))

(declare-fun lt!365361 () (_ BitVec 64))

(declare-fun lt!365369 () (_ BitVec 64))

(assert (=> b!228035 (= e!156199 (not (or (not (= lt!365361 (bvand lt!365364 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!365361 (bvand (bvadd lt!365369 lt!365364) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!228035 (= lt!365361 (bvand lt!365369 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!11495 0))(
  ( (array!11496 (arr!6025 (Array (_ BitVec 32) (_ BitVec 8))) (size!5044 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9184 0))(
  ( (BitStream!9185 (buf!5585 array!11495) (currentByte!10435 (_ BitVec 32)) (currentBit!10430 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19634 0))(
  ( (tuple2!19635 (_1!10694 (_ BitVec 8)) (_2!10694 BitStream!9184)) )
))
(declare-fun lt!365367 () tuple2!19634)

(declare-datatypes ((Unit!17095 0))(
  ( (Unit!17096) )
))
(declare-datatypes ((tuple3!1470 0))(
  ( (tuple3!1471 (_1!10695 Unit!17095) (_2!10695 BitStream!9184) (_3!877 array!11495)) )
))
(declare-fun lt!365362 () tuple3!1470)

(declare-fun i!761 () (_ BitVec 32))

(assert (=> b!228035 (and (= (_1!10694 lt!365367) (select (arr!6025 (_3!877 lt!365362)) i!761)) (= (select (arr!6025 (_3!877 lt!365362)) i!761) (_1!10694 lt!365367)))))

(declare-fun lt!365363 () array!11495)

(declare-fun lt!365366 () Unit!17095)

(declare-fun arrayRangesEqImpliesEq!136 (array!11495 array!11495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17095)

(assert (=> b!228035 (= lt!365366 (arrayRangesEqImpliesEq!136 lt!365363 (_3!877 lt!365362) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11495)

(declare-fun arrayRangesEq!880 (array!11495 array!11495 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228035 (arrayRangesEq!880 arr!308 (_3!877 lt!365362) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365368 () Unit!17095)

(declare-fun arrayRangesEqTransitive!303 (array!11495 array!11495 array!11495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17095)

(assert (=> b!228035 (= lt!365368 (arrayRangesEqTransitive!303 arr!308 lt!365363 (_3!877 lt!365362) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!228035 (arrayRangesEq!880 arr!308 lt!365363 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365373 () Unit!17095)

(declare-fun arrayUpdatedAtPrefixLemma!439 (array!11495 (_ BitVec 32) (_ BitVec 8)) Unit!17095)

(assert (=> b!228035 (= lt!365373 (arrayUpdatedAtPrefixLemma!439 arr!308 i!761 (_1!10694 lt!365367)))))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!228035 (= lt!365364 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761))))))

(declare-fun lt!365370 () (_ BitVec 32))

(declare-fun lt!365372 () (_ BitVec 64))

(declare-fun thiss!1870 () BitStream!9184)

(declare-fun lt!365365 () (_ BitVec 64))

(assert (=> b!228035 (and (= (bvadd lt!365372 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!365370))) lt!365365) (= (bvadd lt!365369 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!365365) (= (buf!5585 thiss!1870) (buf!5585 (_2!10695 lt!365362))) (= (size!5044 arr!308) (size!5044 (_3!877 lt!365362))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228035 (= lt!365365 (bitIndex!0 (size!5044 (buf!5585 (_2!10695 lt!365362))) (currentByte!10435 (_2!10695 lt!365362)) (currentBit!10430 (_2!10695 lt!365362))))))

(assert (=> b!228035 (= lt!365372 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!365369))))

(assert (=> b!228035 (= lt!365372 (bitIndex!0 (size!5044 (buf!5585 (_2!10694 lt!365367))) (currentByte!10435 (_2!10694 lt!365367)) (currentBit!10430 (_2!10694 lt!365367))))))

(assert (=> b!228035 (= lt!365369 (bitIndex!0 (size!5044 (buf!5585 thiss!1870)) (currentByte!10435 thiss!1870) (currentBit!10430 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9184 array!11495 (_ BitVec 32) (_ BitVec 32)) tuple3!1470)

(assert (=> b!228035 (= lt!365362 (readByteArrayLoop!0 (_2!10694 lt!365367) lt!365363 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228035 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5044 (buf!5585 (_2!10694 lt!365367)))) ((_ sign_extend 32) (currentByte!10435 (_2!10694 lt!365367))) ((_ sign_extend 32) (currentBit!10430 (_2!10694 lt!365367))) lt!365370)))

(assert (=> b!228035 (= lt!365370 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!365371 () Unit!17095)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9184 BitStream!9184 (_ BitVec 64) (_ BitVec 32)) Unit!17095)

(assert (=> b!228035 (= lt!365371 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10694 lt!365367) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!228035 (= lt!365363 (array!11496 (store (arr!6025 arr!308) i!761 (_1!10694 lt!365367)) (size!5044 arr!308)))))

(declare-fun readByte!0 (BitStream!9184) tuple2!19634)

(assert (=> b!228035 (= lt!365367 (readByte!0 thiss!1870))))

(declare-fun res!191287 () Bool)

(assert (=> start!47936 (=> (not res!191287) (not e!156199))))

(assert (=> start!47936 (= res!191287 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5044 arr!308))))))

(assert (=> start!47936 e!156199))

(assert (=> start!47936 true))

(declare-fun array_inv!4785 (array!11495) Bool)

(assert (=> start!47936 (array_inv!4785 arr!308)))

(declare-fun e!156200 () Bool)

(declare-fun inv!12 (BitStream!9184) Bool)

(assert (=> start!47936 (and (inv!12 thiss!1870) e!156200)))

(declare-fun b!228033 () Bool)

(declare-fun res!191286 () Bool)

(assert (=> b!228033 (=> (not res!191286) (not e!156199))))

(assert (=> b!228033 (= res!191286 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5044 (buf!5585 thiss!1870))) ((_ sign_extend 32) (currentByte!10435 thiss!1870)) ((_ sign_extend 32) (currentBit!10430 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228036 () Bool)

(assert (=> b!228036 (= e!156200 (array_inv!4785 (buf!5585 thiss!1870)))))

(declare-fun b!228034 () Bool)

(declare-fun res!191285 () Bool)

(assert (=> b!228034 (=> (not res!191285) (not e!156199))))

(assert (=> b!228034 (= res!191285 (bvslt i!761 to!496))))

(assert (= (and start!47936 res!191287) b!228033))

(assert (= (and b!228033 res!191286) b!228034))

(assert (= (and b!228034 res!191285) b!228035))

(assert (= start!47936 b!228036))

(declare-fun m!351247 () Bool)

(assert (=> b!228035 m!351247))

(declare-fun m!351249 () Bool)

(assert (=> b!228035 m!351249))

(declare-fun m!351251 () Bool)

(assert (=> b!228035 m!351251))

(declare-fun m!351253 () Bool)

(assert (=> b!228035 m!351253))

(declare-fun m!351255 () Bool)

(assert (=> b!228035 m!351255))

(declare-fun m!351257 () Bool)

(assert (=> b!228035 m!351257))

(declare-fun m!351259 () Bool)

(assert (=> b!228035 m!351259))

(declare-fun m!351261 () Bool)

(assert (=> b!228035 m!351261))

(declare-fun m!351263 () Bool)

(assert (=> b!228035 m!351263))

(declare-fun m!351265 () Bool)

(assert (=> b!228035 m!351265))

(declare-fun m!351267 () Bool)

(assert (=> b!228035 m!351267))

(declare-fun m!351269 () Bool)

(assert (=> b!228035 m!351269))

(declare-fun m!351271 () Bool)

(assert (=> b!228035 m!351271))

(declare-fun m!351273 () Bool)

(assert (=> b!228035 m!351273))

(declare-fun m!351275 () Bool)

(assert (=> start!47936 m!351275))

(declare-fun m!351277 () Bool)

(assert (=> start!47936 m!351277))

(declare-fun m!351279 () Bool)

(assert (=> b!228033 m!351279))

(declare-fun m!351281 () Bool)

(assert (=> b!228036 m!351281))

(push 1)

(assert (not b!228033))

(assert (not b!228035))

(assert (not start!47936))

(assert (not b!228036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77336 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77336 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5044 (buf!5585 thiss!1870))) ((_ sign_extend 32) (currentByte!10435 thiss!1870)) ((_ sign_extend 32) (currentBit!10430 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5044 (buf!5585 thiss!1870))) ((_ sign_extend 32) (currentByte!10435 thiss!1870)) ((_ sign_extend 32) (currentBit!10430 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18918 () Bool)

(assert (= bs!18918 d!77336))

(declare-fun m!351355 () Bool)

(assert (=> bs!18918 m!351355))

(assert (=> b!228033 d!77336))

(declare-fun d!77338 () Bool)

(assert (=> d!77338 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5044 (buf!5585 (_2!10694 lt!365367)))) ((_ sign_extend 32) (currentByte!10435 (_2!10694 lt!365367))) ((_ sign_extend 32) (currentBit!10430 (_2!10694 lt!365367))) lt!365370) (bvsle ((_ sign_extend 32) lt!365370) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5044 (buf!5585 (_2!10694 lt!365367)))) ((_ sign_extend 32) (currentByte!10435 (_2!10694 lt!365367))) ((_ sign_extend 32) (currentBit!10430 (_2!10694 lt!365367)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18919 () Bool)

(assert (= bs!18919 d!77338))

(declare-fun m!351357 () Bool)

(assert (=> bs!18919 m!351357))

(assert (=> b!228035 d!77338))

(declare-fun d!77340 () Bool)

(declare-fun res!191310 () Bool)

(declare-fun e!156231 () Bool)

(assert (=> d!77340 (=> res!191310 e!156231)))

(assert (=> d!77340 (= res!191310 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77340 (= (arrayRangesEq!880 arr!308 lt!365363 #b00000000000000000000000000000000 i!761) e!156231)))

(declare-fun b!228065 () Bool)

(declare-fun e!156232 () Bool)

(assert (=> b!228065 (= e!156231 e!156232)))

(declare-fun res!191311 () Bool)

(assert (=> b!228065 (=> (not res!191311) (not e!156232))))

(assert (=> b!228065 (= res!191311 (= (select (arr!6025 arr!308) #b00000000000000000000000000000000) (select (arr!6025 lt!365363) #b00000000000000000000000000000000)))))

(declare-fun b!228066 () Bool)

(assert (=> b!228066 (= e!156232 (arrayRangesEq!880 arr!308 lt!365363 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77340 (not res!191310)) b!228065))

(assert (= (and b!228065 res!191311) b!228066))

(declare-fun m!351359 () Bool)

(assert (=> b!228065 m!351359))

(declare-fun m!351361 () Bool)

(assert (=> b!228065 m!351361))

(declare-fun m!351363 () Bool)

(assert (=> b!228066 m!351363))

(assert (=> b!228035 d!77340))

(declare-fun d!77342 () Bool)

(assert (=> d!77342 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!5044 lt!365363)) (bvslt i!761 (size!5044 (_3!877 lt!365362))) (= (select (arr!6025 lt!365363) i!761) (select (arr!6025 (_3!877 lt!365362)) i!761)))))

(declare-fun lt!365454 () Unit!17095)

(declare-fun choose!324 (array!11495 array!11495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17095)

(assert (=> d!77342 (= lt!365454 (choose!324 lt!365363 (_3!877 lt!365362) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77342 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77342 (= (arrayRangesEqImpliesEq!136 lt!365363 (_3!877 lt!365362) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!365454)))

(declare-fun bs!18920 () Bool)

(assert (= bs!18920 d!77342))

(declare-fun m!351365 () Bool)

(assert (=> bs!18920 m!351365))

(assert (=> bs!18920 m!351263))

(declare-fun m!351367 () Bool)

(assert (=> bs!18920 m!351367))

(assert (=> b!228035 d!77342))

(declare-fun d!77344 () Bool)

(declare-fun lt!365475 () (_ BitVec 8))

(declare-fun lt!365473 () (_ BitVec 8))

(assert (=> d!77344 (= lt!365475 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!6025 (buf!5585 thiss!1870)) (currentByte!10435 thiss!1870))) ((_ sign_extend 24) lt!365473))))))

(assert (=> d!77344 (= lt!365473 ((_ extract 7 0) (currentBit!10430 thiss!1870)))))

(declare-fun e!156237 () Bool)

(assert (=> d!77344 e!156237))

(declare-fun res!191317 () Bool)

(assert (=> d!77344 (=> (not res!191317) (not e!156237))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!77344 (= res!191317 (validate_offset_bits!1 ((_ sign_extend 32) (size!5044 (buf!5585 thiss!1870))) ((_ sign_extend 32) (currentByte!10435 thiss!1870)) ((_ sign_extend 32) (currentBit!10430 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19640 0))(
  ( (tuple2!19641 (_1!10700 Unit!17095) (_2!10700 (_ BitVec 8))) )
))
(declare-fun Unit!17101 () Unit!17095)

(declare-fun Unit!17102 () Unit!17095)

(assert (=> d!77344 (= (readByte!0 thiss!1870) (tuple2!19635 (_2!10700 (ite (bvsgt ((_ sign_extend 24) lt!365473) #b00000000000000000000000000000000) (tuple2!19641 Unit!17101 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!365475) (bvlshr (bvand ((_ sign_extend 24) (select (arr!6025 (buf!5585 thiss!1870)) (bvadd (currentByte!10435 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!365473)))))))) (tuple2!19641 Unit!17102 lt!365475))) (BitStream!9185 (buf!5585 thiss!1870) (bvadd (currentByte!10435 thiss!1870) #b00000000000000000000000000000001) (currentBit!10430 thiss!1870))))))

(declare-fun b!228071 () Bool)

(declare-fun e!156238 () Bool)

(assert (=> b!228071 (= e!156237 e!156238)))

(declare-fun res!191318 () Bool)

(assert (=> b!228071 (=> (not res!191318) (not e!156238))))

(declare-fun lt!365471 () tuple2!19634)

(assert (=> b!228071 (= res!191318 (= (buf!5585 (_2!10694 lt!365471)) (buf!5585 thiss!1870)))))

(declare-fun lt!365469 () (_ BitVec 8))

(declare-fun lt!365470 () (_ BitVec 8))

(declare-fun Unit!17103 () Unit!17095)

(declare-fun Unit!17104 () Unit!17095)

(assert (=> b!228071 (= lt!365471 (tuple2!19635 (_2!10700 (ite (bvsgt ((_ sign_extend 24) lt!365469) #b00000000000000000000000000000000) (tuple2!19641 Unit!17103 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!365470) (bvlshr (bvand ((_ sign_extend 24) (select (arr!6025 (buf!5585 thiss!1870)) (bvadd (currentByte!10435 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!365469)))))))) (tuple2!19641 Unit!17104 lt!365470))) (BitStream!9185 (buf!5585 thiss!1870) (bvadd (currentByte!10435 thiss!1870) #b00000000000000000000000000000001) (currentBit!10430 thiss!1870))))))

(assert (=> b!228071 (= lt!365470 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!6025 (buf!5585 thiss!1870)) (currentByte!10435 thiss!1870))) ((_ sign_extend 24) lt!365469))))))

(assert (=> b!228071 (= lt!365469 ((_ extract 7 0) (currentBit!10430 thiss!1870)))))

(declare-fun lt!365472 () (_ BitVec 64))

(declare-fun b!228072 () Bool)

(declare-fun lt!365474 () (_ BitVec 64))

(assert (=> b!228072 (= e!156238 (= (bitIndex!0 (size!5044 (buf!5585 (_2!10694 lt!365471))) (currentByte!10435 (_2!10694 lt!365471)) (currentBit!10430 (_2!10694 lt!365471))) (bvadd lt!365472 lt!365474)))))

(assert (=> b!228072 (or (not (= (bvand lt!365472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!365474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!365472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!365472 lt!365474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!228072 (= lt!365474 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!228072 (= lt!365472 (bitIndex!0 (size!5044 (buf!5585 thiss!1870)) (currentByte!10435 thiss!1870) (currentBit!10430 thiss!1870)))))

(assert (= (and d!77344 res!191317) b!228071))

(assert (= (and b!228071 res!191318) b!228072))

(declare-fun m!351373 () Bool)

(assert (=> d!77344 m!351373))

(declare-fun m!351375 () Bool)

(assert (=> d!77344 m!351375))

(declare-fun m!351377 () Bool)

(assert (=> d!77344 m!351377))

(assert (=> b!228071 m!351377))

(assert (=> b!228071 m!351373))

(declare-fun m!351379 () Bool)

(assert (=> b!228072 m!351379))

(assert (=> b!228072 m!351271))

(assert (=> b!228035 d!77344))

(declare-fun d!77358 () Bool)

(declare-fun res!191319 () Bool)

(declare-fun e!156239 () Bool)

(assert (=> d!77358 (=> res!191319 e!156239)))

(assert (=> d!77358 (= res!191319 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77358 (= (arrayRangesEq!880 arr!308 (_3!877 lt!365362) #b00000000000000000000000000000000 i!761) e!156239)))

(declare-fun b!228073 () Bool)

(declare-fun e!156240 () Bool)

(assert (=> b!228073 (= e!156239 e!156240)))

(declare-fun res!191320 () Bool)

(assert (=> b!228073 (=> (not res!191320) (not e!156240))))

(assert (=> b!228073 (= res!191320 (= (select (arr!6025 arr!308) #b00000000000000000000000000000000) (select (arr!6025 (_3!877 lt!365362)) #b00000000000000000000000000000000)))))

(declare-fun b!228074 () Bool)

(assert (=> b!228074 (= e!156240 (arrayRangesEq!880 arr!308 (_3!877 lt!365362) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77358 (not res!191319)) b!228073))

(assert (= (and b!228073 res!191320) b!228074))

(assert (=> b!228073 m!351359))

(declare-fun m!351381 () Bool)

(assert (=> b!228073 m!351381))

(declare-fun m!351383 () Bool)

(assert (=> b!228074 m!351383))

(assert (=> b!228035 d!77358))

(declare-fun d!77360 () Bool)

(declare-fun e!156243 () Bool)

(assert (=> d!77360 e!156243))

(declare-fun res!191326 () Bool)

(assert (=> d!77360 (=> (not res!191326) (not e!156243))))

(declare-fun lt!365494 () (_ BitVec 64))

(declare-fun lt!365492 () (_ BitVec 64))

(declare-fun lt!365496 () (_ BitVec 64))

(assert (=> d!77360 (= res!191326 (= lt!365494 (bvsub lt!365496 lt!365492)))))

(assert (=> d!77360 (or (= (bvand lt!365496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!365492 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!365496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!365496 lt!365492) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77360 (= lt!365492 (remainingBits!0 ((_ sign_extend 32) (size!5044 (buf!5585 thiss!1870))) ((_ sign_extend 32) (currentByte!10435 thiss!1870)) ((_ sign_extend 32) (currentBit!10430 thiss!1870))))))

(declare-fun lt!365495 () (_ BitVec 64))

(declare-fun lt!365491 () (_ BitVec 64))

(assert (=> d!77360 (= lt!365496 (bvmul lt!365495 lt!365491))))

(assert (=> d!77360 (or (= lt!365495 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!365491 (bvsdiv (bvmul lt!365495 lt!365491) lt!365495)))))

(assert (=> d!77360 (= lt!365491 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77360 (= lt!365495 ((_ sign_extend 32) (size!5044 (buf!5585 thiss!1870))))))

(assert (=> d!77360 (= lt!365494 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10435 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10430 thiss!1870))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77360 (invariant!0 (currentBit!10430 thiss!1870) (currentByte!10435 thiss!1870) (size!5044 (buf!5585 thiss!1870)))))

(assert (=> d!77360 (= (bitIndex!0 (size!5044 (buf!5585 thiss!1870)) (currentByte!10435 thiss!1870) (currentBit!10430 thiss!1870)) lt!365494)))

(declare-fun b!228079 () Bool)

(declare-fun res!191327 () Bool)

(assert (=> b!228079 (=> (not res!191327) (not e!156243))))

(assert (=> b!228079 (= res!191327 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!365494))))

(declare-fun b!228080 () Bool)

(declare-fun lt!365493 () (_ BitVec 64))

(assert (=> b!228080 (= e!156243 (bvsle lt!365494 (bvmul lt!365493 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228080 (or (= lt!365493 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!365493 #b0000000000000000000000000000000000000000000000000000000000001000) lt!365493)))))

(assert (=> b!228080 (= lt!365493 ((_ sign_extend 32) (size!5044 (buf!5585 thiss!1870))))))

(assert (= (and d!77360 res!191326) b!228079))

(assert (= (and b!228079 res!191327) b!228080))

(assert (=> d!77360 m!351355))

(declare-fun m!351389 () Bool)

(assert (=> d!77360 m!351389))

(assert (=> b!228035 d!77360))

(declare-fun d!77364 () Bool)

(declare-fun e!156244 () Bool)

(assert (=> d!77364 e!156244))

(declare-fun res!191328 () Bool)

(assert (=> d!77364 (=> (not res!191328) (not e!156244))))

(declare-fun lt!365502 () (_ BitVec 64))

(declare-fun lt!365500 () (_ BitVec 64))

(declare-fun lt!365498 () (_ BitVec 64))

(assert (=> d!77364 (= res!191328 (= lt!365500 (bvsub lt!365502 lt!365498)))))

(assert (=> d!77364 (or (= (bvand lt!365502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!365498 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!365502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!365502 lt!365498) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77364 (= lt!365498 (remainingBits!0 ((_ sign_extend 32) (size!5044 (buf!5585 (_2!10694 lt!365367)))) ((_ sign_extend 32) (currentByte!10435 (_2!10694 lt!365367))) ((_ sign_extend 32) (currentBit!10430 (_2!10694 lt!365367)))))))

(declare-fun lt!365501 () (_ BitVec 64))

(declare-fun lt!365497 () (_ BitVec 64))

(assert (=> d!77364 (= lt!365502 (bvmul lt!365501 lt!365497))))

(assert (=> d!77364 (or (= lt!365501 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!365497 (bvsdiv (bvmul lt!365501 lt!365497) lt!365501)))))

(assert (=> d!77364 (= lt!365497 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77364 (= lt!365501 ((_ sign_extend 32) (size!5044 (buf!5585 (_2!10694 lt!365367)))))))

(assert (=> d!77364 (= lt!365500 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10435 (_2!10694 lt!365367))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10430 (_2!10694 lt!365367)))))))

(assert (=> d!77364 (invariant!0 (currentBit!10430 (_2!10694 lt!365367)) (currentByte!10435 (_2!10694 lt!365367)) (size!5044 (buf!5585 (_2!10694 lt!365367))))))

(assert (=> d!77364 (= (bitIndex!0 (size!5044 (buf!5585 (_2!10694 lt!365367))) (currentByte!10435 (_2!10694 lt!365367)) (currentBit!10430 (_2!10694 lt!365367))) lt!365500)))

(declare-fun b!228081 () Bool)

(declare-fun res!191329 () Bool)

(assert (=> b!228081 (=> (not res!191329) (not e!156244))))

(assert (=> b!228081 (= res!191329 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!365500))))

(declare-fun b!228082 () Bool)

(declare-fun lt!365499 () (_ BitVec 64))

(assert (=> b!228082 (= e!156244 (bvsle lt!365500 (bvmul lt!365499 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228082 (or (= lt!365499 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!365499 #b0000000000000000000000000000000000000000000000000000000000001000) lt!365499)))))

(assert (=> b!228082 (= lt!365499 ((_ sign_extend 32) (size!5044 (buf!5585 (_2!10694 lt!365367)))))))

(assert (= (and d!77364 res!191328) b!228081))

(assert (= (and b!228081 res!191329) b!228082))

(assert (=> d!77364 m!351357))

(declare-fun m!351391 () Bool)

(assert (=> d!77364 m!351391))

(assert (=> b!228035 d!77364))

(declare-fun d!77366 () Bool)

(declare-fun e!156249 () Bool)

(assert (=> d!77366 e!156249))

(declare-fun res!191334 () Bool)

(assert (=> d!77366 (=> (not res!191334) (not e!156249))))

(assert (=> d!77366 (= res!191334 (and (or (let ((rhs!4003 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!4003 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!4003) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!77367 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!77367 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!77367 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!4002 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!4002 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!4002) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!365515 () Unit!17095)

(declare-fun choose!57 (BitStream!9184 BitStream!9184 (_ BitVec 64) (_ BitVec 32)) Unit!17095)

(assert (=> d!77366 (= lt!365515 (choose!57 thiss!1870 (_2!10694 lt!365367) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!77366 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10694 lt!365367) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!365515)))

(declare-fun b!228087 () Bool)

(declare-fun lt!365516 () (_ BitVec 32))

(assert (=> b!228087 (= e!156249 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5044 (buf!5585 (_2!10694 lt!365367)))) ((_ sign_extend 32) (currentByte!10435 (_2!10694 lt!365367))) ((_ sign_extend 32) (currentBit!10430 (_2!10694 lt!365367))) (bvsub (bvsub to!496 i!761) lt!365516)))))

(assert (=> b!228087 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!365516 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!365516) #b10000000000000000000000000000000)))))

(declare-fun lt!365517 () (_ BitVec 64))

(assert (=> b!228087 (= lt!365516 ((_ extract 31 0) lt!365517))))

(assert (=> b!228087 (and (bvslt lt!365517 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!365517 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!228087 (= lt!365517 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!77366 res!191334) b!228087))

(declare-fun m!351393 () Bool)

(assert (=> d!77366 m!351393))

(declare-fun m!351395 () Bool)

(assert (=> b!228087 m!351395))

(assert (=> b!228035 d!77366))

(declare-fun d!77369 () Bool)

(declare-fun e!156256 () Bool)

(assert (=> d!77369 e!156256))

(declare-fun res!191341 () Bool)

(assert (=> d!77369 (=> (not res!191341) (not e!156256))))

(assert (=> d!77369 (= res!191341 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!5044 arr!308))))))

(declare-fun lt!365535 () Unit!17095)

(declare-fun choose!326 (array!11495 (_ BitVec 32) (_ BitVec 8)) Unit!17095)

(assert (=> d!77369 (= lt!365535 (choose!326 arr!308 i!761 (_1!10694 lt!365367)))))

(assert (=> d!77369 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!5044 arr!308)))))

(assert (=> d!77369 (= (arrayUpdatedAtPrefixLemma!439 arr!308 i!761 (_1!10694 lt!365367)) lt!365535)))

(declare-fun b!228094 () Bool)

(assert (=> b!228094 (= e!156256 (arrayRangesEq!880 arr!308 (array!11496 (store (arr!6025 arr!308) i!761 (_1!10694 lt!365367)) (size!5044 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!77369 res!191341) b!228094))

(declare-fun m!351405 () Bool)

(assert (=> d!77369 m!351405))

(assert (=> b!228094 m!351267))

(declare-fun m!351407 () Bool)

(assert (=> b!228094 m!351407))

(assert (=> b!228035 d!77369))

(declare-fun d!77373 () Bool)

(declare-fun e!156257 () Bool)

(assert (=> d!77373 e!156257))

(declare-fun res!191342 () Bool)

(assert (=> d!77373 (=> (not res!191342) (not e!156257))))

(declare-fun lt!365541 () (_ BitVec 64))

(declare-fun lt!365539 () (_ BitVec 64))

(declare-fun lt!365537 () (_ BitVec 64))

(assert (=> d!77373 (= res!191342 (= lt!365539 (bvsub lt!365541 lt!365537)))))

(assert (=> d!77373 (or (= (bvand lt!365541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!365537 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!365541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!365541 lt!365537) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77373 (= lt!365537 (remainingBits!0 ((_ sign_extend 32) (size!5044 (buf!5585 (_2!10695 lt!365362)))) ((_ sign_extend 32) (currentByte!10435 (_2!10695 lt!365362))) ((_ sign_extend 32) (currentBit!10430 (_2!10695 lt!365362)))))))

(declare-fun lt!365540 () (_ BitVec 64))

(declare-fun lt!365536 () (_ BitVec 64))

(assert (=> d!77373 (= lt!365541 (bvmul lt!365540 lt!365536))))

(assert (=> d!77373 (or (= lt!365540 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!365536 (bvsdiv (bvmul lt!365540 lt!365536) lt!365540)))))

(assert (=> d!77373 (= lt!365536 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77373 (= lt!365540 ((_ sign_extend 32) (size!5044 (buf!5585 (_2!10695 lt!365362)))))))

(assert (=> d!77373 (= lt!365539 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10435 (_2!10695 lt!365362))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10430 (_2!10695 lt!365362)))))))

(assert (=> d!77373 (invariant!0 (currentBit!10430 (_2!10695 lt!365362)) (currentByte!10435 (_2!10695 lt!365362)) (size!5044 (buf!5585 (_2!10695 lt!365362))))))

(assert (=> d!77373 (= (bitIndex!0 (size!5044 (buf!5585 (_2!10695 lt!365362))) (currentByte!10435 (_2!10695 lt!365362)) (currentBit!10430 (_2!10695 lt!365362))) lt!365539)))

(declare-fun b!228095 () Bool)

(declare-fun res!191343 () Bool)

(assert (=> b!228095 (=> (not res!191343) (not e!156257))))

(assert (=> b!228095 (= res!191343 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!365539))))

(declare-fun b!228096 () Bool)

(declare-fun lt!365538 () (_ BitVec 64))

(assert (=> b!228096 (= e!156257 (bvsle lt!365539 (bvmul lt!365538 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228096 (or (= lt!365538 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!365538 #b0000000000000000000000000000000000000000000000000000000000001000) lt!365538)))))

(assert (=> b!228096 (= lt!365538 ((_ sign_extend 32) (size!5044 (buf!5585 (_2!10695 lt!365362)))))))

(assert (= (and d!77373 res!191342) b!228095))

(assert (= (and b!228095 res!191343) b!228096))

(declare-fun m!351409 () Bool)

(assert (=> d!77373 m!351409))

(declare-fun m!351411 () Bool)

(assert (=> d!77373 m!351411))

(assert (=> b!228035 d!77373))

(declare-fun b!228149 () Bool)

(declare-fun e!156299 () tuple3!1470)

(declare-fun lt!365818 () Unit!17095)

(declare-fun lt!365797 () tuple3!1470)

(assert (=> b!228149 (= e!156299 (tuple3!1471 lt!365818 (_2!10695 lt!365797) (_3!877 lt!365797)))))

(declare-fun lt!365807 () tuple2!19634)

(assert (=> b!228149 (= lt!365807 (readByte!0 (_2!10694 lt!365367)))))

(declare-fun lt!365824 () array!11495)

(assert (=> b!228149 (= lt!365824 (array!11496 (store (arr!6025 lt!365363) (bvadd #b00000000000000000000000000000001 i!761) (_1!10694 lt!365807)) (size!5044 lt!365363)))))

(declare-fun lt!365817 () (_ BitVec 64))

(assert (=> b!228149 (= lt!365817 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!365822 () (_ BitVec 32))

(assert (=> b!228149 (= lt!365822 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!365821 () Unit!17095)

(assert (=> b!228149 (= lt!365821 (validateOffsetBytesFromBitIndexLemma!0 (_2!10694 lt!365367) (_2!10694 lt!365807) lt!365817 lt!365822))))

(assert (=> b!228149 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5044 (buf!5585 (_2!10694 lt!365807)))) ((_ sign_extend 32) (currentByte!10435 (_2!10694 lt!365807))) ((_ sign_extend 32) (currentBit!10430 (_2!10694 lt!365807))) (bvsub lt!365822 ((_ extract 31 0) (bvsdiv (bvadd lt!365817 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!365803 () Unit!17095)

(assert (=> b!228149 (= lt!365803 lt!365821)))

(assert (=> b!228149 (= lt!365797 (readByteArrayLoop!0 (_2!10694 lt!365807) lt!365824 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(declare-fun call!3900 () (_ BitVec 64))

(assert (=> b!228149 (= (bitIndex!0 (size!5044 (buf!5585 (_2!10694 lt!365807))) (currentByte!10435 (_2!10694 lt!365807)) (currentBit!10430 (_2!10694 lt!365807))) (bvadd call!3900 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!365815 () Unit!17095)

(declare-fun Unit!17116 () Unit!17095)

(assert (=> b!228149 (= lt!365815 Unit!17116)))

(assert (=> b!228149 (= (bvadd (bitIndex!0 (size!5044 (buf!5585 (_2!10694 lt!365807))) (currentByte!10435 (_2!10694 lt!365807)) (currentBit!10430 (_2!10694 lt!365807))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!5044 (buf!5585 (_2!10695 lt!365797))) (currentByte!10435 (_2!10695 lt!365797)) (currentBit!10430 (_2!10695 lt!365797))))))

(declare-fun lt!365809 () Unit!17095)

(declare-fun Unit!17117 () Unit!17095)

(assert (=> b!228149 (= lt!365809 Unit!17117)))

(assert (=> b!228149 (= (bvadd call!3900 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!5044 (buf!5585 (_2!10695 lt!365797))) (currentByte!10435 (_2!10695 lt!365797)) (currentBit!10430 (_2!10695 lt!365797))))))

(declare-fun lt!365795 () Unit!17095)

(declare-fun Unit!17118 () Unit!17095)

(assert (=> b!228149 (= lt!365795 Unit!17118)))

(assert (=> b!228149 (and (= (buf!5585 (_2!10694 lt!365367)) (buf!5585 (_2!10695 lt!365797))) (= (size!5044 lt!365363) (size!5044 (_3!877 lt!365797))))))

(declare-fun lt!365791 () Unit!17095)

(declare-fun Unit!17119 () Unit!17095)

(assert (=> b!228149 (= lt!365791 Unit!17119)))

(declare-fun lt!365819 () Unit!17095)

(assert (=> b!228149 (= lt!365819 (arrayUpdatedAtPrefixLemma!439 lt!365363 (bvadd #b00000000000000000000000000000001 i!761) (_1!10694 lt!365807)))))

(declare-fun call!3899 () Bool)

(assert (=> b!228149 call!3899))

(declare-fun lt!365826 () Unit!17095)

(assert (=> b!228149 (= lt!365826 lt!365819)))

(declare-fun lt!365820 () (_ BitVec 32))

(assert (=> b!228149 (= lt!365820 #b00000000000000000000000000000000)))

(declare-fun lt!365811 () Unit!17095)

(assert (=> b!228149 (= lt!365811 (arrayRangesEqTransitive!303 lt!365363 lt!365824 (_3!877 lt!365797) lt!365820 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun call!3898 () Bool)

(assert (=> b!228149 call!3898))

(declare-fun lt!365825 () Unit!17095)

(assert (=> b!228149 (= lt!365825 lt!365811)))

(assert (=> b!228149 (arrayRangesEq!880 lt!365363 (_3!877 lt!365797) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!365798 () Unit!17095)

(declare-fun Unit!17120 () Unit!17095)

(assert (=> b!228149 (= lt!365798 Unit!17120)))

(declare-fun lt!365810 () Unit!17095)

(assert (=> b!228149 (= lt!365810 (arrayRangesEqImpliesEq!136 lt!365824 (_3!877 lt!365797) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!228149 (= (select (store (arr!6025 lt!365363) (bvadd #b00000000000000000000000000000001 i!761) (_1!10694 lt!365807)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!6025 (_3!877 lt!365797)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!365801 () Unit!17095)

(assert (=> b!228149 (= lt!365801 lt!365810)))

(declare-fun lt!365805 () Bool)

(assert (=> b!228149 (= lt!365805 (= (select (arr!6025 (_3!877 lt!365797)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10694 lt!365807)))))

(declare-fun Unit!17121 () Unit!17095)

(assert (=> b!228149 (= lt!365818 Unit!17121)))

(assert (=> b!228149 lt!365805))

(declare-fun b!228150 () Bool)

(declare-fun res!191388 () Bool)

(declare-fun e!156298 () Bool)

(assert (=> b!228150 (=> (not res!191388) (not e!156298))))

(declare-fun lt!365799 () tuple3!1470)

(assert (=> b!228150 (= res!191388 (and (= (buf!5585 (_2!10694 lt!365367)) (buf!5585 (_2!10695 lt!365799))) (= (size!5044 lt!365363) (size!5044 (_3!877 lt!365799)))))))

(declare-fun d!77375 () Bool)

(declare-fun e!156297 () Bool)

(assert (=> d!77375 e!156297))

(declare-fun res!191387 () Bool)

(assert (=> d!77375 (=> res!191387 e!156297)))

(assert (=> d!77375 (= res!191387 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!365812 () Bool)

(assert (=> d!77375 (= lt!365812 e!156298)))

(declare-fun res!191389 () Bool)

(assert (=> d!77375 (=> (not res!191389) (not e!156298))))

(declare-fun lt!365823 () (_ BitVec 64))

(declare-fun lt!365804 () (_ BitVec 64))

(assert (=> d!77375 (= res!191389 (= (bvadd lt!365823 lt!365804) (bitIndex!0 (size!5044 (buf!5585 (_2!10695 lt!365799))) (currentByte!10435 (_2!10695 lt!365799)) (currentBit!10430 (_2!10695 lt!365799)))))))

(assert (=> d!77375 (or (not (= (bvand lt!365823 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!365804 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!365823 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!365823 lt!365804) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!365813 () (_ BitVec 64))

(assert (=> d!77375 (= lt!365804 (bvmul lt!365813 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!77375 (or (= lt!365813 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!365813 #b0000000000000000000000000000000000000000000000000000000000001000) lt!365813)))))

(assert (=> d!77375 (= lt!365813 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!77375 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!77375 (= lt!365823 (bitIndex!0 (size!5044 (buf!5585 (_2!10694 lt!365367))) (currentByte!10435 (_2!10694 lt!365367)) (currentBit!10430 (_2!10694 lt!365367))))))

(assert (=> d!77375 (= lt!365799 e!156299)))

(declare-fun c!11227 () Bool)

(assert (=> d!77375 (= c!11227 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!77375 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!5044 lt!365363)))))

(assert (=> d!77375 (= (readByteArrayLoop!0 (_2!10694 lt!365367) lt!365363 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!365799)))

(declare-fun bm!3895 () Bool)

(assert (=> bm!3895 (= call!3900 (bitIndex!0 (size!5044 (buf!5585 (_2!10694 lt!365367))) (currentByte!10435 (_2!10694 lt!365367)) (currentBit!10430 (_2!10694 lt!365367))))))

(declare-fun lt!365816 () (_ BitVec 32))

(declare-fun bm!3896 () Bool)

(declare-fun lt!365806 () (_ BitVec 32))

(declare-fun lt!365793 () array!11495)

(declare-fun lt!365808 () array!11495)

(assert (=> bm!3896 (= call!3899 (arrayRangesEq!880 (ite c!11227 lt!365363 lt!365793) (ite c!11227 (array!11496 (store (arr!6025 lt!365363) (bvadd #b00000000000000000000000000000001 i!761) (_1!10694 lt!365807)) (size!5044 lt!365363)) lt!365808) (ite c!11227 #b00000000000000000000000000000000 lt!365816) (ite c!11227 (bvadd #b00000000000000000000000000000001 i!761) lt!365806)))))

(declare-fun b!228151 () Bool)

(declare-fun lt!365792 () Unit!17095)

(assert (=> b!228151 (= e!156299 (tuple3!1471 lt!365792 (_2!10694 lt!365367) lt!365363))))

(assert (=> b!228151 (= call!3900 call!3900)))

(declare-fun lt!365794 () Unit!17095)

(declare-fun Unit!17122 () Unit!17095)

(assert (=> b!228151 (= lt!365794 Unit!17122)))

(declare-fun lt!365800 () Unit!17095)

(declare-fun arrayRangesEqReflexiveLemma!140 (array!11495) Unit!17095)

(assert (=> b!228151 (= lt!365800 (arrayRangesEqReflexiveLemma!140 lt!365363))))

(assert (=> b!228151 call!3898))

(declare-fun lt!365802 () Unit!17095)

(assert (=> b!228151 (= lt!365802 lt!365800)))

(assert (=> b!228151 (= lt!365793 lt!365363)))

(assert (=> b!228151 (= lt!365808 lt!365363)))

(declare-fun lt!365814 () (_ BitVec 32))

(assert (=> b!228151 (= lt!365814 #b00000000000000000000000000000000)))

(declare-fun lt!365796 () (_ BitVec 32))

(assert (=> b!228151 (= lt!365796 (size!5044 lt!365363))))

(assert (=> b!228151 (= lt!365816 #b00000000000000000000000000000000)))

(assert (=> b!228151 (= lt!365806 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!125 (array!11495 array!11495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17095)

(assert (=> b!228151 (= lt!365792 (arrayRangesEqSlicedLemma!125 lt!365793 lt!365808 lt!365814 lt!365796 lt!365816 lt!365806))))

(assert (=> b!228151 call!3899))

(declare-fun b!228152 () Bool)

(declare-datatypes ((tuple2!19648 0))(
  ( (tuple2!19649 (_1!10704 BitStream!9184) (_2!10704 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9184) tuple2!19648)

(assert (=> b!228152 (= e!156297 (= (select (arr!6025 (_3!877 lt!365799)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10704 (readBytePure!0 (_2!10694 lt!365367)))))))

(assert (=> b!228152 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!5044 (_3!877 lt!365799))))))

(declare-fun b!228153 () Bool)

(assert (=> b!228153 (= e!156298 (arrayRangesEq!880 lt!365363 (_3!877 lt!365799) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun bm!3897 () Bool)

(assert (=> bm!3897 (= call!3898 (arrayRangesEq!880 lt!365363 (ite c!11227 (_3!877 lt!365797) lt!365363) (ite c!11227 lt!365820 #b00000000000000000000000000000000) (ite c!11227 (bvadd #b00000000000000000000000000000001 i!761) (size!5044 lt!365363))))))

(assert (= (and d!77375 c!11227) b!228149))

(assert (= (and d!77375 (not c!11227)) b!228151))

(assert (= (or b!228149 b!228151) bm!3897))

(assert (= (or b!228149 b!228151) bm!3896))

(assert (= (or b!228149 b!228151) bm!3895))

(assert (= (and d!77375 res!191389) b!228150))

(assert (= (and b!228150 res!191388) b!228153))

(assert (= (and d!77375 (not res!191387)) b!228152))

(declare-fun m!351501 () Bool)

(assert (=> bm!3896 m!351501))

(declare-fun m!351503 () Bool)

(assert (=> bm!3896 m!351503))

(assert (=> bm!3895 m!351273))

(declare-fun m!351505 () Bool)

(assert (=> b!228151 m!351505))

(declare-fun m!351507 () Bool)

(assert (=> b!228151 m!351507))

(declare-fun m!351509 () Bool)

(assert (=> d!77375 m!351509))

(assert (=> d!77375 m!351273))

(declare-fun m!351511 () Bool)

(assert (=> b!228149 m!351511))

(declare-fun m!351513 () Bool)

(assert (=> b!228149 m!351513))

(declare-fun m!351515 () Bool)

(assert (=> b!228149 m!351515))

(declare-fun m!351517 () Bool)

(assert (=> b!228149 m!351517))

(declare-fun m!351519 () Bool)

(assert (=> b!228149 m!351519))

(declare-fun m!351521 () Bool)

(assert (=> b!228149 m!351521))

(declare-fun m!351523 () Bool)

(assert (=> b!228149 m!351523))

(declare-fun m!351525 () Bool)

(assert (=> b!228149 m!351525))

(declare-fun m!351527 () Bool)

(assert (=> b!228149 m!351527))

(declare-fun m!351529 () Bool)

(assert (=> b!228149 m!351529))

(declare-fun m!351531 () Bool)

(assert (=> b!228149 m!351531))

(assert (=> b!228149 m!351501))

(declare-fun m!351533 () Bool)

(assert (=> b!228149 m!351533))

(declare-fun m!351535 () Bool)

(assert (=> bm!3897 m!351535))

(declare-fun m!351537 () Bool)

(assert (=> b!228153 m!351537))

(declare-fun m!351539 () Bool)

(assert (=> b!228152 m!351539))

(declare-fun m!351541 () Bool)

(assert (=> b!228152 m!351541))

(assert (=> b!228035 d!77375))

(declare-fun d!77403 () Bool)

(assert (=> d!77403 (arrayRangesEq!880 arr!308 (_3!877 lt!365362) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365829 () Unit!17095)

(declare-fun choose!330 (array!11495 array!11495 array!11495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17095)

(assert (=> d!77403 (= lt!365829 (choose!330 arr!308 lt!365363 (_3!877 lt!365362) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77403 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77403 (= (arrayRangesEqTransitive!303 arr!308 lt!365363 (_3!877 lt!365362) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!365829)))

(declare-fun bs!18928 () Bool)

(assert (= bs!18928 d!77403))

(assert (=> bs!18928 m!351255))

(declare-fun m!351543 () Bool)

(assert (=> bs!18928 m!351543))

(assert (=> b!228035 d!77403))

(declare-fun d!77405 () Bool)

(assert (=> d!77405 (= (array_inv!4785 arr!308) (bvsge (size!5044 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47936 d!77405))

(declare-fun d!77407 () Bool)

(assert (=> d!77407 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10430 thiss!1870) (currentByte!10435 thiss!1870) (size!5044 (buf!5585 thiss!1870))))))

(declare-fun bs!18929 () Bool)

(assert (= bs!18929 d!77407))

(assert (=> bs!18929 m!351389))

(assert (=> start!47936 d!77407))

(declare-fun d!77409 () Bool)

(assert (=> d!77409 (= (array_inv!4785 (buf!5585 thiss!1870)) (bvsge (size!5044 (buf!5585 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!228036 d!77409))

(push 1)

(assert (not b!228152))

(assert (not b!228087))

(assert (not d!77338))

(assert (not bm!3896))

(assert (not d!77407))

(assert (not bm!3897))

(assert (not b!228094))

(assert (not d!77375))

(assert (not d!77360))

(assert (not d!77369))

(assert (not d!77403))

(assert (not b!228074))

(assert (not d!77342))

(assert (not b!228066))

(assert (not b!228153))

(assert (not b!228151))

(assert (not d!77344))

(assert (not b!228149))

(assert (not d!77336))

(assert (not d!77364))

(assert (not bm!3895))

(assert (not d!77366))

(assert (not b!228072))

(assert (not d!77373))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

