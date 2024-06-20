; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41132 () Bool)

(assert start!41132)

(declare-fun e!131612 () Bool)

(declare-fun lt!296557 () (_ BitVec 64))

(declare-datatypes ((array!9917 0))(
  ( (array!9918 (arr!5302 (Array (_ BitVec 32) (_ BitVec 8))) (size!4372 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7852 0))(
  ( (BitStream!7853 (buf!4849 array!9917) (currentByte!9127 (_ BitVec 32)) (currentBit!9122 (_ BitVec 32))) )
))
(declare-fun lt!296535 () BitStream!7852)

(declare-fun lt!296540 () (_ BitVec 64))

(declare-datatypes ((tuple2!16496 0))(
  ( (tuple2!16497 (_1!8893 BitStream!7852) (_2!8893 BitStream!7852)) )
))
(declare-fun lt!296538 () tuple2!16496)

(declare-datatypes ((tuple2!16498 0))(
  ( (tuple2!16499 (_1!8894 BitStream!7852) (_2!8894 (_ BitVec 64))) )
))
(declare-fun lt!296537 () tuple2!16498)

(declare-fun b!190806 () Bool)

(declare-fun lt!296532 () tuple2!16498)

(assert (=> b!190806 (= e!131612 (and (= lt!296540 (bvsub lt!296557 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8893 lt!296538) lt!296535)) (= (_2!8894 lt!296532) (_2!8894 lt!296537)))))))

(declare-fun b!190807 () Bool)

(declare-fun res!159209 () Bool)

(assert (=> b!190807 (=> (not res!159209) (not e!131612))))

(declare-fun lt!296556 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7852 (_ BitVec 64)) BitStream!7852)

(assert (=> b!190807 (= res!159209 (= (_1!8893 lt!296538) (withMovedBitIndex!0 (_2!8893 lt!296538) (bvsub lt!296557 lt!296556))))))

(declare-fun b!190808 () Bool)

(declare-fun res!159213 () Bool)

(declare-fun e!131623 () Bool)

(assert (=> b!190808 (=> (not res!159213) (not e!131623))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!190808 (= res!159213 (not (= i!590 nBits!348)))))

(declare-fun b!190809 () Bool)

(declare-fun e!131616 () Bool)

(declare-fun lt!296539 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!190809 (= e!131616 (= (bvand lt!296539 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190810 () Bool)

(declare-fun e!131621 () Bool)

(declare-datatypes ((tuple2!16500 0))(
  ( (tuple2!16501 (_1!8895 BitStream!7852) (_2!8895 Bool)) )
))
(declare-fun lt!296554 () tuple2!16500)

(declare-fun lt!296558 () tuple2!16500)

(assert (=> b!190810 (= e!131621 (= (_2!8895 lt!296554) (_2!8895 lt!296558)))))

(declare-fun b!190811 () Bool)

(declare-fun e!131620 () Bool)

(assert (=> b!190811 (= e!131620 e!131623)))

(declare-fun res!159207 () Bool)

(assert (=> b!190811 (=> (not res!159207) (not e!131623))))

(declare-fun thiss!1204 () BitStream!7852)

(declare-fun lt!296534 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!190811 (= res!159207 (validate_offset_bits!1 ((_ sign_extend 32) (size!4372 (buf!4849 thiss!1204))) ((_ sign_extend 32) (currentByte!9127 thiss!1204)) ((_ sign_extend 32) (currentBit!9122 thiss!1204)) lt!296534))))

(assert (=> b!190811 (= lt!296534 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!190813 () Bool)

(declare-fun e!131615 () Bool)

(declare-fun e!131613 () Bool)

(assert (=> b!190813 (= e!131615 e!131613)))

(declare-fun res!159193 () Bool)

(assert (=> b!190813 (=> (not res!159193) (not e!131613))))

(declare-fun lt!296551 () tuple2!16500)

(declare-datatypes ((Unit!13582 0))(
  ( (Unit!13583) )
))
(declare-datatypes ((tuple2!16502 0))(
  ( (tuple2!16503 (_1!8896 Unit!13582) (_2!8896 BitStream!7852)) )
))
(declare-fun lt!296559 () tuple2!16502)

(declare-fun lt!296546 () Bool)

(assert (=> b!190813 (= res!159193 (and (= (_2!8895 lt!296551) lt!296546) (= (_1!8895 lt!296551) (_2!8896 lt!296559))))))

(declare-fun readBitPure!0 (BitStream!7852) tuple2!16500)

(declare-fun readerFrom!0 (BitStream!7852 (_ BitVec 32) (_ BitVec 32)) BitStream!7852)

(assert (=> b!190813 (= lt!296551 (readBitPure!0 (readerFrom!0 (_2!8896 lt!296559) (currentBit!9122 thiss!1204) (currentByte!9127 thiss!1204))))))

(declare-fun b!190814 () Bool)

(declare-fun e!131611 () Bool)

(declare-fun e!131617 () Bool)

(assert (=> b!190814 (= e!131611 e!131617)))

(declare-fun res!159192 () Bool)

(assert (=> b!190814 (=> res!159192 e!131617)))

(assert (=> b!190814 (= res!159192 (not (= (_1!8894 lt!296537) (_2!8893 lt!296538))))))

(declare-fun lt!296545 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16498)

(assert (=> b!190814 (= lt!296537 (readNBitsLSBFirstsLoopPure!0 (_1!8893 lt!296538) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296545))))

(declare-fun lt!296552 () tuple2!16502)

(declare-fun lt!296550 () (_ BitVec 64))

(assert (=> b!190814 (validate_offset_bits!1 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!296552)))) ((_ sign_extend 32) (currentByte!9127 (_2!8896 lt!296559))) ((_ sign_extend 32) (currentBit!9122 (_2!8896 lt!296559))) lt!296550)))

(declare-fun lt!296560 () Unit!13582)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7852 array!9917 (_ BitVec 64)) Unit!13582)

(assert (=> b!190814 (= lt!296560 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8896 lt!296559) (buf!4849 (_2!8896 lt!296552)) lt!296550))))

(assert (=> b!190814 (= lt!296550 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!296543 () (_ BitVec 64))

(declare-fun lt!296553 () tuple2!16500)

(assert (=> b!190814 (= lt!296545 (bvor lt!296539 (ite (_2!8895 lt!296553) lt!296543 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!296548 () tuple2!16496)

(assert (=> b!190814 (= lt!296532 (readNBitsLSBFirstsLoopPure!0 (_1!8893 lt!296548) nBits!348 i!590 lt!296539))))

(assert (=> b!190814 (validate_offset_bits!1 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!296552)))) ((_ sign_extend 32) (currentByte!9127 thiss!1204)) ((_ sign_extend 32) (currentBit!9122 thiss!1204)) lt!296534)))

(declare-fun lt!296542 () Unit!13582)

(assert (=> b!190814 (= lt!296542 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4849 (_2!8896 lt!296552)) lt!296534))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!190814 (= lt!296539 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!190814 (= (_2!8895 lt!296553) lt!296546)))

(assert (=> b!190814 (= lt!296553 (readBitPure!0 (_1!8893 lt!296548)))))

(declare-fun reader!0 (BitStream!7852 BitStream!7852) tuple2!16496)

(assert (=> b!190814 (= lt!296538 (reader!0 (_2!8896 lt!296559) (_2!8896 lt!296552)))))

(assert (=> b!190814 (= lt!296548 (reader!0 thiss!1204 (_2!8896 lt!296552)))))

(assert (=> b!190814 e!131621))

(declare-fun res!159210 () Bool)

(assert (=> b!190814 (=> (not res!159210) (not e!131621))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!190814 (= res!159210 (= (bitIndex!0 (size!4372 (buf!4849 (_1!8895 lt!296554))) (currentByte!9127 (_1!8895 lt!296554)) (currentBit!9122 (_1!8895 lt!296554))) (bitIndex!0 (size!4372 (buf!4849 (_1!8895 lt!296558))) (currentByte!9127 (_1!8895 lt!296558)) (currentBit!9122 (_1!8895 lt!296558)))))))

(declare-fun lt!296533 () Unit!13582)

(declare-fun lt!296547 () BitStream!7852)

(declare-fun readBitPrefixLemma!0 (BitStream!7852 BitStream!7852) Unit!13582)

(assert (=> b!190814 (= lt!296533 (readBitPrefixLemma!0 lt!296547 (_2!8896 lt!296552)))))

(assert (=> b!190814 (= lt!296558 (readBitPure!0 (BitStream!7853 (buf!4849 (_2!8896 lt!296552)) (currentByte!9127 thiss!1204) (currentBit!9122 thiss!1204))))))

(assert (=> b!190814 (= lt!296554 (readBitPure!0 lt!296547))))

(declare-fun e!131618 () Bool)

(assert (=> b!190814 e!131618))

(declare-fun res!159191 () Bool)

(assert (=> b!190814 (=> (not res!159191) (not e!131618))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!190814 (= res!159191 (invariant!0 (currentBit!9122 thiss!1204) (currentByte!9127 thiss!1204) (size!4372 (buf!4849 (_2!8896 lt!296559)))))))

(assert (=> b!190814 (= lt!296547 (BitStream!7853 (buf!4849 (_2!8896 lt!296559)) (currentByte!9127 thiss!1204) (currentBit!9122 thiss!1204)))))

(declare-fun b!190815 () Bool)

(assert (=> b!190815 (= e!131618 (invariant!0 (currentBit!9122 thiss!1204) (currentByte!9127 thiss!1204) (size!4372 (buf!4849 (_2!8896 lt!296552)))))))

(declare-fun b!190816 () Bool)

(declare-fun e!131614 () Bool)

(assert (=> b!190816 (= e!131617 e!131614)))

(declare-fun res!159194 () Bool)

(assert (=> b!190816 (=> res!159194 e!131614)))

(assert (=> b!190816 (= res!159194 (not (= (_1!8893 lt!296538) lt!296535)))))

(assert (=> b!190816 e!131612))

(declare-fun res!159203 () Bool)

(assert (=> b!190816 (=> (not res!159203) (not e!131612))))

(declare-fun lt!296549 () tuple2!16498)

(assert (=> b!190816 (= res!159203 (and (= (_2!8894 lt!296532) (_2!8894 lt!296549)) (= (_1!8894 lt!296532) (_1!8894 lt!296549))))))

(declare-fun lt!296536 () Unit!13582)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13582)

(assert (=> b!190816 (= lt!296536 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8893 lt!296548) nBits!348 i!590 lt!296539))))

(assert (=> b!190816 (= lt!296549 (readNBitsLSBFirstsLoopPure!0 lt!296535 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296545))))

(assert (=> b!190816 (= lt!296535 (withMovedBitIndex!0 (_1!8893 lt!296548) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!190817 () Bool)

(declare-fun e!131624 () Bool)

(assert (=> b!190817 (= e!131623 (not e!131624))))

(declare-fun res!159201 () Bool)

(assert (=> b!190817 (=> res!159201 e!131624)))

(assert (=> b!190817 (= res!159201 (not (= lt!296557 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!296540))))))

(assert (=> b!190817 (= lt!296557 (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296559))) (currentByte!9127 (_2!8896 lt!296559)) (currentBit!9122 (_2!8896 lt!296559))))))

(assert (=> b!190817 (= lt!296540 (bitIndex!0 (size!4372 (buf!4849 thiss!1204)) (currentByte!9127 thiss!1204) (currentBit!9122 thiss!1204)))))

(declare-fun e!131610 () Bool)

(assert (=> b!190817 e!131610))

(declare-fun res!159212 () Bool)

(assert (=> b!190817 (=> (not res!159212) (not e!131610))))

(assert (=> b!190817 (= res!159212 (= (size!4372 (buf!4849 thiss!1204)) (size!4372 (buf!4849 (_2!8896 lt!296559)))))))

(declare-fun appendBit!0 (BitStream!7852 Bool) tuple2!16502)

(assert (=> b!190817 (= lt!296559 (appendBit!0 thiss!1204 lt!296546))))

