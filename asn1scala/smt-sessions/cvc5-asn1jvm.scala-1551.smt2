; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43602 () Bool)

(assert start!43602)

(declare-fun b!206339 () Bool)

(declare-fun res!173015 () Bool)

(declare-fun e!141094 () Bool)

(assert (=> b!206339 (=> res!173015 e!141094)))

(declare-datatypes ((array!10385 0))(
  ( (array!10386 (arr!5494 (Array (_ BitVec 32) (_ BitVec 8))) (size!4564 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8236 0))(
  ( (BitStream!8237 (buf!5069 array!10385) (currentByte!9587 (_ BitVec 32)) (currentBit!9582 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14722 0))(
  ( (Unit!14723) )
))
(declare-datatypes ((tuple2!17630 0))(
  ( (tuple2!17631 (_1!9470 Unit!14722) (_2!9470 BitStream!8236)) )
))
(declare-fun lt!322520 () tuple2!17630)

(declare-fun lt!322535 () tuple2!17630)

(declare-fun isPrefixOf!0 (BitStream!8236 BitStream!8236) Bool)

(assert (=> b!206339 (= res!173015 (not (isPrefixOf!0 (_2!9470 lt!322520) (_2!9470 lt!322535))))))

(declare-fun b!206340 () Bool)

(declare-fun e!141091 () Bool)

(declare-fun thiss!1204 () BitStream!8236)

(declare-fun array_inv!4305 (array!10385) Bool)

(assert (=> b!206340 (= e!141091 (array_inv!4305 (buf!5069 thiss!1204)))))

(declare-fun b!206341 () Bool)

(declare-fun e!141090 () Bool)

(declare-datatypes ((tuple2!17632 0))(
  ( (tuple2!17633 (_1!9471 BitStream!8236) (_2!9471 Bool)) )
))
(declare-fun lt!322528 () tuple2!17632)

(declare-fun lt!322522 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206341 (= e!141090 (= (bitIndex!0 (size!4564 (buf!5069 (_1!9471 lt!322528))) (currentByte!9587 (_1!9471 lt!322528)) (currentBit!9582 (_1!9471 lt!322528))) lt!322522))))

(declare-fun b!206342 () Bool)

(declare-fun res!173018 () Bool)

(assert (=> b!206342 (=> res!173018 e!141094)))

(declare-fun lt!322531 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!322532 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!206342 (= res!173018 (or (not (= (size!4564 (buf!5069 (_2!9470 lt!322535))) (size!4564 (buf!5069 thiss!1204)))) (not (= lt!322532 (bvsub (bvadd lt!322531 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun res!173010 () Bool)

(declare-fun e!141097 () Bool)

(assert (=> start!43602 (=> (not res!173010) (not e!141097))))

(assert (=> start!43602 (= res!173010 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43602 e!141097))

(assert (=> start!43602 true))

(declare-fun inv!12 (BitStream!8236) Bool)

(assert (=> start!43602 (and (inv!12 thiss!1204) e!141091)))

(declare-fun b!206343 () Bool)

(declare-fun e!141096 () Bool)

(declare-fun e!141092 () Bool)

(assert (=> b!206343 (= e!141096 (not e!141092))))

(declare-fun res!173006 () Bool)

(assert (=> b!206343 (=> res!173006 e!141092)))

(declare-fun lt!322527 () (_ BitVec 64))

(assert (=> b!206343 (= res!173006 (not (= lt!322527 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322531))))))

(assert (=> b!206343 (= lt!322527 (bitIndex!0 (size!4564 (buf!5069 (_2!9470 lt!322520))) (currentByte!9587 (_2!9470 lt!322520)) (currentBit!9582 (_2!9470 lt!322520))))))

(assert (=> b!206343 (= lt!322531 (bitIndex!0 (size!4564 (buf!5069 thiss!1204)) (currentByte!9587 thiss!1204) (currentBit!9582 thiss!1204)))))

(declare-fun e!141099 () Bool)

(assert (=> b!206343 e!141099))

(declare-fun res!173016 () Bool)

(assert (=> b!206343 (=> (not res!173016) (not e!141099))))

(assert (=> b!206343 (= res!173016 (= (size!4564 (buf!5069 thiss!1204)) (size!4564 (buf!5069 (_2!9470 lt!322520)))))))

(declare-fun lt!322533 () Bool)

(declare-fun appendBit!0 (BitStream!8236 Bool) tuple2!17630)

(assert (=> b!206343 (= lt!322520 (appendBit!0 thiss!1204 lt!322533))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!206343 (= lt!322533 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!206344 () Bool)

(declare-fun res!173013 () Bool)

(assert (=> b!206344 (=> (not res!173013) (not e!141096))))

(assert (=> b!206344 (= res!173013 (not (= i!590 nBits!348)))))

(declare-fun b!206345 () Bool)

(assert (=> b!206345 (= e!141092 e!141094)))

(declare-fun res!173003 () Bool)

(assert (=> b!206345 (=> res!173003 e!141094)))

(assert (=> b!206345 (= res!173003 (not (= lt!322532 (bvsub (bvsub (bvadd lt!322527 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!206345 (= lt!322532 (bitIndex!0 (size!4564 (buf!5069 (_2!9470 lt!322535))) (currentByte!9587 (_2!9470 lt!322535)) (currentBit!9582 (_2!9470 lt!322535))))))

(assert (=> b!206345 (isPrefixOf!0 thiss!1204 (_2!9470 lt!322535))))

(declare-fun lt!322534 () Unit!14722)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8236 BitStream!8236 BitStream!8236) Unit!14722)

(assert (=> b!206345 (= lt!322534 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9470 lt!322520) (_2!9470 lt!322535)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8236 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17630)

(assert (=> b!206345 (= lt!322535 (appendBitsLSBFirstLoopTR!0 (_2!9470 lt!322520) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!206346 () Bool)

(assert (=> b!206346 (= e!141097 e!141096)))

(declare-fun res!173005 () Bool)

(assert (=> b!206346 (=> (not res!173005) (not e!141096))))

(declare-fun lt!322525 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206346 (= res!173005 (validate_offset_bits!1 ((_ sign_extend 32) (size!4564 (buf!5069 thiss!1204))) ((_ sign_extend 32) (currentByte!9587 thiss!1204)) ((_ sign_extend 32) (currentBit!9582 thiss!1204)) lt!322525))))

(assert (=> b!206346 (= lt!322525 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!206347 () Bool)

(declare-fun e!141095 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206347 (= e!141095 (invariant!0 (currentBit!9582 thiss!1204) (currentByte!9587 thiss!1204) (size!4564 (buf!5069 (_2!9470 lt!322535)))))))

(declare-fun b!206348 () Bool)

(declare-fun res!173007 () Bool)

(declare-fun e!141089 () Bool)

(assert (=> b!206348 (=> (not res!173007) (not e!141089))))

(assert (=> b!206348 (= res!173007 (isPrefixOf!0 thiss!1204 (_2!9470 lt!322520)))))

(declare-fun b!206349 () Bool)

(assert (=> b!206349 (= e!141089 e!141090)))

(declare-fun res!173008 () Bool)

(assert (=> b!206349 (=> (not res!173008) (not e!141090))))

(assert (=> b!206349 (= res!173008 (and (= (_2!9471 lt!322528) lt!322533) (= (_1!9471 lt!322528) (_2!9470 lt!322520))))))

(declare-fun readBitPure!0 (BitStream!8236) tuple2!17632)

(declare-fun readerFrom!0 (BitStream!8236 (_ BitVec 32) (_ BitVec 32)) BitStream!8236)

(assert (=> b!206349 (= lt!322528 (readBitPure!0 (readerFrom!0 (_2!9470 lt!322520) (currentBit!9582 thiss!1204) (currentByte!9587 thiss!1204))))))

(declare-fun b!206350 () Bool)

(declare-fun res!173012 () Bool)

(assert (=> b!206350 (=> res!173012 e!141094)))

(assert (=> b!206350 (= res!173012 (not (invariant!0 (currentBit!9582 (_2!9470 lt!322535)) (currentByte!9587 (_2!9470 lt!322535)) (size!4564 (buf!5069 (_2!9470 lt!322535))))))))

(declare-fun b!206351 () Bool)

(declare-fun res!173011 () Bool)

(assert (=> b!206351 (=> (not res!173011) (not e!141096))))

(assert (=> b!206351 (= res!173011 (invariant!0 (currentBit!9582 thiss!1204) (currentByte!9587 thiss!1204) (size!4564 (buf!5069 thiss!1204))))))

(declare-fun b!206352 () Bool)

(assert (=> b!206352 (= e!141094 (or (not (= (size!4564 (buf!5069 thiss!1204)) (size!4564 (buf!5069 (_2!9470 lt!322535))))) (bvsge lt!322525 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!17634 0))(
  ( (tuple2!17635 (_1!9472 BitStream!8236) (_2!9472 BitStream!8236)) )
))
(declare-fun lt!322526 () tuple2!17634)

(assert (=> b!206352 (= (_2!9471 (readBitPure!0 (_1!9472 lt!322526))) lt!322533)))

(declare-fun lt!322523 () tuple2!17634)

(declare-fun reader!0 (BitStream!8236 BitStream!8236) tuple2!17634)

(assert (=> b!206352 (= lt!322523 (reader!0 (_2!9470 lt!322520) (_2!9470 lt!322535)))))

(assert (=> b!206352 (= lt!322526 (reader!0 thiss!1204 (_2!9470 lt!322535)))))

(declare-fun e!141098 () Bool)

(assert (=> b!206352 e!141098))

(declare-fun res!173004 () Bool)

(assert (=> b!206352 (=> (not res!173004) (not e!141098))))

(declare-fun lt!322530 () tuple2!17632)

(declare-fun lt!322519 () tuple2!17632)

(assert (=> b!206352 (= res!173004 (= (bitIndex!0 (size!4564 (buf!5069 (_1!9471 lt!322530))) (currentByte!9587 (_1!9471 lt!322530)) (currentBit!9582 (_1!9471 lt!322530))) (bitIndex!0 (size!4564 (buf!5069 (_1!9471 lt!322519))) (currentByte!9587 (_1!9471 lt!322519)) (currentBit!9582 (_1!9471 lt!322519)))))))

(declare-fun lt!322521 () Unit!14722)

(declare-fun lt!322529 () BitStream!8236)

(declare-fun readBitPrefixLemma!0 (BitStream!8236 BitStream!8236) Unit!14722)

(assert (=> b!206352 (= lt!322521 (readBitPrefixLemma!0 lt!322529 (_2!9470 lt!322535)))))

(assert (=> b!206352 (= lt!322519 (readBitPure!0 (BitStream!8237 (buf!5069 (_2!9470 lt!322535)) (currentByte!9587 thiss!1204) (currentBit!9582 thiss!1204))))))

(assert (=> b!206352 (= lt!322530 (readBitPure!0 lt!322529))))

(assert (=> b!206352 e!141095))

(declare-fun res!173009 () Bool)

(assert (=> b!206352 (=> (not res!173009) (not e!141095))))

(assert (=> b!206352 (= res!173009 (invariant!0 (currentBit!9582 thiss!1204) (currentByte!9587 thiss!1204) (size!4564 (buf!5069 (_2!9470 lt!322520)))))))

(assert (=> b!206352 (= lt!322529 (BitStream!8237 (buf!5069 (_2!9470 lt!322520)) (currentByte!9587 thiss!1204) (currentBit!9582 thiss!1204)))))

(declare-fun b!206353 () Bool)

(assert (=> b!206353 (= e!141099 e!141089)))

(declare-fun res!173014 () Bool)

(assert (=> b!206353 (=> (not res!173014) (not e!141089))))

(declare-fun lt!322524 () (_ BitVec 64))

(assert (=> b!206353 (= res!173014 (= lt!322522 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322524)))))

(assert (=> b!206353 (= lt!322522 (bitIndex!0 (size!4564 (buf!5069 (_2!9470 lt!322520))) (currentByte!9587 (_2!9470 lt!322520)) (currentBit!9582 (_2!9470 lt!322520))))))

(assert (=> b!206353 (= lt!322524 (bitIndex!0 (size!4564 (buf!5069 thiss!1204)) (currentByte!9587 thiss!1204) (currentBit!9582 thiss!1204)))))

(declare-fun b!206354 () Bool)

(declare-fun res!173017 () Bool)

(assert (=> b!206354 (=> res!173017 e!141094)))

(assert (=> b!206354 (= res!173017 (not (isPrefixOf!0 thiss!1204 (_2!9470 lt!322520))))))

(declare-fun b!206355 () Bool)

(assert (=> b!206355 (= e!141098 (= (_2!9471 lt!322530) (_2!9471 lt!322519)))))

(assert (= (and start!43602 res!173010) b!206346))

(assert (= (and b!206346 res!173005) b!206351))

(assert (= (and b!206351 res!173011) b!206344))

(assert (= (and b!206344 res!173013) b!206343))

(assert (= (and b!206343 res!173016) b!206353))

(assert (= (and b!206353 res!173014) b!206348))

(assert (= (and b!206348 res!173007) b!206349))

(assert (= (and b!206349 res!173008) b!206341))

(assert (= (and b!206343 (not res!173006)) b!206345))

(assert (= (and b!206345 (not res!173003)) b!206350))

(assert (= (and b!206350 (not res!173012)) b!206342))

(assert (= (and b!206342 (not res!173018)) b!206339))

(assert (= (and b!206339 (not res!173015)) b!206354))

(assert (= (and b!206354 (not res!173017)) b!206352))

(assert (= (and b!206352 res!173009) b!206347))

(assert (= (and b!206352 res!173004) b!206355))

(assert (= start!43602 b!206340))

(declare-fun m!317895 () Bool)

(assert (=> b!206348 m!317895))

(declare-fun m!317897 () Bool)

(assert (=> b!206351 m!317897))

(declare-fun m!317899 () Bool)

(assert (=> b!206346 m!317899))

(declare-fun m!317901 () Bool)

(assert (=> b!206353 m!317901))

(declare-fun m!317903 () Bool)

(assert (=> b!206353 m!317903))

(declare-fun m!317905 () Bool)

(assert (=> b!206345 m!317905))

(declare-fun m!317907 () Bool)

(assert (=> b!206345 m!317907))

(declare-fun m!317909 () Bool)

(assert (=> b!206345 m!317909))

(declare-fun m!317911 () Bool)

(assert (=> b!206345 m!317911))

(declare-fun m!317913 () Bool)

(assert (=> b!206341 m!317913))

(declare-fun m!317915 () Bool)

(assert (=> b!206339 m!317915))

(declare-fun m!317917 () Bool)

(assert (=> b!206352 m!317917))

(declare-fun m!317919 () Bool)

(assert (=> b!206352 m!317919))

(declare-fun m!317921 () Bool)

(assert (=> b!206352 m!317921))

(declare-fun m!317923 () Bool)

(assert (=> b!206352 m!317923))

(declare-fun m!317925 () Bool)

(assert (=> b!206352 m!317925))

(declare-fun m!317927 () Bool)

(assert (=> b!206352 m!317927))

(declare-fun m!317929 () Bool)

(assert (=> b!206352 m!317929))

(declare-fun m!317931 () Bool)

(assert (=> b!206352 m!317931))

(declare-fun m!317933 () Bool)

(assert (=> b!206352 m!317933))

(assert (=> b!206354 m!317895))

(declare-fun m!317935 () Bool)

(assert (=> b!206340 m!317935))

(declare-fun m!317937 () Bool)

(assert (=> start!43602 m!317937))

(declare-fun m!317939 () Bool)

(assert (=> b!206347 m!317939))

(declare-fun m!317941 () Bool)

(assert (=> b!206349 m!317941))

(assert (=> b!206349 m!317941))

(declare-fun m!317943 () Bool)

(assert (=> b!206349 m!317943))

(assert (=> b!206343 m!317901))

(assert (=> b!206343 m!317903))

(declare-fun m!317945 () Bool)

(assert (=> b!206343 m!317945))

(declare-fun m!317947 () Bool)

(assert (=> b!206350 m!317947))

(push 1)

(assert (not b!206353))

(assert (not b!206339))

(assert (not b!206348))

(assert (not b!206343))

(assert (not b!206340))

(assert (not b!206347))

(assert (not b!206351))

(assert (not b!206352))

(assert (not b!206346))

(assert (not b!206354))

(assert (not b!206341))

(assert (not b!206350))

(assert (not b!206345))

(assert (not b!206349))

(assert (not start!43602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

