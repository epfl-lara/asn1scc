; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41428 () Bool)

(assert start!41428)

(declare-fun b!194323 () Bool)

(declare-fun e!133718 () Bool)

(declare-datatypes ((array!9997 0))(
  ( (array!9998 (arr!5339 (Array (_ BitVec 32) (_ BitVec 8))) (size!4409 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7926 0))(
  ( (BitStream!7927 (buf!4892 array!9997) (currentByte!9182 (_ BitVec 32)) (currentBit!9177 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7926)

(declare-fun array_inv!4150 (array!9997) Bool)

(assert (=> b!194323 (= e!133718 (array_inv!4150 (buf!4892 thiss!1204)))))

(declare-fun b!194324 () Bool)

(declare-fun res!162497 () Bool)

(declare-fun e!133703 () Bool)

(assert (=> b!194324 (=> (not res!162497) (not e!133703))))

(declare-datatypes ((tuple2!16816 0))(
  ( (tuple2!16817 (_1!9053 BitStream!7926) (_2!9053 BitStream!7926)) )
))
(declare-fun lt!302032 () tuple2!16816)

(declare-fun lt!302036 () (_ BitVec 64))

(declare-fun lt!302041 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7926 (_ BitVec 64)) BitStream!7926)

(assert (=> b!194324 (= res!162497 (= (_1!9053 lt!302032) (withMovedBitIndex!0 (_2!9053 lt!302032) (bvsub lt!302041 lt!302036))))))

(declare-fun b!194325 () Bool)

(declare-fun e!133716 () Bool)

(declare-fun e!133712 () Bool)

(assert (=> b!194325 (= e!133716 (not e!133712))))

(declare-fun res!162484 () Bool)

(assert (=> b!194325 (=> res!162484 e!133712)))

(declare-fun lt!302033 () (_ BitVec 64))

(assert (=> b!194325 (= res!162484 (not (= lt!302033 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!302041))))))

(declare-datatypes ((Unit!13734 0))(
  ( (Unit!13735) )
))
(declare-datatypes ((tuple2!16818 0))(
  ( (tuple2!16819 (_1!9054 Unit!13734) (_2!9054 BitStream!7926)) )
))
(declare-fun lt!302035 () tuple2!16818)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!194325 (= lt!302033 (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302035))) (currentByte!9182 (_2!9054 lt!302035)) (currentBit!9177 (_2!9054 lt!302035))))))

(assert (=> b!194325 (= lt!302041 (bitIndex!0 (size!4409 (buf!4892 thiss!1204)) (currentByte!9182 thiss!1204) (currentBit!9177 thiss!1204)))))

(declare-fun e!133705 () Bool)

(assert (=> b!194325 e!133705))

(declare-fun res!162492 () Bool)

(assert (=> b!194325 (=> (not res!162492) (not e!133705))))

(assert (=> b!194325 (= res!162492 (= (size!4409 (buf!4892 thiss!1204)) (size!4409 (buf!4892 (_2!9054 lt!302035)))))))

(declare-fun lt!302030 () Bool)

(declare-fun appendBit!0 (BitStream!7926 Bool) tuple2!16818)

(assert (=> b!194325 (= lt!302035 (appendBit!0 thiss!1204 lt!302030))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!302029 () (_ BitVec 64))

(assert (=> b!194325 (= lt!302030 (not (= (bvand v!189 lt!302029) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!194325 (= lt!302029 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!194326 () Bool)

(declare-fun e!133717 () Bool)

(assert (=> b!194326 (= e!133717 e!133716)))

(declare-fun res!162495 () Bool)

(assert (=> b!194326 (=> (not res!162495) (not e!133716))))

(declare-fun lt!302031 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!194326 (= res!162495 (validate_offset_bits!1 ((_ sign_extend 32) (size!4409 (buf!4892 thiss!1204))) ((_ sign_extend 32) (currentByte!9182 thiss!1204)) ((_ sign_extend 32) (currentBit!9177 thiss!1204)) lt!302031))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!194326 (= lt!302031 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!194327 () Bool)

(declare-fun e!133714 () Bool)

(declare-datatypes ((tuple2!16820 0))(
  ( (tuple2!16821 (_1!9055 BitStream!7926) (_2!9055 Bool)) )
))
(declare-fun lt!302044 () tuple2!16820)

(declare-fun lt!302045 () (_ BitVec 64))

(assert (=> b!194327 (= e!133714 (= (bitIndex!0 (size!4409 (buf!4892 (_1!9055 lt!302044))) (currentByte!9182 (_1!9055 lt!302044)) (currentBit!9177 (_1!9055 lt!302044))) lt!302045))))

(declare-fun lt!302021 () tuple2!16816)

(declare-fun lt!302024 () BitStream!7926)

(declare-datatypes ((tuple2!16822 0))(
  ( (tuple2!16823 (_1!9056 BitStream!7926) (_2!9056 (_ BitVec 64))) )
))
(declare-fun lt!302023 () tuple2!16822)

(declare-fun lt!302037 () tuple2!16822)

(declare-fun b!194328 () Bool)

(assert (=> b!194328 (= e!133703 (and (= lt!302041 (bvsub lt!302033 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9053 lt!302021) lt!302024)) (= (_2!9056 lt!302023) (_2!9056 lt!302037)))))))

(declare-fun b!194329 () Bool)

(declare-fun res!162480 () Bool)

(declare-fun e!133710 () Bool)

(assert (=> b!194329 (=> (not res!162480) (not e!133710))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!194329 (= res!162480 (= (_2!9056 lt!302023) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!194330 () Bool)

(declare-fun e!133713 () Bool)

(assert (=> b!194330 (= e!133705 e!133713)))

(declare-fun res!162501 () Bool)

(assert (=> b!194330 (=> (not res!162501) (not e!133713))))

(declare-fun lt!302020 () (_ BitVec 64))

(assert (=> b!194330 (= res!162501 (= lt!302045 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!302020)))))

(assert (=> b!194330 (= lt!302045 (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302035))) (currentByte!9182 (_2!9054 lt!302035)) (currentBit!9177 (_2!9054 lt!302035))))))

(assert (=> b!194330 (= lt!302020 (bitIndex!0 (size!4409 (buf!4892 thiss!1204)) (currentByte!9182 thiss!1204) (currentBit!9177 thiss!1204)))))

(declare-fun b!194331 () Bool)

(declare-fun e!133706 () Bool)

(declare-fun lt!302034 () tuple2!16818)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!194331 (= e!133706 (invariant!0 (currentBit!9177 thiss!1204) (currentByte!9182 thiss!1204) (size!4409 (buf!4892 (_2!9054 lt!302034)))))))

(declare-fun b!194332 () Bool)

(declare-fun res!162493 () Bool)

(declare-fun e!133711 () Bool)

(assert (=> b!194332 (=> res!162493 e!133711)))

(declare-fun isPrefixOf!0 (BitStream!7926 BitStream!7926) Bool)

(assert (=> b!194332 (= res!162493 (not (isPrefixOf!0 (_2!9054 lt!302035) (_2!9054 lt!302034))))))

(declare-fun b!194333 () Bool)

(declare-fun res!162477 () Bool)

(assert (=> b!194333 (=> res!162477 e!133711)))

(assert (=> b!194333 (= res!162477 (or (not (= (size!4409 (buf!4892 (_2!9054 lt!302034))) (size!4409 (buf!4892 thiss!1204)))) (not (= lt!302036 (bvsub (bvadd lt!302041 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!194334 () Bool)

(declare-fun res!162479 () Bool)

(assert (=> b!194334 (=> (not res!162479) (not e!133716))))

(assert (=> b!194334 (= res!162479 (not (= i!590 nBits!348)))))

(declare-fun b!194335 () Bool)

(declare-fun e!133704 () Bool)

(declare-fun e!133708 () Bool)

(assert (=> b!194335 (= e!133704 e!133708)))

(declare-fun res!162494 () Bool)

(assert (=> b!194335 (=> res!162494 e!133708)))

(assert (=> b!194335 (= res!162494 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4409 (buf!4892 (_1!9053 lt!302032)))) ((_ sign_extend 32) (currentByte!9182 (_1!9053 lt!302032))) ((_ sign_extend 32) (currentBit!9177 (_1!9053 lt!302032))) lt!302031)))))

(assert (=> b!194335 e!133710))

(declare-fun res!162491 () Bool)

(assert (=> b!194335 (=> (not res!162491) (not e!133710))))

(assert (=> b!194335 (= res!162491 (= (size!4409 (buf!4892 thiss!1204)) (size!4409 (buf!4892 (_2!9054 lt!302034)))))))

(declare-fun b!194336 () Bool)

(assert (=> b!194336 (= e!133712 e!133711)))

(declare-fun res!162496 () Bool)

(assert (=> b!194336 (=> res!162496 e!133711)))

(assert (=> b!194336 (= res!162496 (not (= lt!302036 (bvsub (bvsub (bvadd lt!302033 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!194336 (= lt!302036 (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302034))) (currentByte!9182 (_2!9054 lt!302034)) (currentBit!9177 (_2!9054 lt!302034))))))

(assert (=> b!194336 (isPrefixOf!0 thiss!1204 (_2!9054 lt!302034))))

(declare-fun lt!302025 () Unit!13734)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7926 BitStream!7926 BitStream!7926) Unit!13734)

(assert (=> b!194336 (= lt!302025 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9054 lt!302035) (_2!9054 lt!302034)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7926 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16818)

(assert (=> b!194336 (= lt!302034 (appendBitsLSBFirstLoopTR!0 (_2!9054 lt!302035) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!194337 () Bool)

(declare-fun res!162488 () Bool)

(assert (=> b!194337 (=> (not res!162488) (not e!133713))))

(assert (=> b!194337 (= res!162488 (isPrefixOf!0 thiss!1204 (_2!9054 lt!302035)))))

(declare-fun b!194338 () Bool)

(declare-fun e!133715 () Bool)

(declare-fun lt!302043 () tuple2!16820)

(declare-fun lt!302040 () tuple2!16820)

(assert (=> b!194338 (= e!133715 (= (_2!9055 lt!302043) (_2!9055 lt!302040)))))

(declare-fun b!194339 () Bool)

(declare-fun res!162487 () Bool)

(assert (=> b!194339 (=> (not res!162487) (not e!133703))))

(assert (=> b!194339 (= res!162487 (= (_1!9053 lt!302021) (withMovedBitIndex!0 (_2!9053 lt!302021) (bvsub lt!302033 lt!302036))))))

(declare-fun b!194340 () Bool)

(declare-fun res!162485 () Bool)

(assert (=> b!194340 (=> res!162485 e!133711)))

(assert (=> b!194340 (= res!162485 (not (isPrefixOf!0 thiss!1204 (_2!9054 lt!302035))))))

(declare-fun b!194341 () Bool)

(declare-fun res!162499 () Bool)

(assert (=> b!194341 (=> res!162499 e!133711)))

(assert (=> b!194341 (= res!162499 (not (invariant!0 (currentBit!9177 (_2!9054 lt!302034)) (currentByte!9182 (_2!9054 lt!302034)) (size!4409 (buf!4892 (_2!9054 lt!302034))))))))

(declare-fun b!194342 () Bool)

(assert (=> b!194342 (= e!133713 e!133714)))

(declare-fun res!162483 () Bool)

(assert (=> b!194342 (=> (not res!162483) (not e!133714))))

(assert (=> b!194342 (= res!162483 (and (= (_2!9055 lt!302044) lt!302030) (= (_1!9055 lt!302044) (_2!9054 lt!302035))))))

(declare-fun readBitPure!0 (BitStream!7926) tuple2!16820)

(declare-fun readerFrom!0 (BitStream!7926 (_ BitVec 32) (_ BitVec 32)) BitStream!7926)

(assert (=> b!194342 (= lt!302044 (readBitPure!0 (readerFrom!0 (_2!9054 lt!302035) (currentBit!9177 thiss!1204) (currentByte!9182 thiss!1204))))))

(declare-fun res!162498 () Bool)

(assert (=> start!41428 (=> (not res!162498) (not e!133717))))

(assert (=> start!41428 (= res!162498 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41428 e!133717))

(assert (=> start!41428 true))

(declare-fun inv!12 (BitStream!7926) Bool)

(assert (=> start!41428 (and (inv!12 thiss!1204) e!133718)))

(declare-fun b!194343 () Bool)

(declare-fun res!162490 () Bool)

(assert (=> b!194343 (=> (not res!162490) (not e!133716))))

(assert (=> b!194343 (= res!162490 (invariant!0 (currentBit!9177 thiss!1204) (currentByte!9182 thiss!1204) (size!4409 (buf!4892 thiss!1204))))))

(declare-fun b!194344 () Bool)

(declare-fun res!162500 () Bool)

(assert (=> b!194344 (=> res!162500 e!133704)))

(assert (=> b!194344 (= res!162500 (not (= (bitIndex!0 (size!4409 (buf!4892 (_1!9056 lt!302023))) (currentByte!9182 (_1!9056 lt!302023)) (currentBit!9177 (_1!9056 lt!302023))) (bitIndex!0 (size!4409 (buf!4892 (_2!9053 lt!302032))) (currentByte!9182 (_2!9053 lt!302032)) (currentBit!9177 (_2!9053 lt!302032))))))))

(declare-fun b!194345 () Bool)

(declare-fun e!133707 () Bool)

(assert (=> b!194345 (= e!133707 e!133704)))

(declare-fun res!162489 () Bool)

(assert (=> b!194345 (=> res!162489 e!133704)))

(assert (=> b!194345 (= res!162489 (not (= (_1!9053 lt!302021) lt!302024)))))

(assert (=> b!194345 e!133703))

(declare-fun res!162486 () Bool)

(assert (=> b!194345 (=> (not res!162486) (not e!133703))))

(declare-fun lt!302022 () tuple2!16822)

(assert (=> b!194345 (= res!162486 (and (= (_2!9056 lt!302023) (_2!9056 lt!302022)) (= (_1!9056 lt!302023) (_1!9056 lt!302022))))))

(declare-fun lt!302046 () Unit!13734)

(declare-fun lt!302026 () (_ BitVec 64))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13734)

(assert (=> b!194345 (= lt!302046 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9053 lt!302032) nBits!348 i!590 lt!302026))))

(declare-fun lt!302047 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16822)

(assert (=> b!194345 (= lt!302022 (readNBitsLSBFirstsLoopPure!0 lt!302024 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302047))))

(assert (=> b!194345 (= lt!302024 (withMovedBitIndex!0 (_1!9053 lt!302032) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!194346 () Bool)

(assert (=> b!194346 (= e!133710 (= (_1!9056 lt!302023) (_2!9053 lt!302032)))))

(declare-fun b!194347 () Bool)

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!194347 (= e!133708 (= (bvand lt!302026 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194348 () Bool)

(assert (=> b!194348 (= e!133711 e!133707)))

(declare-fun res!162481 () Bool)

(assert (=> b!194348 (=> res!162481 e!133707)))

(assert (=> b!194348 (= res!162481 (not (= (_1!9056 lt!302037) (_2!9053 lt!302021))))))

(assert (=> b!194348 (= lt!302037 (readNBitsLSBFirstsLoopPure!0 (_1!9053 lt!302021) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302047))))

(declare-fun lt!302039 () (_ BitVec 64))

(assert (=> b!194348 (validate_offset_bits!1 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302034)))) ((_ sign_extend 32) (currentByte!9182 (_2!9054 lt!302035))) ((_ sign_extend 32) (currentBit!9177 (_2!9054 lt!302035))) lt!302039)))

(declare-fun lt!302038 () Unit!13734)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7926 array!9997 (_ BitVec 64)) Unit!13734)

(assert (=> b!194348 (= lt!302038 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9054 lt!302035) (buf!4892 (_2!9054 lt!302034)) lt!302039))))

(assert (=> b!194348 (= lt!302039 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!302019 () tuple2!16820)

(assert (=> b!194348 (= lt!302047 (bvor lt!302026 (ite (_2!9055 lt!302019) lt!302029 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194348 (= lt!302023 (readNBitsLSBFirstsLoopPure!0 (_1!9053 lt!302032) nBits!348 i!590 lt!302026))))

(assert (=> b!194348 (validate_offset_bits!1 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302034)))) ((_ sign_extend 32) (currentByte!9182 thiss!1204)) ((_ sign_extend 32) (currentBit!9177 thiss!1204)) lt!302031)))

(declare-fun lt!302028 () Unit!13734)

(assert (=> b!194348 (= lt!302028 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4892 (_2!9054 lt!302034)) lt!302031))))

(assert (=> b!194348 (= lt!302026 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!194348 (= (_2!9055 lt!302019) lt!302030)))

(assert (=> b!194348 (= lt!302019 (readBitPure!0 (_1!9053 lt!302032)))))

(declare-fun reader!0 (BitStream!7926 BitStream!7926) tuple2!16816)

(assert (=> b!194348 (= lt!302021 (reader!0 (_2!9054 lt!302035) (_2!9054 lt!302034)))))

(assert (=> b!194348 (= lt!302032 (reader!0 thiss!1204 (_2!9054 lt!302034)))))

(assert (=> b!194348 e!133715))

(declare-fun res!162478 () Bool)

(assert (=> b!194348 (=> (not res!162478) (not e!133715))))

(assert (=> b!194348 (= res!162478 (= (bitIndex!0 (size!4409 (buf!4892 (_1!9055 lt!302043))) (currentByte!9182 (_1!9055 lt!302043)) (currentBit!9177 (_1!9055 lt!302043))) (bitIndex!0 (size!4409 (buf!4892 (_1!9055 lt!302040))) (currentByte!9182 (_1!9055 lt!302040)) (currentBit!9177 (_1!9055 lt!302040)))))))

(declare-fun lt!302027 () Unit!13734)

(declare-fun lt!302042 () BitStream!7926)

(declare-fun readBitPrefixLemma!0 (BitStream!7926 BitStream!7926) Unit!13734)

(assert (=> b!194348 (= lt!302027 (readBitPrefixLemma!0 lt!302042 (_2!9054 lt!302034)))))

(assert (=> b!194348 (= lt!302040 (readBitPure!0 (BitStream!7927 (buf!4892 (_2!9054 lt!302034)) (currentByte!9182 thiss!1204) (currentBit!9177 thiss!1204))))))

(assert (=> b!194348 (= lt!302043 (readBitPure!0 lt!302042))))

(assert (=> b!194348 e!133706))

(declare-fun res!162482 () Bool)

(assert (=> b!194348 (=> (not res!162482) (not e!133706))))

(assert (=> b!194348 (= res!162482 (invariant!0 (currentBit!9177 thiss!1204) (currentByte!9182 thiss!1204) (size!4409 (buf!4892 (_2!9054 lt!302035)))))))

(assert (=> b!194348 (= lt!302042 (BitStream!7927 (buf!4892 (_2!9054 lt!302035)) (currentByte!9182 thiss!1204) (currentBit!9177 thiss!1204)))))

(assert (= (and start!41428 res!162498) b!194326))

(assert (= (and b!194326 res!162495) b!194343))

(assert (= (and b!194343 res!162490) b!194334))

(assert (= (and b!194334 res!162479) b!194325))

(assert (= (and b!194325 res!162492) b!194330))

(assert (= (and b!194330 res!162501) b!194337))

(assert (= (and b!194337 res!162488) b!194342))

(assert (= (and b!194342 res!162483) b!194327))

(assert (= (and b!194325 (not res!162484)) b!194336))

(assert (= (and b!194336 (not res!162496)) b!194341))

(assert (= (and b!194341 (not res!162499)) b!194333))

(assert (= (and b!194333 (not res!162477)) b!194332))

(assert (= (and b!194332 (not res!162493)) b!194340))

(assert (= (and b!194340 (not res!162485)) b!194348))

(assert (= (and b!194348 res!162482) b!194331))

(assert (= (and b!194348 res!162478) b!194338))

(assert (= (and b!194348 (not res!162481)) b!194345))

(assert (= (and b!194345 res!162486) b!194324))

(assert (= (and b!194324 res!162497) b!194339))

(assert (= (and b!194339 res!162487) b!194328))

(assert (= (and b!194345 (not res!162489)) b!194344))

(assert (= (and b!194344 (not res!162500)) b!194335))

(assert (= (and b!194335 res!162491) b!194329))

(assert (= (and b!194329 res!162480) b!194346))

(assert (= (and b!194335 (not res!162494)) b!194347))

(assert (= start!41428 b!194323))

(declare-fun m!301065 () Bool)

(assert (=> b!194331 m!301065))

(declare-fun m!301067 () Bool)

(assert (=> b!194348 m!301067))

(declare-fun m!301069 () Bool)

(assert (=> b!194348 m!301069))

(declare-fun m!301071 () Bool)

(assert (=> b!194348 m!301071))

(declare-fun m!301073 () Bool)

(assert (=> b!194348 m!301073))

(declare-fun m!301075 () Bool)

(assert (=> b!194348 m!301075))

(declare-fun m!301077 () Bool)

(assert (=> b!194348 m!301077))

(declare-fun m!301079 () Bool)

(assert (=> b!194348 m!301079))

(declare-fun m!301081 () Bool)

(assert (=> b!194348 m!301081))

(declare-fun m!301083 () Bool)

(assert (=> b!194348 m!301083))

(declare-fun m!301085 () Bool)

(assert (=> b!194348 m!301085))

(declare-fun m!301087 () Bool)

(assert (=> b!194348 m!301087))

(declare-fun m!301089 () Bool)

(assert (=> b!194348 m!301089))

(declare-fun m!301091 () Bool)

(assert (=> b!194348 m!301091))

(declare-fun m!301093 () Bool)

(assert (=> b!194348 m!301093))

(declare-fun m!301095 () Bool)

(assert (=> b!194348 m!301095))

(declare-fun m!301097 () Bool)

(assert (=> b!194348 m!301097))

(declare-fun m!301099 () Bool)

(assert (=> b!194341 m!301099))

(declare-fun m!301101 () Bool)

(assert (=> b!194327 m!301101))

(declare-fun m!301103 () Bool)

(assert (=> b!194323 m!301103))

(declare-fun m!301105 () Bool)

(assert (=> start!41428 m!301105))

(declare-fun m!301107 () Bool)

(assert (=> b!194343 m!301107))

(declare-fun m!301109 () Bool)

(assert (=> b!194342 m!301109))

(assert (=> b!194342 m!301109))

(declare-fun m!301111 () Bool)

(assert (=> b!194342 m!301111))

(declare-fun m!301113 () Bool)

(assert (=> b!194329 m!301113))

(declare-fun m!301115 () Bool)

(assert (=> b!194347 m!301115))

(declare-fun m!301117 () Bool)

(assert (=> b!194340 m!301117))

(declare-fun m!301119 () Bool)

(assert (=> b!194344 m!301119))

(declare-fun m!301121 () Bool)

(assert (=> b!194344 m!301121))

(declare-fun m!301123 () Bool)

(assert (=> b!194339 m!301123))

(declare-fun m!301125 () Bool)

(assert (=> b!194335 m!301125))

(assert (=> b!194337 m!301117))

(declare-fun m!301127 () Bool)

(assert (=> b!194330 m!301127))

(declare-fun m!301129 () Bool)

(assert (=> b!194330 m!301129))

(declare-fun m!301131 () Bool)

(assert (=> b!194324 m!301131))

(declare-fun m!301133 () Bool)

(assert (=> b!194336 m!301133))

(declare-fun m!301135 () Bool)

(assert (=> b!194336 m!301135))

(declare-fun m!301137 () Bool)

(assert (=> b!194336 m!301137))

(declare-fun m!301139 () Bool)

(assert (=> b!194336 m!301139))

(assert (=> b!194325 m!301127))

(assert (=> b!194325 m!301129))

(declare-fun m!301141 () Bool)

(assert (=> b!194325 m!301141))

(declare-fun m!301143 () Bool)

(assert (=> b!194326 m!301143))

(declare-fun m!301145 () Bool)

(assert (=> b!194345 m!301145))

(declare-fun m!301147 () Bool)

(assert (=> b!194345 m!301147))

(declare-fun m!301149 () Bool)

(assert (=> b!194345 m!301149))

(declare-fun m!301151 () Bool)

(assert (=> b!194332 m!301151))

(check-sat (not b!194342) (not b!194331) (not b!194347) (not b!194340) (not b!194326) (not b!194323) (not b!194335) (not b!194345) (not b!194327) (not b!194344) (not b!194329) (not b!194337) (not start!41428) (not b!194336) (not b!194339) (not b!194330) (not b!194348) (not b!194332) (not b!194325) (not b!194324) (not b!194341) (not b!194343))
(check-sat)
(get-model)

(declare-fun d!65949 () Bool)

(declare-fun res!162584 () Bool)

(declare-fun e!133772 () Bool)

(assert (=> d!65949 (=> (not res!162584) (not e!133772))))

(assert (=> d!65949 (= res!162584 (= (size!4409 (buf!4892 thiss!1204)) (size!4409 (buf!4892 (_2!9054 lt!302035)))))))

(assert (=> d!65949 (= (isPrefixOf!0 thiss!1204 (_2!9054 lt!302035)) e!133772)))

(declare-fun b!194433 () Bool)

(declare-fun res!162585 () Bool)

(assert (=> b!194433 (=> (not res!162585) (not e!133772))))

(assert (=> b!194433 (= res!162585 (bvsle (bitIndex!0 (size!4409 (buf!4892 thiss!1204)) (currentByte!9182 thiss!1204) (currentBit!9177 thiss!1204)) (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302035))) (currentByte!9182 (_2!9054 lt!302035)) (currentBit!9177 (_2!9054 lt!302035)))))))

(declare-fun b!194434 () Bool)

(declare-fun e!133771 () Bool)

(assert (=> b!194434 (= e!133772 e!133771)))

(declare-fun res!162583 () Bool)

(assert (=> b!194434 (=> res!162583 e!133771)))

(assert (=> b!194434 (= res!162583 (= (size!4409 (buf!4892 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!194435 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9997 array!9997 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!194435 (= e!133771 (arrayBitRangesEq!0 (buf!4892 thiss!1204) (buf!4892 (_2!9054 lt!302035)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4409 (buf!4892 thiss!1204)) (currentByte!9182 thiss!1204) (currentBit!9177 thiss!1204))))))

(assert (= (and d!65949 res!162584) b!194433))

(assert (= (and b!194433 res!162585) b!194434))

(assert (= (and b!194434 (not res!162583)) b!194435))

(assert (=> b!194433 m!301129))

(assert (=> b!194433 m!301127))

(assert (=> b!194435 m!301129))

(assert (=> b!194435 m!301129))

(declare-fun m!301241 () Bool)

(assert (=> b!194435 m!301241))

(assert (=> b!194337 d!65949))

(declare-fun d!65951 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!65951 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4409 (buf!4892 thiss!1204))) ((_ sign_extend 32) (currentByte!9182 thiss!1204)) ((_ sign_extend 32) (currentBit!9177 thiss!1204)) lt!302031) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4409 (buf!4892 thiss!1204))) ((_ sign_extend 32) (currentByte!9182 thiss!1204)) ((_ sign_extend 32) (currentBit!9177 thiss!1204))) lt!302031))))