(assert (=> b!190817 (= lt!296546 (not (= (bvand v!189 lt!296543) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190817 (= lt!296543 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!190818 () Bool)

(declare-fun res!159196 () Bool)

(assert (=> b!190818 (=> res!159196 e!131611)))

(assert (=> b!190818 (= res!159196 (or (not (= (size!4372 (buf!4849 (_2!8896 lt!296552))) (size!4372 (buf!4849 thiss!1204)))) (not (= lt!296556 (bvsub (bvadd lt!296540 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!190819 () Bool)

(declare-fun res!159204 () Bool)

(assert (=> b!190819 (=> (not res!159204) (not e!131612))))

(assert (=> b!190819 (= res!159204 (= (_1!8893 lt!296548) (withMovedBitIndex!0 (_2!8893 lt!296548) (bvsub lt!296540 lt!296556))))))

(declare-fun b!190820 () Bool)

(declare-fun res!159200 () Bool)

(assert (=> b!190820 (=> (not res!159200) (not e!131623))))

(assert (=> b!190820 (= res!159200 (invariant!0 (currentBit!9122 thiss!1204) (currentByte!9127 thiss!1204) (size!4372 (buf!4849 thiss!1204))))))

(declare-fun b!190821 () Bool)

(assert (=> b!190821 (= e!131614 e!131616)))

(declare-fun res!159195 () Bool)

(assert (=> b!190821 (=> res!159195 e!131616)))

(assert (=> b!190821 (= res!159195 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4372 (buf!4849 (_1!8893 lt!296548)))) ((_ sign_extend 32) (currentByte!9127 (_1!8893 lt!296548))) ((_ sign_extend 32) (currentBit!9122 (_1!8893 lt!296548))) lt!296534)))))

(assert (=> b!190821 (= (size!4372 (buf!4849 thiss!1204)) (size!4372 (buf!4849 (_2!8896 lt!296552))))))

(declare-fun b!190822 () Bool)

(declare-fun e!131619 () Bool)

(declare-fun array_inv!4113 (array!9917) Bool)

(assert (=> b!190822 (= e!131619 (array_inv!4113 (buf!4849 thiss!1204)))))

(declare-fun b!190823 () Bool)

(assert (=> b!190823 (= e!131610 e!131615)))

(declare-fun res!159199 () Bool)

(assert (=> b!190823 (=> (not res!159199) (not e!131615))))

(declare-fun lt!296544 () (_ BitVec 64))

(declare-fun lt!296541 () (_ BitVec 64))

(assert (=> b!190823 (= res!159199 (= lt!296544 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!296541)))))

(assert (=> b!190823 (= lt!296544 (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296559))) (currentByte!9127 (_2!8896 lt!296559)) (currentBit!9122 (_2!8896 lt!296559))))))

(assert (=> b!190823 (= lt!296541 (bitIndex!0 (size!4372 (buf!4849 thiss!1204)) (currentByte!9127 thiss!1204) (currentBit!9122 thiss!1204)))))

(declare-fun b!190824 () Bool)

(declare-fun res!159208 () Bool)

(assert (=> b!190824 (=> res!159208 e!131611)))

(declare-fun isPrefixOf!0 (BitStream!7852 BitStream!7852) Bool)

(assert (=> b!190824 (= res!159208 (not (isPrefixOf!0 thiss!1204 (_2!8896 lt!296559))))))

(declare-fun b!190825 () Bool)

(assert (=> b!190825 (= e!131613 (= (bitIndex!0 (size!4372 (buf!4849 (_1!8895 lt!296551))) (currentByte!9127 (_1!8895 lt!296551)) (currentBit!9122 (_1!8895 lt!296551))) lt!296544))))

(declare-fun b!190812 () Bool)

(declare-fun res!159198 () Bool)

(assert (=> b!190812 (=> (not res!159198) (not e!131615))))

(assert (=> b!190812 (= res!159198 (isPrefixOf!0 thiss!1204 (_2!8896 lt!296559)))))

(declare-fun res!159197 () Bool)

(assert (=> start!41132 (=> (not res!159197) (not e!131620))))

(assert (=> start!41132 (= res!159197 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41132 e!131620))

(assert (=> start!41132 true))

(declare-fun inv!12 (BitStream!7852) Bool)

(assert (=> start!41132 (and (inv!12 thiss!1204) e!131619)))

(declare-fun b!190826 () Bool)

(declare-fun res!159202 () Bool)

(assert (=> b!190826 (=> res!159202 e!131614)))

(assert (=> b!190826 (= res!159202 (not (= (bitIndex!0 (size!4372 (buf!4849 (_1!8894 lt!296532))) (currentByte!9127 (_1!8894 lt!296532)) (currentBit!9122 (_1!8894 lt!296532))) (bitIndex!0 (size!4372 (buf!4849 (_2!8893 lt!296548))) (currentByte!9127 (_2!8893 lt!296548)) (currentBit!9122 (_2!8893 lt!296548))))))))

(declare-fun b!190827 () Bool)

(declare-fun res!159206 () Bool)

(assert (=> b!190827 (=> res!159206 e!131611)))

(assert (=> b!190827 (= res!159206 (not (invariant!0 (currentBit!9122 (_2!8896 lt!296552)) (currentByte!9127 (_2!8896 lt!296552)) (size!4372 (buf!4849 (_2!8896 lt!296552))))))))

(declare-fun b!190828 () Bool)

(assert (=> b!190828 (= e!131624 e!131611)))

(declare-fun res!159211 () Bool)

(assert (=> b!190828 (=> res!159211 e!131611)))

(assert (=> b!190828 (= res!159211 (not (= lt!296556 (bvsub (bvsub (bvadd lt!296557 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!190828 (= lt!296556 (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296552))) (currentByte!9127 (_2!8896 lt!296552)) (currentBit!9122 (_2!8896 lt!296552))))))

(assert (=> b!190828 (isPrefixOf!0 thiss!1204 (_2!8896 lt!296552))))

(declare-fun lt!296555 () Unit!13582)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7852 BitStream!7852 BitStream!7852) Unit!13582)

(assert (=> b!190828 (= lt!296555 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8896 lt!296559) (_2!8896 lt!296552)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7852 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16502)

(assert (=> b!190828 (= lt!296552 (appendBitsLSBFirstLoopTR!0 (_2!8896 lt!296559) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!190829 () Bool)

(declare-fun res!159205 () Bool)

(assert (=> b!190829 (=> res!159205 e!131611)))

(assert (=> b!190829 (= res!159205 (not (isPrefixOf!0 (_2!8896 lt!296559) (_2!8896 lt!296552))))))

(assert (= (and start!41132 res!159197) b!190811))

(assert (= (and b!190811 res!159207) b!190820))

(assert (= (and b!190820 res!159200) b!190808))

(assert (= (and b!190808 res!159213) b!190817))

(assert (= (and b!190817 res!159212) b!190823))

(assert (= (and b!190823 res!159199) b!190812))

(assert (= (and b!190812 res!159198) b!190813))

(assert (= (and b!190813 res!159193) b!190825))

(assert (= (and b!190817 (not res!159201)) b!190828))

(assert (= (and b!190828 (not res!159211)) b!190827))

(assert (= (and b!190827 (not res!159206)) b!190818))

(assert (= (and b!190818 (not res!159196)) b!190829))

(assert (= (and b!190829 (not res!159205)) b!190824))

(assert (= (and b!190824 (not res!159208)) b!190814))

(assert (= (and b!190814 res!159191) b!190815))

(assert (= (and b!190814 res!159210) b!190810))

(assert (= (and b!190814 (not res!159192)) b!190816))

(assert (= (and b!190816 res!159203) b!190819))

(assert (= (and b!190819 res!159204) b!190807))

(assert (= (and b!190807 res!159209) b!190806))

(assert (= (and b!190816 (not res!159194)) b!190826))

(assert (= (and b!190826 (not res!159202)) b!190821))

(assert (= (and b!190821 (not res!159195)) b!190809))

(assert (= start!41132 b!190822))

(declare-fun m!296399 () Bool)

(assert (=> b!190809 m!296399))

(declare-fun m!296401 () Bool)

(assert (=> b!190826 m!296401))

(declare-fun m!296403 () Bool)

(assert (=> b!190826 m!296403))

(declare-fun m!296405 () Bool)

(assert (=> b!190815 m!296405))

(declare-fun m!296407 () Bool)

(assert (=> b!190821 m!296407))

(declare-fun m!296409 () Bool)

(assert (=> b!190817 m!296409))

(declare-fun m!296411 () Bool)

(assert (=> b!190817 m!296411))

(declare-fun m!296413 () Bool)

(assert (=> b!190817 m!296413))

(declare-fun m!296415 () Bool)

(assert (=> b!190828 m!296415))

(declare-fun m!296417 () Bool)

(assert (=> b!190828 m!296417))

(declare-fun m!296419 () Bool)

(assert (=> b!190828 m!296419))

(declare-fun m!296421 () Bool)

(assert (=> b!190828 m!296421))

(assert (=> b!190823 m!296409))

(assert (=> b!190823 m!296411))

(declare-fun m!296423 () Bool)

(assert (=> b!190829 m!296423))

(declare-fun m!296425 () Bool)

(assert (=> b!190812 m!296425))

(declare-fun m!296427 () Bool)

(assert (=> b!190814 m!296427))

(declare-fun m!296429 () Bool)

(assert (=> b!190814 m!296429))

(declare-fun m!296431 () Bool)

(assert (=> b!190814 m!296431))

(declare-fun m!296433 () Bool)

(assert (=> b!190814 m!296433))

(declare-fun m!296435 () Bool)

(assert (=> b!190814 m!296435))

(declare-fun m!296437 () Bool)

(assert (=> b!190814 m!296437))

(declare-fun m!296439 () Bool)

(assert (=> b!190814 m!296439))

(declare-fun m!296441 () Bool)

(assert (=> b!190814 m!296441))

(declare-fun m!296443 () Bool)

(assert (=> b!190814 m!296443))

(declare-fun m!296445 () Bool)

(assert (=> b!190814 m!296445))

(declare-fun m!296447 () Bool)

(assert (=> b!190814 m!296447))

(declare-fun m!296449 () Bool)

(assert (=> b!190814 m!296449))

(declare-fun m!296451 () Bool)

(assert (=> b!190814 m!296451))

(declare-fun m!296453 () Bool)

(assert (=> b!190814 m!296453))

(declare-fun m!296455 () Bool)

(assert (=> b!190814 m!296455))

(declare-fun m!296457 () Bool)

(assert (=> b!190814 m!296457))

(declare-fun m!296459 () Bool)

(assert (=> b!190820 m!296459))

(declare-fun m!296461 () Bool)

(assert (=> b!190813 m!296461))

(assert (=> b!190813 m!296461))

(declare-fun m!296463 () Bool)

(assert (=> b!190813 m!296463))

(assert (=> b!190824 m!296425))

(declare-fun m!296465 () Bool)

(assert (=> b!190819 m!296465))

(declare-fun m!296467 () Bool)

(assert (=> b!190827 m!296467))

(declare-fun m!296469 () Bool)

(assert (=> b!190822 m!296469))

(declare-fun m!296471 () Bool)

(assert (=> b!190807 m!296471))

(declare-fun m!296473 () Bool)

(assert (=> start!41132 m!296473))

(declare-fun m!296475 () Bool)

(assert (=> b!190816 m!296475))

(declare-fun m!296477 () Bool)

(assert (=> b!190816 m!296477))

(declare-fun m!296479 () Bool)

(assert (=> b!190816 m!296479))

(declare-fun m!296481 () Bool)

(assert (=> b!190811 m!296481))

(declare-fun m!296483 () Bool)

(assert (=> b!190825 m!296483))

(push 1)

(assert (not b!190817))

(assert (not b!190823))

(assert (not b!190827))

(assert (not b!190821))

(assert (not b!190813))

(assert (not b!190825))

(assert (not b!190824))

(assert (not start!41132))

(assert (not b!190822))

(assert (not b!190829))

(assert (not b!190809))

(assert (not b!190816))

(assert (not b!190814))

(assert (not b!190820))

(assert (not b!190828))

(assert (not b!190819))

(assert (not b!190812))

(assert (not b!190807))

(assert (not b!190811))

(assert (not b!190826))

(assert (not b!190815))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65477 () Bool)

(declare-fun e!131757 () Bool)

(assert (=> d!65477 e!131757))

(declare-fun res!159419 () Bool)

(assert (=> d!65477 (=> (not res!159419) (not e!131757))))

(declare-fun lt!296946 () (_ BitVec 64))

(declare-fun lt!296948 () (_ BitVec 64))

(declare-fun lt!296947 () (_ BitVec 64))

(assert (=> d!65477 (= res!159419 (= lt!296946 (bvsub lt!296947 lt!296948)))))

(assert (=> d!65477 (or (= (bvand lt!296947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296948 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!296947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296947 lt!296948) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!65477 (= lt!296948 (remainingBits!0 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!296559)))) ((_ sign_extend 32) (currentByte!9127 (_2!8896 lt!296559))) ((_ sign_extend 32) (currentBit!9122 (_2!8896 lt!296559)))))))

(declare-fun lt!296943 () (_ BitVec 64))

(declare-fun lt!296944 () (_ BitVec 64))

(assert (=> d!65477 (= lt!296947 (bvmul lt!296943 lt!296944))))

(assert (=> d!65477 (or (= lt!296943 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!296944 (bvsdiv (bvmul lt!296943 lt!296944) lt!296943)))))

(assert (=> d!65477 (= lt!296944 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65477 (= lt!296943 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!296559)))))))

(assert (=> d!65477 (= lt!296946 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9127 (_2!8896 lt!296559))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9122 (_2!8896 lt!296559)))))))

(assert (=> d!65477 (invariant!0 (currentBit!9122 (_2!8896 lt!296559)) (currentByte!9127 (_2!8896 lt!296559)) (size!4372 (buf!4849 (_2!8896 lt!296559))))))

(assert (=> d!65477 (= (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296559))) (currentByte!9127 (_2!8896 lt!296559)) (currentBit!9122 (_2!8896 lt!296559))) lt!296946)))

(declare-fun b!191049 () Bool)

(declare-fun res!159420 () Bool)

(assert (=> b!191049 (=> (not res!159420) (not e!131757))))

(assert (=> b!191049 (= res!159420 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!296946))))

(declare-fun b!191050 () Bool)

(declare-fun lt!296945 () (_ BitVec 64))

