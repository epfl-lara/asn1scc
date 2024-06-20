; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43620 () Bool)

(assert start!43620)

(declare-fun b!206798 () Bool)

(declare-fun res!173440 () Bool)

(declare-fun e!141385 () Bool)

(assert (=> b!206798 (=> res!173440 e!141385)))

(declare-datatypes ((array!10403 0))(
  ( (array!10404 (arr!5503 (Array (_ BitVec 32) (_ BitVec 8))) (size!4573 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8254 0))(
  ( (BitStream!8255 (buf!5078 array!10403) (currentByte!9596 (_ BitVec 32)) (currentBit!9591 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14740 0))(
  ( (Unit!14741) )
))
(declare-datatypes ((tuple2!17690 0))(
  ( (tuple2!17691 (_1!9500 Unit!14740) (_2!9500 BitStream!8254)) )
))
(declare-fun lt!323012 () tuple2!17690)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206798 (= res!173440 (not (invariant!0 (currentBit!9591 (_2!9500 lt!323012)) (currentByte!9596 (_2!9500 lt!323012)) (size!4573 (buf!5078 (_2!9500 lt!323012))))))))

(declare-fun b!206799 () Bool)

(declare-fun res!173450 () Bool)

(assert (=> b!206799 (=> res!173450 e!141385)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!323015 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun thiss!1204 () BitStream!8254)

(declare-fun lt!323005 () (_ BitVec 64))

(assert (=> b!206799 (= res!173450 (or (not (= (size!4573 (buf!5078 (_2!9500 lt!323012))) (size!4573 (buf!5078 thiss!1204)))) (not (= lt!323005 (bvsub (bvadd lt!323015 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!206800 () Bool)

(declare-fun e!141386 () Bool)

(declare-fun e!141382 () Bool)

(assert (=> b!206800 (= e!141386 e!141382)))

(declare-fun res!173435 () Bool)

(assert (=> b!206800 (=> (not res!173435) (not e!141382))))

(declare-fun lt!323011 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206800 (= res!173435 (validate_offset_bits!1 ((_ sign_extend 32) (size!4573 (buf!5078 thiss!1204))) ((_ sign_extend 32) (currentByte!9596 thiss!1204)) ((_ sign_extend 32) (currentBit!9591 thiss!1204)) lt!323011))))

(assert (=> b!206800 (= lt!323011 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun res!173447 () Bool)

(assert (=> start!43620 (=> (not res!173447) (not e!141386))))

(assert (=> start!43620 (= res!173447 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43620 e!141386))

(assert (=> start!43620 true))

(declare-fun e!141377 () Bool)

(declare-fun inv!12 (BitStream!8254) Bool)

(assert (=> start!43620 (and (inv!12 thiss!1204) e!141377)))

(declare-fun b!206801 () Bool)

(assert (=> b!206801 (= e!141385 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000))))))

(declare-fun v!189 () (_ BitVec 64))

(declare-datatypes ((tuple2!17692 0))(
  ( (tuple2!17693 (_1!9501 BitStream!8254) (_2!9501 BitStream!8254)) )
))
(declare-fun lt!323018 () tuple2!17692)

(declare-datatypes ((tuple2!17694 0))(
  ( (tuple2!17695 (_1!9502 BitStream!8254) (_2!9502 (_ BitVec 64))) )
))
(declare-fun lt!323003 () tuple2!17694)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8254 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17694)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206801 (= lt!323003 (readNBitsLSBFirstsLoopPure!0 (_1!9501 lt!323018) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> b!206801 (validate_offset_bits!1 ((_ sign_extend 32) (size!4573 (buf!5078 (_2!9500 lt!323012)))) ((_ sign_extend 32) (currentByte!9596 thiss!1204)) ((_ sign_extend 32) (currentBit!9591 thiss!1204)) lt!323011)))

(declare-fun lt!323000 () Unit!14740)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8254 array!10403 (_ BitVec 64)) Unit!14740)

(assert (=> b!206801 (= lt!323000 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5078 (_2!9500 lt!323012)) lt!323011))))

(declare-fun lt!323002 () Bool)

(declare-datatypes ((tuple2!17696 0))(
  ( (tuple2!17697 (_1!9503 BitStream!8254) (_2!9503 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!8254) tuple2!17696)

(assert (=> b!206801 (= (_2!9503 (readBitPure!0 (_1!9501 lt!323018))) lt!323002)))

(declare-fun lt!323008 () tuple2!17692)

(declare-fun lt!323010 () tuple2!17690)

(declare-fun reader!0 (BitStream!8254 BitStream!8254) tuple2!17692)

(assert (=> b!206801 (= lt!323008 (reader!0 (_2!9500 lt!323010) (_2!9500 lt!323012)))))

(assert (=> b!206801 (= lt!323018 (reader!0 thiss!1204 (_2!9500 lt!323012)))))

(declare-fun e!141383 () Bool)

(assert (=> b!206801 e!141383))

(declare-fun res!173446 () Bool)

(assert (=> b!206801 (=> (not res!173446) (not e!141383))))

(declare-fun lt!323006 () tuple2!17696)

(declare-fun lt!323014 () tuple2!17696)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206801 (= res!173446 (= (bitIndex!0 (size!4573 (buf!5078 (_1!9503 lt!323006))) (currentByte!9596 (_1!9503 lt!323006)) (currentBit!9591 (_1!9503 lt!323006))) (bitIndex!0 (size!4573 (buf!5078 (_1!9503 lt!323014))) (currentByte!9596 (_1!9503 lt!323014)) (currentBit!9591 (_1!9503 lt!323014)))))))

(declare-fun lt!323004 () Unit!14740)

(declare-fun lt!323016 () BitStream!8254)

(declare-fun readBitPrefixLemma!0 (BitStream!8254 BitStream!8254) Unit!14740)

(assert (=> b!206801 (= lt!323004 (readBitPrefixLemma!0 lt!323016 (_2!9500 lt!323012)))))

(assert (=> b!206801 (= lt!323014 (readBitPure!0 (BitStream!8255 (buf!5078 (_2!9500 lt!323012)) (currentByte!9596 thiss!1204) (currentBit!9591 thiss!1204))))))

(assert (=> b!206801 (= lt!323006 (readBitPure!0 lt!323016))))

(declare-fun e!141378 () Bool)

(assert (=> b!206801 e!141378))

(declare-fun res!173445 () Bool)

(assert (=> b!206801 (=> (not res!173445) (not e!141378))))

(assert (=> b!206801 (= res!173445 (invariant!0 (currentBit!9591 thiss!1204) (currentByte!9596 thiss!1204) (size!4573 (buf!5078 (_2!9500 lt!323010)))))))

(assert (=> b!206801 (= lt!323016 (BitStream!8255 (buf!5078 (_2!9500 lt!323010)) (currentByte!9596 thiss!1204) (currentBit!9591 thiss!1204)))))

(declare-fun b!206802 () Bool)

(declare-fun e!141379 () Bool)

(assert (=> b!206802 (= e!141379 e!141385)))

(declare-fun res!173438 () Bool)

(assert (=> b!206802 (=> res!173438 e!141385)))

(declare-fun lt!323013 () (_ BitVec 64))

(assert (=> b!206802 (= res!173438 (not (= lt!323005 (bvsub (bvsub (bvadd lt!323013 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!206802 (= lt!323005 (bitIndex!0 (size!4573 (buf!5078 (_2!9500 lt!323012))) (currentByte!9596 (_2!9500 lt!323012)) (currentBit!9591 (_2!9500 lt!323012))))))

(declare-fun isPrefixOf!0 (BitStream!8254 BitStream!8254) Bool)

(assert (=> b!206802 (isPrefixOf!0 thiss!1204 (_2!9500 lt!323012))))

(declare-fun lt!323007 () Unit!14740)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8254 BitStream!8254 BitStream!8254) Unit!14740)

(assert (=> b!206802 (= lt!323007 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9500 lt!323010) (_2!9500 lt!323012)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8254 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17690)

(assert (=> b!206802 (= lt!323012 (appendBitsLSBFirstLoopTR!0 (_2!9500 lt!323010) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!206803 () Bool)

(declare-fun e!141384 () Bool)

(declare-fun lt!323001 () tuple2!17696)

(declare-fun lt!323009 () (_ BitVec 64))

(assert (=> b!206803 (= e!141384 (= (bitIndex!0 (size!4573 (buf!5078 (_1!9503 lt!323001))) (currentByte!9596 (_1!9503 lt!323001)) (currentBit!9591 (_1!9503 lt!323001))) lt!323009))))

(declare-fun b!206804 () Bool)

(assert (=> b!206804 (= e!141378 (invariant!0 (currentBit!9591 thiss!1204) (currentByte!9596 thiss!1204) (size!4573 (buf!5078 (_2!9500 lt!323012)))))))

(declare-fun b!206805 () Bool)

(declare-fun res!173439 () Bool)

(assert (=> b!206805 (=> res!173439 e!141385)))

(assert (=> b!206805 (= res!173439 (not (isPrefixOf!0 (_2!9500 lt!323010) (_2!9500 lt!323012))))))

(declare-fun b!206806 () Bool)

(declare-fun e!141380 () Bool)

(declare-fun e!141381 () Bool)

(assert (=> b!206806 (= e!141380 e!141381)))

(declare-fun res!173449 () Bool)

(assert (=> b!206806 (=> (not res!173449) (not e!141381))))

(declare-fun lt!323017 () (_ BitVec 64))

(assert (=> b!206806 (= res!173449 (= lt!323009 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323017)))))

(assert (=> b!206806 (= lt!323009 (bitIndex!0 (size!4573 (buf!5078 (_2!9500 lt!323010))) (currentByte!9596 (_2!9500 lt!323010)) (currentBit!9591 (_2!9500 lt!323010))))))

(assert (=> b!206806 (= lt!323017 (bitIndex!0 (size!4573 (buf!5078 thiss!1204)) (currentByte!9596 thiss!1204) (currentBit!9591 thiss!1204)))))

(declare-fun b!206807 () Bool)

(declare-fun res!173443 () Bool)

(assert (=> b!206807 (=> (not res!173443) (not e!141382))))

(assert (=> b!206807 (= res!173443 (not (= i!590 nBits!348)))))

(declare-fun b!206808 () Bool)

(declare-fun res!173444 () Bool)

(assert (=> b!206808 (=> (not res!173444) (not e!141381))))

(assert (=> b!206808 (= res!173444 (isPrefixOf!0 thiss!1204 (_2!9500 lt!323010)))))

(declare-fun b!206809 () Bool)

(assert (=> b!206809 (= e!141383 (= (_2!9503 lt!323006) (_2!9503 lt!323014)))))

(declare-fun b!206810 () Bool)

(declare-fun res!173437 () Bool)

(assert (=> b!206810 (=> res!173437 e!141385)))

(assert (=> b!206810 (= res!173437 (not (isPrefixOf!0 thiss!1204 (_2!9500 lt!323010))))))

(declare-fun b!206811 () Bool)

(declare-fun array_inv!4314 (array!10403) Bool)

(assert (=> b!206811 (= e!141377 (array_inv!4314 (buf!5078 thiss!1204)))))

(declare-fun b!206812 () Bool)

(assert (=> b!206812 (= e!141381 e!141384)))

(declare-fun res!173442 () Bool)

(assert (=> b!206812 (=> (not res!173442) (not e!141384))))

(assert (=> b!206812 (= res!173442 (and (= (_2!9503 lt!323001) lt!323002) (= (_1!9503 lt!323001) (_2!9500 lt!323010))))))

(declare-fun readerFrom!0 (BitStream!8254 (_ BitVec 32) (_ BitVec 32)) BitStream!8254)

(assert (=> b!206812 (= lt!323001 (readBitPure!0 (readerFrom!0 (_2!9500 lt!323010) (currentBit!9591 thiss!1204) (currentByte!9596 thiss!1204))))))

(declare-fun b!206813 () Bool)

(declare-fun res!173441 () Bool)

(assert (=> b!206813 (=> (not res!173441) (not e!141382))))

(assert (=> b!206813 (= res!173441 (invariant!0 (currentBit!9591 thiss!1204) (currentByte!9596 thiss!1204) (size!4573 (buf!5078 thiss!1204))))))

(declare-fun b!206814 () Bool)

(assert (=> b!206814 (= e!141382 (not e!141379))))

(declare-fun res!173436 () Bool)

(assert (=> b!206814 (=> res!173436 e!141379)))

(assert (=> b!206814 (= res!173436 (not (= lt!323013 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323015))))))

(assert (=> b!206814 (= lt!323013 (bitIndex!0 (size!4573 (buf!5078 (_2!9500 lt!323010))) (currentByte!9596 (_2!9500 lt!323010)) (currentBit!9591 (_2!9500 lt!323010))))))

(assert (=> b!206814 (= lt!323015 (bitIndex!0 (size!4573 (buf!5078 thiss!1204)) (currentByte!9596 thiss!1204) (currentBit!9591 thiss!1204)))))

(assert (=> b!206814 e!141380))

(declare-fun res!173448 () Bool)

(assert (=> b!206814 (=> (not res!173448) (not e!141380))))

(assert (=> b!206814 (= res!173448 (= (size!4573 (buf!5078 thiss!1204)) (size!4573 (buf!5078 (_2!9500 lt!323010)))))))

(declare-fun appendBit!0 (BitStream!8254 Bool) tuple2!17690)

(assert (=> b!206814 (= lt!323010 (appendBit!0 thiss!1204 lt!323002))))

(assert (=> b!206814 (= lt!323002 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!43620 res!173447) b!206800))

(assert (= (and b!206800 res!173435) b!206813))

(assert (= (and b!206813 res!173441) b!206807))

(assert (= (and b!206807 res!173443) b!206814))

(assert (= (and b!206814 res!173448) b!206806))

(assert (= (and b!206806 res!173449) b!206808))

(assert (= (and b!206808 res!173444) b!206812))

(assert (= (and b!206812 res!173442) b!206803))

(assert (= (and b!206814 (not res!173436)) b!206802))

(assert (= (and b!206802 (not res!173438)) b!206798))

(assert (= (and b!206798 (not res!173440)) b!206799))

(assert (= (and b!206799 (not res!173450)) b!206805))

(assert (= (and b!206805 (not res!173439)) b!206810))

(assert (= (and b!206810 (not res!173437)) b!206801))

(assert (= (and b!206801 res!173445) b!206804))

(assert (= (and b!206801 res!173446) b!206809))

(assert (= start!43620 b!206811))

(declare-fun m!318405 () Bool)

(assert (=> b!206808 m!318405))

(declare-fun m!318407 () Bool)

(assert (=> b!206811 m!318407))

(declare-fun m!318409 () Bool)

(assert (=> b!206800 m!318409))

(declare-fun m!318411 () Bool)

(assert (=> b!206814 m!318411))

(declare-fun m!318413 () Bool)

(assert (=> b!206814 m!318413))

(declare-fun m!318415 () Bool)

(assert (=> b!206814 m!318415))

(declare-fun m!318417 () Bool)

(assert (=> b!206798 m!318417))

(declare-fun m!318419 () Bool)

(assert (=> b!206802 m!318419))

(declare-fun m!318421 () Bool)

(assert (=> b!206802 m!318421))

(declare-fun m!318423 () Bool)

(assert (=> b!206802 m!318423))

(declare-fun m!318425 () Bool)

(assert (=> b!206802 m!318425))

(assert (=> b!206810 m!318405))

(declare-fun m!318427 () Bool)

(assert (=> b!206805 m!318427))

(declare-fun m!318429 () Bool)

(assert (=> b!206803 m!318429))

(declare-fun m!318431 () Bool)

(assert (=> b!206801 m!318431))

(declare-fun m!318433 () Bool)

(assert (=> b!206801 m!318433))

(declare-fun m!318435 () Bool)

(assert (=> b!206801 m!318435))

(declare-fun m!318437 () Bool)

(assert (=> b!206801 m!318437))

(declare-fun m!318439 () Bool)

(assert (=> b!206801 m!318439))

(declare-fun m!318441 () Bool)

(assert (=> b!206801 m!318441))

(declare-fun m!318443 () Bool)

(assert (=> b!206801 m!318443))

(declare-fun m!318445 () Bool)

(assert (=> b!206801 m!318445))

(declare-fun m!318447 () Bool)

(assert (=> b!206801 m!318447))

(declare-fun m!318449 () Bool)

(assert (=> b!206801 m!318449))

(declare-fun m!318451 () Bool)

(assert (=> b!206801 m!318451))

(declare-fun m!318453 () Bool)

(assert (=> b!206801 m!318453))

(declare-fun m!318455 () Bool)

(assert (=> b!206801 m!318455))

(declare-fun m!318457 () Bool)

(assert (=> b!206813 m!318457))

(declare-fun m!318459 () Bool)

(assert (=> b!206812 m!318459))

(assert (=> b!206812 m!318459))

(declare-fun m!318461 () Bool)

(assert (=> b!206812 m!318461))

(declare-fun m!318463 () Bool)

(assert (=> start!43620 m!318463))

(declare-fun m!318465 () Bool)

(assert (=> b!206804 m!318465))

(assert (=> b!206806 m!318411))

(assert (=> b!206806 m!318413))

(push 1)

(assert (not b!206803))

(assert (not b!206802))

(assert (not start!43620))

(assert (not b!206804))

(assert (not b!206798))

(assert (not b!206805))

(assert (not b!206810))

(assert (not b!206812))

(assert (not b!206800))

(assert (not b!206811))

(assert (not b!206814))

(assert (not b!206806))

(assert (not b!206813))

(assert (not b!206808))

(assert (not b!206801))

(check-sat)

(pop 1)

(push 1)

(check-sat)