(declare-fun bs!16398 () Bool)

(assert (= bs!16398 d!65951))

(declare-fun m!301243 () Bool)

(assert (=> bs!16398 m!301243))

(assert (=> b!194326 d!65951))

(declare-fun d!65953 () Bool)

(assert (=> d!65953 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590)) (ite (= (bvsub #b00000000000000000000000001000000 i!590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!590))))))))

(assert (=> b!194347 d!65953))

(declare-fun d!65955 () Bool)

(declare-fun e!133775 () Bool)

(assert (=> d!65955 e!133775))

(declare-fun res!162590 () Bool)

(assert (=> d!65955 (=> (not res!162590) (not e!133775))))

(declare-fun lt!302147 () (_ BitVec 64))

(declare-fun lt!302152 () (_ BitVec 64))

(declare-fun lt!302151 () (_ BitVec 64))

(assert (=> d!65955 (= res!162590 (= lt!302152 (bvsub lt!302147 lt!302151)))))

(assert (=> d!65955 (or (= (bvand lt!302147 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302151 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302147 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302147 lt!302151) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65955 (= lt!302151 (remainingBits!0 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302034)))) ((_ sign_extend 32) (currentByte!9182 (_2!9054 lt!302034))) ((_ sign_extend 32) (currentBit!9177 (_2!9054 lt!302034)))))))

(declare-fun lt!302148 () (_ BitVec 64))

(declare-fun lt!302149 () (_ BitVec 64))

(assert (=> d!65955 (= lt!302147 (bvmul lt!302148 lt!302149))))

(assert (=> d!65955 (or (= lt!302148 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!302149 (bvsdiv (bvmul lt!302148 lt!302149) lt!302148)))))

(assert (=> d!65955 (= lt!302149 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65955 (= lt!302148 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302034)))))))

(assert (=> d!65955 (= lt!302152 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9182 (_2!9054 lt!302034))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9177 (_2!9054 lt!302034)))))))

(assert (=> d!65955 (invariant!0 (currentBit!9177 (_2!9054 lt!302034)) (currentByte!9182 (_2!9054 lt!302034)) (size!4409 (buf!4892 (_2!9054 lt!302034))))))

(assert (=> d!65955 (= (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302034))) (currentByte!9182 (_2!9054 lt!302034)) (currentBit!9177 (_2!9054 lt!302034))) lt!302152)))

(declare-fun b!194440 () Bool)

(declare-fun res!162591 () Bool)

(assert (=> b!194440 (=> (not res!162591) (not e!133775))))

(assert (=> b!194440 (= res!162591 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!302152))))

(declare-fun b!194441 () Bool)

(declare-fun lt!302150 () (_ BitVec 64))

(assert (=> b!194441 (= e!133775 (bvsle lt!302152 (bvmul lt!302150 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194441 (or (= lt!302150 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!302150 #b0000000000000000000000000000000000000000000000000000000000001000) lt!302150)))))

(assert (=> b!194441 (= lt!302150 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302034)))))))

(assert (= (and d!65955 res!162590) b!194440))

(assert (= (and b!194440 res!162591) b!194441))

(declare-fun m!301245 () Bool)

(assert (=> d!65955 m!301245))

(assert (=> d!65955 m!301099))

(assert (=> b!194336 d!65955))

(declare-fun d!65957 () Bool)

(declare-fun res!162593 () Bool)

(declare-fun e!133777 () Bool)

(assert (=> d!65957 (=> (not res!162593) (not e!133777))))

(assert (=> d!65957 (= res!162593 (= (size!4409 (buf!4892 thiss!1204)) (size!4409 (buf!4892 (_2!9054 lt!302034)))))))

(assert (=> d!65957 (= (isPrefixOf!0 thiss!1204 (_2!9054 lt!302034)) e!133777)))

(declare-fun b!194442 () Bool)

(declare-fun res!162594 () Bool)

(assert (=> b!194442 (=> (not res!162594) (not e!133777))))

(assert (=> b!194442 (= res!162594 (bvsle (bitIndex!0 (size!4409 (buf!4892 thiss!1204)) (currentByte!9182 thiss!1204) (currentBit!9177 thiss!1204)) (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302034))) (currentByte!9182 (_2!9054 lt!302034)) (currentBit!9177 (_2!9054 lt!302034)))))))

(declare-fun b!194443 () Bool)

(declare-fun e!133776 () Bool)

(assert (=> b!194443 (= e!133777 e!133776)))

(declare-fun res!162592 () Bool)

(assert (=> b!194443 (=> res!162592 e!133776)))