(assert (=> b!191050 (= e!131757 (bvsle lt!296946 (bvmul lt!296945 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191050 (or (= lt!296945 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!296945 #b0000000000000000000000000000000000000000000000000000000000001000) lt!296945)))))

(assert (=> b!191050 (= lt!296945 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!296559)))))))

(assert (= (and d!65477 res!159419) b!191049))

(assert (= (and b!191049 res!159420) b!191050))

(declare-fun m!296803 () Bool)

(assert (=> d!65477 m!296803))

(declare-fun m!296805 () Bool)

(assert (=> d!65477 m!296805))

(assert (=> b!190823 d!65477))

(declare-fun d!65479 () Bool)

(declare-fun e!131758 () Bool)

(assert (=> d!65479 e!131758))

(declare-fun res!159421 () Bool)

(assert (=> d!65479 (=> (not res!159421) (not e!131758))))

(declare-fun lt!296953 () (_ BitVec 64))

(declare-fun lt!296952 () (_ BitVec 64))

(declare-fun lt!296954 () (_ BitVec 64))

(assert (=> d!65479 (= res!159421 (= lt!296952 (bvsub lt!296953 lt!296954)))))

(assert (=> d!65479 (or (= (bvand lt!296953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296954 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!296953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296953 lt!296954) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65479 (= lt!296954 (remainingBits!0 ((_ sign_extend 32) (size!4372 (buf!4849 thiss!1204))) ((_ sign_extend 32) (currentByte!9127 thiss!1204)) ((_ sign_extend 32) (currentBit!9122 thiss!1204))))))

(declare-fun lt!296949 () (_ BitVec 64))

(declare-fun lt!296950 () (_ BitVec 64))

(assert (=> d!65479 (= lt!296953 (bvmul lt!296949 lt!296950))))

(assert (=> d!65479 (or (= lt!296949 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!296950 (bvsdiv (bvmul lt!296949 lt!296950) lt!296949)))))

(assert (=> d!65479 (= lt!296950 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65479 (= lt!296949 ((_ sign_extend 32) (size!4372 (buf!4849 thiss!1204))))))

(assert (=> d!65479 (= lt!296952 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9127 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9122 thiss!1204))))))

(assert (=> d!65479 (invariant!0 (currentBit!9122 thiss!1204) (currentByte!9127 thiss!1204) (size!4372 (buf!4849 thiss!1204)))))

(assert (=> d!65479 (= (bitIndex!0 (size!4372 (buf!4849 thiss!1204)) (currentByte!9127 thiss!1204) (currentBit!9122 thiss!1204)) lt!296952)))

(declare-fun b!191051 () Bool)

(declare-fun res!159422 () Bool)

(assert (=> b!191051 (=> (not res!159422) (not e!131758))))

(assert (=> b!191051 (= res!159422 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!296952))))

(declare-fun b!191052 () Bool)

(declare-fun lt!296951 () (_ BitVec 64))

(assert (=> b!191052 (= e!131758 (bvsle lt!296952 (bvmul lt!296951 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191052 (or (= lt!296951 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!296951 #b0000000000000000000000000000000000000000000000000000000000001000) lt!296951)))))

(assert (=> b!191052 (= lt!296951 ((_ sign_extend 32) (size!4372 (buf!4849 thiss!1204))))))

(assert (= (and d!65479 res!159421) b!191051))

(assert (= (and b!191051 res!159422) b!191052))

(declare-fun m!296807 () Bool)

(assert (=> d!65479 m!296807))

(assert (=> d!65479 m!296459))

(assert (=> b!190823 d!65479))

(declare-fun d!65481 () Bool)

(declare-fun res!159429 () Bool)

(declare-fun e!131763 () Bool)

(assert (=> d!65481 (=> (not res!159429) (not e!131763))))

(assert (=> d!65481 (= res!159429 (= (size!4372 (buf!4849 thiss!1204)) (size!4372 (buf!4849 (_2!8896 lt!296559)))))))

(assert (=> d!65481 (= (isPrefixOf!0 thiss!1204 (_2!8896 lt!296559)) e!131763)))

(declare-fun b!191059 () Bool)

(declare-fun res!159430 () Bool)

(assert (=> b!191059 (=> (not res!159430) (not e!131763))))

(assert (=> b!191059 (= res!159430 (bvsle (bitIndex!0 (size!4372 (buf!4849 thiss!1204)) (currentByte!9127 thiss!1204) (currentBit!9122 thiss!1204)) (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296559))) (currentByte!9127 (_2!8896 lt!296559)) (currentBit!9122 (_2!8896 lt!296559)))))))

(declare-fun b!191060 () Bool)

(declare-fun e!131764 () Bool)

(assert (=> b!191060 (= e!131763 e!131764)))

(declare-fun res!159431 () Bool)

(assert (=> b!191060 (=> res!159431 e!131764)))

(assert (=> b!191060 (= res!159431 (= (size!4372 (buf!4849 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!191061 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9917 array!9917 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!191061 (= e!131764 (arrayBitRangesEq!0 (buf!4849 thiss!1204) (buf!4849 (_2!8896 lt!296559)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4372 (buf!4849 thiss!1204)) (currentByte!9127 thiss!1204) (currentBit!9122 thiss!1204))))))

(assert (= (and d!65481 res!159429) b!191059))

(assert (= (and b!191059 res!159430) b!191060))

(assert (= (and b!191060 (not res!159431)) b!191061))

(assert (=> b!191059 m!296411))

(assert (=> b!191059 m!296409))

(assert (=> b!191061 m!296411))

(assert (=> b!191061 m!296411))

(declare-fun m!296809 () Bool)

(assert (=> b!191061 m!296809))

(assert (=> b!190812 d!65481))

(declare-fun d!65483 () Bool)

(assert (=> d!65483 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9122 thiss!1204) (currentByte!9127 thiss!1204) (size!4372 (buf!4849 thiss!1204))))))

(declare-fun bs!16274 () Bool)

(assert (= bs!16274 d!65483))

(assert (=> bs!16274 m!296459))

(assert (=> start!41132 d!65483))

(declare-fun d!65485 () Bool)

(declare-datatypes ((tuple2!16528 0))(
  ( (tuple2!16529 (_1!8909 Bool) (_2!8909 BitStream!7852)) )
))
(declare-fun lt!296957 () tuple2!16528)

(declare-fun readBit!0 (BitStream!7852) tuple2!16528)

(assert (=> d!65485 (= lt!296957 (readBit!0 (readerFrom!0 (_2!8896 lt!296559) (currentBit!9122 thiss!1204) (currentByte!9127 thiss!1204))))))

(assert (=> d!65485 (= (readBitPure!0 (readerFrom!0 (_2!8896 lt!296559) (currentBit!9122 thiss!1204) (currentByte!9127 thiss!1204))) (tuple2!16501 (_2!8909 lt!296957) (_1!8909 lt!296957)))))

(declare-fun bs!16275 () Bool)

(assert (= bs!16275 d!65485))

(assert (=> bs!16275 m!296461))

(declare-fun m!296811 () Bool)

(assert (=> bs!16275 m!296811))

(assert (=> b!190813 d!65485))

(declare-fun d!65487 () Bool)

(declare-fun e!131767 () Bool)

(assert (=> d!65487 e!131767))

(declare-fun res!159435 () Bool)

(assert (=> d!65487 (=> (not res!159435) (not e!131767))))

(assert (=> d!65487 (= res!159435 (invariant!0 (currentBit!9122 (_2!8896 lt!296559)) (currentByte!9127 (_2!8896 lt!296559)) (size!4372 (buf!4849 (_2!8896 lt!296559)))))))

(assert (=> d!65487 (= (readerFrom!0 (_2!8896 lt!296559) (currentBit!9122 thiss!1204) (currentByte!9127 thiss!1204)) (BitStream!7853 (buf!4849 (_2!8896 lt!296559)) (currentByte!9127 thiss!1204) (currentBit!9122 thiss!1204)))))

(declare-fun b!191064 () Bool)

(assert (=> b!191064 (= e!131767 (invariant!0 (currentBit!9122 thiss!1204) (currentByte!9127 thiss!1204) (size!4372 (buf!4849 (_2!8896 lt!296559)))))))

(assert (= (and d!65487 res!159435) b!191064))

(assert (=> d!65487 m!296805))

(assert (=> b!191064 m!296447))

(assert (=> b!190813 d!65487))

(assert (=> b!190824 d!65481))

(declare-fun d!65489 () Bool)

(declare-fun e!131768 () Bool)

(assert (=> d!65489 e!131768))

(declare-fun res!159436 () Bool)

(assert (=> d!65489 (=> (not res!159436) (not e!131768))))

(declare-fun lt!296961 () (_ BitVec 64))

(declare-fun lt!296963 () (_ BitVec 64))

(declare-fun lt!296962 () (_ BitVec 64))

(assert (=> d!65489 (= res!159436 (= lt!296961 (bvsub lt!296962 lt!296963)))))

(assert (=> d!65489 (or (= (bvand lt!296962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296963 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!296962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296962 lt!296963) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65489 (= lt!296963 (remainingBits!0 ((_ sign_extend 32) (size!4372 (buf!4849 (_1!8895 lt!296551)))) ((_ sign_extend 32) (currentByte!9127 (_1!8895 lt!296551))) ((_ sign_extend 32) (currentBit!9122 (_1!8895 lt!296551)))))))

(declare-fun lt!296958 () (_ BitVec 64))

(declare-fun lt!296959 () (_ BitVec 64))

(assert (=> d!65489 (= lt!296962 (bvmul lt!296958 lt!296959))))

(assert (=> d!65489 (or (= lt!296958 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!296959 (bvsdiv (bvmul lt!296958 lt!296959) lt!296958)))))

(assert (=> d!65489 (= lt!296959 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65489 (= lt!296958 ((_ sign_extend 32) (size!4372 (buf!4849 (_1!8895 lt!296551)))))))

(assert (=> d!65489 (= lt!296961 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9127 (_1!8895 lt!296551))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9122 (_1!8895 lt!296551)))))))

(assert (=> d!65489 (invariant!0 (currentBit!9122 (_1!8895 lt!296551)) (currentByte!9127 (_1!8895 lt!296551)) (size!4372 (buf!4849 (_1!8895 lt!296551))))))

(assert (=> d!65489 (= (bitIndex!0 (size!4372 (buf!4849 (_1!8895 lt!296551))) (currentByte!9127 (_1!8895 lt!296551)) (currentBit!9122 (_1!8895 lt!296551))) lt!296961)))

(declare-fun b!191065 () Bool)

(declare-fun res!159437 () Bool)

(assert (=> b!191065 (=> (not res!159437) (not e!131768))))

(assert (=> b!191065 (= res!159437 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!296961))))

(declare-fun b!191066 () Bool)

(declare-fun lt!296960 () (_ BitVec 64))

(assert (=> b!191066 (= e!131768 (bvsle lt!296961 (bvmul lt!296960 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191066 (or (= lt!296960 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!296960 #b0000000000000000000000000000000000000000000000000000000000001000) lt!296960)))))

(assert (=> b!191066 (= lt!296960 ((_ sign_extend 32) (size!4372 (buf!4849 (_1!8895 lt!296551)))))))

(assert (= (and d!65489 res!159436) b!191065))

(assert (= (and b!191065 res!159437) b!191066))

(declare-fun m!296813 () Bool)

(assert (=> d!65489 m!296813))

(declare-fun m!296815 () Bool)

(assert (=> d!65489 m!296815))

(assert (=> b!190825 d!65489))

(declare-fun d!65491 () Bool)

(declare-fun lt!296964 () tuple2!16528)

(assert (=> d!65491 (= lt!296964 (readBit!0 (_1!8893 lt!296548)))))

(assert (=> d!65491 (= (readBitPure!0 (_1!8893 lt!296548)) (tuple2!16501 (_2!8909 lt!296964) (_1!8909 lt!296964)))))

(declare-fun bs!16276 () Bool)

(assert (= bs!16276 d!65491))

(declare-fun m!296817 () Bool)

(assert (=> bs!16276 m!296817))

(assert (=> b!190814 d!65491))

(declare-datatypes ((tuple2!16530 0))(
  ( (tuple2!16531 (_1!8910 (_ BitVec 64)) (_2!8910 BitStream!7852)) )
))
(declare-fun lt!296967 () tuple2!16530)

(declare-fun d!65493 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16530)

(assert (=> d!65493 (= lt!296967 (readNBitsLSBFirstsLoop!0 (_1!8893 lt!296538) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296545))))

(assert (=> d!65493 (= (readNBitsLSBFirstsLoopPure!0 (_1!8893 lt!296538) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296545) (tuple2!16499 (_2!8910 lt!296967) (_1!8910 lt!296967)))))

(declare-fun bs!16277 () Bool)

(assert (= bs!16277 d!65493))

(declare-fun m!296819 () Bool)

(assert (=> bs!16277 m!296819))

(assert (=> b!190814 d!65493))

(declare-fun d!65495 () Bool)

(assert (=> d!65495 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!296552)))) ((_ sign_extend 32) (currentByte!9127 thiss!1204)) ((_ sign_extend 32) (currentBit!9122 thiss!1204)) lt!296534) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!296552)))) ((_ sign_extend 32) (currentByte!9127 thiss!1204)) ((_ sign_extend 32) (currentBit!9122 thiss!1204))) lt!296534))))

(declare-fun bs!16278 () Bool)

(assert (= bs!16278 d!65495))

(declare-fun m!296821 () Bool)

(assert (=> bs!16278 m!296821))

(assert (=> b!190814 d!65495))

(declare-fun d!65497 () Bool)

(declare-fun e!131769 () Bool)

(assert (=> d!65497 e!131769))

(declare-fun res!159438 () Bool)

(assert (=> d!65497 (=> (not res!159438) (not e!131769))))

(declare-fun lt!296971 () (_ BitVec 64))

(declare-fun lt!296973 () (_ BitVec 64))

(declare-fun lt!296972 () (_ BitVec 64))

(assert (=> d!65497 (= res!159438 (= lt!296971 (bvsub lt!296972 lt!296973)))))

(assert (=> d!65497 (or (= (bvand lt!296972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296973 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!296972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296972 lt!296973) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65497 (= lt!296973 (remainingBits!0 ((_ sign_extend 32) (size!4372 (buf!4849 (_1!8895 lt!296558)))) ((_ sign_extend 32) (currentByte!9127 (_1!8895 lt!296558))) ((_ sign_extend 32) (currentBit!9122 (_1!8895 lt!296558)))))))

(declare-fun lt!296968 () (_ BitVec 64))

(declare-fun lt!296969 () (_ BitVec 64))

(assert (=> d!65497 (= lt!296972 (bvmul lt!296968 lt!296969))))

(assert (=> d!65497 (or (= lt!296968 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!296969 (bvsdiv (bvmul lt!296968 lt!296969) lt!296968)))))

(assert (=> d!65497 (= lt!296969 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65497 (= lt!296968 ((_ sign_extend 32) (size!4372 (buf!4849 (_1!8895 lt!296558)))))))

(assert (=> d!65497 (= lt!296971 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9127 (_1!8895 lt!296558))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9122 (_1!8895 lt!296558)))))))

(assert (=> d!65497 (invariant!0 (currentBit!9122 (_1!8895 lt!296558)) (currentByte!9127 (_1!8895 lt!296558)) (size!4372 (buf!4849 (_1!8895 lt!296558))))))

(assert (=> d!65497 (= (bitIndex!0 (size!4372 (buf!4849 (_1!8895 lt!296558))) (currentByte!9127 (_1!8895 lt!296558)) (currentBit!9122 (_1!8895 lt!296558))) lt!296971)))

(declare-fun b!191067 () Bool)

(declare-fun res!159439 () Bool)

(assert (=> b!191067 (=> (not res!159439) (not e!131769))))

(assert (=> b!191067 (= res!159439 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!296971))))

(declare-fun b!191068 () Bool)

(declare-fun lt!296970 () (_ BitVec 64))

