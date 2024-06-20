; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5702 () Bool)

(assert start!5702)

(declare-fun b!24378 () Bool)

(declare-fun e!16605 () Bool)

(declare-fun e!16606 () Bool)

(assert (=> b!24378 (= e!16605 (not e!16606))))

(declare-fun res!21036 () Bool)

(assert (=> b!24378 (=> res!21036 e!16606)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!24378 (= res!21036 (bvsge i!635 to!314))))

(declare-datatypes ((array!1625 0))(
  ( (array!1626 (arr!1154 (Array (_ BitVec 32) (_ BitVec 8))) (size!698 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1228 0))(
  ( (BitStream!1229 (buf!1019 array!1625) (currentByte!2332 (_ BitVec 32)) (currentBit!2327 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1228)

(declare-fun isPrefixOf!0 (BitStream!1228 BitStream!1228) Bool)

(assert (=> b!24378 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2039 0))(
  ( (Unit!2040) )
))
(declare-fun lt!34863 () Unit!2039)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1228) Unit!2039)

(assert (=> b!24378 (= lt!34863 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!34858 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24378 (= lt!34858 (bitIndex!0 (size!698 (buf!1019 thiss!1379)) (currentByte!2332 thiss!1379) (currentBit!2327 thiss!1379)))))

(declare-fun b!24379 () Bool)

(declare-fun res!21034 () Bool)

(declare-fun e!16611 () Bool)

(assert (=> b!24379 (=> res!21034 e!16611)))

(declare-datatypes ((tuple2!2774 0))(
  ( (tuple2!2775 (_1!1474 Unit!2039) (_2!1474 BitStream!1228)) )
))
(declare-fun lt!34855 () tuple2!2774)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24379 (= res!21034 (not (invariant!0 (currentBit!2327 (_2!1474 lt!34855)) (currentByte!2332 (_2!1474 lt!34855)) (size!698 (buf!1019 (_2!1474 lt!34855))))))))

(declare-fun b!24381 () Bool)

(declare-fun res!21045 () Bool)

(assert (=> b!24381 (=> res!21045 e!16611)))

(declare-fun lt!34861 () tuple2!2774)

(assert (=> b!24381 (= res!21045 (not (invariant!0 (currentBit!2327 (_2!1474 lt!34855)) (currentByte!2332 (_2!1474 lt!34855)) (size!698 (buf!1019 (_2!1474 lt!34861))))))))

(declare-fun b!24382 () Bool)

(declare-fun e!16609 () Bool)

(declare-fun e!16610 () Bool)

(assert (=> b!24382 (= e!16609 e!16610)))

(declare-fun res!21044 () Bool)

(assert (=> b!24382 (=> res!21044 e!16610)))

(declare-fun lt!34854 () (_ BitVec 64))

(assert (=> b!24382 (= res!21044 (not (= lt!34854 (bvsub (bvadd lt!34858 to!314) i!635))))))

(assert (=> b!24382 (= lt!34854 (bitIndex!0 (size!698 (buf!1019 (_2!1474 lt!34861))) (currentByte!2332 (_2!1474 lt!34861)) (currentBit!2327 (_2!1474 lt!34861))))))

(declare-fun b!24383 () Bool)

(declare-fun res!21035 () Bool)

(assert (=> b!24383 (=> res!21035 e!16610)))

(assert (=> b!24383 (= res!21035 (not (= (size!698 (buf!1019 thiss!1379)) (size!698 (buf!1019 (_2!1474 lt!34861))))))))

(declare-fun b!24384 () Bool)

(declare-fun res!21038 () Bool)

(assert (=> b!24384 (=> res!21038 e!16610)))

(assert (=> b!24384 (= res!21038 (not (invariant!0 (currentBit!2327 (_2!1474 lt!34861)) (currentByte!2332 (_2!1474 lt!34861)) (size!698 (buf!1019 (_2!1474 lt!34861))))))))

(declare-fun b!24385 () Bool)

(assert (=> b!24385 (= e!16610 e!16611)))

(declare-fun res!21043 () Bool)

(assert (=> b!24385 (=> res!21043 e!16611)))

(assert (=> b!24385 (= res!21043 (not (= (size!698 (buf!1019 (_2!1474 lt!34855))) (size!698 (buf!1019 (_2!1474 lt!34861))))))))

(declare-fun e!16613 () Bool)

(assert (=> b!24385 e!16613))

(declare-fun res!21040 () Bool)

(assert (=> b!24385 (=> (not res!21040) (not e!16613))))

(assert (=> b!24385 (= res!21040 (= (size!698 (buf!1019 (_2!1474 lt!34861))) (size!698 (buf!1019 thiss!1379))))))

(declare-fun b!24386 () Bool)

(assert (=> b!24386 (= e!16613 (= lt!34854 (bvsub (bvsub (bvadd (bitIndex!0 (size!698 (buf!1019 (_2!1474 lt!34855))) (currentByte!2332 (_2!1474 lt!34855)) (currentBit!2327 (_2!1474 lt!34855))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24387 () Bool)

(declare-fun e!16608 () Bool)

(assert (=> b!24387 (= e!16608 e!16609)))

(declare-fun res!21042 () Bool)

(assert (=> b!24387 (=> res!21042 e!16609)))

(assert (=> b!24387 (= res!21042 (not (isPrefixOf!0 (_2!1474 lt!34855) (_2!1474 lt!34861))))))

(assert (=> b!24387 (isPrefixOf!0 thiss!1379 (_2!1474 lt!34861))))

(declare-fun lt!34866 () Unit!2039)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1228 BitStream!1228 BitStream!1228) Unit!2039)

(assert (=> b!24387 (= lt!34866 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1474 lt!34855) (_2!1474 lt!34861)))))

(declare-fun srcBuffer!2 () array!1625)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1228 array!1625 (_ BitVec 64) (_ BitVec 64)) tuple2!2774)

(assert (=> b!24387 (= lt!34861 (appendBitsMSBFirstLoop!0 (_2!1474 lt!34855) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!16615 () Bool)

(assert (=> b!24387 e!16615))

(declare-fun res!21041 () Bool)

(assert (=> b!24387 (=> (not res!21041) (not e!16615))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24387 (= res!21041 (validate_offset_bits!1 ((_ sign_extend 32) (size!698 (buf!1019 (_2!1474 lt!34855)))) ((_ sign_extend 32) (currentByte!2332 thiss!1379)) ((_ sign_extend 32) (currentBit!2327 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34857 () Unit!2039)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1228 array!1625 (_ BitVec 64)) Unit!2039)

(assert (=> b!24387 (= lt!34857 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1019 (_2!1474 lt!34855)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2776 0))(
  ( (tuple2!2777 (_1!1475 BitStream!1228) (_2!1475 BitStream!1228)) )
))
(declare-fun lt!34867 () tuple2!2776)

(declare-fun reader!0 (BitStream!1228 BitStream!1228) tuple2!2776)

(assert (=> b!24387 (= lt!34867 (reader!0 thiss!1379 (_2!1474 lt!34855)))))

(declare-fun res!21037 () Bool)

(assert (=> start!5702 (=> (not res!21037) (not e!16605))))

(assert (=> start!5702 (= res!21037 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!698 srcBuffer!2))))))))

(assert (=> start!5702 e!16605))

(assert (=> start!5702 true))

(declare-fun array_inv!667 (array!1625) Bool)

(assert (=> start!5702 (array_inv!667 srcBuffer!2)))

(declare-fun e!16607 () Bool)

(declare-fun inv!12 (BitStream!1228) Bool)

(assert (=> start!5702 (and (inv!12 thiss!1379) e!16607)))

(declare-fun b!24380 () Bool)

(assert (=> b!24380 (= e!16607 (array_inv!667 (buf!1019 thiss!1379)))))

(declare-fun b!24388 () Bool)

(declare-fun res!21039 () Bool)

(assert (=> b!24388 (=> (not res!21039) (not e!16605))))

(assert (=> b!24388 (= res!21039 (validate_offset_bits!1 ((_ sign_extend 32) (size!698 (buf!1019 thiss!1379))) ((_ sign_extend 32) (currentByte!2332 thiss!1379)) ((_ sign_extend 32) (currentBit!2327 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24389 () Bool)

(declare-datatypes ((List!315 0))(
  ( (Nil!312) (Cons!311 (h!430 Bool) (t!1065 List!315)) )
))
(declare-fun head!152 (List!315) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1228 array!1625 (_ BitVec 64) (_ BitVec 64)) List!315)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1228 BitStream!1228 (_ BitVec 64)) List!315)

(assert (=> b!24389 (= e!16615 (= (head!152 (byteArrayBitContentToList!0 (_2!1474 lt!34855) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!152 (bitStreamReadBitsIntoList!0 (_2!1474 lt!34855) (_1!1475 lt!34867) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24390 () Bool)

(assert (=> b!24390 (= e!16606 e!16608)))

(declare-fun res!21033 () Bool)

(assert (=> b!24390 (=> res!21033 e!16608)))

(assert (=> b!24390 (= res!21033 (not (isPrefixOf!0 thiss!1379 (_2!1474 lt!34855))))))

(declare-fun lt!34856 () (_ BitVec 64))

(assert (=> b!24390 (validate_offset_bits!1 ((_ sign_extend 32) (size!698 (buf!1019 (_2!1474 lt!34855)))) ((_ sign_extend 32) (currentByte!2332 (_2!1474 lt!34855))) ((_ sign_extend 32) (currentBit!2327 (_2!1474 lt!34855))) lt!34856)))

(assert (=> b!24390 (= lt!34856 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34864 () Unit!2039)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1228 BitStream!1228 (_ BitVec 64) (_ BitVec 64)) Unit!2039)

(assert (=> b!24390 (= lt!34864 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1474 lt!34855) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1228 (_ BitVec 8) (_ BitVec 32)) tuple2!2774)

(assert (=> b!24390 (= lt!34855 (appendBitFromByte!0 thiss!1379 (select (arr!1154 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!24391 () Bool)

(assert (=> b!24391 (= e!16611 (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!24391 (validate_offset_bits!1 ((_ sign_extend 32) (size!698 (buf!1019 (_2!1474 lt!34861)))) ((_ sign_extend 32) (currentByte!2332 (_2!1474 lt!34855))) ((_ sign_extend 32) (currentBit!2327 (_2!1474 lt!34855))) lt!34856)))

(declare-fun lt!34865 () Unit!2039)

(assert (=> b!24391 (= lt!34865 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1474 lt!34855) (buf!1019 (_2!1474 lt!34861)) lt!34856))))

(declare-fun lt!34860 () tuple2!2776)

(assert (=> b!24391 (= lt!34860 (reader!0 (_2!1474 lt!34855) (_2!1474 lt!34861)))))

(assert (=> b!24391 (validate_offset_bits!1 ((_ sign_extend 32) (size!698 (buf!1019 (_2!1474 lt!34861)))) ((_ sign_extend 32) (currentByte!2332 thiss!1379)) ((_ sign_extend 32) (currentBit!2327 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34862 () Unit!2039)

(assert (=> b!24391 (= lt!34862 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1019 (_2!1474 lt!34861)) (bvsub to!314 i!635)))))

(declare-fun lt!34859 () tuple2!2776)

(assert (=> b!24391 (= lt!34859 (reader!0 thiss!1379 (_2!1474 lt!34861)))))

(assert (= (and start!5702 res!21037) b!24388))

(assert (= (and b!24388 res!21039) b!24378))

(assert (= (and b!24378 (not res!21036)) b!24390))

(assert (= (and b!24390 (not res!21033)) b!24387))

(assert (= (and b!24387 res!21041) b!24389))

(assert (= (and b!24387 (not res!21042)) b!24382))

(assert (= (and b!24382 (not res!21044)) b!24384))

(assert (= (and b!24384 (not res!21038)) b!24383))

(assert (= (and b!24383 (not res!21035)) b!24385))

(assert (= (and b!24385 res!21040) b!24386))

(assert (= (and b!24385 (not res!21043)) b!24379))

(assert (= (and b!24379 (not res!21034)) b!24381))

(assert (= (and b!24381 (not res!21045)) b!24391))

(assert (= start!5702 b!24380))

(declare-fun m!34413 () Bool)

(assert (=> b!24382 m!34413))

(declare-fun m!34415 () Bool)

(assert (=> b!24384 m!34415))

(declare-fun m!34417 () Bool)

(assert (=> b!24378 m!34417))

(declare-fun m!34419 () Bool)

(assert (=> b!24378 m!34419))

(declare-fun m!34421 () Bool)

(assert (=> b!24378 m!34421))

(declare-fun m!34423 () Bool)

(assert (=> start!5702 m!34423))

(declare-fun m!34425 () Bool)

(assert (=> start!5702 m!34425))

(declare-fun m!34427 () Bool)

(assert (=> b!24390 m!34427))

(declare-fun m!34429 () Bool)

(assert (=> b!24390 m!34429))

(assert (=> b!24390 m!34427))

(declare-fun m!34431 () Bool)

(assert (=> b!24390 m!34431))

(declare-fun m!34433 () Bool)

(assert (=> b!24390 m!34433))

(declare-fun m!34435 () Bool)

(assert (=> b!24390 m!34435))

(declare-fun m!34437 () Bool)

(assert (=> b!24381 m!34437))

(declare-fun m!34439 () Bool)

(assert (=> b!24379 m!34439))

(declare-fun m!34441 () Bool)

(assert (=> b!24380 m!34441))

(declare-fun m!34443 () Bool)

(assert (=> b!24391 m!34443))

(declare-fun m!34445 () Bool)

(assert (=> b!24391 m!34445))

(declare-fun m!34447 () Bool)

(assert (=> b!24391 m!34447))

(declare-fun m!34449 () Bool)

(assert (=> b!24391 m!34449))

(declare-fun m!34451 () Bool)

(assert (=> b!24391 m!34451))

(declare-fun m!34453 () Bool)

(assert (=> b!24391 m!34453))

(declare-fun m!34455 () Bool)

(assert (=> b!24387 m!34455))

(declare-fun m!34457 () Bool)

(assert (=> b!24387 m!34457))

(declare-fun m!34459 () Bool)

(assert (=> b!24387 m!34459))

(declare-fun m!34461 () Bool)

(assert (=> b!24387 m!34461))

(declare-fun m!34463 () Bool)

(assert (=> b!24387 m!34463))

(declare-fun m!34465 () Bool)

(assert (=> b!24387 m!34465))

(declare-fun m!34467 () Bool)

(assert (=> b!24387 m!34467))

(declare-fun m!34469 () Bool)

(assert (=> b!24388 m!34469))

(declare-fun m!34471 () Bool)

(assert (=> b!24386 m!34471))

(declare-fun m!34473 () Bool)

(assert (=> b!24389 m!34473))

(assert (=> b!24389 m!34473))

(declare-fun m!34475 () Bool)

(assert (=> b!24389 m!34475))

(declare-fun m!34477 () Bool)

(assert (=> b!24389 m!34477))

(assert (=> b!24389 m!34477))

(declare-fun m!34479 () Bool)

(assert (=> b!24389 m!34479))

(push 1)

(assert (not start!5702))

(assert (not b!24384))

(assert (not b!24391))

(assert (not b!24386))

(assert (not b!24388))

(assert (not b!24379))

(assert (not b!24390))

(assert (not b!24387))

(assert (not b!24382))

(assert (not b!24381))

(assert (not b!24389))

(assert (not b!24378))

(assert (not b!24380))

(check-sat)

(pop 1)

(push 1)

(check-sat)