(assert (=> b!194443 (= res!162592 (= (size!4409 (buf!4892 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!194444 () Bool)

(assert (=> b!194444 (= e!133776 (arrayBitRangesEq!0 (buf!4892 thiss!1204) (buf!4892 (_2!9054 lt!302034)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4409 (buf!4892 thiss!1204)) (currentByte!9182 thiss!1204) (currentBit!9177 thiss!1204))))))

(assert (= (and d!65957 res!162593) b!194442))

(assert (= (and b!194442 res!162594) b!194443))

(assert (= (and b!194443 (not res!162592)) b!194444))

(assert (=> b!194442 m!301129))

(assert (=> b!194442 m!301133))

(assert (=> b!194444 m!301129))

(assert (=> b!194444 m!301129))

(declare-fun m!301247 () Bool)

(assert (=> b!194444 m!301247))

(assert (=> b!194336 d!65957))

(declare-fun d!65959 () Bool)

(assert (=> d!65959 (isPrefixOf!0 thiss!1204 (_2!9054 lt!302034))))

(declare-fun lt!302155 () Unit!13734)

(declare-fun choose!30 (BitStream!7926 BitStream!7926 BitStream!7926) Unit!13734)

(assert (=> d!65959 (= lt!302155 (choose!30 thiss!1204 (_2!9054 lt!302035) (_2!9054 lt!302034)))))

(assert (=> d!65959 (isPrefixOf!0 thiss!1204 (_2!9054 lt!302035))))

(assert (=> d!65959 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9054 lt!302035) (_2!9054 lt!302034)) lt!302155)))

(declare-fun bs!16399 () Bool)

(assert (= bs!16399 d!65959))

(assert (=> bs!16399 m!301135))

(declare-fun m!301249 () Bool)

(assert (=> bs!16399 m!301249))

(assert (=> bs!16399 m!301117))

(assert (=> b!194336 d!65959))

(declare-fun b!194668 () Bool)

(declare-fun lt!302827 () tuple2!16820)

(declare-fun lt!302842 () tuple2!16818)

(assert (=> b!194668 (= lt!302827 (readBitPure!0 (readerFrom!0 (_2!9054 lt!302842) (currentBit!9177 (_2!9054 lt!302035)) (currentByte!9182 (_2!9054 lt!302035)))))))

(declare-fun lt!302797 () Bool)

(declare-fun res!162789 () Bool)

(assert (=> b!194668 (= res!162789 (and (= (_2!9055 lt!302827) lt!302797) (= (_1!9055 lt!302827) (_2!9054 lt!302842))))))

(declare-fun e!133916 () Bool)

(assert (=> b!194668 (=> (not res!162789) (not e!133916))))

(declare-fun e!133915 () Bool)

(assert (=> b!194668 (= e!133915 e!133916)))

(declare-fun b!194669 () Bool)

(declare-fun e!133913 () Bool)

(declare-fun lt!302836 () tuple2!16822)

(declare-fun lt!302818 () tuple2!16816)

(assert (=> b!194669 (= e!133913 (= (_1!9056 lt!302836) (_2!9053 lt!302818)))))

(declare-fun b!194670 () Bool)

(declare-fun e!133909 () tuple2!16818)

(declare-fun lt!302828 () tuple2!16818)

(assert (=> b!194670 (= e!133909 (tuple2!16819 (_1!9054 lt!302828) (_2!9054 lt!302828)))))

(assert (=> b!194670 (= lt!302797 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194670 (= lt!302842 (appendBit!0 (_2!9054 lt!302035) lt!302797))))

(declare-fun res!162787 () Bool)

(assert (=> b!194670 (= res!162787 (= (size!4409 (buf!4892 (_2!9054 lt!302035))) (size!4409 (buf!4892 (_2!9054 lt!302842)))))))

(assert (=> b!194670 (=> (not res!162787) (not e!133915))))

(assert (=> b!194670 e!133915))

(declare-fun lt!302832 () tuple2!16818)

(assert (=> b!194670 (= lt!302832 lt!302842)))

(assert (=> b!194670 (= lt!302828 (appendBitsLSBFirstLoopTR!0 (_2!9054 lt!302832) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!302813 () Unit!13734)

(assert (=> b!194670 (= lt!302813 (lemmaIsPrefixTransitive!0 (_2!9054 lt!302035) (_2!9054 lt!302832) (_2!9054 lt!302828)))))

(declare-fun call!3065 () Bool)

(assert (=> b!194670 call!3065))

(declare-fun lt!302829 () Unit!13734)

(assert (=> b!194670 (= lt!302829 lt!302813)))

(assert (=> b!194670 (invariant!0 (currentBit!9177 (_2!9054 lt!302035)) (currentByte!9182 (_2!9054 lt!302035)) (size!4409 (buf!4892 (_2!9054 lt!302832))))))

(declare-fun lt!302808 () BitStream!7926)

(assert (=> b!194670 (= lt!302808 (BitStream!7927 (buf!4892 (_2!9054 lt!302832)) (currentByte!9182 (_2!9054 lt!302035)) (currentBit!9177 (_2!9054 lt!302035))))))

(assert (=> b!194670 (invariant!0 (currentBit!9177 lt!302808) (currentByte!9182 lt!302808) (size!4409 (buf!4892 (_2!9054 lt!302828))))))

(declare-fun lt!302849 () BitStream!7926)

(assert (=> b!194670 (= lt!302849 (BitStream!7927 (buf!4892 (_2!9054 lt!302828)) (currentByte!9182 lt!302808) (currentBit!9177 lt!302808)))))

(declare-fun lt!302814 () tuple2!16820)

(assert (=> b!194670 (= lt!302814 (readBitPure!0 lt!302808))))

(declare-fun lt!302816 () tuple2!16820)

(assert (=> b!194670 (= lt!302816 (readBitPure!0 lt!302849))))

(declare-fun lt!302831 () Unit!13734)

(assert (=> b!194670 (= lt!302831 (readBitPrefixLemma!0 lt!302808 (_2!9054 lt!302828)))))

(declare-fun res!162791 () Bool)

(assert (=> b!194670 (= res!162791 (= (bitIndex!0 (size!4409 (buf!4892 (_1!9055 lt!302814))) (currentByte!9182 (_1!9055 lt!302814)) (currentBit!9177 (_1!9055 lt!302814))) (bitIndex!0 (size!4409 (buf!4892 (_1!9055 lt!302816))) (currentByte!9182 (_1!9055 lt!302816)) (currentBit!9177 (_1!9055 lt!302816)))))))

(declare-fun e!133914 () Bool)

(assert (=> b!194670 (=> (not res!162791) (not e!133914))))

(assert (=> b!194670 e!133914))

(declare-fun lt!302843 () Unit!13734)

(assert (=> b!194670 (= lt!302843 lt!302831)))

(declare-fun lt!302810 () tuple2!16816)

(assert (=> b!194670 (= lt!302810 (reader!0 (_2!9054 lt!302035) (_2!9054 lt!302828)))))

(declare-fun lt!302839 () tuple2!16816)

(assert (=> b!194670 (= lt!302839 (reader!0 (_2!9054 lt!302832) (_2!9054 lt!302828)))))

(declare-fun lt!302806 () tuple2!16820)

(assert (=> b!194670 (= lt!302806 (readBitPure!0 (_1!9053 lt!302810)))))

(assert (=> b!194670 (= (_2!9055 lt!302806) lt!302797)))

(declare-fun lt!302830 () Unit!13734)

(declare-fun Unit!13762 () Unit!13734)

(assert (=> b!194670 (= lt!302830 Unit!13762)))

(declare-fun lt!302841 () (_ BitVec 64))

(assert (=> b!194670 (= lt!302841 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!302833 () (_ BitVec 64))

(assert (=> b!194670 (= lt!302833 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!302823 () Unit!13734)

(assert (=> b!194670 (= lt!302823 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9054 lt!302035) (buf!4892 (_2!9054 lt!302828)) lt!302833))))

(assert (=> b!194670 (validate_offset_bits!1 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302828)))) ((_ sign_extend 32) (currentByte!9182 (_2!9054 lt!302035))) ((_ sign_extend 32) (currentBit!9177 (_2!9054 lt!302035))) lt!302833)))

(declare-fun lt!302817 () Unit!13734)

(assert (=> b!194670 (= lt!302817 lt!302823)))

(declare-fun lt!302799 () tuple2!16822)

(assert (=> b!194670 (= lt!302799 (readNBitsLSBFirstsLoopPure!0 (_1!9053 lt!302810) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302841))))

(declare-fun lt!302822 () (_ BitVec 64))

(assert (=> b!194670 (= lt!302822 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!302845 () Unit!13734)

(assert (=> b!194670 (= lt!302845 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9054 lt!302832) (buf!4892 (_2!9054 lt!302828)) lt!302822))))

(assert (=> b!194670 (validate_offset_bits!1 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302828)))) ((_ sign_extend 32) (currentByte!9182 (_2!9054 lt!302832))) ((_ sign_extend 32) (currentBit!9177 (_2!9054 lt!302832))) lt!302822)))

(declare-fun lt!302846 () Unit!13734)

(assert (=> b!194670 (= lt!302846 lt!302845)))

(declare-fun lt!302800 () tuple2!16822)

(assert (=> b!194670 (= lt!302800 (readNBitsLSBFirstsLoopPure!0 (_1!9053 lt!302839) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!302841 (ite (_2!9055 lt!302806) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!302820 () tuple2!16822)

(assert (=> b!194670 (= lt!302820 (readNBitsLSBFirstsLoopPure!0 (_1!9053 lt!302810) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302841))))

(declare-fun c!9726 () Bool)

(assert (=> b!194670 (= c!9726 (_2!9055 (readBitPure!0 (_1!9053 lt!302810))))))

(declare-fun lt!302835 () tuple2!16822)

(declare-fun e!133912 () (_ BitVec 64))

(assert (=> b!194670 (= lt!302835 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9053 lt!302810) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!302841 e!133912)))))

(declare-fun lt!302811 () Unit!13734)

(assert (=> b!194670 (= lt!302811 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9053 lt!302810) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302841))))

(assert (=> b!194670 (and (= (_2!9056 lt!302820) (_2!9056 lt!302835)) (= (_1!9056 lt!302820) (_1!9056 lt!302835)))))

(declare-fun lt!302809 () Unit!13734)

(assert (=> b!194670 (= lt!302809 lt!302811)))

(assert (=> b!194670 (= (_1!9053 lt!302810) (withMovedBitIndex!0 (_2!9053 lt!302810) (bvsub (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302035))) (currentByte!9182 (_2!9054 lt!302035)) (currentBit!9177 (_2!9054 lt!302035))) (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302828))) (currentByte!9182 (_2!9054 lt!302828)) (currentBit!9177 (_2!9054 lt!302828))))))))

(declare-fun lt!302802 () Unit!13734)

(declare-fun Unit!13763 () Unit!13734)

(assert (=> b!194670 (= lt!302802 Unit!13763)))

(assert (=> b!194670 (= (_1!9053 lt!302839) (withMovedBitIndex!0 (_2!9053 lt!302839) (bvsub (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302832))) (currentByte!9182 (_2!9054 lt!302832)) (currentBit!9177 (_2!9054 lt!302832))) (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302828))) (currentByte!9182 (_2!9054 lt!302828)) (currentBit!9177 (_2!9054 lt!302828))))))))

(declare-fun lt!302850 () Unit!13734)

(declare-fun Unit!13764 () Unit!13734)

(assert (=> b!194670 (= lt!302850 Unit!13764)))

(assert (=> b!194670 (= (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302035))) (currentByte!9182 (_2!9054 lt!302035)) (currentBit!9177 (_2!9054 lt!302035))) (bvsub (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302832))) (currentByte!9182 (_2!9054 lt!302832)) (currentBit!9177 (_2!9054 lt!302832))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!302838 () Unit!13734)

(declare-fun Unit!13765 () Unit!13734)

(assert (=> b!194670 (= lt!302838 Unit!13765)))

(assert (=> b!194670 (= (_2!9056 lt!302799) (_2!9056 lt!302800))))

(declare-fun lt!302847 () Unit!13734)

(declare-fun Unit!13766 () Unit!13734)

(assert (=> b!194670 (= lt!302847 Unit!13766)))

(assert (=> b!194670 (invariant!0 (currentBit!9177 (_2!9054 lt!302828)) (currentByte!9182 (_2!9054 lt!302828)) (size!4409 (buf!4892 (_2!9054 lt!302828))))))

(declare-fun lt!302826 () Unit!13734)

(declare-fun Unit!13767 () Unit!13734)

(assert (=> b!194670 (= lt!302826 Unit!13767)))

(assert (=> b!194670 (= (size!4409 (buf!4892 (_2!9054 lt!302035))) (size!4409 (buf!4892 (_2!9054 lt!302828))))))

(declare-fun lt!302804 () Unit!13734)

(declare-fun Unit!13768 () Unit!13734)

(assert (=> b!194670 (= lt!302804 Unit!13768)))

(assert (=> b!194670 (= (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302828))) (currentByte!9182 (_2!9054 lt!302828)) (currentBit!9177 (_2!9054 lt!302828))) (bvsub (bvadd (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302035))) (currentByte!9182 (_2!9054 lt!302035)) (currentBit!9177 (_2!9054 lt!302035))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!302798 () Unit!13734)

(declare-fun Unit!13769 () Unit!13734)

(assert (=> b!194670 (= lt!302798 Unit!13769)))

(declare-fun lt!302801 () Unit!13734)

(declare-fun Unit!13770 () Unit!13734)

(assert (=> b!194670 (= lt!302801 Unit!13770)))

(assert (=> b!194670 (= lt!302818 (reader!0 (_2!9054 lt!302035) (_2!9054 lt!302828)))))

(declare-fun lt!302807 () (_ BitVec 64))

(assert (=> b!194670 (= lt!302807 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!302815 () Unit!13734)

(assert (=> b!194670 (= lt!302815 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9054 lt!302035) (buf!4892 (_2!9054 lt!302828)) lt!302807))))

(assert (=> b!194670 (validate_offset_bits!1 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302828)))) ((_ sign_extend 32) (currentByte!9182 (_2!9054 lt!302035))) ((_ sign_extend 32) (currentBit!9177 (_2!9054 lt!302035))) lt!302807)))

(declare-fun lt!302795 () Unit!13734)

(assert (=> b!194670 (= lt!302795 lt!302815)))