(assert (=> b!191068 (= e!131769 (bvsle lt!296971 (bvmul lt!296970 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191068 (or (= lt!296970 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!296970 #b0000000000000000000000000000000000000000000000000000000000001000) lt!296970)))))

(assert (=> b!191068 (= lt!296970 ((_ sign_extend 32) (size!4372 (buf!4849 (_1!8895 lt!296558)))))))

(assert (= (and d!65497 res!159438) b!191067))

(assert (= (and b!191067 res!159439) b!191068))

(declare-fun m!296823 () Bool)

(assert (=> d!65497 m!296823))

(declare-fun m!296825 () Bool)

(assert (=> d!65497 m!296825))

(assert (=> b!190814 d!65497))

(declare-fun d!65499 () Bool)

(declare-fun lt!296974 () tuple2!16528)

(assert (=> d!65499 (= lt!296974 (readBit!0 lt!296547))))

(assert (=> d!65499 (= (readBitPure!0 lt!296547) (tuple2!16501 (_2!8909 lt!296974) (_1!8909 lt!296974)))))

(declare-fun bs!16279 () Bool)

(assert (= bs!16279 d!65499))

(declare-fun m!296827 () Bool)

(assert (=> bs!16279 m!296827))

(assert (=> b!190814 d!65499))

(declare-fun d!65501 () Bool)

(declare-fun e!131770 () Bool)

(assert (=> d!65501 e!131770))

(declare-fun res!159440 () Bool)

(assert (=> d!65501 (=> (not res!159440) (not e!131770))))

(declare-fun lt!296979 () (_ BitVec 64))

(declare-fun lt!296980 () (_ BitVec 64))

(declare-fun lt!296978 () (_ BitVec 64))

(assert (=> d!65501 (= res!159440 (= lt!296978 (bvsub lt!296979 lt!296980)))))

(assert (=> d!65501 (or (= (bvand lt!296979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296980 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!296979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296979 lt!296980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65501 (= lt!296980 (remainingBits!0 ((_ sign_extend 32) (size!4372 (buf!4849 (_1!8895 lt!296554)))) ((_ sign_extend 32) (currentByte!9127 (_1!8895 lt!296554))) ((_ sign_extend 32) (currentBit!9122 (_1!8895 lt!296554)))))))

(declare-fun lt!296975 () (_ BitVec 64))

(declare-fun lt!296976 () (_ BitVec 64))

(assert (=> d!65501 (= lt!296979 (bvmul lt!296975 lt!296976))))

(assert (=> d!65501 (or (= lt!296975 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!296976 (bvsdiv (bvmul lt!296975 lt!296976) lt!296975)))))

(assert (=> d!65501 (= lt!296976 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65501 (= lt!296975 ((_ sign_extend 32) (size!4372 (buf!4849 (_1!8895 lt!296554)))))))

(assert (=> d!65501 (= lt!296978 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9127 (_1!8895 lt!296554))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9122 (_1!8895 lt!296554)))))))

(assert (=> d!65501 (invariant!0 (currentBit!9122 (_1!8895 lt!296554)) (currentByte!9127 (_1!8895 lt!296554)) (size!4372 (buf!4849 (_1!8895 lt!296554))))))

(assert (=> d!65501 (= (bitIndex!0 (size!4372 (buf!4849 (_1!8895 lt!296554))) (currentByte!9127 (_1!8895 lt!296554)) (currentBit!9122 (_1!8895 lt!296554))) lt!296978)))

(declare-fun b!191069 () Bool)

(declare-fun res!159441 () Bool)

(assert (=> b!191069 (=> (not res!159441) (not e!131770))))

(assert (=> b!191069 (= res!159441 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!296978))))

(declare-fun b!191070 () Bool)

(declare-fun lt!296977 () (_ BitVec 64))

(assert (=> b!191070 (= e!131770 (bvsle lt!296978 (bvmul lt!296977 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191070 (or (= lt!296977 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!296977 #b0000000000000000000000000000000000000000000000000000000000001000) lt!296977)))))

(assert (=> b!191070 (= lt!296977 ((_ sign_extend 32) (size!4372 (buf!4849 (_1!8895 lt!296554)))))))

(assert (= (and d!65501 res!159440) b!191069))

(assert (= (and b!191069 res!159441) b!191070))

(declare-fun m!296829 () Bool)

(assert (=> d!65501 m!296829))

(declare-fun m!296831 () Bool)

(assert (=> d!65501 m!296831))

(assert (=> b!190814 d!65501))

(declare-fun lt!297022 () tuple2!16496)

(declare-fun b!191081 () Bool)

(declare-fun lt!297039 () (_ BitVec 64))

(declare-fun e!131776 () Bool)

(declare-fun lt!297036 () (_ BitVec 64))

(assert (=> b!191081 (= e!131776 (= (_1!8893 lt!297022) (withMovedBitIndex!0 (_2!8893 lt!297022) (bvsub lt!297036 lt!297039))))))

(assert (=> b!191081 (or (= (bvand lt!297036 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297039 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297036 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297036 lt!297039) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191081 (= lt!297039 (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296552))) (currentByte!9127 (_2!8896 lt!296552)) (currentBit!9122 (_2!8896 lt!296552))))))

(assert (=> b!191081 (= lt!297036 (bitIndex!0 (size!4372 (buf!4849 thiss!1204)) (currentByte!9127 thiss!1204) (currentBit!9122 thiss!1204)))))

(declare-fun b!191082 () Bool)

(declare-fun e!131775 () Unit!13582)

(declare-fun lt!297029 () Unit!13582)

(assert (=> b!191082 (= e!131775 lt!297029)))

(declare-fun lt!297028 () (_ BitVec 64))

(assert (=> b!191082 (= lt!297028 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!297038 () (_ BitVec 64))

(assert (=> b!191082 (= lt!297038 (bitIndex!0 (size!4372 (buf!4849 thiss!1204)) (currentByte!9127 thiss!1204) (currentBit!9122 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9917 array!9917 (_ BitVec 64) (_ BitVec 64)) Unit!13582)

(assert (=> b!191082 (= lt!297029 (arrayBitRangesEqSymmetric!0 (buf!4849 thiss!1204) (buf!4849 (_2!8896 lt!296552)) lt!297028 lt!297038))))

(assert (=> b!191082 (arrayBitRangesEq!0 (buf!4849 (_2!8896 lt!296552)) (buf!4849 thiss!1204) lt!297028 lt!297038)))

(declare-fun b!191083 () Bool)

(declare-fun res!159448 () Bool)

(assert (=> b!191083 (=> (not res!159448) (not e!131776))))

(assert (=> b!191083 (= res!159448 (isPrefixOf!0 (_2!8893 lt!297022) (_2!8896 lt!296552)))))

(declare-fun d!65503 () Bool)

(assert (=> d!65503 e!131776))

(declare-fun res!159450 () Bool)

(assert (=> d!65503 (=> (not res!159450) (not e!131776))))

(assert (=> d!65503 (= res!159450 (isPrefixOf!0 (_1!8893 lt!297022) (_2!8893 lt!297022)))))

(declare-fun lt!297024 () BitStream!7852)

(assert (=> d!65503 (= lt!297022 (tuple2!16497 lt!297024 (_2!8896 lt!296552)))))

(declare-fun lt!297033 () Unit!13582)

(declare-fun lt!297025 () Unit!13582)

(assert (=> d!65503 (= lt!297033 lt!297025)))

(assert (=> d!65503 (isPrefixOf!0 lt!297024 (_2!8896 lt!296552))))

(assert (=> d!65503 (= lt!297025 (lemmaIsPrefixTransitive!0 lt!297024 (_2!8896 lt!296552) (_2!8896 lt!296552)))))

(declare-fun lt!297034 () Unit!13582)

(declare-fun lt!297021 () Unit!13582)

(assert (=> d!65503 (= lt!297034 lt!297021)))

(assert (=> d!65503 (isPrefixOf!0 lt!297024 (_2!8896 lt!296552))))

(assert (=> d!65503 (= lt!297021 (lemmaIsPrefixTransitive!0 lt!297024 thiss!1204 (_2!8896 lt!296552)))))

(declare-fun lt!297026 () Unit!13582)

(assert (=> d!65503 (= lt!297026 e!131775)))

(declare-fun c!9656 () Bool)

(assert (=> d!65503 (= c!9656 (not (= (size!4372 (buf!4849 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!297040 () Unit!13582)

(declare-fun lt!297031 () Unit!13582)

(assert (=> d!65503 (= lt!297040 lt!297031)))

(assert (=> d!65503 (isPrefixOf!0 (_2!8896 lt!296552) (_2!8896 lt!296552))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7852) Unit!13582)

(assert (=> d!65503 (= lt!297031 (lemmaIsPrefixRefl!0 (_2!8896 lt!296552)))))

(declare-fun lt!297027 () Unit!13582)

(declare-fun lt!297030 () Unit!13582)

(assert (=> d!65503 (= lt!297027 lt!297030)))

(assert (=> d!65503 (= lt!297030 (lemmaIsPrefixRefl!0 (_2!8896 lt!296552)))))

(declare-fun lt!297023 () Unit!13582)

(declare-fun lt!297037 () Unit!13582)

(assert (=> d!65503 (= lt!297023 lt!297037)))

(assert (=> d!65503 (isPrefixOf!0 lt!297024 lt!297024)))

(assert (=> d!65503 (= lt!297037 (lemmaIsPrefixRefl!0 lt!297024))))

(declare-fun lt!297035 () Unit!13582)

(declare-fun lt!297032 () Unit!13582)

(assert (=> d!65503 (= lt!297035 lt!297032)))

(assert (=> d!65503 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!65503 (= lt!297032 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!65503 (= lt!297024 (BitStream!7853 (buf!4849 (_2!8896 lt!296552)) (currentByte!9127 thiss!1204) (currentBit!9122 thiss!1204)))))

(assert (=> d!65503 (isPrefixOf!0 thiss!1204 (_2!8896 lt!296552))))

(assert (=> d!65503 (= (reader!0 thiss!1204 (_2!8896 lt!296552)) lt!297022)))

(declare-fun b!191084 () Bool)

(declare-fun res!159449 () Bool)

(assert (=> b!191084 (=> (not res!159449) (not e!131776))))

(assert (=> b!191084 (= res!159449 (isPrefixOf!0 (_1!8893 lt!297022) thiss!1204))))

(declare-fun b!191085 () Bool)

(declare-fun Unit!13601 () Unit!13582)

(assert (=> b!191085 (= e!131775 Unit!13601)))

(assert (= (and d!65503 c!9656) b!191082))

(assert (= (and d!65503 (not c!9656)) b!191085))

(assert (= (and d!65503 res!159450) b!191084))

(assert (= (and b!191084 res!159449) b!191083))

(assert (= (and b!191083 res!159448) b!191081))

(declare-fun m!296833 () Bool)

(assert (=> b!191081 m!296833))

(assert (=> b!191081 m!296415))

(assert (=> b!191081 m!296411))

(declare-fun m!296835 () Bool)

(assert (=> b!191084 m!296835))

(assert (=> b!191082 m!296411))

(declare-fun m!296837 () Bool)

(assert (=> b!191082 m!296837))

(declare-fun m!296839 () Bool)

(assert (=> b!191082 m!296839))

(declare-fun m!296841 () Bool)

(assert (=> d!65503 m!296841))

(declare-fun m!296843 () Bool)

(assert (=> d!65503 m!296843))

(assert (=> d!65503 m!296417))

(declare-fun m!296845 () Bool)

(assert (=> d!65503 m!296845))

(declare-fun m!296847 () Bool)

(assert (=> d!65503 m!296847))

(declare-fun m!296849 () Bool)

(assert (=> d!65503 m!296849))

(declare-fun m!296851 () Bool)

(assert (=> d!65503 m!296851))

(declare-fun m!296853 () Bool)

(assert (=> d!65503 m!296853))

(declare-fun m!296855 () Bool)

(assert (=> d!65503 m!296855))

(declare-fun m!296857 () Bool)

(assert (=> d!65503 m!296857))

(declare-fun m!296859 () Bool)

(assert (=> d!65503 m!296859))

(declare-fun m!296861 () Bool)

(assert (=> b!191083 m!296861))

(assert (=> b!190814 d!65503))

(declare-fun d!65507 () Bool)

(assert (=> d!65507 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!296552)))) ((_ sign_extend 32) (currentByte!9127 (_2!8896 lt!296559))) ((_ sign_extend 32) (currentBit!9122 (_2!8896 lt!296559))) lt!296550) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!296552)))) ((_ sign_extend 32) (currentByte!9127 (_2!8896 lt!296559))) ((_ sign_extend 32) (currentBit!9122 (_2!8896 lt!296559)))) lt!296550))))

(declare-fun bs!16280 () Bool)

(assert (= bs!16280 d!65507))

(declare-fun m!296863 () Bool)

(assert (=> bs!16280 m!296863))

(assert (=> b!190814 d!65507))

(declare-fun d!65509 () Bool)

(declare-fun lt!297041 () tuple2!16530)

(assert (=> d!65509 (= lt!297041 (readNBitsLSBFirstsLoop!0 (_1!8893 lt!296548) nBits!348 i!590 lt!296539))))

(assert (=> d!65509 (= (readNBitsLSBFirstsLoopPure!0 (_1!8893 lt!296548) nBits!348 i!590 lt!296539) (tuple2!16499 (_2!8910 lt!297041) (_1!8910 lt!297041)))))

(declare-fun bs!16281 () Bool)

(assert (= bs!16281 d!65509))

(declare-fun m!296865 () Bool)

(assert (=> bs!16281 m!296865))

(assert (=> b!190814 d!65509))

(declare-fun d!65511 () Bool)

(declare-fun lt!297042 () tuple2!16528)

(assert (=> d!65511 (= lt!297042 (readBit!0 (BitStream!7853 (buf!4849 (_2!8896 lt!296552)) (currentByte!9127 thiss!1204) (currentBit!9122 thiss!1204))))))

(assert (=> d!65511 (= (readBitPure!0 (BitStream!7853 (buf!4849 (_2!8896 lt!296552)) (currentByte!9127 thiss!1204) (currentBit!9122 thiss!1204))) (tuple2!16501 (_2!8909 lt!297042) (_1!8909 lt!297042)))))

(declare-fun bs!16282 () Bool)

(assert (= bs!16282 d!65511))

(declare-fun m!296867 () Bool)

(assert (=> bs!16282 m!296867))

(assert (=> b!190814 d!65511))

(declare-fun e!131778 () Bool)

(declare-fun b!191086 () Bool)

(declare-fun lt!297058 () (_ BitVec 64))

(declare-fun lt!297061 () (_ BitVec 64))

(declare-fun lt!297044 () tuple2!16496)

(assert (=> b!191086 (= e!131778 (= (_1!8893 lt!297044) (withMovedBitIndex!0 (_2!8893 lt!297044) (bvsub lt!297058 lt!297061))))))

(assert (=> b!191086 (or (= (bvand lt!297058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297061 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297058 lt!297061) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191086 (= lt!297061 (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296552))) (currentByte!9127 (_2!8896 lt!296552)) (currentBit!9122 (_2!8896 lt!296552))))))

(assert (=> b!191086 (= lt!297058 (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296559))) (currentByte!9127 (_2!8896 lt!296559)) (currentBit!9122 (_2!8896 lt!296559))))))

(declare-fun b!191087 () Bool)

(declare-fun e!131777 () Unit!13582)

(declare-fun lt!297051 () Unit!13582)

(assert (=> b!191087 (= e!131777 lt!297051)))

(declare-fun lt!297050 () (_ BitVec 64))

(assert (=> b!191087 (= lt!297050 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!297060 () (_ BitVec 64))

(assert (=> b!191087 (= lt!297060 (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296559))) (currentByte!9127 (_2!8896 lt!296559)) (currentBit!9122 (_2!8896 lt!296559))))))

(assert (=> b!191087 (= lt!297051 (arrayBitRangesEqSymmetric!0 (buf!4849 (_2!8896 lt!296559)) (buf!4849 (_2!8896 lt!296552)) lt!297050 lt!297060))))

(assert (=> b!191087 (arrayBitRangesEq!0 (buf!4849 (_2!8896 lt!296552)) (buf!4849 (_2!8896 lt!296559)) lt!297050 lt!297060)))

(declare-fun b!191088 () Bool)

(declare-fun res!159451 () Bool)

(assert (=> b!191088 (=> (not res!159451) (not e!131778))))

(assert (=> b!191088 (= res!159451 (isPrefixOf!0 (_2!8893 lt!297044) (_2!8896 lt!296552)))))

(declare-fun d!65513 () Bool)

(assert (=> d!65513 e!131778))

(declare-fun res!159453 () Bool)

(assert (=> d!65513 (=> (not res!159453) (not e!131778))))

(assert (=> d!65513 (= res!159453 (isPrefixOf!0 (_1!8893 lt!297044) (_2!8893 lt!297044)))))

(declare-fun lt!297046 () BitStream!7852)

(assert (=> d!65513 (= lt!297044 (tuple2!16497 lt!297046 (_2!8896 lt!296552)))))

(declare-fun lt!297055 () Unit!13582)

(declare-fun lt!297047 () Unit!13582)

(assert (=> d!65513 (= lt!297055 lt!297047)))

(assert (=> d!65513 (isPrefixOf!0 lt!297046 (_2!8896 lt!296552))))

(assert (=> d!65513 (= lt!297047 (lemmaIsPrefixTransitive!0 lt!297046 (_2!8896 lt!296552) (_2!8896 lt!296552)))))

(declare-fun lt!297056 () Unit!13582)

(declare-fun lt!297043 () Unit!13582)

(assert (=> d!65513 (= lt!297056 lt!297043)))

(assert (=> d!65513 (isPrefixOf!0 lt!297046 (_2!8896 lt!296552))))

(assert (=> d!65513 (= lt!297043 (lemmaIsPrefixTransitive!0 lt!297046 (_2!8896 lt!296559) (_2!8896 lt!296552)))))

(declare-fun lt!297048 () Unit!13582)

(assert (=> d!65513 (= lt!297048 e!131777)))

(declare-fun c!9657 () Bool)

(assert (=> d!65513 (= c!9657 (not (= (size!4372 (buf!4849 (_2!8896 lt!296559))) #b00000000000000000000000000000000)))))

(declare-fun lt!297062 () Unit!13582)

(declare-fun lt!297053 () Unit!13582)

(assert (=> d!65513 (= lt!297062 lt!297053)))

(assert (=> d!65513 (isPrefixOf!0 (_2!8896 lt!296552) (_2!8896 lt!296552))))

(assert (=> d!65513 (= lt!297053 (lemmaIsPrefixRefl!0 (_2!8896 lt!296552)))))

(declare-fun lt!297049 () Unit!13582)

(declare-fun lt!297052 () Unit!13582)

(assert (=> d!65513 (= lt!297049 lt!297052)))

(assert (=> d!65513 (= lt!297052 (lemmaIsPrefixRefl!0 (_2!8896 lt!296552)))))

(declare-fun lt!297045 () Unit!13582)

(declare-fun lt!297059 () Unit!13582)

(assert (=> d!65513 (= lt!297045 lt!297059)))

(assert (=> d!65513 (isPrefixOf!0 lt!297046 lt!297046)))

(assert (=> d!65513 (= lt!297059 (lemmaIsPrefixRefl!0 lt!297046))))

(declare-fun lt!297057 () Unit!13582)

(declare-fun lt!297054 () Unit!13582)

(assert (=> d!65513 (= lt!297057 lt!297054)))

(assert (=> d!65513 (isPrefixOf!0 (_2!8896 lt!296559) (_2!8896 lt!296559))))

(assert (=> d!65513 (= lt!297054 (lemmaIsPrefixRefl!0 (_2!8896 lt!296559)))))

(assert (=> d!65513 (= lt!297046 (BitStream!7853 (buf!4849 (_2!8896 lt!296552)) (currentByte!9127 (_2!8896 lt!296559)) (currentBit!9122 (_2!8896 lt!296559))))))

(assert (=> d!65513 (isPrefixOf!0 (_2!8896 lt!296559) (_2!8896 lt!296552))))

(assert (=> d!65513 (= (reader!0 (_2!8896 lt!296559) (_2!8896 lt!296552)) lt!297044)))

(declare-fun b!191089 () Bool)

(declare-fun res!159452 () Bool)

(assert (=> b!191089 (=> (not res!159452) (not e!131778))))

(assert (=> b!191089 (= res!159452 (isPrefixOf!0 (_1!8893 lt!297044) (_2!8896 lt!296559)))))

(declare-fun b!191090 () Bool)

(declare-fun Unit!13603 () Unit!13582)

(assert (=> b!191090 (= e!131777 Unit!13603)))

(assert (= (and d!65513 c!9657) b!191087))

(assert (= (and d!65513 (not c!9657)) b!191090))

(assert (= (and d!65513 res!159453) b!191089))

(assert (= (and b!191089 res!159452) b!191088))

(assert (= (and b!191088 res!159451) b!191086))

(declare-fun m!296869 () Bool)

(assert (=> b!191086 m!296869))

(assert (=> b!191086 m!296415))

(assert (=> b!191086 m!296409))

(declare-fun m!296871 () Bool)

(assert (=> b!191089 m!296871))

(assert (=> b!191087 m!296409))

(declare-fun m!296873 () Bool)

(assert (=> b!191087 m!296873))

(declare-fun m!296875 () Bool)

(assert (=> b!191087 m!296875))

(declare-fun m!296877 () Bool)

(assert (=> d!65513 m!296877))

(declare-fun m!296879 () Bool)

(assert (=> d!65513 m!296879))

(assert (=> d!65513 m!296423))

(assert (=> d!65513 m!296845))

(declare-fun m!296881 () Bool)

(assert (=> d!65513 m!296881))

(declare-fun m!296883 () Bool)

(assert (=> d!65513 m!296883))

(assert (=> d!65513 m!296851))

(declare-fun m!296885 () Bool)

(assert (=> d!65513 m!296885))

(declare-fun m!296887 () Bool)

(assert (=> d!65513 m!296887))

(declare-fun m!296889 () Bool)

(assert (=> d!65513 m!296889))

(declare-fun m!296891 () Bool)

(assert (=> d!65513 m!296891))

(declare-fun m!296893 () Bool)

(assert (=> b!191088 m!296893))

(assert (=> b!190814 d!65513))

(declare-fun d!65515 () Bool)

(declare-fun e!131787 () Bool)

(assert (=> d!65515 e!131787))

(declare-fun res!159465 () Bool)

(assert (=> d!65515 (=> (not res!159465) (not e!131787))))

(declare-fun lt!297073 () tuple2!16500)

(declare-fun lt!297072 () tuple2!16500)

(assert (=> d!65515 (= res!159465 (= (bitIndex!0 (size!4372 (buf!4849 (_1!8895 lt!297073))) (currentByte!9127 (_1!8895 lt!297073)) (currentBit!9122 (_1!8895 lt!297073))) (bitIndex!0 (size!4372 (buf!4849 (_1!8895 lt!297072))) (currentByte!9127 (_1!8895 lt!297072)) (currentBit!9122 (_1!8895 lt!297072)))))))

(declare-fun lt!297071 () Unit!13582)

(declare-fun lt!297074 () BitStream!7852)

(declare-fun choose!50 (BitStream!7852 BitStream!7852 BitStream!7852 tuple2!16500 tuple2!16500 BitStream!7852 Bool tuple2!16500 tuple2!16500 BitStream!7852 Bool) Unit!13582)

(assert (=> d!65515 (= lt!297071 (choose!50 lt!296547 (_2!8896 lt!296552) lt!297074 lt!297073 (tuple2!16501 (_1!8895 lt!297073) (_2!8895 lt!297073)) (_1!8895 lt!297073) (_2!8895 lt!297073) lt!297072 (tuple2!16501 (_1!8895 lt!297072) (_2!8895 lt!297072)) (_1!8895 lt!297072) (_2!8895 lt!297072)))))

(assert (=> d!65515 (= lt!297072 (readBitPure!0 lt!297074))))

(assert (=> d!65515 (= lt!297073 (readBitPure!0 lt!296547))))

(assert (=> d!65515 (= lt!297074 (BitStream!7853 (buf!4849 (_2!8896 lt!296552)) (currentByte!9127 lt!296547) (currentBit!9122 lt!296547)))))

(assert (=> d!65515 (invariant!0 (currentBit!9122 lt!296547) (currentByte!9127 lt!296547) (size!4372 (buf!4849 (_2!8896 lt!296552))))))

(assert (=> d!65515 (= (readBitPrefixLemma!0 lt!296547 (_2!8896 lt!296552)) lt!297071)))

(declare-fun b!191102 () Bool)

(assert (=> b!191102 (= e!131787 (= (_2!8895 lt!297073) (_2!8895 lt!297072)))))

(assert (= (and d!65515 res!159465) b!191102))

(declare-fun m!296897 () Bool)

(assert (=> d!65515 m!296897))

(declare-fun m!296899 () Bool)

(assert (=> d!65515 m!296899))

(assert (=> d!65515 m!296443))

(declare-fun m!296901 () Bool)

(assert (=> d!65515 m!296901))

(declare-fun m!296903 () Bool)

(assert (=> d!65515 m!296903))

(declare-fun m!296905 () Bool)

(assert (=> d!65515 m!296905))

(assert (=> b!190814 d!65515))

(declare-fun d!65519 () Bool)

(assert (=> d!65519 (validate_offset_bits!1 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!296552)))) ((_ sign_extend 32) (currentByte!9127 (_2!8896 lt!296559))) ((_ sign_extend 32) (currentBit!9122 (_2!8896 lt!296559))) lt!296550)))

(declare-fun lt!297095 () Unit!13582)

(declare-fun choose!9 (BitStream!7852 array!9917 (_ BitVec 64) BitStream!7852) Unit!13582)

(assert (=> d!65519 (= lt!297095 (choose!9 (_2!8896 lt!296559) (buf!4849 (_2!8896 lt!296552)) lt!296550 (BitStream!7853 (buf!4849 (_2!8896 lt!296552)) (currentByte!9127 (_2!8896 lt!296559)) (currentBit!9122 (_2!8896 lt!296559)))))))

(assert (=> d!65519 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8896 lt!296559) (buf!4849 (_2!8896 lt!296552)) lt!296550) lt!297095)))

(declare-fun bs!16285 () Bool)

(assert (= bs!16285 d!65519))

(assert (=> bs!16285 m!296427))

(declare-fun m!296911 () Bool)

(assert (=> bs!16285 m!296911))

(assert (=> b!190814 d!65519))

(declare-fun d!65523 () Bool)

(assert (=> d!65523 (= (invariant!0 (currentBit!9122 thiss!1204) (currentByte!9127 thiss!1204) (size!4372 (buf!4849 (_2!8896 lt!296559)))) (and (bvsge (currentBit!9122 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9122 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9127 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9127 thiss!1204) (size!4372 (buf!4849 (_2!8896 lt!296559)))) (and (= (currentBit!9122 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9127 thiss!1204) (size!4372 (buf!4849 (_2!8896 lt!296559))))))))))

(assert (=> b!190814 d!65523))

(declare-fun d!65525 () Bool)

(assert (=> d!65525 (validate_offset_bits!1 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!296552)))) ((_ sign_extend 32) (currentByte!9127 thiss!1204)) ((_ sign_extend 32) (currentBit!9122 thiss!1204)) lt!296534)))