(assert (=> b!194670 (= lt!302836 (readNBitsLSBFirstsLoopPure!0 (_1!9053 lt!302818) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!162786 () Bool)

(assert (=> b!194670 (= res!162786 (= (_2!9056 lt!302836) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!194670 (=> (not res!162786) (not e!133913))))

(assert (=> b!194670 e!133913))

(declare-fun lt!302803 () Unit!13734)

(declare-fun Unit!13771 () Unit!13734)

(assert (=> b!194670 (= lt!302803 Unit!13771)))

(declare-fun b!194671 () Bool)

(declare-fun e!133911 () Bool)

(declare-fun lt!302796 () tuple2!16822)

(declare-fun lt!302834 () tuple2!16816)

(assert (=> b!194671 (= e!133911 (= (_1!9056 lt!302796) (_2!9053 lt!302834)))))

(declare-fun d!65961 () Bool)

(declare-fun e!133908 () Bool)

(assert (=> d!65961 e!133908))

(declare-fun res!162792 () Bool)

(assert (=> d!65961 (=> (not res!162792) (not e!133908))))

(declare-fun lt!302840 () tuple2!16818)

(assert (=> d!65961 (= res!162792 (invariant!0 (currentBit!9177 (_2!9054 lt!302840)) (currentByte!9182 (_2!9054 lt!302840)) (size!4409 (buf!4892 (_2!9054 lt!302840)))))))

(assert (=> d!65961 (= lt!302840 e!133909)))

(declare-fun c!9727 () Bool)

(assert (=> d!65961 (= c!9727 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!65961 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!65961 (= (appendBitsLSBFirstLoopTR!0 (_2!9054 lt!302035) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!302840)))

(declare-fun b!194672 () Bool)

(declare-fun res!162788 () Bool)

(assert (=> b!194672 (=> (not res!162788) (not e!133908))))

(assert (=> b!194672 (= res!162788 (isPrefixOf!0 (_2!9054 lt!302035) (_2!9054 lt!302840)))))

(declare-fun b!194673 () Bool)

(declare-fun res!162790 () Bool)

(assert (=> b!194673 (=> (not res!162790) (not e!133908))))

(declare-fun lt!302812 () (_ BitVec 64))

(declare-fun lt!302824 () (_ BitVec 64))

(assert (=> b!194673 (= res!162790 (= (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302840))) (currentByte!9182 (_2!9054 lt!302840)) (currentBit!9177 (_2!9054 lt!302840))) (bvsub lt!302812 lt!302824)))))

(assert (=> b!194673 (or (= (bvand lt!302812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302824 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302812 lt!302824) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194673 (= lt!302824 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!302848 () (_ BitVec 64))

(declare-fun lt!302821 () (_ BitVec 64))

(assert (=> b!194673 (= lt!302812 (bvadd lt!302848 lt!302821))))

(assert (=> b!194673 (or (not (= (bvand lt!302848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302821 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!302848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!302848 lt!302821) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194673 (= lt!302821 ((_ sign_extend 32) nBits!348))))

(assert (=> b!194673 (= lt!302848 (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302035))) (currentByte!9182 (_2!9054 lt!302035)) (currentBit!9177 (_2!9054 lt!302035))))))

(declare-fun b!194674 () Bool)

(declare-fun res!162796 () Bool)

(assert (=> b!194674 (= res!162796 (isPrefixOf!0 (_2!9054 lt!302035) (_2!9054 lt!302842)))))

(assert (=> b!194674 (=> (not res!162796) (not e!133915))))

(declare-fun b!194675 () Bool)

(assert (=> b!194675 (= e!133908 e!133911)))

(declare-fun res!162795 () Bool)

(assert (=> b!194675 (=> (not res!162795) (not e!133911))))

(assert (=> b!194675 (= res!162795 (= (_2!9056 lt!302796) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!194675 (= lt!302796 (readNBitsLSBFirstsLoopPure!0 (_1!9053 lt!302834) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!302819 () Unit!13734)

(declare-fun lt!302825 () Unit!13734)

(assert (=> b!194675 (= lt!302819 lt!302825)))

(declare-fun lt!302837 () (_ BitVec 64))

(assert (=> b!194675 (validate_offset_bits!1 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302840)))) ((_ sign_extend 32) (currentByte!9182 (_2!9054 lt!302035))) ((_ sign_extend 32) (currentBit!9177 (_2!9054 lt!302035))) lt!302837)))

(assert (=> b!194675 (= lt!302825 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9054 lt!302035) (buf!4892 (_2!9054 lt!302840)) lt!302837))))

(declare-fun e!133910 () Bool)

(assert (=> b!194675 e!133910))

(declare-fun res!162794 () Bool)

(assert (=> b!194675 (=> (not res!162794) (not e!133910))))

(assert (=> b!194675 (= res!162794 (and (= (size!4409 (buf!4892 (_2!9054 lt!302035))) (size!4409 (buf!4892 (_2!9054 lt!302840)))) (bvsge lt!302837 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194675 (= lt!302837 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!194675 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!194675 (= lt!302834 (reader!0 (_2!9054 lt!302035) (_2!9054 lt!302840)))))

(declare-fun b!194676 () Bool)

(assert (=> b!194676 (= e!133914 (= (_2!9055 lt!302814) (_2!9055 lt!302816)))))

(declare-fun b!194677 () Bool)

(assert (=> b!194677 (= e!133912 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!194678 () Bool)

(assert (=> b!194678 (= e!133916 (= (bitIndex!0 (size!4409 (buf!4892 (_1!9055 lt!302827))) (currentByte!9182 (_1!9055 lt!302827)) (currentBit!9177 (_1!9055 lt!302827))) (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302842))) (currentByte!9182 (_2!9054 lt!302842)) (currentBit!9177 (_2!9054 lt!302842)))))))

(declare-fun b!194679 () Bool)

(declare-fun res!162793 () Bool)

(assert (=> b!194679 (=> (not res!162793) (not e!133908))))

(assert (=> b!194679 (= res!162793 (= (size!4409 (buf!4892 (_2!9054 lt!302035))) (size!4409 (buf!4892 (_2!9054 lt!302840)))))))

(declare-fun b!194680 () Bool)

(assert (=> b!194680 (= e!133910 (validate_offset_bits!1 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302035)))) ((_ sign_extend 32) (currentByte!9182 (_2!9054 lt!302035))) ((_ sign_extend 32) (currentBit!9177 (_2!9054 lt!302035))) lt!302837))))

(declare-fun b!194681 () Bool)

(assert (=> b!194681 (= e!133912 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!194682 () Bool)

(declare-fun res!162797 () Bool)

(assert (=> b!194682 (= res!162797 (= (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302842))) (currentByte!9182 (_2!9054 lt!302842)) (currentBit!9177 (_2!9054 lt!302842))) (bvadd (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302035))) (currentByte!9182 (_2!9054 lt!302035)) (currentBit!9177 (_2!9054 lt!302035))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!194682 (=> (not res!162797) (not e!133915))))

(declare-fun b!194683 () Bool)

(declare-fun Unit!13772 () Unit!13734)

(assert (=> b!194683 (= e!133909 (tuple2!16819 Unit!13772 (_2!9054 lt!302035)))))

(declare-fun lt!302844 () Unit!13734)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7926) Unit!13734)

(assert (=> b!194683 (= lt!302844 (lemmaIsPrefixRefl!0 (_2!9054 lt!302035)))))

(assert (=> b!194683 call!3065))

(declare-fun lt!302805 () Unit!13734)

(assert (=> b!194683 (= lt!302805 lt!302844)))

(declare-fun bm!3062 () Bool)

(assert (=> bm!3062 (= call!3065 (isPrefixOf!0 (_2!9054 lt!302035) (ite c!9727 (_2!9054 lt!302035) (_2!9054 lt!302828))))))

(assert (= (and d!65961 c!9727) b!194683))

(assert (= (and d!65961 (not c!9727)) b!194670))

(assert (= (and b!194670 res!162787) b!194682))

(assert (= (and b!194682 res!162797) b!194674))

(assert (= (and b!194674 res!162796) b!194668))

(assert (= (and b!194668 res!162789) b!194678))

(assert (= (and b!194670 res!162791) b!194676))

(assert (= (and b!194670 c!9726) b!194681))

(assert (= (and b!194670 (not c!9726)) b!194677))

(assert (= (and b!194670 res!162786) b!194669))

(assert (= (or b!194683 b!194670) bm!3062))

(assert (= (and d!65961 res!162792) b!194679))

(assert (= (and b!194679 res!162793) b!194673))

(assert (= (and b!194673 res!162790) b!194672))

(assert (= (and b!194672 res!162788) b!194675))

(assert (= (and b!194675 res!162794) b!194680))

(assert (= (and b!194675 res!162795) b!194671))

(declare-fun m!301593 () Bool)

(assert (=> b!194682 m!301593))

(assert (=> b!194682 m!301127))

(declare-fun m!301595 () Bool)

(assert (=> b!194668 m!301595))

(assert (=> b!194668 m!301595))

(declare-fun m!301597 () Bool)

(assert (=> b!194668 m!301597))

(declare-fun m!301599 () Bool)

(assert (=> b!194675 m!301599))

(declare-fun m!301601 () Bool)

(assert (=> b!194675 m!301601))

(declare-fun m!301603 () Bool)

(assert (=> b!194675 m!301603))

(assert (=> b!194675 m!301113))

(declare-fun m!301605 () Bool)

(assert (=> b!194675 m!301605))

(declare-fun m!301607 () Bool)

(assert (=> b!194675 m!301607))

(declare-fun m!301609 () Bool)

(assert (=> bm!3062 m!301609))

(declare-fun m!301611 () Bool)

(assert (=> b!194683 m!301611))

(declare-fun m!301613 () Bool)

(assert (=> b!194680 m!301613))

(declare-fun m!301615 () Bool)

(assert (=> b!194673 m!301615))

(assert (=> b!194673 m!301127))

(declare-fun m!301617 () Bool)

(assert (=> d!65961 m!301617))

(declare-fun m!301619 () Bool)

(assert (=> b!194678 m!301619))

(assert (=> b!194678 m!301593))

(declare-fun m!301621 () Bool)

(assert (=> b!194674 m!301621))

(declare-fun m!301623 () Bool)

(assert (=> b!194670 m!301623))

(declare-fun m!301625 () Bool)

(assert (=> b!194670 m!301625))

(declare-fun m!301627 () Bool)

(assert (=> b!194670 m!301627))

(declare-fun m!301629 () Bool)

(assert (=> b!194670 m!301629))

(assert (=> b!194670 m!301605))

(declare-fun m!301631 () Bool)

(assert (=> b!194670 m!301631))

(declare-fun m!301633 () Bool)

(assert (=> b!194670 m!301633))

(declare-fun m!301635 () Bool)

(assert (=> b!194670 m!301635))

(declare-fun m!301637 () Bool)

(assert (=> b!194670 m!301637))

(declare-fun m!301639 () Bool)

(assert (=> b!194670 m!301639))

(declare-fun m!301641 () Bool)

(assert (=> b!194670 m!301641))

(declare-fun m!301643 () Bool)

(assert (=> b!194670 m!301643))

(declare-fun m!301645 () Bool)

(assert (=> b!194670 m!301645))

(declare-fun m!301647 () Bool)

(assert (=> b!194670 m!301647))

(declare-fun m!301649 () Bool)

(assert (=> b!194670 m!301649))

(declare-fun m!301651 () Bool)

(assert (=> b!194670 m!301651))

(declare-fun m!301653 () Bool)

(assert (=> b!194670 m!301653))

(declare-fun m!301655 () Bool)

(assert (=> b!194670 m!301655))

(declare-fun m!301657 () Bool)

(assert (=> b!194670 m!301657))

(declare-fun m!301659 () Bool)

(assert (=> b!194670 m!301659))

(declare-fun m!301661 () Bool)

(assert (=> b!194670 m!301661))

(declare-fun m!301663 () Bool)

(assert (=> b!194670 m!301663))

(assert (=> b!194670 m!301127))

(declare-fun m!301665 () Bool)

(assert (=> b!194670 m!301665))

(declare-fun m!301667 () Bool)

(assert (=> b!194670 m!301667))

(assert (=> b!194670 m!301665))

(declare-fun m!301669 () Bool)

(assert (=> b!194670 m!301669))

(declare-fun m!301671 () Bool)

(assert (=> b!194670 m!301671))

(declare-fun m!301673 () Bool)

(assert (=> b!194670 m!301673))

(assert (=> b!194670 m!301113))

(declare-fun m!301675 () Bool)

(assert (=> b!194670 m!301675))

(declare-fun m!301677 () Bool)

(assert (=> b!194670 m!301677))

(declare-fun m!301679 () Bool)

(assert (=> b!194670 m!301679))

(declare-fun m!301681 () Bool)

(assert (=> b!194670 m!301681))

(declare-fun m!301683 () Bool)

(assert (=> b!194672 m!301683))

(assert (=> b!194336 d!65961))

(declare-fun d!66091 () Bool)

(declare-fun e!133924 () Bool)

(assert (=> d!66091 e!133924))

(declare-fun res!162809 () Bool)

(assert (=> d!66091 (=> (not res!162809) (not e!133924))))

(declare-fun lt!302911 () (_ BitVec 64))

(declare-fun lt!302906 () (_ BitVec 64))

(declare-fun lt!302910 () (_ BitVec 64))

(assert (=> d!66091 (= res!162809 (= lt!302911 (bvsub lt!302906 lt!302910)))))

(assert (=> d!66091 (or (= (bvand lt!302906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302910 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302906 lt!302910) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66091 (= lt!302910 (remainingBits!0 ((_ sign_extend 32) (size!4409 (buf!4892 (_1!9055 lt!302044)))) ((_ sign_extend 32) (currentByte!9182 (_1!9055 lt!302044))) ((_ sign_extend 32) (currentBit!9177 (_1!9055 lt!302044)))))))

(declare-fun lt!302907 () (_ BitVec 64))

(declare-fun lt!302908 () (_ BitVec 64))

(assert (=> d!66091 (= lt!302906 (bvmul lt!302907 lt!302908))))

(assert (=> d!66091 (or (= lt!302907 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!302908 (bvsdiv (bvmul lt!302907 lt!302908) lt!302907)))))

(assert (=> d!66091 (= lt!302908 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66091 (= lt!302907 ((_ sign_extend 32) (size!4409 (buf!4892 (_1!9055 lt!302044)))))))

(assert (=> d!66091 (= lt!302911 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9182 (_1!9055 lt!302044))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9177 (_1!9055 lt!302044)))))))

(assert (=> d!66091 (invariant!0 (currentBit!9177 (_1!9055 lt!302044)) (currentByte!9182 (_1!9055 lt!302044)) (size!4409 (buf!4892 (_1!9055 lt!302044))))))

(assert (=> d!66091 (= (bitIndex!0 (size!4409 (buf!4892 (_1!9055 lt!302044))) (currentByte!9182 (_1!9055 lt!302044)) (currentBit!9177 (_1!9055 lt!302044))) lt!302911)))

(declare-fun b!194699 () Bool)

(declare-fun res!162810 () Bool)

(assert (=> b!194699 (=> (not res!162810) (not e!133924))))

(assert (=> b!194699 (= res!162810 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!302911))))

(declare-fun b!194700 () Bool)

(declare-fun lt!302909 () (_ BitVec 64))

(assert (=> b!194700 (= e!133924 (bvsle lt!302911 (bvmul lt!302909 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194700 (or (= lt!302909 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!302909 #b0000000000000000000000000000000000000000000000000000000000001000) lt!302909)))))

(assert (=> b!194700 (= lt!302909 ((_ sign_extend 32) (size!4409 (buf!4892 (_1!9055 lt!302044)))))))

(assert (= (and d!66091 res!162809) b!194699))

(assert (= (and b!194699 res!162810) b!194700))

(declare-fun m!301685 () Bool)

(assert (=> d!66091 m!301685))

(declare-fun m!301687 () Bool)

(assert (=> d!66091 m!301687))

(assert (=> b!194327 d!66091))

(declare-fun d!66093 () Bool)

(declare-fun e!133932 () Bool)

(assert (=> d!66093 e!133932))

(declare-fun res!162821 () Bool)

(assert (=> d!66093 (=> (not res!162821) (not e!133932))))

(declare-fun lt!302969 () tuple2!16820)

(declare-fun lt!302972 () tuple2!16820)

(assert (=> d!66093 (= res!162821 (= (bitIndex!0 (size!4409 (buf!4892 (_1!9055 lt!302969))) (currentByte!9182 (_1!9055 lt!302969)) (currentBit!9177 (_1!9055 lt!302969))) (bitIndex!0 (size!4409 (buf!4892 (_1!9055 lt!302972))) (currentByte!9182 (_1!9055 lt!302972)) (currentBit!9177 (_1!9055 lt!302972)))))))

(declare-fun lt!302971 () Unit!13734)

(declare-fun lt!302970 () BitStream!7926)

(declare-fun choose!50 (BitStream!7926 BitStream!7926 BitStream!7926 tuple2!16820 tuple2!16820 BitStream!7926 Bool tuple2!16820 tuple2!16820 BitStream!7926 Bool) Unit!13734)

(assert (=> d!66093 (= lt!302971 (choose!50 lt!302042 (_2!9054 lt!302034) lt!302970 lt!302969 (tuple2!16821 (_1!9055 lt!302969) (_2!9055 lt!302969)) (_1!9055 lt!302969) (_2!9055 lt!302969) lt!302972 (tuple2!16821 (_1!9055 lt!302972) (_2!9055 lt!302972)) (_1!9055 lt!302972) (_2!9055 lt!302972)))))

(assert (=> d!66093 (= lt!302972 (readBitPure!0 lt!302970))))

(assert (=> d!66093 (= lt!302969 (readBitPure!0 lt!302042))))

(assert (=> d!66093 (= lt!302970 (BitStream!7927 (buf!4892 (_2!9054 lt!302034)) (currentByte!9182 lt!302042) (currentBit!9177 lt!302042)))))

(assert (=> d!66093 (invariant!0 (currentBit!9177 lt!302042) (currentByte!9182 lt!302042) (size!4409 (buf!4892 (_2!9054 lt!302034))))))

(assert (=> d!66093 (= (readBitPrefixLemma!0 lt!302042 (_2!9054 lt!302034)) lt!302971)))

(declare-fun b!194715 () Bool)

(assert (=> b!194715 (= e!133932 (= (_2!9055 lt!302969) (_2!9055 lt!302972)))))

(assert (= (and d!66093 res!162821) b!194715))

(declare-fun m!301755 () Bool)

(assert (=> d!66093 m!301755))

(declare-fun m!301757 () Bool)

(assert (=> d!66093 m!301757))

(declare-fun m!301759 () Bool)

(assert (=> d!66093 m!301759))

(assert (=> d!66093 m!301071))

(declare-fun m!301761 () Bool)

(assert (=> d!66093 m!301761))

(declare-fun m!301763 () Bool)

(assert (=> d!66093 m!301763))

(assert (=> b!194348 d!66093))

(declare-fun d!66109 () Bool)

(assert (=> d!66109 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!194348 d!66109))

(declare-fun d!66111 () Bool)

(declare-datatypes ((tuple2!16840 0))(
  ( (tuple2!16841 (_1!9065 (_ BitVec 64)) (_2!9065 BitStream!7926)) )
))
(declare-fun lt!302988 () tuple2!16840)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16840)

(assert (=> d!66111 (= lt!302988 (readNBitsLSBFirstsLoop!0 (_1!9053 lt!302032) nBits!348 i!590 lt!302026))))

(assert (=> d!66111 (= (readNBitsLSBFirstsLoopPure!0 (_1!9053 lt!302032) nBits!348 i!590 lt!302026) (tuple2!16823 (_2!9065 lt!302988) (_1!9065 lt!302988)))))

(declare-fun bs!16426 () Bool)

(assert (= bs!16426 d!66111))

(declare-fun m!301777 () Bool)

(assert (=> bs!16426 m!301777))

(assert (=> b!194348 d!66111))

(declare-fun d!66117 () Bool)

(declare-datatypes ((tuple2!16842 0))(
  ( (tuple2!16843 (_1!9066 Bool) (_2!9066 BitStream!7926)) )
))
(declare-fun lt!303031 () tuple2!16842)

(declare-fun readBit!0 (BitStream!7926) tuple2!16842)

(assert (=> d!66117 (= lt!303031 (readBit!0 (_1!9053 lt!302032)))))

(assert (=> d!66117 (= (readBitPure!0 (_1!9053 lt!302032)) (tuple2!16821 (_2!9066 lt!303031) (_1!9066 lt!303031)))))

(declare-fun bs!16427 () Bool)

(assert (= bs!16427 d!66117))

(declare-fun m!301779 () Bool)

(assert (=> bs!16427 m!301779))

(assert (=> b!194348 d!66117))

(declare-fun d!66119 () Bool)

(assert (=> d!66119 (= (invariant!0 (currentBit!9177 thiss!1204) (currentByte!9182 thiss!1204) (size!4409 (buf!4892 (_2!9054 lt!302035)))) (and (bvsge (currentBit!9177 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9177 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9182 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9182 thiss!1204) (size!4409 (buf!4892 (_2!9054 lt!302035)))) (and (= (currentBit!9177 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9182 thiss!1204) (size!4409 (buf!4892 (_2!9054 lt!302035))))))))))

(assert (=> b!194348 d!66119))

(declare-fun b!194762 () Bool)

(declare-fun res!162856 () Bool)

(declare-fun e!133957 () Bool)

(assert (=> b!194762 (=> (not res!162856) (not e!133957))))

(declare-fun lt!303147 () tuple2!16816)

(assert (=> b!194762 (= res!162856 (isPrefixOf!0 (_2!9053 lt!303147) (_2!9054 lt!302034)))))

(declare-fun b!194763 () Bool)

(declare-fun e!133958 () Unit!13734)

(declare-fun Unit!13774 () Unit!13734)

(assert (=> b!194763 (= e!133958 Unit!13774)))

(declare-fun b!194764 () Bool)

(declare-fun res!162857 () Bool)

(assert (=> b!194764 (=> (not res!162857) (not e!133957))))

(assert (=> b!194764 (= res!162857 (isPrefixOf!0 (_1!9053 lt!303147) thiss!1204))))

(declare-fun b!194765 () Bool)

(declare-fun lt!303150 () Unit!13734)

(assert (=> b!194765 (= e!133958 lt!303150)))

(declare-fun lt!303153 () (_ BitVec 64))

(assert (=> b!194765 (= lt!303153 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!303154 () (_ BitVec 64))

(assert (=> b!194765 (= lt!303154 (bitIndex!0 (size!4409 (buf!4892 thiss!1204)) (currentByte!9182 thiss!1204) (currentBit!9177 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9997 array!9997 (_ BitVec 64) (_ BitVec 64)) Unit!13734)

(assert (=> b!194765 (= lt!303150 (arrayBitRangesEqSymmetric!0 (buf!4892 thiss!1204) (buf!4892 (_2!9054 lt!302034)) lt!303153 lt!303154))))

(assert (=> b!194765 (arrayBitRangesEq!0 (buf!4892 (_2!9054 lt!302034)) (buf!4892 thiss!1204) lt!303153 lt!303154)))

(declare-fun d!66121 () Bool)

(assert (=> d!66121 e!133957))

(declare-fun res!162858 () Bool)

(assert (=> d!66121 (=> (not res!162858) (not e!133957))))

(assert (=> d!66121 (= res!162858 (isPrefixOf!0 (_1!9053 lt!303147) (_2!9053 lt!303147)))))

(declare-fun lt!303158 () BitStream!7926)

(assert (=> d!66121 (= lt!303147 (tuple2!16817 lt!303158 (_2!9054 lt!302034)))))

(declare-fun lt!303152 () Unit!13734)

(declare-fun lt!303157 () Unit!13734)

(assert (=> d!66121 (= lt!303152 lt!303157)))

(assert (=> d!66121 (isPrefixOf!0 lt!303158 (_2!9054 lt!302034))))

(assert (=> d!66121 (= lt!303157 (lemmaIsPrefixTransitive!0 lt!303158 (_2!9054 lt!302034) (_2!9054 lt!302034)))))

(declare-fun lt!303161 () Unit!13734)

(declare-fun lt!303151 () Unit!13734)

(assert (=> d!66121 (= lt!303161 lt!303151)))

(assert (=> d!66121 (isPrefixOf!0 lt!303158 (_2!9054 lt!302034))))

(assert (=> d!66121 (= lt!303151 (lemmaIsPrefixTransitive!0 lt!303158 thiss!1204 (_2!9054 lt!302034)))))

(declare-fun lt!303156 () Unit!13734)

(assert (=> d!66121 (= lt!303156 e!133958)))

(declare-fun c!9738 () Bool)

(assert (=> d!66121 (= c!9738 (not (= (size!4409 (buf!4892 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!303148 () Unit!13734)

(declare-fun lt!303162 () Unit!13734)

(assert (=> d!66121 (= lt!303148 lt!303162)))

(assert (=> d!66121 (isPrefixOf!0 (_2!9054 lt!302034) (_2!9054 lt!302034))))

(assert (=> d!66121 (= lt!303162 (lemmaIsPrefixRefl!0 (_2!9054 lt!302034)))))

(declare-fun lt!303144 () Unit!13734)

(declare-fun lt!303149 () Unit!13734)

(assert (=> d!66121 (= lt!303144 lt!303149)))

(assert (=> d!66121 (= lt!303149 (lemmaIsPrefixRefl!0 (_2!9054 lt!302034)))))

(declare-fun lt!303160 () Unit!13734)

(declare-fun lt!303163 () Unit!13734)

(assert (=> d!66121 (= lt!303160 lt!303163)))

(assert (=> d!66121 (isPrefixOf!0 lt!303158 lt!303158)))

(assert (=> d!66121 (= lt!303163 (lemmaIsPrefixRefl!0 lt!303158))))

(declare-fun lt!303159 () Unit!13734)

(declare-fun lt!303155 () Unit!13734)

(assert (=> d!66121 (= lt!303159 lt!303155)))

(assert (=> d!66121 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!66121 (= lt!303155 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!66121 (= lt!303158 (BitStream!7927 (buf!4892 (_2!9054 lt!302034)) (currentByte!9182 thiss!1204) (currentBit!9177 thiss!1204)))))

(assert (=> d!66121 (isPrefixOf!0 thiss!1204 (_2!9054 lt!302034))))

(assert (=> d!66121 (= (reader!0 thiss!1204 (_2!9054 lt!302034)) lt!303147)))

(declare-fun b!194766 () Bool)

(declare-fun lt!303145 () (_ BitVec 64))

(declare-fun lt!303146 () (_ BitVec 64))

(assert (=> b!194766 (= e!133957 (= (_1!9053 lt!303147) (withMovedBitIndex!0 (_2!9053 lt!303147) (bvsub lt!303146 lt!303145))))))

(assert (=> b!194766 (or (= (bvand lt!303146 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!303145 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!303146 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!303146 lt!303145) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194766 (= lt!303145 (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302034))) (currentByte!9182 (_2!9054 lt!302034)) (currentBit!9177 (_2!9054 lt!302034))))))

(assert (=> b!194766 (= lt!303146 (bitIndex!0 (size!4409 (buf!4892 thiss!1204)) (currentByte!9182 thiss!1204) (currentBit!9177 thiss!1204)))))

(assert (= (and d!66121 c!9738) b!194765))

(assert (= (and d!66121 (not c!9738)) b!194763))

(assert (= (and d!66121 res!162858) b!194764))

(assert (= (and b!194764 res!162857) b!194762))

(assert (= (and b!194762 res!162856) b!194766))

(declare-fun m!301873 () Bool)

(assert (=> d!66121 m!301873))

(declare-fun m!301875 () Bool)

(assert (=> d!66121 m!301875))

(declare-fun m!301877 () Bool)

(assert (=> d!66121 m!301877))

(assert (=> d!66121 m!301135))

(declare-fun m!301879 () Bool)

(assert (=> d!66121 m!301879))

(declare-fun m!301881 () Bool)

(assert (=> d!66121 m!301881))

(declare-fun m!301883 () Bool)

(assert (=> d!66121 m!301883))

(declare-fun m!301885 () Bool)

(assert (=> d!66121 m!301885))

(declare-fun m!301887 () Bool)

(assert (=> d!66121 m!301887))

(declare-fun m!301889 () Bool)

(assert (=> d!66121 m!301889))

(declare-fun m!301891 () Bool)

(assert (=> d!66121 m!301891))

(declare-fun m!301893 () Bool)

(assert (=> b!194764 m!301893))

(declare-fun m!301895 () Bool)

(assert (=> b!194766 m!301895))

(assert (=> b!194766 m!301133))

(assert (=> b!194766 m!301129))

(declare-fun m!301897 () Bool)

(assert (=> b!194762 m!301897))

(assert (=> b!194765 m!301129))

(declare-fun m!301899 () Bool)

(assert (=> b!194765 m!301899))

(declare-fun m!301901 () Bool)

(assert (=> b!194765 m!301901))

(assert (=> b!194348 d!66121))

(declare-fun b!194767 () Bool)

(declare-fun res!162859 () Bool)

(declare-fun e!133959 () Bool)

(assert (=> b!194767 (=> (not res!162859) (not e!133959))))

(declare-fun lt!303167 () tuple2!16816)

(assert (=> b!194767 (= res!162859 (isPrefixOf!0 (_2!9053 lt!303167) (_2!9054 lt!302034)))))

(declare-fun b!194768 () Bool)

(declare-fun e!133960 () Unit!13734)

(declare-fun Unit!13776 () Unit!13734)

(assert (=> b!194768 (= e!133960 Unit!13776)))

(declare-fun b!194769 () Bool)

(declare-fun res!162860 () Bool)

(assert (=> b!194769 (=> (not res!162860) (not e!133959))))

(assert (=> b!194769 (= res!162860 (isPrefixOf!0 (_1!9053 lt!303167) (_2!9054 lt!302035)))))

(declare-fun b!194770 () Bool)

(declare-fun lt!303170 () Unit!13734)

(assert (=> b!194770 (= e!133960 lt!303170)))

(declare-fun lt!303173 () (_ BitVec 64))

(assert (=> b!194770 (= lt!303173 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!303174 () (_ BitVec 64))

(assert (=> b!194770 (= lt!303174 (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302035))) (currentByte!9182 (_2!9054 lt!302035)) (currentBit!9177 (_2!9054 lt!302035))))))

(assert (=> b!194770 (= lt!303170 (arrayBitRangesEqSymmetric!0 (buf!4892 (_2!9054 lt!302035)) (buf!4892 (_2!9054 lt!302034)) lt!303173 lt!303174))))

(assert (=> b!194770 (arrayBitRangesEq!0 (buf!4892 (_2!9054 lt!302034)) (buf!4892 (_2!9054 lt!302035)) lt!303173 lt!303174)))

(declare-fun d!66153 () Bool)

(assert (=> d!66153 e!133959))

(declare-fun res!162861 () Bool)

(assert (=> d!66153 (=> (not res!162861) (not e!133959))))

(assert (=> d!66153 (= res!162861 (isPrefixOf!0 (_1!9053 lt!303167) (_2!9053 lt!303167)))))

(declare-fun lt!303178 () BitStream!7926)

(assert (=> d!66153 (= lt!303167 (tuple2!16817 lt!303178 (_2!9054 lt!302034)))))

(declare-fun lt!303172 () Unit!13734)

(declare-fun lt!303177 () Unit!13734)

(assert (=> d!66153 (= lt!303172 lt!303177)))

(assert (=> d!66153 (isPrefixOf!0 lt!303178 (_2!9054 lt!302034))))

(assert (=> d!66153 (= lt!303177 (lemmaIsPrefixTransitive!0 lt!303178 (_2!9054 lt!302034) (_2!9054 lt!302034)))))

(declare-fun lt!303181 () Unit!13734)

(declare-fun lt!303171 () Unit!13734)

(assert (=> d!66153 (= lt!303181 lt!303171)))

(assert (=> d!66153 (isPrefixOf!0 lt!303178 (_2!9054 lt!302034))))

(assert (=> d!66153 (= lt!303171 (lemmaIsPrefixTransitive!0 lt!303178 (_2!9054 lt!302035) (_2!9054 lt!302034)))))

(declare-fun lt!303176 () Unit!13734)

(assert (=> d!66153 (= lt!303176 e!133960)))

(declare-fun c!9739 () Bool)

(assert (=> d!66153 (= c!9739 (not (= (size!4409 (buf!4892 (_2!9054 lt!302035))) #b00000000000000000000000000000000)))))

(declare-fun lt!303168 () Unit!13734)

(declare-fun lt!303182 () Unit!13734)

(assert (=> d!66153 (= lt!303168 lt!303182)))

(assert (=> d!66153 (isPrefixOf!0 (_2!9054 lt!302034) (_2!9054 lt!302034))))

(assert (=> d!66153 (= lt!303182 (lemmaIsPrefixRefl!0 (_2!9054 lt!302034)))))

(declare-fun lt!303164 () Unit!13734)

(declare-fun lt!303169 () Unit!13734)

(assert (=> d!66153 (= lt!303164 lt!303169)))

(assert (=> d!66153 (= lt!303169 (lemmaIsPrefixRefl!0 (_2!9054 lt!302034)))))

(declare-fun lt!303180 () Unit!13734)

(declare-fun lt!303183 () Unit!13734)

(assert (=> d!66153 (= lt!303180 lt!303183)))

(assert (=> d!66153 (isPrefixOf!0 lt!303178 lt!303178)))

(assert (=> d!66153 (= lt!303183 (lemmaIsPrefixRefl!0 lt!303178))))

(declare-fun lt!303179 () Unit!13734)

(declare-fun lt!303175 () Unit!13734)

(assert (=> d!66153 (= lt!303179 lt!303175)))

(assert (=> d!66153 (isPrefixOf!0 (_2!9054 lt!302035) (_2!9054 lt!302035))))

(assert (=> d!66153 (= lt!303175 (lemmaIsPrefixRefl!0 (_2!9054 lt!302035)))))

(assert (=> d!66153 (= lt!303178 (BitStream!7927 (buf!4892 (_2!9054 lt!302034)) (currentByte!9182 (_2!9054 lt!302035)) (currentBit!9177 (_2!9054 lt!302035))))))

(assert (=> d!66153 (isPrefixOf!0 (_2!9054 lt!302035) (_2!9054 lt!302034))))

(assert (=> d!66153 (= (reader!0 (_2!9054 lt!302035) (_2!9054 lt!302034)) lt!303167)))

(declare-fun b!194771 () Bool)

(declare-fun lt!303165 () (_ BitVec 64))

(declare-fun lt!303166 () (_ BitVec 64))

(assert (=> b!194771 (= e!133959 (= (_1!9053 lt!303167) (withMovedBitIndex!0 (_2!9053 lt!303167) (bvsub lt!303166 lt!303165))))))

(assert (=> b!194771 (or (= (bvand lt!303166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!303165 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!303166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!303166 lt!303165) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194771 (= lt!303165 (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302034))) (currentByte!9182 (_2!9054 lt!302034)) (currentBit!9177 (_2!9054 lt!302034))))))

(assert (=> b!194771 (= lt!303166 (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302035))) (currentByte!9182 (_2!9054 lt!302035)) (currentBit!9177 (_2!9054 lt!302035))))))

(assert (= (and d!66153 c!9739) b!194770))

(assert (= (and d!66153 (not c!9739)) b!194768))

(assert (= (and d!66153 res!162861) b!194769))

(assert (= (and b!194769 res!162860) b!194767))

(assert (= (and b!194767 res!162859) b!194771))

(declare-fun m!301903 () Bool)

(assert (=> d!66153 m!301903))

(declare-fun m!301905 () Bool)

(assert (=> d!66153 m!301905))

(assert (=> d!66153 m!301877))

(assert (=> d!66153 m!301151))

(assert (=> d!66153 m!301611))

(assert (=> d!66153 m!301881))

(declare-fun m!301907 () Bool)

(assert (=> d!66153 m!301907))

(declare-fun m!301909 () Bool)

(assert (=> d!66153 m!301909))

(declare-fun m!301911 () Bool)

(assert (=> d!66153 m!301911))

(declare-fun m!301913 () Bool)

(assert (=> d!66153 m!301913))

(declare-fun m!301915 () Bool)

(assert (=> d!66153 m!301915))

(declare-fun m!301917 () Bool)

(assert (=> b!194769 m!301917))

(declare-fun m!301919 () Bool)

(assert (=> b!194771 m!301919))

(assert (=> b!194771 m!301133))

(assert (=> b!194771 m!301127))

(declare-fun m!301921 () Bool)

(assert (=> b!194767 m!301921))

(assert (=> b!194770 m!301127))

(declare-fun m!301923 () Bool)

(assert (=> b!194770 m!301923))

(declare-fun m!301925 () Bool)

(assert (=> b!194770 m!301925))

(assert (=> b!194348 d!66153))

(declare-fun d!66155 () Bool)

(declare-fun lt!303184 () tuple2!16842)

(assert (=> d!66155 (= lt!303184 (readBit!0 (BitStream!7927 (buf!4892 (_2!9054 lt!302034)) (currentByte!9182 thiss!1204) (currentBit!9177 thiss!1204))))))

(assert (=> d!66155 (= (readBitPure!0 (BitStream!7927 (buf!4892 (_2!9054 lt!302034)) (currentByte!9182 thiss!1204) (currentBit!9177 thiss!1204))) (tuple2!16821 (_2!9066 lt!303184) (_1!9066 lt!303184)))))

(declare-fun bs!16436 () Bool)

(assert (= bs!16436 d!66155))

(declare-fun m!301927 () Bool)

(assert (=> bs!16436 m!301927))

(assert (=> b!194348 d!66155))

(declare-fun d!66157 () Bool)

(declare-fun e!133961 () Bool)

(assert (=> d!66157 e!133961))

(declare-fun res!162862 () Bool)

(assert (=> d!66157 (=> (not res!162862) (not e!133961))))

(declare-fun lt!303185 () (_ BitVec 64))

(declare-fun lt!303190 () (_ BitVec 64))

(declare-fun lt!303189 () (_ BitVec 64))

(assert (=> d!66157 (= res!162862 (= lt!303190 (bvsub lt!303185 lt!303189)))))

(assert (=> d!66157 (or (= (bvand lt!303185 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!303189 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!303185 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!303185 lt!303189) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66157 (= lt!303189 (remainingBits!0 ((_ sign_extend 32) (size!4409 (buf!4892 (_1!9055 lt!302040)))) ((_ sign_extend 32) (currentByte!9182 (_1!9055 lt!302040))) ((_ sign_extend 32) (currentBit!9177 (_1!9055 lt!302040)))))))

(declare-fun lt!303186 () (_ BitVec 64))

(declare-fun lt!303187 () (_ BitVec 64))

(assert (=> d!66157 (= lt!303185 (bvmul lt!303186 lt!303187))))

(assert (=> d!66157 (or (= lt!303186 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!303187 (bvsdiv (bvmul lt!303186 lt!303187) lt!303186)))))

(assert (=> d!66157 (= lt!303187 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66157 (= lt!303186 ((_ sign_extend 32) (size!4409 (buf!4892 (_1!9055 lt!302040)))))))

(assert (=> d!66157 (= lt!303190 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9182 (_1!9055 lt!302040))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9177 (_1!9055 lt!302040)))))))

(assert (=> d!66157 (invariant!0 (currentBit!9177 (_1!9055 lt!302040)) (currentByte!9182 (_1!9055 lt!302040)) (size!4409 (buf!4892 (_1!9055 lt!302040))))))

(assert (=> d!66157 (= (bitIndex!0 (size!4409 (buf!4892 (_1!9055 lt!302040))) (currentByte!9182 (_1!9055 lt!302040)) (currentBit!9177 (_1!9055 lt!302040))) lt!303190)))

(declare-fun b!194772 () Bool)

(declare-fun res!162863 () Bool)

(assert (=> b!194772 (=> (not res!162863) (not e!133961))))

(assert (=> b!194772 (= res!162863 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!303190))))

(declare-fun b!194773 () Bool)

(declare-fun lt!303188 () (_ BitVec 64))

(assert (=> b!194773 (= e!133961 (bvsle lt!303190 (bvmul lt!303188 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194773 (or (= lt!303188 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!303188 #b0000000000000000000000000000000000000000000000000000000000001000) lt!303188)))))

(assert (=> b!194773 (= lt!303188 ((_ sign_extend 32) (size!4409 (buf!4892 (_1!9055 lt!302040)))))))

(assert (= (and d!66157 res!162862) b!194772))

(assert (= (and b!194772 res!162863) b!194773))

(declare-fun m!301929 () Bool)

(assert (=> d!66157 m!301929))

(declare-fun m!301931 () Bool)

(assert (=> d!66157 m!301931))

(assert (=> b!194348 d!66157))

(declare-fun d!66159 () Bool)

(declare-fun e!133962 () Bool)

(assert (=> d!66159 e!133962))

(declare-fun res!162864 () Bool)

(assert (=> d!66159 (=> (not res!162864) (not e!133962))))

(declare-fun lt!303195 () (_ BitVec 64))

(declare-fun lt!303191 () (_ BitVec 64))

(declare-fun lt!303196 () (_ BitVec 64))

(assert (=> d!66159 (= res!162864 (= lt!303196 (bvsub lt!303191 lt!303195)))))

(assert (=> d!66159 (or (= (bvand lt!303191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!303195 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!303191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!303191 lt!303195) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66159 (= lt!303195 (remainingBits!0 ((_ sign_extend 32) (size!4409 (buf!4892 (_1!9055 lt!302043)))) ((_ sign_extend 32) (currentByte!9182 (_1!9055 lt!302043))) ((_ sign_extend 32) (currentBit!9177 (_1!9055 lt!302043)))))))

(declare-fun lt!303192 () (_ BitVec 64))

(declare-fun lt!303193 () (_ BitVec 64))

(assert (=> d!66159 (= lt!303191 (bvmul lt!303192 lt!303193))))

(assert (=> d!66159 (or (= lt!303192 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!303193 (bvsdiv (bvmul lt!303192 lt!303193) lt!303192)))))

(assert (=> d!66159 (= lt!303193 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66159 (= lt!303192 ((_ sign_extend 32) (size!4409 (buf!4892 (_1!9055 lt!302043)))))))

(assert (=> d!66159 (= lt!303196 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9182 (_1!9055 lt!302043))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9177 (_1!9055 lt!302043)))))))

(assert (=> d!66159 (invariant!0 (currentBit!9177 (_1!9055 lt!302043)) (currentByte!9182 (_1!9055 lt!302043)) (size!4409 (buf!4892 (_1!9055 lt!302043))))))

(assert (=> d!66159 (= (bitIndex!0 (size!4409 (buf!4892 (_1!9055 lt!302043))) (currentByte!9182 (_1!9055 lt!302043)) (currentBit!9177 (_1!9055 lt!302043))) lt!303196)))

(declare-fun b!194774 () Bool)

(declare-fun res!162865 () Bool)

(assert (=> b!194774 (=> (not res!162865) (not e!133962))))

(assert (=> b!194774 (= res!162865 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!303196))))

(declare-fun b!194775 () Bool)

(declare-fun lt!303194 () (_ BitVec 64))

(assert (=> b!194775 (= e!133962 (bvsle lt!303196 (bvmul lt!303194 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194775 (or (= lt!303194 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!303194 #b0000000000000000000000000000000000000000000000000000000000001000) lt!303194)))))

(assert (=> b!194775 (= lt!303194 ((_ sign_extend 32) (size!4409 (buf!4892 (_1!9055 lt!302043)))))))

(assert (= (and d!66159 res!162864) b!194774))

(assert (= (and b!194774 res!162865) b!194775))

(declare-fun m!301933 () Bool)

(assert (=> d!66159 m!301933))

(declare-fun m!301935 () Bool)

(assert (=> d!66159 m!301935))

(assert (=> b!194348 d!66159))

(declare-fun d!66161 () Bool)

(assert (=> d!66161 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302034)))) ((_ sign_extend 32) (currentByte!9182 thiss!1204)) ((_ sign_extend 32) (currentBit!9177 thiss!1204)) lt!302031) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302034)))) ((_ sign_extend 32) (currentByte!9182 thiss!1204)) ((_ sign_extend 32) (currentBit!9177 thiss!1204))) lt!302031))))

(declare-fun bs!16437 () Bool)

(assert (= bs!16437 d!66161))

(declare-fun m!301937 () Bool)

(assert (=> bs!16437 m!301937))

(assert (=> b!194348 d!66161))

(declare-fun d!66163 () Bool)

(assert (=> d!66163 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302034)))) ((_ sign_extend 32) (currentByte!9182 (_2!9054 lt!302035))) ((_ sign_extend 32) (currentBit!9177 (_2!9054 lt!302035))) lt!302039) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302034)))) ((_ sign_extend 32) (currentByte!9182 (_2!9054 lt!302035))) ((_ sign_extend 32) (currentBit!9177 (_2!9054 lt!302035)))) lt!302039))))

(declare-fun bs!16438 () Bool)

(assert (= bs!16438 d!66163))

(declare-fun m!301939 () Bool)

(assert (=> bs!16438 m!301939))

(assert (=> b!194348 d!66163))

(declare-fun lt!303197 () tuple2!16840)

(declare-fun d!66165 () Bool)

(assert (=> d!66165 (= lt!303197 (readNBitsLSBFirstsLoop!0 (_1!9053 lt!302021) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302047))))

(assert (=> d!66165 (= (readNBitsLSBFirstsLoopPure!0 (_1!9053 lt!302021) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302047) (tuple2!16823 (_2!9065 lt!303197) (_1!9065 lt!303197)))))

(declare-fun bs!16439 () Bool)

(assert (= bs!16439 d!66165))

(declare-fun m!301941 () Bool)

(assert (=> bs!16439 m!301941))

(assert (=> b!194348 d!66165))

(declare-fun d!66167 () Bool)

(assert (=> d!66167 (validate_offset_bits!1 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302034)))) ((_ sign_extend 32) (currentByte!9182 thiss!1204)) ((_ sign_extend 32) (currentBit!9177 thiss!1204)) lt!302031)))

(declare-fun lt!303200 () Unit!13734)

(declare-fun choose!9 (BitStream!7926 array!9997 (_ BitVec 64) BitStream!7926) Unit!13734)

(assert (=> d!66167 (= lt!303200 (choose!9 thiss!1204 (buf!4892 (_2!9054 lt!302034)) lt!302031 (BitStream!7927 (buf!4892 (_2!9054 lt!302034)) (currentByte!9182 thiss!1204) (currentBit!9177 thiss!1204))))))

(assert (=> d!66167 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4892 (_2!9054 lt!302034)) lt!302031) lt!303200)))

(declare-fun bs!16440 () Bool)

(assert (= bs!16440 d!66167))

(assert (=> bs!16440 m!301095))

(declare-fun m!301943 () Bool)

(assert (=> bs!16440 m!301943))

(assert (=> b!194348 d!66167))

(declare-fun d!66169 () Bool)

(declare-fun lt!303201 () tuple2!16842)

(assert (=> d!66169 (= lt!303201 (readBit!0 lt!302042))))

(assert (=> d!66169 (= (readBitPure!0 lt!302042) (tuple2!16821 (_2!9066 lt!303201) (_1!9066 lt!303201)))))

(declare-fun bs!16441 () Bool)

(assert (= bs!16441 d!66169))