(declare-fun lt!297096 () Unit!13582)

(assert (=> d!65525 (= lt!297096 (choose!9 thiss!1204 (buf!4849 (_2!8896 lt!296552)) lt!296534 (BitStream!7853 (buf!4849 (_2!8896 lt!296552)) (currentByte!9127 thiss!1204) (currentBit!9122 thiss!1204))))))

(assert (=> d!65525 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4849 (_2!8896 lt!296552)) lt!296534) lt!297096)))

(declare-fun bs!16286 () Bool)

(assert (= bs!16286 d!65525))

(assert (=> bs!16286 m!296439))

(declare-fun m!296913 () Bool)

(assert (=> bs!16286 m!296913))

(assert (=> b!190814 d!65525))

(declare-fun d!65527 () Bool)

(assert (=> d!65527 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!190814 d!65527))

(declare-fun d!65529 () Bool)

(assert (=> d!65529 (= (invariant!0 (currentBit!9122 thiss!1204) (currentByte!9127 thiss!1204) (size!4372 (buf!4849 thiss!1204))) (and (bvsge (currentBit!9122 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9122 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9127 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9127 thiss!1204) (size!4372 (buf!4849 thiss!1204))) (and (= (currentBit!9122 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9127 thiss!1204) (size!4372 (buf!4849 thiss!1204)))))))))

(assert (=> b!190820 d!65529))

(declare-fun d!65531 () Bool)

(assert (=> d!65531 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4372 (buf!4849 (_1!8893 lt!296548)))) ((_ sign_extend 32) (currentByte!9127 (_1!8893 lt!296548))) ((_ sign_extend 32) (currentBit!9122 (_1!8893 lt!296548))) lt!296534) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4372 (buf!4849 (_1!8893 lt!296548)))) ((_ sign_extend 32) (currentByte!9127 (_1!8893 lt!296548))) ((_ sign_extend 32) (currentBit!9122 (_1!8893 lt!296548)))) lt!296534))))

(declare-fun bs!16288 () Bool)

(assert (= bs!16288 d!65531))

(declare-fun m!296917 () Bool)

(assert (=> bs!16288 m!296917))

(assert (=> b!190821 d!65531))

(declare-fun d!65535 () Bool)

(assert (=> d!65535 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4372 (buf!4849 thiss!1204))) ((_ sign_extend 32) (currentByte!9127 thiss!1204)) ((_ sign_extend 32) (currentBit!9122 thiss!1204)) lt!296534) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4372 (buf!4849 thiss!1204))) ((_ sign_extend 32) (currentByte!9127 thiss!1204)) ((_ sign_extend 32) (currentBit!9122 thiss!1204))) lt!296534))))

(declare-fun bs!16289 () Bool)

(assert (= bs!16289 d!65535))

(assert (=> bs!16289 m!296807))

(assert (=> b!190811 d!65535))

(declare-fun d!65537 () Bool)

(assert (=> d!65537 (= (array_inv!4113 (buf!4849 thiss!1204)) (bvsge (size!4372 (buf!4849 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!190822 d!65537))

(declare-fun d!65539 () Bool)

(declare-fun e!131793 () Bool)

(assert (=> d!65539 e!131793))

(declare-fun res!159471 () Bool)

(assert (=> d!65539 (=> (not res!159471) (not e!131793))))

(declare-fun lt!297110 () BitStream!7852)

(declare-fun lt!297111 () (_ BitVec 64))

(assert (=> d!65539 (= res!159471 (= (bvadd lt!297111 (bvsub lt!296557 lt!296556)) (bitIndex!0 (size!4372 (buf!4849 lt!297110)) (currentByte!9127 lt!297110) (currentBit!9122 lt!297110))))))

(assert (=> d!65539 (or (not (= (bvand lt!297111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296557 lt!296556) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!297111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!297111 (bvsub lt!296557 lt!296556)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65539 (= lt!297111 (bitIndex!0 (size!4372 (buf!4849 (_2!8893 lt!296538))) (currentByte!9127 (_2!8893 lt!296538)) (currentBit!9122 (_2!8893 lt!296538))))))

(declare-fun moveBitIndex!0 (BitStream!7852 (_ BitVec 64)) tuple2!16502)

(assert (=> d!65539 (= lt!297110 (_2!8896 (moveBitIndex!0 (_2!8893 lt!296538) (bvsub lt!296557 lt!296556))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7852 (_ BitVec 64)) Bool)

(assert (=> d!65539 (moveBitIndexPrecond!0 (_2!8893 lt!296538) (bvsub lt!296557 lt!296556))))

(assert (=> d!65539 (= (withMovedBitIndex!0 (_2!8893 lt!296538) (bvsub lt!296557 lt!296556)) lt!297110)))

(declare-fun b!191108 () Bool)

(assert (=> b!191108 (= e!131793 (= (size!4372 (buf!4849 (_2!8893 lt!296538))) (size!4372 (buf!4849 lt!297110))))))

(assert (= (and d!65539 res!159471) b!191108))

(declare-fun m!296927 () Bool)

(assert (=> d!65539 m!296927))

(declare-fun m!296929 () Bool)

(assert (=> d!65539 m!296929))

(declare-fun m!296931 () Bool)

(assert (=> d!65539 m!296931))

(declare-fun m!296933 () Bool)

(assert (=> d!65539 m!296933))

(assert (=> b!190807 d!65539))

(declare-fun d!65543 () Bool)

(declare-fun e!131794 () Bool)

(assert (=> d!65543 e!131794))

(declare-fun res!159472 () Bool)

(assert (=> d!65543 (=> (not res!159472) (not e!131794))))

(declare-fun lt!297116 () (_ BitVec 64))

(declare-fun lt!297117 () (_ BitVec 64))

(declare-fun lt!297115 () (_ BitVec 64))

(assert (=> d!65543 (= res!159472 (= lt!297115 (bvsub lt!297116 lt!297117)))))

(assert (=> d!65543 (or (= (bvand lt!297116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297117 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297116 lt!297117) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65543 (= lt!297117 (remainingBits!0 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!296552)))) ((_ sign_extend 32) (currentByte!9127 (_2!8896 lt!296552))) ((_ sign_extend 32) (currentBit!9122 (_2!8896 lt!296552)))))))

(declare-fun lt!297112 () (_ BitVec 64))

(declare-fun lt!297113 () (_ BitVec 64))

(assert (=> d!65543 (= lt!297116 (bvmul lt!297112 lt!297113))))

(assert (=> d!65543 (or (= lt!297112 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!297113 (bvsdiv (bvmul lt!297112 lt!297113) lt!297112)))))

(assert (=> d!65543 (= lt!297113 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65543 (= lt!297112 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!296552)))))))

(assert (=> d!65543 (= lt!297115 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9127 (_2!8896 lt!296552))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9122 (_2!8896 lt!296552)))))))

(assert (=> d!65543 (invariant!0 (currentBit!9122 (_2!8896 lt!296552)) (currentByte!9127 (_2!8896 lt!296552)) (size!4372 (buf!4849 (_2!8896 lt!296552))))))

(assert (=> d!65543 (= (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296552))) (currentByte!9127 (_2!8896 lt!296552)) (currentBit!9122 (_2!8896 lt!296552))) lt!297115)))

(declare-fun b!191109 () Bool)

(declare-fun res!159473 () Bool)

(assert (=> b!191109 (=> (not res!159473) (not e!131794))))

(assert (=> b!191109 (= res!159473 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!297115))))

(declare-fun b!191110 () Bool)

(declare-fun lt!297114 () (_ BitVec 64))

(assert (=> b!191110 (= e!131794 (bvsle lt!297115 (bvmul lt!297114 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191110 (or (= lt!297114 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!297114 #b0000000000000000000000000000000000000000000000000000000000001000) lt!297114)))))

(assert (=> b!191110 (= lt!297114 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!296552)))))))

(assert (= (and d!65543 res!159472) b!191109))

(assert (= (and b!191109 res!159473) b!191110))

(declare-fun m!296935 () Bool)

(assert (=> d!65543 m!296935))

(assert (=> d!65543 m!296467))

(assert (=> b!190828 d!65543))

(declare-fun d!65545 () Bool)

(declare-fun res!159474 () Bool)

(declare-fun e!131795 () Bool)

(assert (=> d!65545 (=> (not res!159474) (not e!131795))))

(assert (=> d!65545 (= res!159474 (= (size!4372 (buf!4849 thiss!1204)) (size!4372 (buf!4849 (_2!8896 lt!296552)))))))

(assert (=> d!65545 (= (isPrefixOf!0 thiss!1204 (_2!8896 lt!296552)) e!131795)))

(declare-fun b!191111 () Bool)

(declare-fun res!159475 () Bool)

(assert (=> b!191111 (=> (not res!159475) (not e!131795))))

(assert (=> b!191111 (= res!159475 (bvsle (bitIndex!0 (size!4372 (buf!4849 thiss!1204)) (currentByte!9127 thiss!1204) (currentBit!9122 thiss!1204)) (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296552))) (currentByte!9127 (_2!8896 lt!296552)) (currentBit!9122 (_2!8896 lt!296552)))))))

(declare-fun b!191112 () Bool)

(declare-fun e!131796 () Bool)

(assert (=> b!191112 (= e!131795 e!131796)))

(declare-fun res!159476 () Bool)

(assert (=> b!191112 (=> res!159476 e!131796)))