(declare-fun m!301945 () Bool)

(assert (=> bs!16441 m!301945))

(assert (=> b!194348 d!66169))

(declare-fun d!66171 () Bool)

(assert (=> d!66171 (validate_offset_bits!1 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302034)))) ((_ sign_extend 32) (currentByte!9182 (_2!9054 lt!302035))) ((_ sign_extend 32) (currentBit!9177 (_2!9054 lt!302035))) lt!302039)))

(declare-fun lt!303202 () Unit!13734)

(assert (=> d!66171 (= lt!303202 (choose!9 (_2!9054 lt!302035) (buf!4892 (_2!9054 lt!302034)) lt!302039 (BitStream!7927 (buf!4892 (_2!9054 lt!302034)) (currentByte!9182 (_2!9054 lt!302035)) (currentBit!9177 (_2!9054 lt!302035)))))))

(assert (=> d!66171 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9054 lt!302035) (buf!4892 (_2!9054 lt!302034)) lt!302039) lt!303202)))

(declare-fun bs!16442 () Bool)

(assert (= bs!16442 d!66171))

(assert (=> bs!16442 m!301093))

(declare-fun m!301947 () Bool)

(assert (=> bs!16442 m!301947))

(assert (=> b!194348 d!66171))

(declare-fun d!66173 () Bool)

(assert (=> d!66173 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9177 thiss!1204) (currentByte!9182 thiss!1204) (size!4409 (buf!4892 thiss!1204))))))

(declare-fun bs!16443 () Bool)

(assert (= bs!16443 d!66173))

(assert (=> bs!16443 m!301107))

(assert (=> start!41428 d!66173))

(declare-fun d!66175 () Bool)

(assert (=> d!66175 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!194329 d!66175))

(declare-fun d!66177 () Bool)

(declare-fun e!133965 () Bool)

(assert (=> d!66177 e!133965))

(declare-fun res!162868 () Bool)

(assert (=> d!66177 (=> (not res!162868) (not e!133965))))

(declare-fun lt!303207 () BitStream!7926)

(declare-fun lt!303208 () (_ BitVec 64))

(assert (=> d!66177 (= res!162868 (= (bvadd lt!303208 (bvsub lt!302033 lt!302036)) (bitIndex!0 (size!4409 (buf!4892 lt!303207)) (currentByte!9182 lt!303207) (currentBit!9177 lt!303207))))))