(assert (=> b!191112 (= res!159476 (= (size!4372 (buf!4849 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!191113 () Bool)

(assert (=> b!191113 (= e!131796 (arrayBitRangesEq!0 (buf!4849 thiss!1204) (buf!4849 (_2!8896 lt!296552)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4372 (buf!4849 thiss!1204)) (currentByte!9127 thiss!1204) (currentBit!9122 thiss!1204))))))

(assert (= (and d!65545 res!159474) b!191111))

(assert (= (and b!191111 res!159475) b!191112))

(assert (= (and b!191112 (not res!159476)) b!191113))

(assert (=> b!191111 m!296411))

(assert (=> b!191111 m!296415))

(assert (=> b!191113 m!296411))

(assert (=> b!191113 m!296411))

(declare-fun m!296937 () Bool)

(assert (=> b!191113 m!296937))

(assert (=> b!190828 d!65545))

(declare-fun d!65547 () Bool)

(assert (=> d!65547 (isPrefixOf!0 thiss!1204 (_2!8896 lt!296552))))

(declare-fun lt!297120 () Unit!13582)

(declare-fun choose!30 (BitStream!7852 BitStream!7852 BitStream!7852) Unit!13582)

(assert (=> d!65547 (= lt!297120 (choose!30 thiss!1204 (_2!8896 lt!296559) (_2!8896 lt!296552)))))

(assert (=> d!65547 (isPrefixOf!0 thiss!1204 (_2!8896 lt!296559))))

(assert (=> d!65547 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8896 lt!296559) (_2!8896 lt!296552)) lt!297120)))

(declare-fun bs!16290 () Bool)

(assert (= bs!16290 d!65547))

(assert (=> bs!16290 m!296417))

(declare-fun m!296939 () Bool)

(assert (=> bs!16290 m!296939))

(assert (=> bs!16290 m!296425))

(assert (=> b!190828 d!65547))

(declare-fun c!9678 () Bool)

(declare-fun call!3047 () Bool)

(declare-fun lt!297778 () tuple2!16502)

(declare-fun bm!3044 () Bool)

(assert (=> bm!3044 (= call!3047 (isPrefixOf!0 (_2!8896 lt!296559) (ite c!9678 (_2!8896 lt!296559) (_2!8896 lt!297778))))))

(declare-fun b!191304 () Bool)

(declare-fun e!131904 () (_ BitVec 64))

(assert (=> b!191304 (= e!131904 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!191305 () Bool)

(declare-fun e!131906 () tuple2!16502)

(declare-fun Unit!13613 () Unit!13582)

(assert (=> b!191305 (= e!131906 (tuple2!16503 Unit!13613 (_2!8896 lt!296559)))))

(declare-fun lt!297758 () Unit!13582)

(assert (=> b!191305 (= lt!297758 (lemmaIsPrefixRefl!0 (_2!8896 lt!296559)))))

(assert (=> b!191305 call!3047))

(declare-fun lt!297794 () Unit!13582)

(assert (=> b!191305 (= lt!297794 lt!297758)))

(declare-fun b!191306 () Bool)

(assert (=> b!191306 (= e!131904 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!191307 () Bool)

(declare-fun lt!297801 () tuple2!16500)

(assert (=> b!191307 (= lt!297801 (readBitPure!0 (readerFrom!0 (_2!8896 lt!297778) (currentBit!9122 (_2!8896 lt!296559)) (currentByte!9127 (_2!8896 lt!296559)))))))

(declare-fun lt!297798 () Bool)

(declare-fun res!159634 () Bool)

(assert (=> b!191307 (= res!159634 (and (= (_2!8895 lt!297801) lt!297798) (= (_1!8895 lt!297801) (_2!8896 lt!297778))))))

(declare-fun e!131910 () Bool)

(assert (=> b!191307 (=> (not res!159634) (not e!131910))))

(declare-fun e!131907 () Bool)

(assert (=> b!191307 (= e!131907 e!131910)))

(declare-fun d!65549 () Bool)

(declare-fun e!131909 () Bool)

(assert (=> d!65549 e!131909))

(declare-fun res!159637 () Bool)

(assert (=> d!65549 (=> (not res!159637) (not e!131909))))

(declare-fun lt!297785 () tuple2!16502)

(assert (=> d!65549 (= res!159637 (invariant!0 (currentBit!9122 (_2!8896 lt!297785)) (currentByte!9127 (_2!8896 lt!297785)) (size!4372 (buf!4849 (_2!8896 lt!297785)))))))

(assert (=> d!65549 (= lt!297785 e!131906)))

(assert (=> d!65549 (= c!9678 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!65549 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!65549 (= (appendBitsLSBFirstLoopTR!0 (_2!8896 lt!296559) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!297785)))

(declare-fun b!191308 () Bool)

(declare-fun res!159639 () Bool)

(assert (=> b!191308 (= res!159639 (= (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!297778))) (currentByte!9127 (_2!8896 lt!297778)) (currentBit!9122 (_2!8896 lt!297778))) (bvadd (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296559))) (currentByte!9127 (_2!8896 lt!296559)) (currentBit!9122 (_2!8896 lt!296559))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!191308 (=> (not res!159639) (not e!131907))))

(declare-fun b!191309 () Bool)

(declare-fun e!131905 () Bool)

(declare-fun lt!297768 () tuple2!16498)

(declare-fun lt!297775 () tuple2!16496)

(assert (=> b!191309 (= e!131905 (= (_1!8894 lt!297768) (_2!8893 lt!297775)))))

(declare-fun b!191310 () Bool)

(assert (=> b!191310 (= e!131909 e!131905)))

(declare-fun res!159638 () Bool)

(assert (=> b!191310 (=> (not res!159638) (not e!131905))))

(assert (=> b!191310 (= res!159638 (= (_2!8894 lt!297768) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!191310 (= lt!297768 (readNBitsLSBFirstsLoopPure!0 (_1!8893 lt!297775) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!297761 () Unit!13582)

(declare-fun lt!297786 () Unit!13582)

(assert (=> b!191310 (= lt!297761 lt!297786)))

(declare-fun lt!297757 () (_ BitVec 64))

(assert (=> b!191310 (validate_offset_bits!1 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!297785)))) ((_ sign_extend 32) (currentByte!9127 (_2!8896 lt!296559))) ((_ sign_extend 32) (currentBit!9122 (_2!8896 lt!296559))) lt!297757)))

(assert (=> b!191310 (= lt!297786 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8896 lt!296559) (buf!4849 (_2!8896 lt!297785)) lt!297757))))

(declare-fun e!131911 () Bool)

(assert (=> b!191310 e!131911))

(declare-fun res!159628 () Bool)

(assert (=> b!191310 (=> (not res!159628) (not e!131911))))

(assert (=> b!191310 (= res!159628 (and (= (size!4372 (buf!4849 (_2!8896 lt!296559))) (size!4372 (buf!4849 (_2!8896 lt!297785)))) (bvsge lt!297757 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191310 (= lt!297757 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!191310 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!191310 (= lt!297775 (reader!0 (_2!8896 lt!296559) (_2!8896 lt!297785)))))

(declare-fun b!191311 () Bool)

(declare-fun res!159629 () Bool)

(assert (=> b!191311 (=> (not res!159629) (not e!131909))))

(declare-fun lt!297787 () (_ BitVec 64))

(declare-fun lt!297790 () (_ BitVec 64))

(assert (=> b!191311 (= res!159629 (= (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!297785))) (currentByte!9127 (_2!8896 lt!297785)) (currentBit!9122 (_2!8896 lt!297785))) (bvsub lt!297787 lt!297790)))))

(assert (=> b!191311 (or (= (bvand lt!297787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297790 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297787 lt!297790) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191311 (= lt!297790 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!297796 () (_ BitVec 64))

(declare-fun lt!297756 () (_ BitVec 64))

(assert (=> b!191311 (= lt!297787 (bvadd lt!297796 lt!297756))))

(assert (=> b!191311 (or (not (= (bvand lt!297796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297756 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!297796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!297796 lt!297756) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191311 (= lt!297756 ((_ sign_extend 32) nBits!348))))

(assert (=> b!191311 (= lt!297796 (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296559))) (currentByte!9127 (_2!8896 lt!296559)) (currentBit!9122 (_2!8896 lt!296559))))))

(declare-fun b!191312 () Bool)

(assert (=> b!191312 (= e!131910 (= (bitIndex!0 (size!4372 (buf!4849 (_1!8895 lt!297801))) (currentByte!9127 (_1!8895 lt!297801)) (currentBit!9122 (_1!8895 lt!297801))) (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!297778))) (currentByte!9127 (_2!8896 lt!297778)) (currentBit!9122 (_2!8896 lt!297778)))))))

(declare-fun b!191313 () Bool)

(declare-fun e!131908 () Bool)

(declare-fun lt!297765 () tuple2!16500)

(declare-fun lt!297762 () tuple2!16500)

(assert (=> b!191313 (= e!131908 (= (_2!8895 lt!297765) (_2!8895 lt!297762)))))

(declare-fun b!191314 () Bool)

(declare-fun res!159631 () Bool)

(assert (=> b!191314 (=> (not res!159631) (not e!131909))))

(assert (=> b!191314 (= res!159631 (isPrefixOf!0 (_2!8896 lt!296559) (_2!8896 lt!297785)))))

(declare-fun b!191315 () Bool)

(declare-fun res!159632 () Bool)

(assert (=> b!191315 (= res!159632 call!3047)))

(assert (=> b!191315 (=> (not res!159632) (not e!131907))))

(declare-fun b!191316 () Bool)

(declare-fun e!131912 () Bool)

(declare-fun lt!297800 () tuple2!16498)

(declare-fun lt!297792 () tuple2!16496)

(assert (=> b!191316 (= e!131912 (= (_1!8894 lt!297800) (_2!8893 lt!297792)))))

(declare-fun b!191317 () Bool)

(declare-fun res!159636 () Bool)

(assert (=> b!191317 (=> (not res!159636) (not e!131909))))

(assert (=> b!191317 (= res!159636 (= (size!4372 (buf!4849 (_2!8896 lt!296559))) (size!4372 (buf!4849 (_2!8896 lt!297785)))))))

(declare-fun b!191318 () Bool)

(declare-fun lt!297797 () tuple2!16502)

(assert (=> b!191318 (= e!131906 (tuple2!16503 (_1!8896 lt!297797) (_2!8896 lt!297797)))))

(assert (=> b!191318 (= lt!297798 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191318 (= lt!297778 (appendBit!0 (_2!8896 lt!296559) lt!297798))))

(declare-fun res!159633 () Bool)

(assert (=> b!191318 (= res!159633 (= (size!4372 (buf!4849 (_2!8896 lt!296559))) (size!4372 (buf!4849 (_2!8896 lt!297778)))))))

(assert (=> b!191318 (=> (not res!159633) (not e!131907))))

(assert (=> b!191318 e!131907))

(declare-fun lt!297789 () tuple2!16502)

(assert (=> b!191318 (= lt!297789 lt!297778)))

(assert (=> b!191318 (= lt!297797 (appendBitsLSBFirstLoopTR!0 (_2!8896 lt!297789) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!297805 () Unit!13582)

(assert (=> b!191318 (= lt!297805 (lemmaIsPrefixTransitive!0 (_2!8896 lt!296559) (_2!8896 lt!297789) (_2!8896 lt!297797)))))

(assert (=> b!191318 (isPrefixOf!0 (_2!8896 lt!296559) (_2!8896 lt!297797))))

(declare-fun lt!297777 () Unit!13582)

(assert (=> b!191318 (= lt!297777 lt!297805)))

(assert (=> b!191318 (invariant!0 (currentBit!9122 (_2!8896 lt!296559)) (currentByte!9127 (_2!8896 lt!296559)) (size!4372 (buf!4849 (_2!8896 lt!297789))))))

(declare-fun lt!297766 () BitStream!7852)

(assert (=> b!191318 (= lt!297766 (BitStream!7853 (buf!4849 (_2!8896 lt!297789)) (currentByte!9127 (_2!8896 lt!296559)) (currentBit!9122 (_2!8896 lt!296559))))))

(assert (=> b!191318 (invariant!0 (currentBit!9122 lt!297766) (currentByte!9127 lt!297766) (size!4372 (buf!4849 (_2!8896 lt!297797))))))

(declare-fun lt!297773 () BitStream!7852)

(assert (=> b!191318 (= lt!297773 (BitStream!7853 (buf!4849 (_2!8896 lt!297797)) (currentByte!9127 lt!297766) (currentBit!9122 lt!297766)))))

(assert (=> b!191318 (= lt!297765 (readBitPure!0 lt!297766))))

(assert (=> b!191318 (= lt!297762 (readBitPure!0 lt!297773))))

(declare-fun lt!297806 () Unit!13582)

(assert (=> b!191318 (= lt!297806 (readBitPrefixLemma!0 lt!297766 (_2!8896 lt!297797)))))

(declare-fun res!159635 () Bool)

(assert (=> b!191318 (= res!159635 (= (bitIndex!0 (size!4372 (buf!4849 (_1!8895 lt!297765))) (currentByte!9127 (_1!8895 lt!297765)) (currentBit!9122 (_1!8895 lt!297765))) (bitIndex!0 (size!4372 (buf!4849 (_1!8895 lt!297762))) (currentByte!9127 (_1!8895 lt!297762)) (currentBit!9122 (_1!8895 lt!297762)))))))

(assert (=> b!191318 (=> (not res!159635) (not e!131908))))

(assert (=> b!191318 e!131908))

(declare-fun lt!297763 () Unit!13582)

(assert (=> b!191318 (= lt!297763 lt!297806)))

(declare-fun lt!297769 () tuple2!16496)

(assert (=> b!191318 (= lt!297769 (reader!0 (_2!8896 lt!296559) (_2!8896 lt!297797)))))

(declare-fun lt!297795 () tuple2!16496)

(assert (=> b!191318 (= lt!297795 (reader!0 (_2!8896 lt!297789) (_2!8896 lt!297797)))))

(declare-fun lt!297782 () tuple2!16500)

(assert (=> b!191318 (= lt!297782 (readBitPure!0 (_1!8893 lt!297769)))))

(assert (=> b!191318 (= (_2!8895 lt!297782) lt!297798)))

(declare-fun lt!297804 () Unit!13582)

(declare-fun Unit!13615 () Unit!13582)

(assert (=> b!191318 (= lt!297804 Unit!13615)))

(declare-fun lt!297788 () (_ BitVec 64))

(assert (=> b!191318 (= lt!297788 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!297767 () (_ BitVec 64))

(assert (=> b!191318 (= lt!297767 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!297803 () Unit!13582)

(assert (=> b!191318 (= lt!297803 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8896 lt!296559) (buf!4849 (_2!8896 lt!297797)) lt!297767))))

(assert (=> b!191318 (validate_offset_bits!1 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!297797)))) ((_ sign_extend 32) (currentByte!9127 (_2!8896 lt!296559))) ((_ sign_extend 32) (currentBit!9122 (_2!8896 lt!296559))) lt!297767)))

(declare-fun lt!297809 () Unit!13582)

(assert (=> b!191318 (= lt!297809 lt!297803)))

(declare-fun lt!297791 () tuple2!16498)

(assert (=> b!191318 (= lt!297791 (readNBitsLSBFirstsLoopPure!0 (_1!8893 lt!297769) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!297788))))

(declare-fun lt!297754 () (_ BitVec 64))

(assert (=> b!191318 (= lt!297754 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!297807 () Unit!13582)

(assert (=> b!191318 (= lt!297807 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8896 lt!297789) (buf!4849 (_2!8896 lt!297797)) lt!297754))))

(assert (=> b!191318 (validate_offset_bits!1 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!297797)))) ((_ sign_extend 32) (currentByte!9127 (_2!8896 lt!297789))) ((_ sign_extend 32) (currentBit!9122 (_2!8896 lt!297789))) lt!297754)))

(declare-fun lt!297783 () Unit!13582)

(assert (=> b!191318 (= lt!297783 lt!297807)))

(declare-fun lt!297774 () tuple2!16498)

(assert (=> b!191318 (= lt!297774 (readNBitsLSBFirstsLoopPure!0 (_1!8893 lt!297795) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!297788 (ite (_2!8895 lt!297782) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!297780 () tuple2!16498)

(assert (=> b!191318 (= lt!297780 (readNBitsLSBFirstsLoopPure!0 (_1!8893 lt!297769) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!297788))))

(declare-fun c!9679 () Bool)

(assert (=> b!191318 (= c!9679 (_2!8895 (readBitPure!0 (_1!8893 lt!297769))))))

(declare-fun lt!297802 () tuple2!16498)

(assert (=> b!191318 (= lt!297802 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8893 lt!297769) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!297788 e!131904)))))

(declare-fun lt!297760 () Unit!13582)

(assert (=> b!191318 (= lt!297760 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8893 lt!297769) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!297788))))

(assert (=> b!191318 (and (= (_2!8894 lt!297780) (_2!8894 lt!297802)) (= (_1!8894 lt!297780) (_1!8894 lt!297802)))))

(declare-fun lt!297770 () Unit!13582)

(assert (=> b!191318 (= lt!297770 lt!297760)))

(assert (=> b!191318 (= (_1!8893 lt!297769) (withMovedBitIndex!0 (_2!8893 lt!297769) (bvsub (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296559))) (currentByte!9127 (_2!8896 lt!296559)) (currentBit!9122 (_2!8896 lt!296559))) (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!297797))) (currentByte!9127 (_2!8896 lt!297797)) (currentBit!9122 (_2!8896 lt!297797))))))))

(declare-fun lt!297808 () Unit!13582)

(declare-fun Unit!13616 () Unit!13582)

(assert (=> b!191318 (= lt!297808 Unit!13616)))

(assert (=> b!191318 (= (_1!8893 lt!297795) (withMovedBitIndex!0 (_2!8893 lt!297795) (bvsub (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!297789))) (currentByte!9127 (_2!8896 lt!297789)) (currentBit!9122 (_2!8896 lt!297789))) (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!297797))) (currentByte!9127 (_2!8896 lt!297797)) (currentBit!9122 (_2!8896 lt!297797))))))))