(assert (=> d!66177 (or (not (= (bvand lt!303208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302033 lt!302036) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!303208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!303208 (bvsub lt!302033 lt!302036)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66177 (= lt!303208 (bitIndex!0 (size!4409 (buf!4892 (_2!9053 lt!302021))) (currentByte!9182 (_2!9053 lt!302021)) (currentBit!9177 (_2!9053 lt!302021))))))

(declare-fun moveBitIndex!0 (BitStream!7926 (_ BitVec 64)) tuple2!16818)

(assert (=> d!66177 (= lt!303207 (_2!9054 (moveBitIndex!0 (_2!9053 lt!302021) (bvsub lt!302033 lt!302036))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7926 (_ BitVec 64)) Bool)

(assert (=> d!66177 (moveBitIndexPrecond!0 (_2!9053 lt!302021) (bvsub lt!302033 lt!302036))))

(assert (=> d!66177 (= (withMovedBitIndex!0 (_2!9053 lt!302021) (bvsub lt!302033 lt!302036)) lt!303207)))

(declare-fun b!194778 () Bool)

(assert (=> b!194778 (= e!133965 (= (size!4409 (buf!4892 (_2!9053 lt!302021))) (size!4409 (buf!4892 lt!303207))))))

(assert (= (and d!66177 res!162868) b!194778))

(declare-fun m!301949 () Bool)

(assert (=> d!66177 m!301949))

(declare-fun m!301951 () Bool)

(assert (=> d!66177 m!301951))

(declare-fun m!301953 () Bool)

(assert (=> d!66177 m!301953))

(declare-fun m!301955 () Bool)

(assert (=> d!66177 m!301955))

(assert (=> b!194339 d!66177))

(declare-fun d!66179 () Bool)

(assert (=> d!66179 (= (invariant!0 (currentBit!9177 (_2!9054 lt!302034)) (currentByte!9182 (_2!9054 lt!302034)) (size!4409 (buf!4892 (_2!9054 lt!302034)))) (and (bvsge (currentBit!9177 (_2!9054 lt!302034)) #b00000000000000000000000000000000) (bvslt (currentBit!9177 (_2!9054 lt!302034)) #b00000000000000000000000000001000) (bvsge (currentByte!9182 (_2!9054 lt!302034)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9182 (_2!9054 lt!302034)) (size!4409 (buf!4892 (_2!9054 lt!302034)))) (and (= (currentBit!9177 (_2!9054 lt!302034)) #b00000000000000000000000000000000) (= (currentByte!9182 (_2!9054 lt!302034)) (size!4409 (buf!4892 (_2!9054 lt!302034))))))))))

(assert (=> b!194341 d!66179))

(declare-fun d!66181 () Bool)

(declare-fun e!133966 () Bool)

(assert (=> d!66181 e!133966))

(declare-fun res!162869 () Bool)

(assert (=> d!66181 (=> (not res!162869) (not e!133966))))

(declare-fun lt!303213 () (_ BitVec 64))

(declare-fun lt!303209 () (_ BitVec 64))

(declare-fun lt!303214 () (_ BitVec 64))

(assert (=> d!66181 (= res!162869 (= lt!303214 (bvsub lt!303209 lt!303213)))))

(assert (=> d!66181 (or (= (bvand lt!303209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!303213 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!303209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!303209 lt!303213) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66181 (= lt!303213 (remainingBits!0 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302035)))) ((_ sign_extend 32) (currentByte!9182 (_2!9054 lt!302035))) ((_ sign_extend 32) (currentBit!9177 (_2!9054 lt!302035)))))))

(declare-fun lt!303210 () (_ BitVec 64))

(declare-fun lt!303211 () (_ BitVec 64))

(assert (=> d!66181 (= lt!303209 (bvmul lt!303210 lt!303211))))

(assert (=> d!66181 (or (= lt!303210 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!303211 (bvsdiv (bvmul lt!303210 lt!303211) lt!303210)))))

(assert (=> d!66181 (= lt!303211 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66181 (= lt!303210 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302035)))))))

(assert (=> d!66181 (= lt!303214 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9182 (_2!9054 lt!302035))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9177 (_2!9054 lt!302035)))))))

(assert (=> d!66181 (invariant!0 (currentBit!9177 (_2!9054 lt!302035)) (currentByte!9182 (_2!9054 lt!302035)) (size!4409 (buf!4892 (_2!9054 lt!302035))))))

(assert (=> d!66181 (= (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302035))) (currentByte!9182 (_2!9054 lt!302035)) (currentBit!9177 (_2!9054 lt!302035))) lt!303214)))

(declare-fun b!194779 () Bool)

(declare-fun res!162870 () Bool)

(assert (=> b!194779 (=> (not res!162870) (not e!133966))))

(assert (=> b!194779 (= res!162870 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!303214))))

(declare-fun b!194780 () Bool)

(declare-fun lt!303212 () (_ BitVec 64))