(declare-fun lt!297776 () Unit!13582)

(declare-fun Unit!13617 () Unit!13582)

(assert (=> b!191318 (= lt!297776 Unit!13617)))

(assert (=> b!191318 (= (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296559))) (currentByte!9127 (_2!8896 lt!296559)) (currentBit!9122 (_2!8896 lt!296559))) (bvsub (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!297789))) (currentByte!9127 (_2!8896 lt!297789)) (currentBit!9122 (_2!8896 lt!297789))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!297793 () Unit!13582)

(declare-fun Unit!13618 () Unit!13582)

(assert (=> b!191318 (= lt!297793 Unit!13618)))

(assert (=> b!191318 (= (_2!8894 lt!297791) (_2!8894 lt!297774))))

(declare-fun lt!297781 () Unit!13582)

(declare-fun Unit!13619 () Unit!13582)

(assert (=> b!191318 (= lt!297781 Unit!13619)))

(assert (=> b!191318 (invariant!0 (currentBit!9122 (_2!8896 lt!297797)) (currentByte!9127 (_2!8896 lt!297797)) (size!4372 (buf!4849 (_2!8896 lt!297797))))))

(declare-fun lt!297779 () Unit!13582)

(declare-fun Unit!13620 () Unit!13582)

(assert (=> b!191318 (= lt!297779 Unit!13620)))

(assert (=> b!191318 (= (size!4372 (buf!4849 (_2!8896 lt!296559))) (size!4372 (buf!4849 (_2!8896 lt!297797))))))

(declare-fun lt!297784 () Unit!13582)

(declare-fun Unit!13621 () Unit!13582)

(assert (=> b!191318 (= lt!297784 Unit!13621)))

(assert (=> b!191318 (= (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!297797))) (currentByte!9127 (_2!8896 lt!297797)) (currentBit!9122 (_2!8896 lt!297797))) (bvsub (bvadd (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296559))) (currentByte!9127 (_2!8896 lt!296559)) (currentBit!9122 (_2!8896 lt!296559))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!297759 () Unit!13582)

(declare-fun Unit!13622 () Unit!13582)

(assert (=> b!191318 (= lt!297759 Unit!13622)))

(declare-fun lt!297772 () Unit!13582)

(declare-fun Unit!13623 () Unit!13582)

(assert (=> b!191318 (= lt!297772 Unit!13623)))

(assert (=> b!191318 (= lt!297792 (reader!0 (_2!8896 lt!296559) (_2!8896 lt!297797)))))

(declare-fun lt!297799 () (_ BitVec 64))

(assert (=> b!191318 (= lt!297799 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!297771 () Unit!13582)

(assert (=> b!191318 (= lt!297771 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8896 lt!296559) (buf!4849 (_2!8896 lt!297797)) lt!297799))))

(assert (=> b!191318 (validate_offset_bits!1 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!297797)))) ((_ sign_extend 32) (currentByte!9127 (_2!8896 lt!296559))) ((_ sign_extend 32) (currentBit!9122 (_2!8896 lt!296559))) lt!297799)))

(declare-fun lt!297755 () Unit!13582)

(assert (=> b!191318 (= lt!297755 lt!297771)))

(assert (=> b!191318 (= lt!297800 (readNBitsLSBFirstsLoopPure!0 (_1!8893 lt!297792) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!159630 () Bool)

(assert (=> b!191318 (= res!159630 (= (_2!8894 lt!297800) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!191318 (=> (not res!159630) (not e!131912))))

(assert (=> b!191318 e!131912))

(declare-fun lt!297764 () Unit!13582)

(declare-fun Unit!13624 () Unit!13582)

(assert (=> b!191318 (= lt!297764 Unit!13624)))

(declare-fun b!191319 () Bool)

(assert (=> b!191319 (= e!131911 (validate_offset_bits!1 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8896 lt!296559)))) ((_ sign_extend 32) (currentByte!9127 (_2!8896 lt!296559))) ((_ sign_extend 32) (currentBit!9122 (_2!8896 lt!296559))) lt!297757))))

(assert (= (and d!65549 c!9678) b!191305))

(assert (= (and d!65549 (not c!9678)) b!191318))

(assert (= (and b!191318 res!159633) b!191308))

(assert (= (and b!191308 res!159639) b!191315))

(assert (= (and b!191315 res!159632) b!191307))

(assert (= (and b!191307 res!159634) b!191312))

(assert (= (and b!191318 res!159635) b!191313))

(assert (= (and b!191318 c!9679) b!191304))

(assert (= (and b!191318 (not c!9679)) b!191306))

(assert (= (and b!191318 res!159630) b!191316))

(assert (= (or b!191305 b!191315) bm!3044))

(assert (= (and d!65549 res!159637) b!191317))

(assert (= (and b!191317 res!159636) b!191311))

(assert (= (and b!191311 res!159629) b!191314))

(assert (= (and b!191314 res!159631) b!191310))

(assert (= (and b!191310 res!159628) b!191319))

(assert (= (and b!191310 res!159638) b!191309))

(declare-fun m!297281 () Bool)

(assert (=> b!191310 m!297281))

(declare-fun m!297283 () Bool)

(assert (=> b!191310 m!297283))

(declare-fun m!297285 () Bool)

(assert (=> b!191310 m!297285))

(declare-fun m!297287 () Bool)

(assert (=> b!191310 m!297287))

(declare-fun m!297289 () Bool)

(assert (=> b!191310 m!297289))

(declare-fun m!297291 () Bool)

(assert (=> b!191310 m!297291))

(declare-fun m!297293 () Bool)

(assert (=> b!191311 m!297293))

(assert (=> b!191311 m!296409))

(declare-fun m!297295 () Bool)

(assert (=> b!191318 m!297295))

(declare-fun m!297297 () Bool)

(assert (=> b!191318 m!297297))

(declare-fun m!297299 () Bool)

(assert (=> b!191318 m!297299))

(declare-fun m!297301 () Bool)

(assert (=> b!191318 m!297301))

(assert (=> b!191318 m!297281))

(declare-fun m!297303 () Bool)

(assert (=> b!191318 m!297303))

(declare-fun m!297305 () Bool)

(assert (=> b!191318 m!297305))

(declare-fun m!297307 () Bool)

(assert (=> b!191318 m!297307))

(declare-fun m!297309 () Bool)

(assert (=> b!191318 m!297309))

(declare-fun m!297311 () Bool)

(assert (=> b!191318 m!297311))

(declare-fun m!297313 () Bool)

(assert (=> b!191318 m!297313))

(declare-fun m!297315 () Bool)

(assert (=> b!191318 m!297315))

(assert (=> b!191318 m!297291))

(declare-fun m!297317 () Bool)

(assert (=> b!191318 m!297317))

(declare-fun m!297319 () Bool)

(assert (=> b!191318 m!297319))

(declare-fun m!297321 () Bool)

(assert (=> b!191318 m!297321))

(declare-fun m!297323 () Bool)

(assert (=> b!191318 m!297323))

(declare-fun m!297325 () Bool)

(assert (=> b!191318 m!297325))

(declare-fun m!297327 () Bool)

(assert (=> b!191318 m!297327))

(declare-fun m!297329 () Bool)

(assert (=> b!191318 m!297329))

(declare-fun m!297331 () Bool)

(assert (=> b!191318 m!297331))

(declare-fun m!297333 () Bool)

(assert (=> b!191318 m!297333))

(declare-fun m!297335 () Bool)

(assert (=> b!191318 m!297335))

(declare-fun m!297337 () Bool)

(assert (=> b!191318 m!297337))

(declare-fun m!297339 () Bool)

(assert (=> b!191318 m!297339))

(declare-fun m!297341 () Bool)

(assert (=> b!191318 m!297341))

(declare-fun m!297343 () Bool)

(assert (=> b!191318 m!297343))

(declare-fun m!297345 () Bool)

(assert (=> b!191318 m!297345))

(declare-fun m!297347 () Bool)

(assert (=> b!191318 m!297347))

(assert (=> b!191318 m!297295))

(declare-fun m!297349 () Bool)

(assert (=> b!191318 m!297349))

(declare-fun m!297351 () Bool)

(assert (=> b!191318 m!297351))

(assert (=> b!191318 m!296409))

(declare-fun m!297353 () Bool)

(assert (=> b!191318 m!297353))

(declare-fun m!297355 () Bool)

(assert (=> b!191318 m!297355))

(assert (=> b!191305 m!296877))

(declare-fun m!297357 () Bool)

(assert (=> d!65549 m!297357))

(declare-fun m!297359 () Bool)

(assert (=> b!191312 m!297359))

(declare-fun m!297361 () Bool)

(assert (=> b!191312 m!297361))

(assert (=> b!191308 m!297361))

(assert (=> b!191308 m!296409))

(declare-fun m!297363 () Bool)

(assert (=> b!191307 m!297363))

(assert (=> b!191307 m!297363))

(declare-fun m!297365 () Bool)

(assert (=> b!191307 m!297365))

(declare-fun m!297367 () Bool)

(assert (=> b!191319 m!297367))

(declare-fun m!297369 () Bool)

(assert (=> b!191314 m!297369))

(declare-fun m!297371 () Bool)

(assert (=> bm!3044 m!297371))

(assert (=> b!190828 d!65549))

(declare-fun d!65645 () Bool)

(declare-fun res!159640 () Bool)

(declare-fun e!131913 () Bool)

(assert (=> d!65645 (=> (not res!159640) (not e!131913))))

(assert (=> d!65645 (= res!159640 (= (size!4372 (buf!4849 (_2!8896 lt!296559))) (size!4372 (buf!4849 (_2!8896 lt!296552)))))))

(assert (=> d!65645 (= (isPrefixOf!0 (_2!8896 lt!296559) (_2!8896 lt!296552)) e!131913)))

(declare-fun b!191320 () Bool)

(declare-fun res!159641 () Bool)

(assert (=> b!191320 (=> (not res!159641) (not e!131913))))

(assert (=> b!191320 (= res!159641 (bvsle (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296559))) (currentByte!9127 (_2!8896 lt!296559)) (currentBit!9122 (_2!8896 lt!296559))) (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296552))) (currentByte!9127 (_2!8896 lt!296552)) (currentBit!9122 (_2!8896 lt!296552)))))))

(declare-fun b!191321 () Bool)

(declare-fun e!131914 () Bool)

(assert (=> b!191321 (= e!131913 e!131914)))

(declare-fun res!159642 () Bool)

(assert (=> b!191321 (=> res!159642 e!131914)))