(assert (=> b!194780 (= e!133966 (bvsle lt!303214 (bvmul lt!303212 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194780 (or (= lt!303212 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!303212 #b0000000000000000000000000000000000000000000000000000000000001000) lt!303212)))))

(assert (=> b!194780 (= lt!303212 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9054 lt!302035)))))))

(assert (= (and d!66181 res!162869) b!194779))

(assert (= (and b!194779 res!162870) b!194780))

(declare-fun m!301957 () Bool)

(assert (=> d!66181 m!301957))

(declare-fun m!301959 () Bool)

(assert (=> d!66181 m!301959))

(assert (=> b!194330 d!66181))

(declare-fun d!66183 () Bool)

(declare-fun e!133967 () Bool)

(assert (=> d!66183 e!133967))

(declare-fun res!162871 () Bool)

(assert (=> d!66183 (=> (not res!162871) (not e!133967))))

(declare-fun lt!303220 () (_ BitVec 64))

(declare-fun lt!303215 () (_ BitVec 64))

(declare-fun lt!303219 () (_ BitVec 64))

(assert (=> d!66183 (= res!162871 (= lt!303220 (bvsub lt!303215 lt!303219)))))

(assert (=> d!66183 (or (= (bvand lt!303215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!303219 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!303215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!303215 lt!303219) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66183 (= lt!303219 (remainingBits!0 ((_ sign_extend 32) (size!4409 (buf!4892 thiss!1204))) ((_ sign_extend 32) (currentByte!9182 thiss!1204)) ((_ sign_extend 32) (currentBit!9177 thiss!1204))))))

(declare-fun lt!303216 () (_ BitVec 64))

(declare-fun lt!303217 () (_ BitVec 64))

(assert (=> d!66183 (= lt!303215 (bvmul lt!303216 lt!303217))))

(assert (=> d!66183 (or (= lt!303216 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!303217 (bvsdiv (bvmul lt!303216 lt!303217) lt!303216)))))

(assert (=> d!66183 (= lt!303217 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66183 (= lt!303216 ((_ sign_extend 32) (size!4409 (buf!4892 thiss!1204))))))

(assert (=> d!66183 (= lt!303220 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9182 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9177 thiss!1204))))))

(assert (=> d!66183 (invariant!0 (currentBit!9177 thiss!1204) (currentByte!9182 thiss!1204) (size!4409 (buf!4892 thiss!1204)))))

(assert (=> d!66183 (= (bitIndex!0 (size!4409 (buf!4892 thiss!1204)) (currentByte!9182 thiss!1204) (currentBit!9177 thiss!1204)) lt!303220)))

(declare-fun b!194781 () Bool)

(declare-fun res!162872 () Bool)

(assert (=> b!194781 (=> (not res!162872) (not e!133967))))

(assert (=> b!194781 (= res!162872 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!303220))))

(declare-fun b!194782 () Bool)

(declare-fun lt!303218 () (_ BitVec 64))

(assert (=> b!194782 (= e!133967 (bvsle lt!303220 (bvmul lt!303218 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194782 (or (= lt!303218 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!303218 #b0000000000000000000000000000000000000000000000000000000000001000) lt!303218)))))

(assert (=> b!194782 (= lt!303218 ((_ sign_extend 32) (size!4409 (buf!4892 thiss!1204))))))

(assert (= (and d!66183 res!162871) b!194781))

(assert (= (and b!194781 res!162872) b!194782))

(assert (=> d!66183 m!301243))

(assert (=> d!66183 m!301107))

(assert (=> b!194330 d!66183))

(assert (=> b!194340 d!65949))

(declare-fun d!66185 () Bool)

(declare-fun lt!303221 () tuple2!16842)

(assert (=> d!66185 (= lt!303221 (readBit!0 (readerFrom!0 (_2!9054 lt!302035) (currentBit!9177 thiss!1204) (currentByte!9182 thiss!1204))))))

(assert (=> d!66185 (= (readBitPure!0 (readerFrom!0 (_2!9054 lt!302035) (currentBit!9177 thiss!1204) (currentByte!9182 thiss!1204))) (tuple2!16821 (_2!9066 lt!303221) (_1!9066 lt!303221)))))

(declare-fun bs!16444 () Bool)

(assert (= bs!16444 d!66185))

(assert (=> bs!16444 m!301109))

(declare-fun m!301961 () Bool)

(assert (=> bs!16444 m!301961))

(assert (=> b!194342 d!66185))

(declare-fun d!66187 () Bool)

(declare-fun e!133970 () Bool)

(assert (=> d!66187 e!133970))

(declare-fun res!162876 () Bool)

(assert (=> d!66187 (=> (not res!162876) (not e!133970))))

(assert (=> d!66187 (= res!162876 (invariant!0 (currentBit!9177 (_2!9054 lt!302035)) (currentByte!9182 (_2!9054 lt!302035)) (size!4409 (buf!4892 (_2!9054 lt!302035)))))))

(assert (=> d!66187 (= (readerFrom!0 (_2!9054 lt!302035) (currentBit!9177 thiss!1204) (currentByte!9182 thiss!1204)) (BitStream!7927 (buf!4892 (_2!9054 lt!302035)) (currentByte!9182 thiss!1204) (currentBit!9177 thiss!1204)))))

(declare-fun b!194785 () Bool)

(assert (=> b!194785 (= e!133970 (invariant!0 (currentBit!9177 thiss!1204) (currentByte!9182 thiss!1204) (size!4409 (buf!4892 (_2!9054 lt!302035)))))))

(assert (= (and d!66187 res!162876) b!194785))

(assert (=> d!66187 m!301959))

(assert (=> b!194785 m!301069))

(assert (=> b!194342 d!66187))

(declare-fun d!66189 () Bool)

(assert (=> d!66189 (= (invariant!0 (currentBit!9177 thiss!1204) (currentByte!9182 thiss!1204) (size!4409 (buf!4892 (_2!9054 lt!302034)))) (and (bvsge (currentBit!9177 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9177 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9182 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9182 thiss!1204) (size!4409 (buf!4892 (_2!9054 lt!302034)))) (and (= (currentBit!9177 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9182 thiss!1204) (size!4409 (buf!4892 (_2!9054 lt!302034))))))))))

(assert (=> b!194331 d!66189))

(declare-fun d!66191 () Bool)

(assert (=> d!66191 (= (invariant!0 (currentBit!9177 thiss!1204) (currentByte!9182 thiss!1204) (size!4409 (buf!4892 thiss!1204))) (and (bvsge (currentBit!9177 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9177 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9182 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9182 thiss!1204) (size!4409 (buf!4892 thiss!1204))) (and (= (currentBit!9177 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9182 thiss!1204) (size!4409 (buf!4892 thiss!1204)))))))))

(assert (=> b!194343 d!66191))

(declare-fun d!66193 () Bool)

(declare-fun res!162878 () Bool)

(declare-fun e!133972 () Bool)

(assert (=> d!66193 (=> (not res!162878) (not e!133972))))

(assert (=> d!66193 (= res!162878 (= (size!4409 (buf!4892 (_2!9054 lt!302035))) (size!4409 (buf!4892 (_2!9054 lt!302034)))))))

(assert (=> d!66193 (= (isPrefixOf!0 (_2!9054 lt!302035) (_2!9054 lt!302034)) e!133972)))

(declare-fun b!194786 () Bool)

(declare-fun res!162879 () Bool)

(assert (=> b!194786 (=> (not res!162879) (not e!133972))))

(assert (=> b!194786 (= res!162879 (bvsle (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302035))) (currentByte!9182 (_2!9054 lt!302035)) (currentBit!9177 (_2!9054 lt!302035))) (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302034))) (currentByte!9182 (_2!9054 lt!302034)) (currentBit!9177 (_2!9054 lt!302034)))))))

(declare-fun b!194787 () Bool)

(declare-fun e!133971 () Bool)

(assert (=> b!194787 (= e!133972 e!133971)))

(declare-fun res!162877 () Bool)

(assert (=> b!194787 (=> res!162877 e!133971)))

(assert (=> b!194787 (= res!162877 (= (size!4409 (buf!4892 (_2!9054 lt!302035))) #b00000000000000000000000000000000))))

(declare-fun b!194788 () Bool)

(assert (=> b!194788 (= e!133971 (arrayBitRangesEq!0 (buf!4892 (_2!9054 lt!302035)) (buf!4892 (_2!9054 lt!302034)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!302035))) (currentByte!9182 (_2!9054 lt!302035)) (currentBit!9177 (_2!9054 lt!302035)))))))

(assert (= (and d!66193 res!162878) b!194786))

(assert (= (and b!194786 res!162879) b!194787))

(assert (= (and b!194787 (not res!162877)) b!194788))

(assert (=> b!194786 m!301127))

(assert (=> b!194786 m!301133))

(assert (=> b!194788 m!301127))

(assert (=> b!194788 m!301127))

(declare-fun m!301963 () Bool)

(assert (=> b!194788 m!301963))

(assert (=> b!194332 d!66193))

(declare-fun d!66195 () Bool)

(declare-fun lt!303235 () tuple2!16822)

(declare-fun lt!303239 () tuple2!16822)

(assert (=> d!66195 (and (= (_2!9056 lt!303235) (_2!9056 lt!303239)) (= (_1!9056 lt!303235) (_1!9056 lt!303239)))))

(declare-fun lt!303238 () (_ BitVec 64))

(declare-fun lt!303237 () Bool)

(declare-fun lt!303234 () BitStream!7926)

(declare-fun lt!303236 () Unit!13734)

(declare-fun choose!56 (BitStream!7926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16822 tuple2!16822 BitStream!7926 (_ BitVec 64) Bool BitStream!7926 (_ BitVec 64) tuple2!16822 tuple2!16822 BitStream!7926 (_ BitVec 64)) Unit!13734)

(assert (=> d!66195 (= lt!303236 (choose!56 (_1!9053 lt!302032) nBits!348 i!590 lt!302026 lt!303235 (tuple2!16823 (_1!9056 lt!303235) (_2!9056 lt!303235)) (_1!9056 lt!303235) (_2!9056 lt!303235) lt!303237 lt!303234 lt!303238 lt!303239 (tuple2!16823 (_1!9056 lt!303239) (_2!9056 lt!303239)) (_1!9056 lt!303239) (_2!9056 lt!303239)))))

(assert (=> d!66195 (= lt!303239 (readNBitsLSBFirstsLoopPure!0 lt!303234 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!303238))))

(assert (=> d!66195 (= lt!303238 (bvor lt!302026 (ite lt!303237 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66195 (= lt!303234 (withMovedBitIndex!0 (_1!9053 lt!302032) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!66195 (= lt!303237 (_2!9055 (readBitPure!0 (_1!9053 lt!302032))))))

(assert (=> d!66195 (= lt!303235 (readNBitsLSBFirstsLoopPure!0 (_1!9053 lt!302032) nBits!348 i!590 lt!302026))))

(assert (=> d!66195 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9053 lt!302032) nBits!348 i!590 lt!302026) lt!303236)))

(declare-fun bs!16446 () Bool)

(assert (= bs!16446 d!66195))

(declare-fun m!301965 () Bool)

(assert (=> bs!16446 m!301965))

(assert (=> bs!16446 m!301149))

(assert (=> bs!16446 m!301097))

(assert (=> bs!16446 m!301067))

(declare-fun m!301967 () Bool)

(assert (=> bs!16446 m!301967))

(assert (=> b!194345 d!66195))

(declare-fun lt!303240 () tuple2!16840)

(declare-fun d!66197 () Bool)

(assert (=> d!66197 (= lt!303240 (readNBitsLSBFirstsLoop!0 lt!302024 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302047))))

(assert (=> d!66197 (= (readNBitsLSBFirstsLoopPure!0 lt!302024 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302047) (tuple2!16823 (_2!9065 lt!303240) (_1!9065 lt!303240)))))

(declare-fun bs!16447 () Bool)

(assert (= bs!16447 d!66197))

(declare-fun m!301969 () Bool)

(assert (=> bs!16447 m!301969))

(assert (=> b!194345 d!66197))

(declare-fun d!66199 () Bool)

(declare-fun e!133973 () Bool)

(assert (=> d!66199 e!133973))

(declare-fun res!162880 () Bool)

(assert (=> d!66199 (=> (not res!162880) (not e!133973))))

(declare-fun lt!303242 () (_ BitVec 64))

(declare-fun lt!303241 () BitStream!7926)

(assert (=> d!66199 (= res!162880 (= (bvadd lt!303242 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4409 (buf!4892 lt!303241)) (currentByte!9182 lt!303241) (currentBit!9177 lt!303241))))))

(assert (=> d!66199 (or (not (= (bvand lt!303242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!303242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!303242 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66199 (= lt!303242 (bitIndex!0 (size!4409 (buf!4892 (_1!9053 lt!302032))) (currentByte!9182 (_1!9053 lt!302032)) (currentBit!9177 (_1!9053 lt!302032))))))

(assert (=> d!66199 (= lt!303241 (_2!9054 (moveBitIndex!0 (_1!9053 lt!302032) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!66199 (moveBitIndexPrecond!0 (_1!9053 lt!302032) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!66199 (= (withMovedBitIndex!0 (_1!9053 lt!302032) #b0000000000000000000000000000000000000000000000000000000000000001) lt!303241)))

(declare-fun b!194789 () Bool)

(assert (=> b!194789 (= e!133973 (= (size!4409 (buf!4892 (_1!9053 lt!302032))) (size!4409 (buf!4892 lt!303241))))))

(assert (= (and d!66199 res!162880) b!194789))

(declare-fun m!301971 () Bool)

(assert (=> d!66199 m!301971))

(declare-fun m!301973 () Bool)

(assert (=> d!66199 m!301973))

(declare-fun m!301975 () Bool)

(assert (=> d!66199 m!301975))

(declare-fun m!301977 () Bool)

(assert (=> d!66199 m!301977))

(assert (=> b!194345 d!66199))

(declare-fun d!66201 () Bool)

(assert (=> d!66201 (= (array_inv!4150 (buf!4892 thiss!1204)) (bvsge (size!4409 (buf!4892 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!194323 d!66201))

(declare-fun d!66203 () Bool)

(declare-fun e!133974 () Bool)

(assert (=> d!66203 e!133974))

(declare-fun res!162881 () Bool)

(assert (=> d!66203 (=> (not res!162881) (not e!133974))))

(declare-fun lt!303247 () (_ BitVec 64))

(declare-fun lt!303243 () (_ BitVec 64))

(declare-fun lt!303248 () (_ BitVec 64))

(assert (=> d!66203 (= res!162881 (= lt!303248 (bvsub lt!303243 lt!303247)))))

(assert (=> d!66203 (or (= (bvand lt!303243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!303247 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!303243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!303243 lt!303247) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66203 (= lt!303247 (remainingBits!0 ((_ sign_extend 32) (size!4409 (buf!4892 (_1!9056 lt!302023)))) ((_ sign_extend 32) (currentByte!9182 (_1!9056 lt!302023))) ((_ sign_extend 32) (currentBit!9177 (_1!9056 lt!302023)))))))

(declare-fun lt!303244 () (_ BitVec 64))

(declare-fun lt!303245 () (_ BitVec 64))

(assert (=> d!66203 (= lt!303243 (bvmul lt!303244 lt!303245))))

(assert (=> d!66203 (or (= lt!303244 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!303245 (bvsdiv (bvmul lt!303244 lt!303245) lt!303244)))))

(assert (=> d!66203 (= lt!303245 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66203 (= lt!303244 ((_ sign_extend 32) (size!4409 (buf!4892 (_1!9056 lt!302023)))))))

(assert (=> d!66203 (= lt!303248 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9182 (_1!9056 lt!302023))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9177 (_1!9056 lt!302023)))))))

(assert (=> d!66203 (invariant!0 (currentBit!9177 (_1!9056 lt!302023)) (currentByte!9182 (_1!9056 lt!302023)) (size!4409 (buf!4892 (_1!9056 lt!302023))))))

(assert (=> d!66203 (= (bitIndex!0 (size!4409 (buf!4892 (_1!9056 lt!302023))) (currentByte!9182 (_1!9056 lt!302023)) (currentBit!9177 (_1!9056 lt!302023))) lt!303248)))

(declare-fun b!194790 () Bool)

(declare-fun res!162882 () Bool)

(assert (=> b!194790 (=> (not res!162882) (not e!133974))))

(assert (=> b!194790 (= res!162882 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!303248))))

(declare-fun b!194791 () Bool)

(declare-fun lt!303246 () (_ BitVec 64))

(assert (=> b!194791 (= e!133974 (bvsle lt!303248 (bvmul lt!303246 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194791 (or (= lt!303246 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!303246 #b0000000000000000000000000000000000000000000000000000000000001000) lt!303246)))))

(assert (=> b!194791 (= lt!303246 ((_ sign_extend 32) (size!4409 (buf!4892 (_1!9056 lt!302023)))))))

(assert (= (and d!66203 res!162881) b!194790))

(assert (= (and b!194790 res!162882) b!194791))

(declare-fun m!301979 () Bool)

(assert (=> d!66203 m!301979))

(declare-fun m!301981 () Bool)

(assert (=> d!66203 m!301981))

(assert (=> b!194344 d!66203))

(declare-fun d!66205 () Bool)

(declare-fun e!133975 () Bool)

(assert (=> d!66205 e!133975))

(declare-fun res!162883 () Bool)

(assert (=> d!66205 (=> (not res!162883) (not e!133975))))

(declare-fun lt!303249 () (_ BitVec 64))

(declare-fun lt!303253 () (_ BitVec 64))

(declare-fun lt!303254 () (_ BitVec 64))

(assert (=> d!66205 (= res!162883 (= lt!303254 (bvsub lt!303249 lt!303253)))))

(assert (=> d!66205 (or (= (bvand lt!303249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!303253 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!303249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!303249 lt!303253) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66205 (= lt!303253 (remainingBits!0 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9053 lt!302032)))) ((_ sign_extend 32) (currentByte!9182 (_2!9053 lt!302032))) ((_ sign_extend 32) (currentBit!9177 (_2!9053 lt!302032)))))))

(declare-fun lt!303250 () (_ BitVec 64))

(declare-fun lt!303251 () (_ BitVec 64))

(assert (=> d!66205 (= lt!303249 (bvmul lt!303250 lt!303251))))

(assert (=> d!66205 (or (= lt!303250 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!303251 (bvsdiv (bvmul lt!303250 lt!303251) lt!303250)))))

(assert (=> d!66205 (= lt!303251 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66205 (= lt!303250 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9053 lt!302032)))))))

(assert (=> d!66205 (= lt!303254 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9182 (_2!9053 lt!302032))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9177 (_2!9053 lt!302032)))))))

(assert (=> d!66205 (invariant!0 (currentBit!9177 (_2!9053 lt!302032)) (currentByte!9182 (_2!9053 lt!302032)) (size!4409 (buf!4892 (_2!9053 lt!302032))))))

(assert (=> d!66205 (= (bitIndex!0 (size!4409 (buf!4892 (_2!9053 lt!302032))) (currentByte!9182 (_2!9053 lt!302032)) (currentBit!9177 (_2!9053 lt!302032))) lt!303254)))

(declare-fun b!194792 () Bool)

(declare-fun res!162884 () Bool)

(assert (=> b!194792 (=> (not res!162884) (not e!133975))))

(assert (=> b!194792 (= res!162884 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!303254))))

(declare-fun b!194793 () Bool)

(declare-fun lt!303252 () (_ BitVec 64))

(assert (=> b!194793 (= e!133975 (bvsle lt!303254 (bvmul lt!303252 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194793 (or (= lt!303252 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!303252 #b0000000000000000000000000000000000000000000000000000000000001000) lt!303252)))))

(assert (=> b!194793 (= lt!303252 ((_ sign_extend 32) (size!4409 (buf!4892 (_2!9053 lt!302032)))))))

(assert (= (and d!66205 res!162883) b!194792))

(assert (= (and b!194792 res!162884) b!194793))

(declare-fun m!301983 () Bool)

(assert (=> d!66205 m!301983))

(declare-fun m!301985 () Bool)

(assert (=> d!66205 m!301985))

(assert (=> b!194344 d!66205))

(assert (=> b!194325 d!66181))

(assert (=> b!194325 d!66183))

(declare-fun b!194805 () Bool)

(declare-fun e!133981 () Bool)

(declare-fun e!133980 () Bool)

(assert (=> b!194805 (= e!133981 e!133980)))

(declare-fun res!162896 () Bool)

(assert (=> b!194805 (=> (not res!162896) (not e!133980))))

(declare-fun lt!303266 () tuple2!16818)

(declare-fun lt!303265 () tuple2!16820)

(assert (=> b!194805 (= res!162896 (and (= (_2!9055 lt!303265) lt!302030) (= (_1!9055 lt!303265) (_2!9054 lt!303266))))))

(assert (=> b!194805 (= lt!303265 (readBitPure!0 (readerFrom!0 (_2!9054 lt!303266) (currentBit!9177 thiss!1204) (currentByte!9182 thiss!1204))))))

(declare-fun b!194803 () Bool)

(declare-fun res!162893 () Bool)

(assert (=> b!194803 (=> (not res!162893) (not e!133981))))

(declare-fun lt!303263 () (_ BitVec 64))

(declare-fun lt!303264 () (_ BitVec 64))

(assert (=> b!194803 (= res!162893 (= (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!303266))) (currentByte!9182 (_2!9054 lt!303266)) (currentBit!9177 (_2!9054 lt!303266))) (bvadd lt!303263 lt!303264)))))

(assert (=> b!194803 (or (not (= (bvand lt!303263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!303264 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!303263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!303263 lt!303264) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194803 (= lt!303264 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!194803 (= lt!303263 (bitIndex!0 (size!4409 (buf!4892 thiss!1204)) (currentByte!9182 thiss!1204) (currentBit!9177 thiss!1204)))))

(declare-fun d!66207 () Bool)

(assert (=> d!66207 e!133981))

(declare-fun res!162895 () Bool)

(assert (=> d!66207 (=> (not res!162895) (not e!133981))))

(assert (=> d!66207 (= res!162895 (= (size!4409 (buf!4892 thiss!1204)) (size!4409 (buf!4892 (_2!9054 lt!303266)))))))

(declare-fun choose!16 (BitStream!7926 Bool) tuple2!16818)

(assert (=> d!66207 (= lt!303266 (choose!16 thiss!1204 lt!302030))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!66207 (validate_offset_bit!0 ((_ sign_extend 32) (size!4409 (buf!4892 thiss!1204))) ((_ sign_extend 32) (currentByte!9182 thiss!1204)) ((_ sign_extend 32) (currentBit!9177 thiss!1204)))))

(assert (=> d!66207 (= (appendBit!0 thiss!1204 lt!302030) lt!303266)))

(declare-fun b!194804 () Bool)

(declare-fun res!162894 () Bool)

(assert (=> b!194804 (=> (not res!162894) (not e!133981))))

(assert (=> b!194804 (= res!162894 (isPrefixOf!0 thiss!1204 (_2!9054 lt!303266)))))

(declare-fun b!194806 () Bool)

(assert (=> b!194806 (= e!133980 (= (bitIndex!0 (size!4409 (buf!4892 (_1!9055 lt!303265))) (currentByte!9182 (_1!9055 lt!303265)) (currentBit!9177 (_1!9055 lt!303265))) (bitIndex!0 (size!4409 (buf!4892 (_2!9054 lt!303266))) (currentByte!9182 (_2!9054 lt!303266)) (currentBit!9177 (_2!9054 lt!303266)))))))

(assert (= (and d!66207 res!162895) b!194803))

(assert (= (and b!194803 res!162893) b!194804))

(assert (= (and b!194804 res!162894) b!194805))

(assert (= (and b!194805 res!162896) b!194806))

(declare-fun m!301987 () Bool)

(assert (=> b!194804 m!301987))

(declare-fun m!301989 () Bool)

(assert (=> b!194805 m!301989))

(assert (=> b!194805 m!301989))

(declare-fun m!301991 () Bool)

(assert (=> b!194805 m!301991))

(declare-fun m!301993 () Bool)

(assert (=> d!66207 m!301993))

(declare-fun m!301995 () Bool)

(assert (=> d!66207 m!301995))

(declare-fun m!301997 () Bool)

(assert (=> b!194806 m!301997))

(declare-fun m!301999 () Bool)

(assert (=> b!194806 m!301999))

(assert (=> b!194803 m!301999))

(assert (=> b!194803 m!301129))

(assert (=> b!194325 d!66207))

(declare-fun d!66209 () Bool)

(assert (=> d!66209 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4409 (buf!4892 (_1!9053 lt!302032)))) ((_ sign_extend 32) (currentByte!9182 (_1!9053 lt!302032))) ((_ sign_extend 32) (currentBit!9177 (_1!9053 lt!302032))) lt!302031) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4409 (buf!4892 (_1!9053 lt!302032)))) ((_ sign_extend 32) (currentByte!9182 (_1!9053 lt!302032))) ((_ sign_extend 32) (currentBit!9177 (_1!9053 lt!302032)))) lt!302031))))

(declare-fun bs!16448 () Bool)

(assert (= bs!16448 d!66209))

(declare-fun m!302001 () Bool)

(assert (=> bs!16448 m!302001))

(assert (=> b!194335 d!66209))

(declare-fun d!66211 () Bool)

(declare-fun e!133982 () Bool)

(assert (=> d!66211 e!133982))

(declare-fun res!162897 () Bool)

(assert (=> d!66211 (=> (not res!162897) (not e!133982))))

(declare-fun lt!303268 () (_ BitVec 64))

(declare-fun lt!303267 () BitStream!7926)

(assert (=> d!66211 (= res!162897 (= (bvadd lt!303268 (bvsub lt!302041 lt!302036)) (bitIndex!0 (size!4409 (buf!4892 lt!303267)) (currentByte!9182 lt!303267) (currentBit!9177 lt!303267))))))

(assert (=> d!66211 (or (not (= (bvand lt!303268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302041 lt!302036) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!303268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!303268 (bvsub lt!302041 lt!302036)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66211 (= lt!303268 (bitIndex!0 (size!4409 (buf!4892 (_2!9053 lt!302032))) (currentByte!9182 (_2!9053 lt!302032)) (currentBit!9177 (_2!9053 lt!302032))))))

(assert (=> d!66211 (= lt!303267 (_2!9054 (moveBitIndex!0 (_2!9053 lt!302032) (bvsub lt!302041 lt!302036))))))

(assert (=> d!66211 (moveBitIndexPrecond!0 (_2!9053 lt!302032) (bvsub lt!302041 lt!302036))))

(assert (=> d!66211 (= (withMovedBitIndex!0 (_2!9053 lt!302032) (bvsub lt!302041 lt!302036)) lt!303267)))

(declare-fun b!194807 () Bool)

(assert (=> b!194807 (= e!133982 (= (size!4409 (buf!4892 (_2!9053 lt!302032))) (size!4409 (buf!4892 lt!303267))))))

(assert (= (and d!66211 res!162897) b!194807))

(declare-fun m!302003 () Bool)

(assert (=> d!66211 m!302003))

(assert (=> d!66211 m!301121))

(declare-fun m!302005 () Bool)

(assert (=> d!66211 m!302005))

(declare-fun m!302007 () Bool)

(assert (=> d!66211 m!302007))

(assert (=> b!194324 d!66211))

(check-sat (not b!194766) (not b!194771) (not b!194678) (not d!66185) (not b!194675) (not d!66157) (not b!194674) (not d!66197) (not d!65961) (not d!66121) (not d!66181) (not b!194433) (not d!66169) (not b!194765) (not b!194804) (not b!194680) (not d!66171) (not b!194683) (not d!66207) (not d!66111) (not d!66167) (not d!65951) (not b!194770) (not b!194803) (not d!66117) (not d!66173) (not d!66091) (not d!66203) (not b!194805) (not b!194767) (not b!194788) (not d!66093) (not d!66161) (not d!66195) (not b!194673) (not d!66165) (not d!66163) (not b!194444) (not d!66159) (not b!194764) (not b!194786) (not b!194785) (not b!194806) (not d!66183) (not b!194442) (not b!194682) (not b!194762) (not d!65955) (not b!194668) (not d!66187) (not d!66205) (not d!66177) (not b!194670) (not d!65959) (not bm!3062) (not d!66153) (not d!66211) (not d!66199) (not d!66155) (not b!194435) (not b!194769) (not d!66209) (not b!194672))
(check-sat)