(assert (=> b!191321 (= res!159642 (= (size!4372 (buf!4849 (_2!8896 lt!296559))) #b00000000000000000000000000000000))))

(declare-fun b!191322 () Bool)

(assert (=> b!191322 (= e!131914 (arrayBitRangesEq!0 (buf!4849 (_2!8896 lt!296559)) (buf!4849 (_2!8896 lt!296552)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!296559))) (currentByte!9127 (_2!8896 lt!296559)) (currentBit!9122 (_2!8896 lt!296559)))))))

(assert (= (and d!65645 res!159640) b!191320))

(assert (= (and b!191320 res!159641) b!191321))

(assert (= (and b!191321 (not res!159642)) b!191322))

(assert (=> b!191320 m!296409))

(assert (=> b!191320 m!296415))

(assert (=> b!191322 m!296409))

(assert (=> b!191322 m!296409))

(declare-fun m!297373 () Bool)

(assert (=> b!191322 m!297373))

(assert (=> b!190829 d!65645))

(declare-fun d!65647 () Bool)

(declare-fun e!131915 () Bool)

(assert (=> d!65647 e!131915))

(declare-fun res!159643 () Bool)

(assert (=> d!65647 (=> (not res!159643) (not e!131915))))

(declare-fun lt!297810 () BitStream!7852)

(declare-fun lt!297811 () (_ BitVec 64))

(assert (=> d!65647 (= res!159643 (= (bvadd lt!297811 (bvsub lt!296540 lt!296556)) (bitIndex!0 (size!4372 (buf!4849 lt!297810)) (currentByte!9127 lt!297810) (currentBit!9122 lt!297810))))))

(assert (=> d!65647 (or (not (= (bvand lt!297811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296540 lt!296556) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!297811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!297811 (bvsub lt!296540 lt!296556)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65647 (= lt!297811 (bitIndex!0 (size!4372 (buf!4849 (_2!8893 lt!296548))) (currentByte!9127 (_2!8893 lt!296548)) (currentBit!9122 (_2!8893 lt!296548))))))

(assert (=> d!65647 (= lt!297810 (_2!8896 (moveBitIndex!0 (_2!8893 lt!296548) (bvsub lt!296540 lt!296556))))))

(assert (=> d!65647 (moveBitIndexPrecond!0 (_2!8893 lt!296548) (bvsub lt!296540 lt!296556))))

(assert (=> d!65647 (= (withMovedBitIndex!0 (_2!8893 lt!296548) (bvsub lt!296540 lt!296556)) lt!297810)))

(declare-fun b!191323 () Bool)

(assert (=> b!191323 (= e!131915 (= (size!4372 (buf!4849 (_2!8893 lt!296548))) (size!4372 (buf!4849 lt!297810))))))

(assert (= (and d!65647 res!159643) b!191323))

(declare-fun m!297375 () Bool)

(assert (=> d!65647 m!297375))

(assert (=> d!65647 m!296403))

(declare-fun m!297377 () Bool)

(assert (=> d!65647 m!297377))

(declare-fun m!297379 () Bool)

(assert (=> d!65647 m!297379))

(assert (=> b!190819 d!65647))

(declare-fun d!65649 () Bool)

(assert (=> d!65649 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590)) (ite (= (bvsub #b00000000000000000000000001000000 i!590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!590))))))))

(assert (=> b!190809 d!65649))

(declare-fun d!65651 () Bool)

(assert (=> d!65651 (= (invariant!0 (currentBit!9122 thiss!1204) (currentByte!9127 thiss!1204) (size!4372 (buf!4849 (_2!8896 lt!296552)))) (and (bvsge (currentBit!9122 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9122 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9127 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9127 thiss!1204) (size!4372 (buf!4849 (_2!8896 lt!296552)))) (and (= (currentBit!9122 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9127 thiss!1204) (size!4372 (buf!4849 (_2!8896 lt!296552))))))))))

(assert (=> b!190815 d!65651))

(declare-fun d!65653 () Bool)

(declare-fun e!131916 () Bool)

(assert (=> d!65653 e!131916))

(declare-fun res!159644 () Bool)

(assert (=> d!65653 (=> (not res!159644) (not e!131916))))

(declare-fun lt!297816 () (_ BitVec 64))

(declare-fun lt!297817 () (_ BitVec 64))

(declare-fun lt!297815 () (_ BitVec 64))

(assert (=> d!65653 (= res!159644 (= lt!297815 (bvsub lt!297816 lt!297817)))))

(assert (=> d!65653 (or (= (bvand lt!297816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297817 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297816 lt!297817) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65653 (= lt!297817 (remainingBits!0 ((_ sign_extend 32) (size!4372 (buf!4849 (_1!8894 lt!296532)))) ((_ sign_extend 32) (currentByte!9127 (_1!8894 lt!296532))) ((_ sign_extend 32) (currentBit!9122 (_1!8894 lt!296532)))))))

(declare-fun lt!297812 () (_ BitVec 64))

(declare-fun lt!297813 () (_ BitVec 64))

(assert (=> d!65653 (= lt!297816 (bvmul lt!297812 lt!297813))))

(assert (=> d!65653 (or (= lt!297812 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!297813 (bvsdiv (bvmul lt!297812 lt!297813) lt!297812)))))

(assert (=> d!65653 (= lt!297813 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65653 (= lt!297812 ((_ sign_extend 32) (size!4372 (buf!4849 (_1!8894 lt!296532)))))))

(assert (=> d!65653 (= lt!297815 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9127 (_1!8894 lt!296532))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9122 (_1!8894 lt!296532)))))))

(assert (=> d!65653 (invariant!0 (currentBit!9122 (_1!8894 lt!296532)) (currentByte!9127 (_1!8894 lt!296532)) (size!4372 (buf!4849 (_1!8894 lt!296532))))))

(assert (=> d!65653 (= (bitIndex!0 (size!4372 (buf!4849 (_1!8894 lt!296532))) (currentByte!9127 (_1!8894 lt!296532)) (currentBit!9122 (_1!8894 lt!296532))) lt!297815)))

(declare-fun b!191324 () Bool)

(declare-fun res!159645 () Bool)

(assert (=> b!191324 (=> (not res!159645) (not e!131916))))

(assert (=> b!191324 (= res!159645 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!297815))))

(declare-fun b!191325 () Bool)

(declare-fun lt!297814 () (_ BitVec 64))

(assert (=> b!191325 (= e!131916 (bvsle lt!297815 (bvmul lt!297814 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191325 (or (= lt!297814 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!297814 #b0000000000000000000000000000000000000000000000000000000000001000) lt!297814)))))

(assert (=> b!191325 (= lt!297814 ((_ sign_extend 32) (size!4372 (buf!4849 (_1!8894 lt!296532)))))))

(assert (= (and d!65653 res!159644) b!191324))

(assert (= (and b!191324 res!159645) b!191325))

(declare-fun m!297381 () Bool)

(assert (=> d!65653 m!297381))

(declare-fun m!297383 () Bool)

(assert (=> d!65653 m!297383))

(assert (=> b!190826 d!65653))

(declare-fun d!65655 () Bool)

(declare-fun e!131917 () Bool)

(assert (=> d!65655 e!131917))

(declare-fun res!159646 () Bool)

(assert (=> d!65655 (=> (not res!159646) (not e!131917))))

(declare-fun lt!297822 () (_ BitVec 64))

(declare-fun lt!297823 () (_ BitVec 64))

(declare-fun lt!297821 () (_ BitVec 64))

(assert (=> d!65655 (= res!159646 (= lt!297821 (bvsub lt!297822 lt!297823)))))

(assert (=> d!65655 (or (= (bvand lt!297822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297823 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297822 lt!297823) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65655 (= lt!297823 (remainingBits!0 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8893 lt!296548)))) ((_ sign_extend 32) (currentByte!9127 (_2!8893 lt!296548))) ((_ sign_extend 32) (currentBit!9122 (_2!8893 lt!296548)))))))

(declare-fun lt!297818 () (_ BitVec 64))

(declare-fun lt!297819 () (_ BitVec 64))

(assert (=> d!65655 (= lt!297822 (bvmul lt!297818 lt!297819))))

(assert (=> d!65655 (or (= lt!297818 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!297819 (bvsdiv (bvmul lt!297818 lt!297819) lt!297818)))))

(assert (=> d!65655 (= lt!297819 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65655 (= lt!297818 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8893 lt!296548)))))))

(assert (=> d!65655 (= lt!297821 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9127 (_2!8893 lt!296548))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9122 (_2!8893 lt!296548)))))))

(assert (=> d!65655 (invariant!0 (currentBit!9122 (_2!8893 lt!296548)) (currentByte!9127 (_2!8893 lt!296548)) (size!4372 (buf!4849 (_2!8893 lt!296548))))))

(assert (=> d!65655 (= (bitIndex!0 (size!4372 (buf!4849 (_2!8893 lt!296548))) (currentByte!9127 (_2!8893 lt!296548)) (currentBit!9122 (_2!8893 lt!296548))) lt!297821)))

(declare-fun b!191326 () Bool)

(declare-fun res!159647 () Bool)

(assert (=> b!191326 (=> (not res!159647) (not e!131917))))

(assert (=> b!191326 (= res!159647 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!297821))))

(declare-fun b!191327 () Bool)

(declare-fun lt!297820 () (_ BitVec 64))

(assert (=> b!191327 (= e!131917 (bvsle lt!297821 (bvmul lt!297820 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191327 (or (= lt!297820 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!297820 #b0000000000000000000000000000000000000000000000000000000000001000) lt!297820)))))

(assert (=> b!191327 (= lt!297820 ((_ sign_extend 32) (size!4372 (buf!4849 (_2!8893 lt!296548)))))))

(assert (= (and d!65655 res!159646) b!191326))

(assert (= (and b!191326 res!159647) b!191327))

(declare-fun m!297385 () Bool)

(assert (=> d!65655 m!297385))

(declare-fun m!297387 () Bool)

(assert (=> d!65655 m!297387))

(assert (=> b!190826 d!65655))

(declare-fun d!65657 () Bool)

(assert (=> d!65657 (= (invariant!0 (currentBit!9122 (_2!8896 lt!296552)) (currentByte!9127 (_2!8896 lt!296552)) (size!4372 (buf!4849 (_2!8896 lt!296552)))) (and (bvsge (currentBit!9122 (_2!8896 lt!296552)) #b00000000000000000000000000000000) (bvslt (currentBit!9122 (_2!8896 lt!296552)) #b00000000000000000000000000001000) (bvsge (currentByte!9127 (_2!8896 lt!296552)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9127 (_2!8896 lt!296552)) (size!4372 (buf!4849 (_2!8896 lt!296552)))) (and (= (currentBit!9122 (_2!8896 lt!296552)) #b00000000000000000000000000000000) (= (currentByte!9127 (_2!8896 lt!296552)) (size!4372 (buf!4849 (_2!8896 lt!296552))))))))))

(assert (=> b!190827 d!65657))

(declare-fun d!65659 () Bool)

(declare-fun lt!297851 () tuple2!16498)

(declare-fun lt!297853 () tuple2!16498)

(assert (=> d!65659 (and (= (_2!8894 lt!297851) (_2!8894 lt!297853)) (= (_1!8894 lt!297851) (_1!8894 lt!297853)))))

(declare-fun lt!297852 () Unit!13582)

(declare-fun lt!297850 () Bool)

(declare-fun lt!297848 () BitStream!7852)

(declare-fun lt!297849 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!7852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16498 tuple2!16498 BitStream!7852 (_ BitVec 64) Bool BitStream!7852 (_ BitVec 64) tuple2!16498 tuple2!16498 BitStream!7852 (_ BitVec 64)) Unit!13582)

(assert (=> d!65659 (= lt!297852 (choose!56 (_1!8893 lt!296548) nBits!348 i!590 lt!296539 lt!297851 (tuple2!16499 (_1!8894 lt!297851) (_2!8894 lt!297851)) (_1!8894 lt!297851) (_2!8894 lt!297851) lt!297850 lt!297848 lt!297849 lt!297853 (tuple2!16499 (_1!8894 lt!297853) (_2!8894 lt!297853)) (_1!8894 lt!297853) (_2!8894 lt!297853)))))

(assert (=> d!65659 (= lt!297853 (readNBitsLSBFirstsLoopPure!0 lt!297848 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!297849))))

(assert (=> d!65659 (= lt!297849 (bvor lt!296539 (ite lt!297850 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65659 (= lt!297848 (withMovedBitIndex!0 (_1!8893 lt!296548) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!65659 (= lt!297850 (_2!8895 (readBitPure!0 (_1!8893 lt!296548))))))

(assert (=> d!65659 (= lt!297851 (readNBitsLSBFirstsLoopPure!0 (_1!8893 lt!296548) nBits!348 i!590 lt!296539))))

(assert (=> d!65659 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8893 lt!296548) nBits!348 i!590 lt!296539) lt!297852)))

(declare-fun bs!16309 () Bool)

(assert (= bs!16309 d!65659))

(assert (=> bs!16309 m!296445))

(assert (=> bs!16309 m!296479))

(declare-fun m!297403 () Bool)

(assert (=> bs!16309 m!297403))

(assert (=> bs!16309 m!296437))

(declare-fun m!297405 () Bool)

(assert (=> bs!16309 m!297405))

(assert (=> b!190816 d!65659))

(declare-fun lt!297854 () tuple2!16530)

(declare-fun d!65661 () Bool)

(assert (=> d!65661 (= lt!297854 (readNBitsLSBFirstsLoop!0 lt!296535 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296545))))

(assert (=> d!65661 (= (readNBitsLSBFirstsLoopPure!0 lt!296535 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296545) (tuple2!16499 (_2!8910 lt!297854) (_1!8910 lt!297854)))))

(declare-fun bs!16310 () Bool)

(assert (= bs!16310 d!65661))

(declare-fun m!297407 () Bool)

(assert (=> bs!16310 m!297407))

(assert (=> b!190816 d!65661))

(declare-fun d!65663 () Bool)

(declare-fun e!131924 () Bool)

(assert (=> d!65663 e!131924))

(declare-fun res!159660 () Bool)

(assert (=> d!65663 (=> (not res!159660) (not e!131924))))

(declare-fun lt!297856 () (_ BitVec 64))

(declare-fun lt!297855 () BitStream!7852)

(assert (=> d!65663 (= res!159660 (= (bvadd lt!297856 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4372 (buf!4849 lt!297855)) (currentByte!9127 lt!297855) (currentBit!9122 lt!297855))))))

(assert (=> d!65663 (or (not (= (bvand lt!297856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!297856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!297856 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65663 (= lt!297856 (bitIndex!0 (size!4372 (buf!4849 (_1!8893 lt!296548))) (currentByte!9127 (_1!8893 lt!296548)) (currentBit!9122 (_1!8893 lt!296548))))))

(assert (=> d!65663 (= lt!297855 (_2!8896 (moveBitIndex!0 (_1!8893 lt!296548) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!65663 (moveBitIndexPrecond!0 (_1!8893 lt!296548) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!65663 (= (withMovedBitIndex!0 (_1!8893 lt!296548) #b0000000000000000000000000000000000000000000000000000000000000001) lt!297855)))

(declare-fun b!191341 () Bool)

(assert (=> b!191341 (= e!131924 (= (size!4372 (buf!4849 (_1!8893 lt!296548))) (size!4372 (buf!4849 lt!297855))))))

(assert (= (and d!65663 res!159660) b!191341))

(declare-fun m!297409 () Bool)

(assert (=> d!65663 m!297409))

(declare-fun m!297411 () Bool)

(assert (=> d!65663 m!297411))

(declare-fun m!297413 () Bool)

(assert (=> d!65663 m!297413))

(declare-fun m!297415 () Bool)

(assert (=> d!65663 m!297415))

(assert (=> b!190816 d!65663))

(assert (=> b!190817 d!65477))

(assert (=> b!190817 d!65479))

(declare-fun d!65665 () Bool)

(declare-fun e!131929 () Bool)

(assert (=> d!65665 e!131929))

(declare-fun res!159671 () Bool)

(assert (=> d!65665 (=> (not res!159671) (not e!131929))))

(declare-fun lt!297868 () tuple2!16502)

(assert (=> d!65665 (= res!159671 (= (size!4372 (buf!4849 thiss!1204)) (size!4372 (buf!4849 (_2!8896 lt!297868)))))))

(declare-fun choose!16 (BitStream!7852 Bool) tuple2!16502)

(assert (=> d!65665 (= lt!297868 (choose!16 thiss!1204 lt!296546))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!65665 (validate_offset_bit!0 ((_ sign_extend 32) (size!4372 (buf!4849 thiss!1204))) ((_ sign_extend 32) (currentByte!9127 thiss!1204)) ((_ sign_extend 32) (currentBit!9122 thiss!1204)))))

(assert (=> d!65665 (= (appendBit!0 thiss!1204 lt!296546) lt!297868)))

(declare-fun b!191354 () Bool)

(declare-fun e!131930 () Bool)

(declare-fun lt!297865 () tuple2!16500)

(assert (=> b!191354 (= e!131930 (= (bitIndex!0 (size!4372 (buf!4849 (_1!8895 lt!297865))) (currentByte!9127 (_1!8895 lt!297865)) (currentBit!9122 (_1!8895 lt!297865))) (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!297868))) (currentByte!9127 (_2!8896 lt!297868)) (currentBit!9122 (_2!8896 lt!297868)))))))

(declare-fun b!191352 () Bool)

(declare-fun res!159672 () Bool)

(assert (=> b!191352 (=> (not res!159672) (not e!131929))))

(assert (=> b!191352 (= res!159672 (isPrefixOf!0 thiss!1204 (_2!8896 lt!297868)))))

(declare-fun b!191351 () Bool)

(declare-fun res!159670 () Bool)

(assert (=> b!191351 (=> (not res!159670) (not e!131929))))

(declare-fun lt!297867 () (_ BitVec 64))

(declare-fun lt!297866 () (_ BitVec 64))

(assert (=> b!191351 (= res!159670 (= (bitIndex!0 (size!4372 (buf!4849 (_2!8896 lt!297868))) (currentByte!9127 (_2!8896 lt!297868)) (currentBit!9122 (_2!8896 lt!297868))) (bvadd lt!297866 lt!297867)))))

(assert (=> b!191351 (or (not (= (bvand lt!297866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297867 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!297866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!297866 lt!297867) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191351 (= lt!297867 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!191351 (= lt!297866 (bitIndex!0 (size!4372 (buf!4849 thiss!1204)) (currentByte!9127 thiss!1204) (currentBit!9122 thiss!1204)))))

(declare-fun b!191353 () Bool)

(assert (=> b!191353 (= e!131929 e!131930)))

(declare-fun res!159669 () Bool)

(assert (=> b!191353 (=> (not res!159669) (not e!131930))))

(assert (=> b!191353 (= res!159669 (and (= (_2!8895 lt!297865) lt!296546) (= (_1!8895 lt!297865) (_2!8896 lt!297868))))))

(assert (=> b!191353 (= lt!297865 (readBitPure!0 (readerFrom!0 (_2!8896 lt!297868) (currentBit!9122 thiss!1204) (currentByte!9127 thiss!1204))))))

(assert (= (and d!65665 res!159671) b!191351))

(assert (= (and b!191351 res!159670) b!191352))

(assert (= (and b!191352 res!159672) b!191353))

(assert (= (and b!191353 res!159669) b!191354))

(declare-fun m!297417 () Bool)

(assert (=> b!191354 m!297417))

(declare-fun m!297419 () Bool)

(assert (=> b!191354 m!297419))

(declare-fun m!297421 () Bool)

(assert (=> b!191352 m!297421))

(assert (=> b!191351 m!297419))

(assert (=> b!191351 m!296411))

(declare-fun m!297423 () Bool)

(assert (=> b!191353 m!297423))

(assert (=> b!191353 m!297423))

(declare-fun m!297425 () Bool)

(assert (=> b!191353 m!297425))

(declare-fun m!297427 () Bool)

(assert (=> d!65665 m!297427))

(declare-fun m!297429 () Bool)

(assert (=> d!65665 m!297429))

(assert (=> b!190817 d!65665))

(push 1)

(assert (not d!65665))

(assert (not d!65647))

(assert (not b!191064))

(assert (not d!65511))

(assert (not d!65477))

(assert (not d!65501))

(assert (not b!191312))

(assert (not d!65535))

(assert (not d!65515))

(assert (not d!65485))

(assert (not d!65487))

(assert (not b!191322))

(assert (not b!191318))

(assert (not b!191086))

(assert (not b!191353))

(assert (not d!65653))

(assert (not b!191319))

(assert (not b!191061))

(assert (not b!191311))

(assert (not d!65489))

(assert (not d!65543))

(assert (not d!65507))

(assert (not d!65479))

(assert (not d!65499))

(assert (not d!65531))

(assert (not b!191314))

(assert (not b!191111))

(assert (not b!191083))

(assert (not d!65519))

(assert (not d!65659))

(assert (not b!191320))

(assert (not d!65655))

(assert (not d!65503))

(assert (not d!65493))

(assert (not d!65513))

(assert (not d!65483))

(assert (not d!65663))

(assert (not b!191081))

(assert (not b!191084))

(assert (not b!191308))

(assert (not d!65495))

(assert (not b!191351))

(assert (not bm!3044))

(assert (not b!191113))

(assert (not d!65509))

(assert (not b!191082))

(assert (not d!65547))

(assert (not b!191310))

(assert (not d!65549))

(assert (not d!65497))

(assert (not b!191354))

(assert (not b!191088))

(assert (not d!65491))

(assert (not b!191307))

(assert (not b!191059))

(assert (not b!191087))

(assert (not d!65525))

(assert (not b!191089))

(assert (not d!65661))

(assert (not b!191305))

(assert (not d!65539))

(assert (not b!191352))

(check-sat)

(pop 1)

(push 1)

(check-sat)

