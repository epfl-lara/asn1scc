; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5732 () Bool)

(assert start!5732)

(declare-fun b!25008 () Bool)

(declare-fun e!17107 () Bool)

(declare-fun e!17103 () Bool)

(assert (=> b!25008 (= e!17107 e!17103)))

(declare-fun res!21618 () Bool)

(assert (=> b!25008 (=> res!21618 e!17103)))

(declare-fun lt!35493 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!35486 () (_ BitVec 64))

(assert (=> b!25008 (= res!21618 (not (= lt!35493 (bvsub (bvadd lt!35486 to!314) i!635))))))

(declare-datatypes ((array!1655 0))(
  ( (array!1656 (arr!1169 (Array (_ BitVec 32) (_ BitVec 8))) (size!713 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1258 0))(
  ( (BitStream!1259 (buf!1034 array!1655) (currentByte!2347 (_ BitVec 32)) (currentBit!2342 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2069 0))(
  ( (Unit!2070) )
))
(declare-datatypes ((tuple2!2834 0))(
  ( (tuple2!2835 (_1!1504 Unit!2069) (_2!1504 BitStream!1258)) )
))
(declare-fun lt!35491 () tuple2!2834)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!25008 (= lt!35493 (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!35491))) (currentByte!2347 (_2!1504 lt!35491)) (currentBit!2342 (_2!1504 lt!35491))))))

(declare-fun srcBuffer!2 () array!1655)

(declare-datatypes ((tuple2!2836 0))(
  ( (tuple2!2837 (_1!1505 BitStream!1258) (_2!1505 BitStream!1258)) )
))
(declare-fun lt!35497 () tuple2!2836)

(declare-fun b!25009 () Bool)

(declare-fun e!17102 () Bool)

(declare-fun lt!35484 () tuple2!2834)

(declare-datatypes ((List!330 0))(
  ( (Nil!327) (Cons!326 (h!445 Bool) (t!1080 List!330)) )
))
(declare-fun head!167 (List!330) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1258 array!1655 (_ BitVec 64) (_ BitVec 64)) List!330)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1258 BitStream!1258 (_ BitVec 64)) List!330)

(assert (=> b!25009 (= e!17102 (= (head!167 (byteArrayBitContentToList!0 (_2!1504 lt!35484) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!167 (bitStreamReadBitsIntoList!0 (_2!1504 lt!35484) (_1!1505 lt!35497) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!25010 () Bool)

(declare-fun res!21627 () Bool)

(declare-fun e!17108 () Bool)

(assert (=> b!25010 (=> res!21627 e!17108)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!25010 (= res!21627 (not (invariant!0 (currentBit!2342 (_2!1504 lt!35484)) (currentByte!2347 (_2!1504 lt!35484)) (size!713 (buf!1034 (_2!1504 lt!35491))))))))

(declare-fun b!25011 () Bool)

(declare-fun e!17110 () Bool)

(declare-fun e!17104 () Bool)

(assert (=> b!25011 (= e!17110 e!17104)))

(declare-fun res!21621 () Bool)

(assert (=> b!25011 (=> res!21621 e!17104)))

(declare-fun thiss!1379 () BitStream!1258)

(declare-fun isPrefixOf!0 (BitStream!1258 BitStream!1258) Bool)

(assert (=> b!25011 (= res!21621 (not (isPrefixOf!0 thiss!1379 (_2!1504 lt!35484))))))

(declare-fun lt!35489 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!25011 (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35484)))) ((_ sign_extend 32) (currentByte!2347 (_2!1504 lt!35484))) ((_ sign_extend 32) (currentBit!2342 (_2!1504 lt!35484))) lt!35489)))

(assert (=> b!25011 (= lt!35489 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35485 () Unit!2069)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1258 BitStream!1258 (_ BitVec 64) (_ BitVec 64)) Unit!2069)

(assert (=> b!25011 (= lt!35485 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1504 lt!35484) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1258 (_ BitVec 8) (_ BitVec 32)) tuple2!2834)

(assert (=> b!25011 (= lt!35484 (appendBitFromByte!0 thiss!1379 (select (arr!1169 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!25012 () Bool)

(declare-fun e!17100 () Bool)

(declare-fun array_inv!682 (array!1655) Bool)

(assert (=> b!25012 (= e!17100 (array_inv!682 (buf!1034 thiss!1379)))))

(declare-fun b!25013 () Bool)

(declare-fun res!21628 () Bool)

(assert (=> b!25013 (=> res!21628 e!17103)))

(assert (=> b!25013 (= res!21628 (not (invariant!0 (currentBit!2342 (_2!1504 lt!35491)) (currentByte!2347 (_2!1504 lt!35491)) (size!713 (buf!1034 (_2!1504 lt!35491))))))))

(declare-fun b!25014 () Bool)

(declare-fun res!21622 () Bool)

(assert (=> b!25014 (=> res!21622 e!17103)))

(assert (=> b!25014 (= res!21622 (not (= (size!713 (buf!1034 thiss!1379)) (size!713 (buf!1034 (_2!1504 lt!35491))))))))

(declare-fun b!25015 () Bool)

(declare-fun e!17106 () Bool)

(assert (=> b!25015 (= e!17106 (= lt!35493 (bvsub (bvsub (bvadd (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!35484))) (currentByte!2347 (_2!1504 lt!35484)) (currentBit!2342 (_2!1504 lt!35484))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!21620 () Bool)

(declare-fun e!17109 () Bool)

(assert (=> start!5732 (=> (not res!21620) (not e!17109))))

(assert (=> start!5732 (= res!21620 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!713 srcBuffer!2))))))))

(assert (=> start!5732 e!17109))

(assert (=> start!5732 true))

(assert (=> start!5732 (array_inv!682 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1258) Bool)

(assert (=> start!5732 (and (inv!12 thiss!1379) e!17100)))

(declare-fun lt!35495 () tuple2!2836)

(declare-fun b!25016 () Bool)

(assert (=> b!25016 (= e!17108 (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_1!1505 lt!35495)))) ((_ sign_extend 32) (currentByte!2347 (_1!1505 lt!35495))) ((_ sign_extend 32) (currentBit!2342 (_1!1505 lt!35495))) (bvsub to!314 i!635)))))

(assert (=> b!25016 (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35491)))) ((_ sign_extend 32) (currentByte!2347 (_2!1504 lt!35484))) ((_ sign_extend 32) (currentBit!2342 (_2!1504 lt!35484))) lt!35489)))

(declare-fun lt!35487 () Unit!2069)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1258 array!1655 (_ BitVec 64)) Unit!2069)

(assert (=> b!25016 (= lt!35487 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1504 lt!35484) (buf!1034 (_2!1504 lt!35491)) lt!35489))))

(declare-fun lt!35488 () tuple2!2836)

(declare-fun reader!0 (BitStream!1258 BitStream!1258) tuple2!2836)

(assert (=> b!25016 (= lt!35488 (reader!0 (_2!1504 lt!35484) (_2!1504 lt!35491)))))

(assert (=> b!25016 (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35491)))) ((_ sign_extend 32) (currentByte!2347 thiss!1379)) ((_ sign_extend 32) (currentBit!2342 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!35496 () Unit!2069)

(assert (=> b!25016 (= lt!35496 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1034 (_2!1504 lt!35491)) (bvsub to!314 i!635)))))

(assert (=> b!25016 (= lt!35495 (reader!0 thiss!1379 (_2!1504 lt!35491)))))

(declare-fun b!25017 () Bool)

(assert (=> b!25017 (= e!17109 (not e!17110))))

(declare-fun res!21623 () Bool)

(assert (=> b!25017 (=> res!21623 e!17110)))

(assert (=> b!25017 (= res!21623 (bvsge i!635 to!314))))

(assert (=> b!25017 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!35494 () Unit!2069)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1258) Unit!2069)

(assert (=> b!25017 (= lt!35494 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!25017 (= lt!35486 (bitIndex!0 (size!713 (buf!1034 thiss!1379)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379)))))

(declare-fun b!25018 () Bool)

(declare-fun res!21625 () Bool)

(assert (=> b!25018 (=> (not res!21625) (not e!17109))))

(assert (=> b!25018 (= res!21625 (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 thiss!1379))) ((_ sign_extend 32) (currentByte!2347 thiss!1379)) ((_ sign_extend 32) (currentBit!2342 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!25019 () Bool)

(declare-fun res!21629 () Bool)

(assert (=> b!25019 (=> res!21629 e!17108)))

(assert (=> b!25019 (= res!21629 (not (invariant!0 (currentBit!2342 (_2!1504 lt!35484)) (currentByte!2347 (_2!1504 lt!35484)) (size!713 (buf!1034 (_2!1504 lt!35484))))))))

(declare-fun b!25020 () Bool)

(assert (=> b!25020 (= e!17104 e!17107)))

(declare-fun res!21630 () Bool)

(assert (=> b!25020 (=> res!21630 e!17107)))

(assert (=> b!25020 (= res!21630 (not (isPrefixOf!0 (_2!1504 lt!35484) (_2!1504 lt!35491))))))

(assert (=> b!25020 (isPrefixOf!0 thiss!1379 (_2!1504 lt!35491))))

(declare-fun lt!35490 () Unit!2069)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1258 BitStream!1258 BitStream!1258) Unit!2069)

(assert (=> b!25020 (= lt!35490 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1504 lt!35484) (_2!1504 lt!35491)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1258 array!1655 (_ BitVec 64) (_ BitVec 64)) tuple2!2834)

(assert (=> b!25020 (= lt!35491 (appendBitsMSBFirstLoop!0 (_2!1504 lt!35484) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!25020 e!17102))

(declare-fun res!21619 () Bool)

(assert (=> b!25020 (=> (not res!21619) (not e!17102))))

(assert (=> b!25020 (= res!21619 (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35484)))) ((_ sign_extend 32) (currentByte!2347 thiss!1379)) ((_ sign_extend 32) (currentBit!2342 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35492 () Unit!2069)

(assert (=> b!25020 (= lt!35492 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1034 (_2!1504 lt!35484)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!25020 (= lt!35497 (reader!0 thiss!1379 (_2!1504 lt!35484)))))

(declare-fun b!25021 () Bool)

(assert (=> b!25021 (= e!17103 e!17108)))

(declare-fun res!21624 () Bool)

(assert (=> b!25021 (=> res!21624 e!17108)))

(assert (=> b!25021 (= res!21624 (not (= (size!713 (buf!1034 (_2!1504 lt!35484))) (size!713 (buf!1034 (_2!1504 lt!35491))))))))

(assert (=> b!25021 e!17106))

(declare-fun res!21626 () Bool)

(assert (=> b!25021 (=> (not res!21626) (not e!17106))))

(assert (=> b!25021 (= res!21626 (= (size!713 (buf!1034 (_2!1504 lt!35491))) (size!713 (buf!1034 thiss!1379))))))

(assert (= (and start!5732 res!21620) b!25018))

(assert (= (and b!25018 res!21625) b!25017))

(assert (= (and b!25017 (not res!21623)) b!25011))

(assert (= (and b!25011 (not res!21621)) b!25020))

(assert (= (and b!25020 res!21619) b!25009))

(assert (= (and b!25020 (not res!21630)) b!25008))

(assert (= (and b!25008 (not res!21618)) b!25013))

(assert (= (and b!25013 (not res!21628)) b!25014))

(assert (= (and b!25014 (not res!21622)) b!25021))

(assert (= (and b!25021 res!21626) b!25015))

(assert (= (and b!25021 (not res!21624)) b!25019))

(assert (= (and b!25019 (not res!21629)) b!25010))

(assert (= (and b!25010 (not res!21627)) b!25016))

(assert (= start!5732 b!25012))

(declare-fun m!35433 () Bool)

(assert (=> b!25008 m!35433))

(declare-fun m!35435 () Bool)

(assert (=> b!25010 m!35435))

(declare-fun m!35437 () Bool)

(assert (=> b!25016 m!35437))

(declare-fun m!35439 () Bool)

(assert (=> b!25016 m!35439))

(declare-fun m!35441 () Bool)

(assert (=> b!25016 m!35441))

(declare-fun m!35443 () Bool)

(assert (=> b!25016 m!35443))

(declare-fun m!35445 () Bool)

(assert (=> b!25016 m!35445))

(declare-fun m!35447 () Bool)

(assert (=> b!25016 m!35447))

(declare-fun m!35449 () Bool)

(assert (=> b!25016 m!35449))

(declare-fun m!35451 () Bool)

(assert (=> b!25017 m!35451))

(declare-fun m!35453 () Bool)

(assert (=> b!25017 m!35453))

(declare-fun m!35455 () Bool)

(assert (=> b!25017 m!35455))

(declare-fun m!35457 () Bool)

(assert (=> b!25019 m!35457))

(declare-fun m!35459 () Bool)

(assert (=> b!25020 m!35459))

(declare-fun m!35461 () Bool)

(assert (=> b!25020 m!35461))

(declare-fun m!35463 () Bool)

(assert (=> b!25020 m!35463))

(declare-fun m!35465 () Bool)

(assert (=> b!25020 m!35465))

(declare-fun m!35467 () Bool)

(assert (=> b!25020 m!35467))

(declare-fun m!35469 () Bool)

(assert (=> b!25020 m!35469))

(declare-fun m!35471 () Bool)

(assert (=> b!25020 m!35471))

(declare-fun m!35473 () Bool)

(assert (=> start!5732 m!35473))

(declare-fun m!35475 () Bool)

(assert (=> start!5732 m!35475))

(declare-fun m!35477 () Bool)

(assert (=> b!25012 m!35477))

(declare-fun m!35479 () Bool)

(assert (=> b!25011 m!35479))

(declare-fun m!35481 () Bool)

(assert (=> b!25011 m!35481))

(assert (=> b!25011 m!35479))

(declare-fun m!35483 () Bool)

(assert (=> b!25011 m!35483))

(declare-fun m!35485 () Bool)

(assert (=> b!25011 m!35485))

(declare-fun m!35487 () Bool)

(assert (=> b!25011 m!35487))

(declare-fun m!35489 () Bool)

(assert (=> b!25018 m!35489))

(declare-fun m!35491 () Bool)

(assert (=> b!25013 m!35491))

(declare-fun m!35493 () Bool)

(assert (=> b!25009 m!35493))

(assert (=> b!25009 m!35493))

(declare-fun m!35495 () Bool)

(assert (=> b!25009 m!35495))

(declare-fun m!35497 () Bool)

(assert (=> b!25009 m!35497))

(assert (=> b!25009 m!35497))

(declare-fun m!35499 () Bool)

(assert (=> b!25009 m!35499))

(declare-fun m!35501 () Bool)

(assert (=> b!25015 m!35501))

(push 1)

(assert (not b!25020))

(assert (not b!25012))

(assert (not b!25008))

(assert (not b!25017))

(assert (not b!25013))

(assert (not start!5732))

(assert (not b!25009))

(assert (not b!25010))

(assert (not b!25015))

(assert (not b!25011))

(assert (not b!25019))

(assert (not b!25016))

(assert (not b!25018))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7478 () Bool)

(declare-fun e!17216 () Bool)

(assert (=> d!7478 e!17216))

(declare-fun res!21763 () Bool)

(assert (=> d!7478 (=> (not res!21763) (not e!17216))))

(declare-fun lt!35680 () (_ BitVec 64))

(declare-fun lt!35676 () (_ BitVec 64))

(declare-fun lt!35678 () (_ BitVec 64))

(assert (=> d!7478 (= res!21763 (= lt!35676 (bvsub lt!35680 lt!35678)))))

(assert (=> d!7478 (or (= (bvand lt!35680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!35678 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!35680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!35680 lt!35678) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!7478 (= lt!35678 (remainingBits!0 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35484)))) ((_ sign_extend 32) (currentByte!2347 (_2!1504 lt!35484))) ((_ sign_extend 32) (currentBit!2342 (_2!1504 lt!35484)))))))

(declare-fun lt!35679 () (_ BitVec 64))

(declare-fun lt!35677 () (_ BitVec 64))

(assert (=> d!7478 (= lt!35680 (bvmul lt!35679 lt!35677))))

(assert (=> d!7478 (or (= lt!35679 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!35677 (bvsdiv (bvmul lt!35679 lt!35677) lt!35679)))))

(assert (=> d!7478 (= lt!35677 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7478 (= lt!35679 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35484)))))))

(assert (=> d!7478 (= lt!35676 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2347 (_2!1504 lt!35484))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2342 (_2!1504 lt!35484)))))))

(assert (=> d!7478 (invariant!0 (currentBit!2342 (_2!1504 lt!35484)) (currentByte!2347 (_2!1504 lt!35484)) (size!713 (buf!1034 (_2!1504 lt!35484))))))

(assert (=> d!7478 (= (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!35484))) (currentByte!2347 (_2!1504 lt!35484)) (currentBit!2342 (_2!1504 lt!35484))) lt!35676)))

(declare-fun b!25178 () Bool)

(declare-fun res!21762 () Bool)

(assert (=> b!25178 (=> (not res!21762) (not e!17216))))

(assert (=> b!25178 (= res!21762 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!35676))))

(declare-fun b!25179 () Bool)

(declare-fun lt!35675 () (_ BitVec 64))

(assert (=> b!25179 (= e!17216 (bvsle lt!35676 (bvmul lt!35675 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!25179 (or (= lt!35675 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!35675 #b0000000000000000000000000000000000000000000000000000000000001000) lt!35675)))))

(assert (=> b!25179 (= lt!35675 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35484)))))))

(assert (= (and d!7478 res!21763) b!25178))

(assert (= (and b!25178 res!21762) b!25179))

(declare-fun m!35701 () Bool)

(assert (=> d!7478 m!35701))

(assert (=> d!7478 m!35457))

(assert (=> b!25015 d!7478))

(declare-fun b!25190 () Bool)

(declare-fun res!21771 () Bool)

(declare-fun e!17222 () Bool)

(assert (=> b!25190 (=> (not res!21771) (not e!17222))))

(declare-fun lt!35733 () tuple2!2836)

(assert (=> b!25190 (= res!21771 (isPrefixOf!0 (_2!1505 lt!35733) (_2!1504 lt!35491)))))

(declare-fun d!7480 () Bool)

(assert (=> d!7480 e!17222))

(declare-fun res!21770 () Bool)

(assert (=> d!7480 (=> (not res!21770) (not e!17222))))

(assert (=> d!7480 (= res!21770 (isPrefixOf!0 (_1!1505 lt!35733) (_2!1505 lt!35733)))))

(declare-fun lt!35736 () BitStream!1258)

(assert (=> d!7480 (= lt!35733 (tuple2!2837 lt!35736 (_2!1504 lt!35491)))))

(declare-fun lt!35734 () Unit!2069)

(declare-fun lt!35725 () Unit!2069)

(assert (=> d!7480 (= lt!35734 lt!35725)))

(assert (=> d!7480 (isPrefixOf!0 lt!35736 (_2!1504 lt!35491))))

(assert (=> d!7480 (= lt!35725 (lemmaIsPrefixTransitive!0 lt!35736 (_2!1504 lt!35491) (_2!1504 lt!35491)))))

(declare-fun lt!35737 () Unit!2069)

(declare-fun lt!35739 () Unit!2069)

(assert (=> d!7480 (= lt!35737 lt!35739)))

(assert (=> d!7480 (isPrefixOf!0 lt!35736 (_2!1504 lt!35491))))

(assert (=> d!7480 (= lt!35739 (lemmaIsPrefixTransitive!0 lt!35736 (_2!1504 lt!35484) (_2!1504 lt!35491)))))

(declare-fun lt!35724 () Unit!2069)

(declare-fun e!17221 () Unit!2069)

(assert (=> d!7480 (= lt!35724 e!17221)))

(declare-fun c!1680 () Bool)

(assert (=> d!7480 (= c!1680 (not (= (size!713 (buf!1034 (_2!1504 lt!35484))) #b00000000000000000000000000000000)))))

(declare-fun lt!35731 () Unit!2069)

(declare-fun lt!35726 () Unit!2069)

(assert (=> d!7480 (= lt!35731 lt!35726)))

(assert (=> d!7480 (isPrefixOf!0 (_2!1504 lt!35491) (_2!1504 lt!35491))))

(assert (=> d!7480 (= lt!35726 (lemmaIsPrefixRefl!0 (_2!1504 lt!35491)))))

(declare-fun lt!35729 () Unit!2069)

(declare-fun lt!35732 () Unit!2069)

(assert (=> d!7480 (= lt!35729 lt!35732)))

(assert (=> d!7480 (= lt!35732 (lemmaIsPrefixRefl!0 (_2!1504 lt!35491)))))

(declare-fun lt!35723 () Unit!2069)

(declare-fun lt!35722 () Unit!2069)

(assert (=> d!7480 (= lt!35723 lt!35722)))

(assert (=> d!7480 (isPrefixOf!0 lt!35736 lt!35736)))

(assert (=> d!7480 (= lt!35722 (lemmaIsPrefixRefl!0 lt!35736))))

(declare-fun lt!35740 () Unit!2069)

(declare-fun lt!35728 () Unit!2069)

(assert (=> d!7480 (= lt!35740 lt!35728)))

(assert (=> d!7480 (isPrefixOf!0 (_2!1504 lt!35484) (_2!1504 lt!35484))))

(assert (=> d!7480 (= lt!35728 (lemmaIsPrefixRefl!0 (_2!1504 lt!35484)))))

(assert (=> d!7480 (= lt!35736 (BitStream!1259 (buf!1034 (_2!1504 lt!35491)) (currentByte!2347 (_2!1504 lt!35484)) (currentBit!2342 (_2!1504 lt!35484))))))

(assert (=> d!7480 (isPrefixOf!0 (_2!1504 lt!35484) (_2!1504 lt!35491))))

(assert (=> d!7480 (= (reader!0 (_2!1504 lt!35484) (_2!1504 lt!35491)) lt!35733)))

(declare-fun b!25191 () Bool)

(declare-fun Unit!2084 () Unit!2069)

(assert (=> b!25191 (= e!17221 Unit!2084)))

(declare-fun lt!35735 () (_ BitVec 64))

(declare-fun lt!35721 () (_ BitVec 64))

(declare-fun b!25192 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1258 (_ BitVec 64)) BitStream!1258)

(assert (=> b!25192 (= e!17222 (= (_1!1505 lt!35733) (withMovedBitIndex!0 (_2!1505 lt!35733) (bvsub lt!35735 lt!35721))))))

(assert (=> b!25192 (or (= (bvand lt!35735 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!35721 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!35735 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!35735 lt!35721) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25192 (= lt!35721 (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!35491))) (currentByte!2347 (_2!1504 lt!35491)) (currentBit!2342 (_2!1504 lt!35491))))))

(assert (=> b!25192 (= lt!35735 (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!35484))) (currentByte!2347 (_2!1504 lt!35484)) (currentBit!2342 (_2!1504 lt!35484))))))

(declare-fun b!25193 () Bool)

(declare-fun res!21772 () Bool)

(assert (=> b!25193 (=> (not res!21772) (not e!17222))))

(assert (=> b!25193 (= res!21772 (isPrefixOf!0 (_1!1505 lt!35733) (_2!1504 lt!35484)))))

(declare-fun b!25194 () Bool)

(declare-fun lt!35727 () Unit!2069)

(assert (=> b!25194 (= e!17221 lt!35727)))

(declare-fun lt!35730 () (_ BitVec 64))

(assert (=> b!25194 (= lt!35730 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35738 () (_ BitVec 64))

(assert (=> b!25194 (= lt!35738 (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!35484))) (currentByte!2347 (_2!1504 lt!35484)) (currentBit!2342 (_2!1504 lt!35484))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1655 array!1655 (_ BitVec 64) (_ BitVec 64)) Unit!2069)

(assert (=> b!25194 (= lt!35727 (arrayBitRangesEqSymmetric!0 (buf!1034 (_2!1504 lt!35484)) (buf!1034 (_2!1504 lt!35491)) lt!35730 lt!35738))))

(declare-fun arrayBitRangesEq!0 (array!1655 array!1655 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!25194 (arrayBitRangesEq!0 (buf!1034 (_2!1504 lt!35491)) (buf!1034 (_2!1504 lt!35484)) lt!35730 lt!35738)))

(assert (= (and d!7480 c!1680) b!25194))

(assert (= (and d!7480 (not c!1680)) b!25191))

(assert (= (and d!7480 res!21770) b!25193))

(assert (= (and b!25193 res!21772) b!25190))

(assert (= (and b!25190 res!21771) b!25192))

(declare-fun m!35703 () Bool)

(assert (=> b!25192 m!35703))

(assert (=> b!25192 m!35433))

(assert (=> b!25192 m!35501))

(declare-fun m!35705 () Bool)

(assert (=> b!25193 m!35705))

(declare-fun m!35707 () Bool)

(assert (=> b!25190 m!35707))

(assert (=> b!25194 m!35501))

(declare-fun m!35709 () Bool)

(assert (=> b!25194 m!35709))

(declare-fun m!35711 () Bool)

(assert (=> b!25194 m!35711))

(declare-fun m!35713 () Bool)

(assert (=> d!7480 m!35713))

(declare-fun m!35715 () Bool)

(assert (=> d!7480 m!35715))

(assert (=> d!7480 m!35461))

(declare-fun m!35717 () Bool)

(assert (=> d!7480 m!35717))

(declare-fun m!35719 () Bool)

(assert (=> d!7480 m!35719))

(declare-fun m!35721 () Bool)

(assert (=> d!7480 m!35721))

(declare-fun m!35723 () Bool)

(assert (=> d!7480 m!35723))

(declare-fun m!35725 () Bool)

(assert (=> d!7480 m!35725))

(declare-fun m!35727 () Bool)

(assert (=> d!7480 m!35727))

(declare-fun m!35729 () Bool)

(assert (=> d!7480 m!35729))

(declare-fun m!35731 () Bool)

(assert (=> d!7480 m!35731))

(assert (=> b!25016 d!7480))

(declare-fun d!7482 () Bool)

(assert (=> d!7482 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35491)))) ((_ sign_extend 32) (currentByte!2347 thiss!1379)) ((_ sign_extend 32) (currentBit!2342 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35491)))) ((_ sign_extend 32) (currentByte!2347 thiss!1379)) ((_ sign_extend 32) (currentBit!2342 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2171 () Bool)

(assert (= bs!2171 d!7482))

(declare-fun m!35733 () Bool)

(assert (=> bs!2171 m!35733))

(assert (=> b!25016 d!7482))

(declare-fun d!7484 () Bool)

(assert (=> d!7484 (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35491)))) ((_ sign_extend 32) (currentByte!2347 thiss!1379)) ((_ sign_extend 32) (currentBit!2342 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!35743 () Unit!2069)

(declare-fun choose!9 (BitStream!1258 array!1655 (_ BitVec 64) BitStream!1258) Unit!2069)

(assert (=> d!7484 (= lt!35743 (choose!9 thiss!1379 (buf!1034 (_2!1504 lt!35491)) (bvsub to!314 i!635) (BitStream!1259 (buf!1034 (_2!1504 lt!35491)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379))))))

(assert (=> d!7484 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1034 (_2!1504 lt!35491)) (bvsub to!314 i!635)) lt!35743)))

(declare-fun bs!2172 () Bool)

(assert (= bs!2172 d!7484))

(assert (=> bs!2172 m!35437))

(declare-fun m!35735 () Bool)

(assert (=> bs!2172 m!35735))

(assert (=> b!25016 d!7484))

(declare-fun d!7486 () Bool)

(assert (=> d!7486 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35491)))) ((_ sign_extend 32) (currentByte!2347 (_2!1504 lt!35484))) ((_ sign_extend 32) (currentBit!2342 (_2!1504 lt!35484))) lt!35489) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35491)))) ((_ sign_extend 32) (currentByte!2347 (_2!1504 lt!35484))) ((_ sign_extend 32) (currentBit!2342 (_2!1504 lt!35484)))) lt!35489))))

(declare-fun bs!2173 () Bool)

(assert (= bs!2173 d!7486))

(declare-fun m!35737 () Bool)

(assert (=> bs!2173 m!35737))

(assert (=> b!25016 d!7486))

(declare-fun b!25195 () Bool)

(declare-fun res!21774 () Bool)

(declare-fun e!17224 () Bool)

(assert (=> b!25195 (=> (not res!21774) (not e!17224))))

(declare-fun lt!35756 () tuple2!2836)

(assert (=> b!25195 (= res!21774 (isPrefixOf!0 (_2!1505 lt!35756) (_2!1504 lt!35491)))))

(declare-fun d!7488 () Bool)

(assert (=> d!7488 e!17224))

(declare-fun res!21773 () Bool)

(assert (=> d!7488 (=> (not res!21773) (not e!17224))))

(assert (=> d!7488 (= res!21773 (isPrefixOf!0 (_1!1505 lt!35756) (_2!1505 lt!35756)))))

(declare-fun lt!35759 () BitStream!1258)

(assert (=> d!7488 (= lt!35756 (tuple2!2837 lt!35759 (_2!1504 lt!35491)))))

(declare-fun lt!35757 () Unit!2069)

(declare-fun lt!35748 () Unit!2069)

(assert (=> d!7488 (= lt!35757 lt!35748)))

(assert (=> d!7488 (isPrefixOf!0 lt!35759 (_2!1504 lt!35491))))

(assert (=> d!7488 (= lt!35748 (lemmaIsPrefixTransitive!0 lt!35759 (_2!1504 lt!35491) (_2!1504 lt!35491)))))

(declare-fun lt!35760 () Unit!2069)

(declare-fun lt!35762 () Unit!2069)

(assert (=> d!7488 (= lt!35760 lt!35762)))

(assert (=> d!7488 (isPrefixOf!0 lt!35759 (_2!1504 lt!35491))))

(assert (=> d!7488 (= lt!35762 (lemmaIsPrefixTransitive!0 lt!35759 thiss!1379 (_2!1504 lt!35491)))))

(declare-fun lt!35747 () Unit!2069)

(declare-fun e!17223 () Unit!2069)

(assert (=> d!7488 (= lt!35747 e!17223)))

(declare-fun c!1681 () Bool)

(assert (=> d!7488 (= c!1681 (not (= (size!713 (buf!1034 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!35754 () Unit!2069)

(declare-fun lt!35749 () Unit!2069)

(assert (=> d!7488 (= lt!35754 lt!35749)))

(assert (=> d!7488 (isPrefixOf!0 (_2!1504 lt!35491) (_2!1504 lt!35491))))

(assert (=> d!7488 (= lt!35749 (lemmaIsPrefixRefl!0 (_2!1504 lt!35491)))))

(declare-fun lt!35752 () Unit!2069)

(declare-fun lt!35755 () Unit!2069)

(assert (=> d!7488 (= lt!35752 lt!35755)))

(assert (=> d!7488 (= lt!35755 (lemmaIsPrefixRefl!0 (_2!1504 lt!35491)))))

(declare-fun lt!35746 () Unit!2069)

(declare-fun lt!35745 () Unit!2069)

(assert (=> d!7488 (= lt!35746 lt!35745)))

(assert (=> d!7488 (isPrefixOf!0 lt!35759 lt!35759)))

(assert (=> d!7488 (= lt!35745 (lemmaIsPrefixRefl!0 lt!35759))))

(declare-fun lt!35763 () Unit!2069)

(declare-fun lt!35751 () Unit!2069)

(assert (=> d!7488 (= lt!35763 lt!35751)))

(assert (=> d!7488 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7488 (= lt!35751 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7488 (= lt!35759 (BitStream!1259 (buf!1034 (_2!1504 lt!35491)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379)))))

(assert (=> d!7488 (isPrefixOf!0 thiss!1379 (_2!1504 lt!35491))))

(assert (=> d!7488 (= (reader!0 thiss!1379 (_2!1504 lt!35491)) lt!35756)))

(declare-fun b!25196 () Bool)

(declare-fun Unit!2086 () Unit!2069)

(assert (=> b!25196 (= e!17223 Unit!2086)))

(declare-fun lt!35758 () (_ BitVec 64))

(declare-fun b!25197 () Bool)

(declare-fun lt!35744 () (_ BitVec 64))

(assert (=> b!25197 (= e!17224 (= (_1!1505 lt!35756) (withMovedBitIndex!0 (_2!1505 lt!35756) (bvsub lt!35758 lt!35744))))))

(assert (=> b!25197 (or (= (bvand lt!35758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!35744 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!35758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!35758 lt!35744) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25197 (= lt!35744 (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!35491))) (currentByte!2347 (_2!1504 lt!35491)) (currentBit!2342 (_2!1504 lt!35491))))))

(assert (=> b!25197 (= lt!35758 (bitIndex!0 (size!713 (buf!1034 thiss!1379)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379)))))

(declare-fun b!25198 () Bool)

(declare-fun res!21775 () Bool)

(assert (=> b!25198 (=> (not res!21775) (not e!17224))))

(assert (=> b!25198 (= res!21775 (isPrefixOf!0 (_1!1505 lt!35756) thiss!1379))))

(declare-fun b!25199 () Bool)

(declare-fun lt!35750 () Unit!2069)

(assert (=> b!25199 (= e!17223 lt!35750)))

(declare-fun lt!35753 () (_ BitVec 64))

(assert (=> b!25199 (= lt!35753 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35761 () (_ BitVec 64))

(assert (=> b!25199 (= lt!35761 (bitIndex!0 (size!713 (buf!1034 thiss!1379)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379)))))

(assert (=> b!25199 (= lt!35750 (arrayBitRangesEqSymmetric!0 (buf!1034 thiss!1379) (buf!1034 (_2!1504 lt!35491)) lt!35753 lt!35761))))

(assert (=> b!25199 (arrayBitRangesEq!0 (buf!1034 (_2!1504 lt!35491)) (buf!1034 thiss!1379) lt!35753 lt!35761)))

(assert (= (and d!7488 c!1681) b!25199))

(assert (= (and d!7488 (not c!1681)) b!25196))

(assert (= (and d!7488 res!21773) b!25198))

(assert (= (and b!25198 res!21775) b!25195))

(assert (= (and b!25195 res!21774) b!25197))

(declare-fun m!35739 () Bool)

(assert (=> b!25197 m!35739))

(assert (=> b!25197 m!35433))

(assert (=> b!25197 m!35455))

(declare-fun m!35741 () Bool)

(assert (=> b!25198 m!35741))

(declare-fun m!35743 () Bool)

(assert (=> b!25195 m!35743))

(assert (=> b!25199 m!35455))

(declare-fun m!35745 () Bool)

(assert (=> b!25199 m!35745))

(declare-fun m!35747 () Bool)

(assert (=> b!25199 m!35747))

(assert (=> d!7488 m!35713))

(assert (=> d!7488 m!35715))

(assert (=> d!7488 m!35459))

(declare-fun m!35749 () Bool)

(assert (=> d!7488 m!35749))

(declare-fun m!35751 () Bool)

(assert (=> d!7488 m!35751))

(declare-fun m!35753 () Bool)

(assert (=> d!7488 m!35753))

(declare-fun m!35755 () Bool)

(assert (=> d!7488 m!35755))

(assert (=> d!7488 m!35451))

(declare-fun m!35757 () Bool)

(assert (=> d!7488 m!35757))

(assert (=> d!7488 m!35453))

(declare-fun m!35759 () Bool)

(assert (=> d!7488 m!35759))

(assert (=> b!25016 d!7488))

(declare-fun d!7490 () Bool)

(assert (=> d!7490 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_1!1505 lt!35495)))) ((_ sign_extend 32) (currentByte!2347 (_1!1505 lt!35495))) ((_ sign_extend 32) (currentBit!2342 (_1!1505 lt!35495))) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!713 (buf!1034 (_1!1505 lt!35495)))) ((_ sign_extend 32) (currentByte!2347 (_1!1505 lt!35495))) ((_ sign_extend 32) (currentBit!2342 (_1!1505 lt!35495)))) (bvsub to!314 i!635)))))

(declare-fun bs!2174 () Bool)

(assert (= bs!2174 d!7490))

(declare-fun m!35761 () Bool)

(assert (=> bs!2174 m!35761))

(assert (=> b!25016 d!7490))

(declare-fun d!7492 () Bool)

(assert (=> d!7492 (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35491)))) ((_ sign_extend 32) (currentByte!2347 (_2!1504 lt!35484))) ((_ sign_extend 32) (currentBit!2342 (_2!1504 lt!35484))) lt!35489)))

(declare-fun lt!35764 () Unit!2069)

(assert (=> d!7492 (= lt!35764 (choose!9 (_2!1504 lt!35484) (buf!1034 (_2!1504 lt!35491)) lt!35489 (BitStream!1259 (buf!1034 (_2!1504 lt!35491)) (currentByte!2347 (_2!1504 lt!35484)) (currentBit!2342 (_2!1504 lt!35484)))))))

(assert (=> d!7492 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1504 lt!35484) (buf!1034 (_2!1504 lt!35491)) lt!35489) lt!35764)))

(declare-fun bs!2175 () Bool)

(assert (= bs!2175 d!7492))

(assert (=> bs!2175 m!35447))

(declare-fun m!35763 () Bool)

(assert (=> bs!2175 m!35763))

(assert (=> b!25016 d!7492))

(declare-fun d!7494 () Bool)

(declare-fun res!21782 () Bool)

(declare-fun e!17230 () Bool)

(assert (=> d!7494 (=> (not res!21782) (not e!17230))))

(assert (=> d!7494 (= res!21782 (= (size!713 (buf!1034 thiss!1379)) (size!713 (buf!1034 thiss!1379))))))

(assert (=> d!7494 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!17230)))

(declare-fun b!25206 () Bool)

(declare-fun res!21783 () Bool)

(assert (=> b!25206 (=> (not res!21783) (not e!17230))))

(assert (=> b!25206 (= res!21783 (bvsle (bitIndex!0 (size!713 (buf!1034 thiss!1379)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379)) (bitIndex!0 (size!713 (buf!1034 thiss!1379)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379))))))

(declare-fun b!25207 () Bool)

(declare-fun e!17229 () Bool)

(assert (=> b!25207 (= e!17230 e!17229)))

(declare-fun res!21784 () Bool)

(assert (=> b!25207 (=> res!21784 e!17229)))

(assert (=> b!25207 (= res!21784 (= (size!713 (buf!1034 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!25208 () Bool)

(assert (=> b!25208 (= e!17229 (arrayBitRangesEq!0 (buf!1034 thiss!1379) (buf!1034 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!713 (buf!1034 thiss!1379)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379))))))

(assert (= (and d!7494 res!21782) b!25206))

(assert (= (and b!25206 res!21783) b!25207))

(assert (= (and b!25207 (not res!21784)) b!25208))

(assert (=> b!25206 m!35455))

(assert (=> b!25206 m!35455))

(assert (=> b!25208 m!35455))

(assert (=> b!25208 m!35455))

(declare-fun m!35765 () Bool)

(assert (=> b!25208 m!35765))

(assert (=> b!25017 d!7494))

(declare-fun d!7496 () Bool)

(assert (=> d!7496 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!35767 () Unit!2069)

(declare-fun choose!11 (BitStream!1258) Unit!2069)

(assert (=> d!7496 (= lt!35767 (choose!11 thiss!1379))))

(assert (=> d!7496 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!35767)))

(declare-fun bs!2177 () Bool)

(assert (= bs!2177 d!7496))

(assert (=> bs!2177 m!35451))

(declare-fun m!35767 () Bool)

(assert (=> bs!2177 m!35767))

(assert (=> b!25017 d!7496))

(declare-fun d!7498 () Bool)

(declare-fun e!17231 () Bool)

(assert (=> d!7498 e!17231))

(declare-fun res!21786 () Bool)

(assert (=> d!7498 (=> (not res!21786) (not e!17231))))

(declare-fun lt!35769 () (_ BitVec 64))

(declare-fun lt!35771 () (_ BitVec 64))

(declare-fun lt!35773 () (_ BitVec 64))

(assert (=> d!7498 (= res!21786 (= lt!35769 (bvsub lt!35773 lt!35771)))))

(assert (=> d!7498 (or (= (bvand lt!35773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!35771 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!35773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!35773 lt!35771) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7498 (= lt!35771 (remainingBits!0 ((_ sign_extend 32) (size!713 (buf!1034 thiss!1379))) ((_ sign_extend 32) (currentByte!2347 thiss!1379)) ((_ sign_extend 32) (currentBit!2342 thiss!1379))))))

(declare-fun lt!35772 () (_ BitVec 64))

(declare-fun lt!35770 () (_ BitVec 64))

(assert (=> d!7498 (= lt!35773 (bvmul lt!35772 lt!35770))))

(assert (=> d!7498 (or (= lt!35772 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!35770 (bvsdiv (bvmul lt!35772 lt!35770) lt!35772)))))

(assert (=> d!7498 (= lt!35770 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7498 (= lt!35772 ((_ sign_extend 32) (size!713 (buf!1034 thiss!1379))))))

(assert (=> d!7498 (= lt!35769 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2347 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2342 thiss!1379))))))

(assert (=> d!7498 (invariant!0 (currentBit!2342 thiss!1379) (currentByte!2347 thiss!1379) (size!713 (buf!1034 thiss!1379)))))

(assert (=> d!7498 (= (bitIndex!0 (size!713 (buf!1034 thiss!1379)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379)) lt!35769)))

(declare-fun b!25209 () Bool)

(declare-fun res!21785 () Bool)

(assert (=> b!25209 (=> (not res!21785) (not e!17231))))

(assert (=> b!25209 (= res!21785 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!35769))))

(declare-fun b!25210 () Bool)

(declare-fun lt!35768 () (_ BitVec 64))

(assert (=> b!25210 (= e!17231 (bvsle lt!35769 (bvmul lt!35768 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!25210 (or (= lt!35768 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!35768 #b0000000000000000000000000000000000000000000000000000000000001000) lt!35768)))))

(assert (=> b!25210 (= lt!35768 ((_ sign_extend 32) (size!713 (buf!1034 thiss!1379))))))

(assert (= (and d!7498 res!21786) b!25209))

(assert (= (and b!25209 res!21785) b!25210))

(declare-fun m!35769 () Bool)

(assert (=> d!7498 m!35769))

(declare-fun m!35771 () Bool)

(assert (=> d!7498 m!35771))

(assert (=> b!25017 d!7498))

(declare-fun d!7500 () Bool)

(assert (=> d!7500 (= (array_inv!682 (buf!1034 thiss!1379)) (bvsge (size!713 (buf!1034 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!25012 d!7500))

(declare-fun d!7502 () Bool)

(assert (=> d!7502 (= (invariant!0 (currentBit!2342 (_2!1504 lt!35491)) (currentByte!2347 (_2!1504 lt!35491)) (size!713 (buf!1034 (_2!1504 lt!35491)))) (and (bvsge (currentBit!2342 (_2!1504 lt!35491)) #b00000000000000000000000000000000) (bvslt (currentBit!2342 (_2!1504 lt!35491)) #b00000000000000000000000000001000) (bvsge (currentByte!2347 (_2!1504 lt!35491)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2347 (_2!1504 lt!35491)) (size!713 (buf!1034 (_2!1504 lt!35491)))) (and (= (currentBit!2342 (_2!1504 lt!35491)) #b00000000000000000000000000000000) (= (currentByte!2347 (_2!1504 lt!35491)) (size!713 (buf!1034 (_2!1504 lt!35491))))))))))

(assert (=> b!25013 d!7502))

(declare-fun d!7504 () Bool)

(assert (=> d!7504 (= (array_inv!682 srcBuffer!2) (bvsge (size!713 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5732 d!7504))

(declare-fun d!7506 () Bool)

(assert (=> d!7506 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2342 thiss!1379) (currentByte!2347 thiss!1379) (size!713 (buf!1034 thiss!1379))))))

(declare-fun bs!2178 () Bool)

(assert (= bs!2178 d!7506))

(assert (=> bs!2178 m!35771))

(assert (=> start!5732 d!7506))

(declare-fun d!7508 () Bool)

(declare-fun res!21787 () Bool)

(declare-fun e!17233 () Bool)

(assert (=> d!7508 (=> (not res!21787) (not e!17233))))

(assert (=> d!7508 (= res!21787 (= (size!713 (buf!1034 thiss!1379)) (size!713 (buf!1034 (_2!1504 lt!35491)))))))

(assert (=> d!7508 (= (isPrefixOf!0 thiss!1379 (_2!1504 lt!35491)) e!17233)))

(declare-fun b!25211 () Bool)

(declare-fun res!21788 () Bool)

(assert (=> b!25211 (=> (not res!21788) (not e!17233))))

(assert (=> b!25211 (= res!21788 (bvsle (bitIndex!0 (size!713 (buf!1034 thiss!1379)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379)) (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!35491))) (currentByte!2347 (_2!1504 lt!35491)) (currentBit!2342 (_2!1504 lt!35491)))))))

(declare-fun b!25212 () Bool)

(declare-fun e!17232 () Bool)

(assert (=> b!25212 (= e!17233 e!17232)))

(declare-fun res!21789 () Bool)

(assert (=> b!25212 (=> res!21789 e!17232)))

(assert (=> b!25212 (= res!21789 (= (size!713 (buf!1034 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!25213 () Bool)

(assert (=> b!25213 (= e!17232 (arrayBitRangesEq!0 (buf!1034 thiss!1379) (buf!1034 (_2!1504 lt!35491)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!713 (buf!1034 thiss!1379)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379))))))

(assert (= (and d!7508 res!21787) b!25211))

(assert (= (and b!25211 res!21788) b!25212))

(assert (= (and b!25212 (not res!21789)) b!25213))

(assert (=> b!25211 m!35455))

(assert (=> b!25211 m!35433))

(assert (=> b!25213 m!35455))

(assert (=> b!25213 m!35455))

(declare-fun m!35773 () Bool)

(assert (=> b!25213 m!35773))

(assert (=> b!25020 d!7508))

(declare-fun d!7510 () Bool)

(assert (=> d!7510 (isPrefixOf!0 thiss!1379 (_2!1504 lt!35491))))

(declare-fun lt!35776 () Unit!2069)

(declare-fun choose!30 (BitStream!1258 BitStream!1258 BitStream!1258) Unit!2069)

(assert (=> d!7510 (= lt!35776 (choose!30 thiss!1379 (_2!1504 lt!35484) (_2!1504 lt!35491)))))

(assert (=> d!7510 (isPrefixOf!0 thiss!1379 (_2!1504 lt!35484))))

(assert (=> d!7510 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1504 lt!35484) (_2!1504 lt!35491)) lt!35776)))

(declare-fun bs!2179 () Bool)

(assert (= bs!2179 d!7510))

(assert (=> bs!2179 m!35459))

(declare-fun m!35775 () Bool)

(assert (=> bs!2179 m!35775))

(assert (=> bs!2179 m!35485))

(assert (=> b!25020 d!7510))

(declare-fun d!7512 () Bool)

(assert (=> d!7512 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35484)))) ((_ sign_extend 32) (currentByte!2347 thiss!1379)) ((_ sign_extend 32) (currentBit!2342 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35484)))) ((_ sign_extend 32) (currentByte!2347 thiss!1379)) ((_ sign_extend 32) (currentBit!2342 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2180 () Bool)

(assert (= bs!2180 d!7512))

(declare-fun m!35777 () Bool)

(assert (=> bs!2180 m!35777))

(assert (=> b!25020 d!7512))

(declare-fun b!25214 () Bool)

(declare-fun res!21791 () Bool)

(declare-fun e!17235 () Bool)

(assert (=> b!25214 (=> (not res!21791) (not e!17235))))

(declare-fun lt!35789 () tuple2!2836)

(assert (=> b!25214 (= res!21791 (isPrefixOf!0 (_2!1505 lt!35789) (_2!1504 lt!35484)))))

(declare-fun d!7514 () Bool)

(assert (=> d!7514 e!17235))

(declare-fun res!21790 () Bool)

(assert (=> d!7514 (=> (not res!21790) (not e!17235))))

(assert (=> d!7514 (= res!21790 (isPrefixOf!0 (_1!1505 lt!35789) (_2!1505 lt!35789)))))

(declare-fun lt!35792 () BitStream!1258)

(assert (=> d!7514 (= lt!35789 (tuple2!2837 lt!35792 (_2!1504 lt!35484)))))

(declare-fun lt!35790 () Unit!2069)

(declare-fun lt!35781 () Unit!2069)

(assert (=> d!7514 (= lt!35790 lt!35781)))

(assert (=> d!7514 (isPrefixOf!0 lt!35792 (_2!1504 lt!35484))))

(assert (=> d!7514 (= lt!35781 (lemmaIsPrefixTransitive!0 lt!35792 (_2!1504 lt!35484) (_2!1504 lt!35484)))))

(declare-fun lt!35793 () Unit!2069)

(declare-fun lt!35795 () Unit!2069)

(assert (=> d!7514 (= lt!35793 lt!35795)))

(assert (=> d!7514 (isPrefixOf!0 lt!35792 (_2!1504 lt!35484))))

(assert (=> d!7514 (= lt!35795 (lemmaIsPrefixTransitive!0 lt!35792 thiss!1379 (_2!1504 lt!35484)))))

(declare-fun lt!35780 () Unit!2069)

(declare-fun e!17234 () Unit!2069)

(assert (=> d!7514 (= lt!35780 e!17234)))

(declare-fun c!1682 () Bool)

(assert (=> d!7514 (= c!1682 (not (= (size!713 (buf!1034 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!35787 () Unit!2069)

(declare-fun lt!35782 () Unit!2069)

(assert (=> d!7514 (= lt!35787 lt!35782)))

(assert (=> d!7514 (isPrefixOf!0 (_2!1504 lt!35484) (_2!1504 lt!35484))))

(assert (=> d!7514 (= lt!35782 (lemmaIsPrefixRefl!0 (_2!1504 lt!35484)))))

(declare-fun lt!35785 () Unit!2069)

(declare-fun lt!35788 () Unit!2069)

(assert (=> d!7514 (= lt!35785 lt!35788)))

(assert (=> d!7514 (= lt!35788 (lemmaIsPrefixRefl!0 (_2!1504 lt!35484)))))

(declare-fun lt!35779 () Unit!2069)

(declare-fun lt!35778 () Unit!2069)

(assert (=> d!7514 (= lt!35779 lt!35778)))

(assert (=> d!7514 (isPrefixOf!0 lt!35792 lt!35792)))

(assert (=> d!7514 (= lt!35778 (lemmaIsPrefixRefl!0 lt!35792))))

(declare-fun lt!35796 () Unit!2069)

(declare-fun lt!35784 () Unit!2069)

(assert (=> d!7514 (= lt!35796 lt!35784)))

(assert (=> d!7514 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7514 (= lt!35784 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7514 (= lt!35792 (BitStream!1259 (buf!1034 (_2!1504 lt!35484)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379)))))

(assert (=> d!7514 (isPrefixOf!0 thiss!1379 (_2!1504 lt!35484))))

(assert (=> d!7514 (= (reader!0 thiss!1379 (_2!1504 lt!35484)) lt!35789)))

(declare-fun b!25215 () Bool)

(declare-fun Unit!2087 () Unit!2069)

(assert (=> b!25215 (= e!17234 Unit!2087)))

(declare-fun lt!35777 () (_ BitVec 64))

(declare-fun b!25216 () Bool)

(declare-fun lt!35791 () (_ BitVec 64))

(assert (=> b!25216 (= e!17235 (= (_1!1505 lt!35789) (withMovedBitIndex!0 (_2!1505 lt!35789) (bvsub lt!35791 lt!35777))))))

(assert (=> b!25216 (or (= (bvand lt!35791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!35777 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!35791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!35791 lt!35777) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25216 (= lt!35777 (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!35484))) (currentByte!2347 (_2!1504 lt!35484)) (currentBit!2342 (_2!1504 lt!35484))))))

(assert (=> b!25216 (= lt!35791 (bitIndex!0 (size!713 (buf!1034 thiss!1379)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379)))))

(declare-fun b!25217 () Bool)

(declare-fun res!21792 () Bool)

(assert (=> b!25217 (=> (not res!21792) (not e!17235))))

(assert (=> b!25217 (= res!21792 (isPrefixOf!0 (_1!1505 lt!35789) thiss!1379))))

(declare-fun b!25218 () Bool)

(declare-fun lt!35783 () Unit!2069)

(assert (=> b!25218 (= e!17234 lt!35783)))

(declare-fun lt!35786 () (_ BitVec 64))

(assert (=> b!25218 (= lt!35786 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35794 () (_ BitVec 64))

(assert (=> b!25218 (= lt!35794 (bitIndex!0 (size!713 (buf!1034 thiss!1379)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379)))))

(assert (=> b!25218 (= lt!35783 (arrayBitRangesEqSymmetric!0 (buf!1034 thiss!1379) (buf!1034 (_2!1504 lt!35484)) lt!35786 lt!35794))))

(assert (=> b!25218 (arrayBitRangesEq!0 (buf!1034 (_2!1504 lt!35484)) (buf!1034 thiss!1379) lt!35786 lt!35794)))

(assert (= (and d!7514 c!1682) b!25218))

(assert (= (and d!7514 (not c!1682)) b!25215))

(assert (= (and d!7514 res!21790) b!25217))

(assert (= (and b!25217 res!21792) b!25214))

(assert (= (and b!25214 res!21791) b!25216))

(declare-fun m!35779 () Bool)

(assert (=> b!25216 m!35779))

(assert (=> b!25216 m!35501))

(assert (=> b!25216 m!35455))

(declare-fun m!35781 () Bool)

(assert (=> b!25217 m!35781))

(declare-fun m!35783 () Bool)

(assert (=> b!25214 m!35783))

(assert (=> b!25218 m!35455))

(declare-fun m!35785 () Bool)

(assert (=> b!25218 m!35785))

(declare-fun m!35787 () Bool)

(assert (=> b!25218 m!35787))

(assert (=> d!7514 m!35729))

(assert (=> d!7514 m!35725))

(assert (=> d!7514 m!35485))

(declare-fun m!35789 () Bool)

(assert (=> d!7514 m!35789))

(declare-fun m!35791 () Bool)

(assert (=> d!7514 m!35791))

(declare-fun m!35793 () Bool)

(assert (=> d!7514 m!35793))

(declare-fun m!35795 () Bool)

(assert (=> d!7514 m!35795))

(assert (=> d!7514 m!35451))

(declare-fun m!35797 () Bool)

(assert (=> d!7514 m!35797))

(assert (=> d!7514 m!35453))

(declare-fun m!35799 () Bool)

(assert (=> d!7514 m!35799))

(assert (=> b!25020 d!7514))

(declare-fun d!7516 () Bool)

(assert (=> d!7516 (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35484)))) ((_ sign_extend 32) (currentByte!2347 thiss!1379)) ((_ sign_extend 32) (currentBit!2342 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!35797 () Unit!2069)

(assert (=> d!7516 (= lt!35797 (choose!9 thiss!1379 (buf!1034 (_2!1504 lt!35484)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1259 (buf!1034 (_2!1504 lt!35484)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379))))))

(assert (=> d!7516 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1034 (_2!1504 lt!35484)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!35797)))

(declare-fun bs!2181 () Bool)

(assert (= bs!2181 d!7516))

(assert (=> bs!2181 m!35463))

(declare-fun m!35801 () Bool)

(assert (=> bs!2181 m!35801))

(assert (=> b!25020 d!7516))

(declare-fun d!7518 () Bool)

(declare-fun res!21793 () Bool)

(declare-fun e!17237 () Bool)

(assert (=> d!7518 (=> (not res!21793) (not e!17237))))

(assert (=> d!7518 (= res!21793 (= (size!713 (buf!1034 (_2!1504 lt!35484))) (size!713 (buf!1034 (_2!1504 lt!35491)))))))

(assert (=> d!7518 (= (isPrefixOf!0 (_2!1504 lt!35484) (_2!1504 lt!35491)) e!17237)))

(declare-fun b!25219 () Bool)

(declare-fun res!21794 () Bool)

(assert (=> b!25219 (=> (not res!21794) (not e!17237))))

(assert (=> b!25219 (= res!21794 (bvsle (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!35484))) (currentByte!2347 (_2!1504 lt!35484)) (currentBit!2342 (_2!1504 lt!35484))) (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!35491))) (currentByte!2347 (_2!1504 lt!35491)) (currentBit!2342 (_2!1504 lt!35491)))))))

(declare-fun b!25220 () Bool)

(declare-fun e!17236 () Bool)

(assert (=> b!25220 (= e!17237 e!17236)))

(declare-fun res!21795 () Bool)

(assert (=> b!25220 (=> res!21795 e!17236)))

(assert (=> b!25220 (= res!21795 (= (size!713 (buf!1034 (_2!1504 lt!35484))) #b00000000000000000000000000000000))))

(declare-fun b!25221 () Bool)

(assert (=> b!25221 (= e!17236 (arrayBitRangesEq!0 (buf!1034 (_2!1504 lt!35484)) (buf!1034 (_2!1504 lt!35491)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!35484))) (currentByte!2347 (_2!1504 lt!35484)) (currentBit!2342 (_2!1504 lt!35484)))))))

(assert (= (and d!7518 res!21793) b!25219))

(assert (= (and b!25219 res!21794) b!25220))

(assert (= (and b!25220 (not res!21795)) b!25221))

(assert (=> b!25219 m!35501))

(assert (=> b!25219 m!35433))

(assert (=> b!25221 m!35501))

(assert (=> b!25221 m!35501))

(declare-fun m!35803 () Bool)

(assert (=> b!25221 m!35803))

(assert (=> b!25020 d!7518))

(declare-fun b!25377 () Bool)

(declare-fun e!17312 () tuple2!2834)

(declare-fun Unit!2088 () Unit!2069)

(assert (=> b!25377 (= e!17312 (tuple2!2835 Unit!2088 (_2!1504 lt!35484)))))

(assert (=> b!25377 (= (size!713 (buf!1034 (_2!1504 lt!35484))) (size!713 (buf!1034 (_2!1504 lt!35484))))))

(declare-fun lt!36285 () Unit!2069)

(declare-fun Unit!2089 () Unit!2069)

(assert (=> b!25377 (= lt!36285 Unit!2089)))

(declare-fun call!343 () tuple2!2836)

(declare-fun checkByteArrayBitContent!0 (BitStream!1258 array!1655 array!1655 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!2854 0))(
  ( (tuple2!2855 (_1!1514 array!1655) (_2!1514 BitStream!1258)) )
))
(declare-fun readBits!0 (BitStream!1258 (_ BitVec 64)) tuple2!2854)

(assert (=> b!25377 (checkByteArrayBitContent!0 (_2!1504 lt!35484) srcBuffer!2 (_1!1514 (readBits!0 (_1!1505 call!343) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!25378 () Bool)

(declare-fun e!17311 () Bool)

(declare-fun lt!36289 () (_ BitVec 64))

(assert (=> b!25378 (= e!17311 (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35484)))) ((_ sign_extend 32) (currentByte!2347 (_2!1504 lt!35484))) ((_ sign_extend 32) (currentBit!2342 (_2!1504 lt!35484))) lt!36289))))

(declare-fun b!25379 () Bool)

(declare-fun lt!36303 () tuple2!2834)

(declare-fun e!17313 () Bool)

(declare-fun lt!36281 () tuple2!2836)

(assert (=> b!25379 (= e!17313 (= (bitStreamReadBitsIntoList!0 (_2!1504 lt!36303) (_1!1505 lt!36281) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1504 lt!36303) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!25379 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25379 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!36301 () Unit!2069)

(declare-fun lt!36271 () Unit!2069)

(assert (=> b!25379 (= lt!36301 lt!36271)))

(assert (=> b!25379 (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!36303)))) ((_ sign_extend 32) (currentByte!2347 (_2!1504 lt!35484))) ((_ sign_extend 32) (currentBit!2342 (_2!1504 lt!35484))) lt!36289)))

(assert (=> b!25379 (= lt!36271 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1504 lt!35484) (buf!1034 (_2!1504 lt!36303)) lt!36289))))

(assert (=> b!25379 e!17311))

(declare-fun res!21907 () Bool)

(assert (=> b!25379 (=> (not res!21907) (not e!17311))))

(assert (=> b!25379 (= res!21907 (and (= (size!713 (buf!1034 (_2!1504 lt!35484))) (size!713 (buf!1034 (_2!1504 lt!36303)))) (bvsge lt!36289 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25379 (= lt!36289 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!25379 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25379 (= lt!36281 (reader!0 (_2!1504 lt!35484) (_2!1504 lt!36303)))))

(declare-fun b!25380 () Bool)

(declare-fun res!21906 () Bool)

(assert (=> b!25380 (=> (not res!21906) (not e!17313))))

(assert (=> b!25380 (= res!21906 (= (size!713 (buf!1034 (_2!1504 lt!36303))) (size!713 (buf!1034 (_2!1504 lt!35484)))))))

(declare-fun b!25381 () Bool)

(declare-fun res!21909 () Bool)

(assert (=> b!25381 (=> (not res!21909) (not e!17313))))

(assert (=> b!25381 (= res!21909 (invariant!0 (currentBit!2342 (_2!1504 lt!36303)) (currentByte!2347 (_2!1504 lt!36303)) (size!713 (buf!1034 (_2!1504 lt!36303)))))))

(declare-fun d!7520 () Bool)

(assert (=> d!7520 e!17313))

(declare-fun res!21908 () Bool)

(assert (=> d!7520 (=> (not res!21908) (not e!17313))))

(declare-fun lt!36290 () (_ BitVec 64))

(assert (=> d!7520 (= res!21908 (= (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!36303))) (currentByte!2347 (_2!1504 lt!36303)) (currentBit!2342 (_2!1504 lt!36303))) (bvsub lt!36290 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!7520 (or (= (bvand lt!36290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!36290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!36290 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!36275 () (_ BitVec 64))

(assert (=> d!7520 (= lt!36290 (bvadd lt!36275 to!314))))

(assert (=> d!7520 (or (not (= (bvand lt!36275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!36275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!36275 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7520 (= lt!36275 (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!35484))) (currentByte!2347 (_2!1504 lt!35484)) (currentBit!2342 (_2!1504 lt!35484))))))

(assert (=> d!7520 (= lt!36303 e!17312)))

(declare-fun c!1705 () Bool)

(assert (=> d!7520 (= c!1705 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!36286 () Unit!2069)

(declare-fun lt!36296 () Unit!2069)

(assert (=> d!7520 (= lt!36286 lt!36296)))

(assert (=> d!7520 (isPrefixOf!0 (_2!1504 lt!35484) (_2!1504 lt!35484))))

(assert (=> d!7520 (= lt!36296 (lemmaIsPrefixRefl!0 (_2!1504 lt!35484)))))

(declare-fun lt!36288 () (_ BitVec 64))

(assert (=> d!7520 (= lt!36288 (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!35484))) (currentByte!2347 (_2!1504 lt!35484)) (currentBit!2342 (_2!1504 lt!35484))))))

(assert (=> d!7520 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7520 (= (appendBitsMSBFirstLoop!0 (_2!1504 lt!35484) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!36303)))

(declare-fun b!25382 () Bool)

(declare-fun lt!36269 () tuple2!2834)

(declare-fun Unit!2090 () Unit!2069)

(assert (=> b!25382 (= e!17312 (tuple2!2835 Unit!2090 (_2!1504 lt!36269)))))

(declare-fun lt!36270 () tuple2!2834)

(assert (=> b!25382 (= lt!36270 (appendBitFromByte!0 (_2!1504 lt!35484) (select (arr!1169 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!36294 () (_ BitVec 64))

(assert (=> b!25382 (= lt!36294 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!36306 () (_ BitVec 64))

(assert (=> b!25382 (= lt!36306 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!36291 () Unit!2069)

(assert (=> b!25382 (= lt!36291 (validateOffsetBitsIneqLemma!0 (_2!1504 lt!35484) (_2!1504 lt!36270) lt!36294 lt!36306))))

(assert (=> b!25382 (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!36270)))) ((_ sign_extend 32) (currentByte!2347 (_2!1504 lt!36270))) ((_ sign_extend 32) (currentBit!2342 (_2!1504 lt!36270))) (bvsub lt!36294 lt!36306))))

(declare-fun lt!36266 () Unit!2069)

(assert (=> b!25382 (= lt!36266 lt!36291)))

(declare-fun lt!36278 () tuple2!2836)

(assert (=> b!25382 (= lt!36278 (reader!0 (_2!1504 lt!35484) (_2!1504 lt!36270)))))

(declare-fun lt!36299 () (_ BitVec 64))

(assert (=> b!25382 (= lt!36299 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!36276 () Unit!2069)

(assert (=> b!25382 (= lt!36276 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1504 lt!35484) (buf!1034 (_2!1504 lt!36270)) lt!36299))))

(assert (=> b!25382 (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!36270)))) ((_ sign_extend 32) (currentByte!2347 (_2!1504 lt!35484))) ((_ sign_extend 32) (currentBit!2342 (_2!1504 lt!35484))) lt!36299)))

(declare-fun lt!36293 () Unit!2069)

(assert (=> b!25382 (= lt!36293 lt!36276)))

(assert (=> b!25382 (= (head!167 (byteArrayBitContentToList!0 (_2!1504 lt!36270) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!167 (bitStreamReadBitsIntoList!0 (_2!1504 lt!36270) (_1!1505 lt!36278) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!36268 () Unit!2069)

(declare-fun Unit!2091 () Unit!2069)

(assert (=> b!25382 (= lt!36268 Unit!2091)))

(assert (=> b!25382 (= lt!36269 (appendBitsMSBFirstLoop!0 (_2!1504 lt!36270) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!36302 () Unit!2069)

(assert (=> b!25382 (= lt!36302 (lemmaIsPrefixTransitive!0 (_2!1504 lt!35484) (_2!1504 lt!36270) (_2!1504 lt!36269)))))

(assert (=> b!25382 (isPrefixOf!0 (_2!1504 lt!35484) (_2!1504 lt!36269))))

(declare-fun lt!36283 () Unit!2069)

(assert (=> b!25382 (= lt!36283 lt!36302)))

(assert (=> b!25382 (= (size!713 (buf!1034 (_2!1504 lt!36269))) (size!713 (buf!1034 (_2!1504 lt!35484))))))

(declare-fun lt!36284 () Unit!2069)

(declare-fun Unit!2092 () Unit!2069)

(assert (=> b!25382 (= lt!36284 Unit!2092)))

(assert (=> b!25382 (= (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!36269))) (currentByte!2347 (_2!1504 lt!36269)) (currentBit!2342 (_2!1504 lt!36269))) (bvsub (bvadd (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!35484))) (currentByte!2347 (_2!1504 lt!35484)) (currentBit!2342 (_2!1504 lt!35484))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!36304 () Unit!2069)

(declare-fun Unit!2093 () Unit!2069)

(assert (=> b!25382 (= lt!36304 Unit!2093)))

(assert (=> b!25382 (= (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!36269))) (currentByte!2347 (_2!1504 lt!36269)) (currentBit!2342 (_2!1504 lt!36269))) (bvsub (bvsub (bvadd (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!36270))) (currentByte!2347 (_2!1504 lt!36270)) (currentBit!2342 (_2!1504 lt!36270))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!36292 () Unit!2069)

(declare-fun Unit!2094 () Unit!2069)

(assert (=> b!25382 (= lt!36292 Unit!2094)))

(declare-fun lt!36280 () tuple2!2836)

(assert (=> b!25382 (= lt!36280 (reader!0 (_2!1504 lt!35484) (_2!1504 lt!36269)))))

(declare-fun lt!36267 () (_ BitVec 64))

(assert (=> b!25382 (= lt!36267 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!36272 () Unit!2069)

(assert (=> b!25382 (= lt!36272 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1504 lt!35484) (buf!1034 (_2!1504 lt!36269)) lt!36267))))

(assert (=> b!25382 (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!36269)))) ((_ sign_extend 32) (currentByte!2347 (_2!1504 lt!35484))) ((_ sign_extend 32) (currentBit!2342 (_2!1504 lt!35484))) lt!36267)))

(declare-fun lt!36307 () Unit!2069)

(assert (=> b!25382 (= lt!36307 lt!36272)))

(declare-fun lt!36277 () tuple2!2836)

(assert (=> b!25382 (= lt!36277 call!343)))

(declare-fun lt!36264 () (_ BitVec 64))

(assert (=> b!25382 (= lt!36264 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!36279 () Unit!2069)

(assert (=> b!25382 (= lt!36279 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1504 lt!36270) (buf!1034 (_2!1504 lt!36269)) lt!36264))))

(assert (=> b!25382 (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!36269)))) ((_ sign_extend 32) (currentByte!2347 (_2!1504 lt!36270))) ((_ sign_extend 32) (currentBit!2342 (_2!1504 lt!36270))) lt!36264)))

(declare-fun lt!36300 () Unit!2069)

(assert (=> b!25382 (= lt!36300 lt!36279)))

(declare-fun lt!36274 () List!330)

(assert (=> b!25382 (= lt!36274 (byteArrayBitContentToList!0 (_2!1504 lt!36269) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!36265 () List!330)

(assert (=> b!25382 (= lt!36265 (byteArrayBitContentToList!0 (_2!1504 lt!36269) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!36298 () List!330)

(assert (=> b!25382 (= lt!36298 (bitStreamReadBitsIntoList!0 (_2!1504 lt!36269) (_1!1505 lt!36280) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!36297 () List!330)

(assert (=> b!25382 (= lt!36297 (bitStreamReadBitsIntoList!0 (_2!1504 lt!36269) (_1!1505 lt!36277) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!36282 () (_ BitVec 64))

(assert (=> b!25382 (= lt!36282 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!36305 () Unit!2069)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1258 BitStream!1258 BitStream!1258 BitStream!1258 (_ BitVec 64) List!330) Unit!2069)

(assert (=> b!25382 (= lt!36305 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1504 lt!36269) (_2!1504 lt!36269) (_1!1505 lt!36280) (_1!1505 lt!36277) lt!36282 lt!36298))))

(declare-fun tail!87 (List!330) List!330)

(assert (=> b!25382 (= (bitStreamReadBitsIntoList!0 (_2!1504 lt!36269) (_1!1505 lt!36277) (bvsub lt!36282 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!87 lt!36298))))

(declare-fun lt!36295 () Unit!2069)

(assert (=> b!25382 (= lt!36295 lt!36305)))

(declare-fun lt!36273 () Unit!2069)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1655 array!1655 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2069)

(assert (=> b!25382 (= lt!36273 (arrayBitRangesEqImpliesEq!0 (buf!1034 (_2!1504 lt!36270)) (buf!1034 (_2!1504 lt!36269)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!36288 (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!36270))) (currentByte!2347 (_2!1504 lt!36270)) (currentBit!2342 (_2!1504 lt!36270)))))))

(declare-fun bitAt!0 (array!1655 (_ BitVec 64)) Bool)

(assert (=> b!25382 (= (bitAt!0 (buf!1034 (_2!1504 lt!36270)) lt!36288) (bitAt!0 (buf!1034 (_2!1504 lt!36269)) lt!36288))))

(declare-fun lt!36287 () Unit!2069)

(assert (=> b!25382 (= lt!36287 lt!36273)))

(declare-fun bm!340 () Bool)

(assert (=> bm!340 (= call!343 (reader!0 (ite c!1705 (_2!1504 lt!36270) (_2!1504 lt!35484)) (ite c!1705 (_2!1504 lt!36269) (_2!1504 lt!35484))))))

(declare-fun b!25383 () Bool)

(declare-fun res!21910 () Bool)

(assert (=> b!25383 (=> (not res!21910) (not e!17313))))

(assert (=> b!25383 (= res!21910 (= (size!713 (buf!1034 (_2!1504 lt!35484))) (size!713 (buf!1034 (_2!1504 lt!36303)))))))

(declare-fun b!25384 () Bool)

(declare-fun res!21911 () Bool)

(assert (=> b!25384 (=> (not res!21911) (not e!17313))))

(assert (=> b!25384 (= res!21911 (isPrefixOf!0 (_2!1504 lt!35484) (_2!1504 lt!36303)))))

(assert (= (and d!7520 c!1705) b!25382))

(assert (= (and d!7520 (not c!1705)) b!25377))

(assert (= (or b!25382 b!25377) bm!340))

(assert (= (and d!7520 res!21908) b!25381))

(assert (= (and b!25381 res!21909) b!25383))

(assert (= (and b!25383 res!21910) b!25384))

(assert (= (and b!25384 res!21911) b!25380))

(assert (= (and b!25380 res!21906) b!25379))

(assert (= (and b!25379 res!21907) b!25378))

(declare-fun m!36067 () Bool)

(assert (=> b!25377 m!36067))

(declare-fun m!36069 () Bool)

(assert (=> b!25377 m!36069))

(declare-fun m!36071 () Bool)

(assert (=> b!25379 m!36071))

(declare-fun m!36073 () Bool)

(assert (=> b!25379 m!36073))

(declare-fun m!36075 () Bool)

(assert (=> b!25379 m!36075))

(declare-fun m!36077 () Bool)

(assert (=> b!25379 m!36077))

(declare-fun m!36079 () Bool)

(assert (=> b!25379 m!36079))

(declare-fun m!36081 () Bool)

(assert (=> d!7520 m!36081))

(assert (=> d!7520 m!35501))

(assert (=> d!7520 m!35725))

(assert (=> d!7520 m!35729))

(declare-fun m!36083 () Bool)

(assert (=> b!25378 m!36083))

(declare-fun m!36085 () Bool)

(assert (=> b!25381 m!36085))

(declare-fun m!36087 () Bool)

(assert (=> b!25382 m!36087))

(declare-fun m!36089 () Bool)

(assert (=> b!25382 m!36089))

(declare-fun m!36091 () Bool)

(assert (=> b!25382 m!36091))

(declare-fun m!36093 () Bool)

(assert (=> b!25382 m!36093))

(declare-fun m!36095 () Bool)

(assert (=> b!25382 m!36095))

(declare-fun m!36097 () Bool)

(assert (=> b!25382 m!36097))

(declare-fun m!36099 () Bool)

(assert (=> b!25382 m!36099))

(declare-fun m!36101 () Bool)

(assert (=> b!25382 m!36101))

(declare-fun m!36103 () Bool)

(assert (=> b!25382 m!36103))

(declare-fun m!36105 () Bool)

(assert (=> b!25382 m!36105))

(declare-fun m!36107 () Bool)

(assert (=> b!25382 m!36107))

(declare-fun m!36109 () Bool)

(assert (=> b!25382 m!36109))

(declare-fun m!36111 () Bool)

(assert (=> b!25382 m!36111))

(declare-fun m!36113 () Bool)

(assert (=> b!25382 m!36113))

(declare-fun m!36115 () Bool)

(assert (=> b!25382 m!36115))

(declare-fun m!36117 () Bool)

(assert (=> b!25382 m!36117))

(declare-fun m!36119 () Bool)

(assert (=> b!25382 m!36119))

(declare-fun m!36121 () Bool)

(assert (=> b!25382 m!36121))

(declare-fun m!36123 () Bool)

(assert (=> b!25382 m!36123))

(declare-fun m!36125 () Bool)

(assert (=> b!25382 m!36125))

(declare-fun m!36127 () Bool)

(assert (=> b!25382 m!36127))

(declare-fun m!36129 () Bool)

(assert (=> b!25382 m!36129))

(declare-fun m!36131 () Bool)

(assert (=> b!25382 m!36131))

(assert (=> b!25382 m!36099))

(declare-fun m!36133 () Bool)

(assert (=> b!25382 m!36133))

(assert (=> b!25382 m!36119))

(declare-fun m!36135 () Bool)

(assert (=> b!25382 m!36135))

(declare-fun m!36137 () Bool)

(assert (=> b!25382 m!36137))

(declare-fun m!36139 () Bool)

(assert (=> b!25382 m!36139))

(assert (=> b!25382 m!36101))

(declare-fun m!36141 () Bool)

(assert (=> b!25382 m!36141))

(assert (=> b!25382 m!35501))

(declare-fun m!36143 () Bool)

(assert (=> b!25382 m!36143))

(assert (=> b!25382 m!36095))

(declare-fun m!36145 () Bool)

(assert (=> b!25382 m!36145))

(declare-fun m!36147 () Bool)

(assert (=> b!25382 m!36147))

(declare-fun m!36149 () Bool)

(assert (=> bm!340 m!36149))

(declare-fun m!36151 () Bool)

(assert (=> b!25384 m!36151))

(assert (=> b!25020 d!7520))

(declare-fun d!7590 () Bool)

(assert (=> d!7590 (= (invariant!0 (currentBit!2342 (_2!1504 lt!35484)) (currentByte!2347 (_2!1504 lt!35484)) (size!713 (buf!1034 (_2!1504 lt!35491)))) (and (bvsge (currentBit!2342 (_2!1504 lt!35484)) #b00000000000000000000000000000000) (bvslt (currentBit!2342 (_2!1504 lt!35484)) #b00000000000000000000000000001000) (bvsge (currentByte!2347 (_2!1504 lt!35484)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2347 (_2!1504 lt!35484)) (size!713 (buf!1034 (_2!1504 lt!35491)))) (and (= (currentBit!2342 (_2!1504 lt!35484)) #b00000000000000000000000000000000) (= (currentByte!2347 (_2!1504 lt!35484)) (size!713 (buf!1034 (_2!1504 lt!35491))))))))))

(assert (=> b!25010 d!7590))

(declare-fun d!7592 () Bool)

(declare-fun res!21912 () Bool)

(declare-fun e!17315 () Bool)

(assert (=> d!7592 (=> (not res!21912) (not e!17315))))

(assert (=> d!7592 (= res!21912 (= (size!713 (buf!1034 thiss!1379)) (size!713 (buf!1034 (_2!1504 lt!35484)))))))

(assert (=> d!7592 (= (isPrefixOf!0 thiss!1379 (_2!1504 lt!35484)) e!17315)))

(declare-fun b!25385 () Bool)

(declare-fun res!21913 () Bool)

(assert (=> b!25385 (=> (not res!21913) (not e!17315))))

(assert (=> b!25385 (= res!21913 (bvsle (bitIndex!0 (size!713 (buf!1034 thiss!1379)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379)) (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!35484))) (currentByte!2347 (_2!1504 lt!35484)) (currentBit!2342 (_2!1504 lt!35484)))))))

(declare-fun b!25386 () Bool)

(declare-fun e!17314 () Bool)

(assert (=> b!25386 (= e!17315 e!17314)))

(declare-fun res!21914 () Bool)

(assert (=> b!25386 (=> res!21914 e!17314)))

(assert (=> b!25386 (= res!21914 (= (size!713 (buf!1034 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!25387 () Bool)

(assert (=> b!25387 (= e!17314 (arrayBitRangesEq!0 (buf!1034 thiss!1379) (buf!1034 (_2!1504 lt!35484)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!713 (buf!1034 thiss!1379)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379))))))

(assert (= (and d!7592 res!21912) b!25385))

(assert (= (and b!25385 res!21913) b!25386))

(assert (= (and b!25386 (not res!21914)) b!25387))

(assert (=> b!25385 m!35455))

(assert (=> b!25385 m!35501))

(assert (=> b!25387 m!35455))

(assert (=> b!25387 m!35455))

(declare-fun m!36153 () Bool)

(assert (=> b!25387 m!36153))

(assert (=> b!25011 d!7592))

(declare-fun d!7594 () Bool)

(assert (=> d!7594 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35484)))) ((_ sign_extend 32) (currentByte!2347 (_2!1504 lt!35484))) ((_ sign_extend 32) (currentBit!2342 (_2!1504 lt!35484))) lt!35489) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35484)))) ((_ sign_extend 32) (currentByte!2347 (_2!1504 lt!35484))) ((_ sign_extend 32) (currentBit!2342 (_2!1504 lt!35484)))) lt!35489))))

(declare-fun bs!2193 () Bool)

(assert (= bs!2193 d!7594))

(assert (=> bs!2193 m!35701))

(assert (=> b!25011 d!7594))

(declare-fun d!7596 () Bool)

(declare-fun e!17318 () Bool)

(assert (=> d!7596 e!17318))

(declare-fun res!21917 () Bool)

(assert (=> d!7596 (=> (not res!21917) (not e!17318))))

(assert (=> d!7596 (= res!21917 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!36310 () Unit!2069)

(declare-fun choose!27 (BitStream!1258 BitStream!1258 (_ BitVec 64) (_ BitVec 64)) Unit!2069)

(assert (=> d!7596 (= lt!36310 (choose!27 thiss!1379 (_2!1504 lt!35484) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!7596 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!7596 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1504 lt!35484) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!36310)))

(declare-fun b!25390 () Bool)

(assert (=> b!25390 (= e!17318 (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35484)))) ((_ sign_extend 32) (currentByte!2347 (_2!1504 lt!35484))) ((_ sign_extend 32) (currentBit!2342 (_2!1504 lt!35484))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!7596 res!21917) b!25390))

(declare-fun m!36155 () Bool)

(assert (=> d!7596 m!36155))

(declare-fun m!36157 () Bool)

(assert (=> b!25390 m!36157))

(assert (=> b!25011 d!7596))

(declare-fun b!25408 () Bool)

(declare-fun res!21941 () Bool)

(declare-fun e!17327 () Bool)

(assert (=> b!25408 (=> (not res!21941) (not e!17327))))

(declare-fun lt!36339 () tuple2!2834)

(declare-fun lt!36337 () (_ BitVec 64))

(declare-fun lt!36338 () (_ BitVec 64))

(assert (=> b!25408 (= res!21941 (= (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!36339))) (currentByte!2347 (_2!1504 lt!36339)) (currentBit!2342 (_2!1504 lt!36339))) (bvadd lt!36338 lt!36337)))))

(assert (=> b!25408 (or (not (= (bvand lt!36338 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!36337 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!36338 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!36338 lt!36337) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25408 (= lt!36337 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!25408 (= lt!36338 (bitIndex!0 (size!713 (buf!1034 thiss!1379)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379)))))

(declare-fun b!25409 () Bool)

(declare-fun e!17328 () Bool)

(assert (=> b!25409 (= e!17327 e!17328)))

(declare-fun res!21938 () Bool)

(assert (=> b!25409 (=> (not res!21938) (not e!17328))))

(declare-fun lt!36342 () (_ BitVec 8))

(declare-datatypes ((tuple2!2856 0))(
  ( (tuple2!2857 (_1!1515 BitStream!1258) (_2!1515 Bool)) )
))
(declare-fun lt!36345 () tuple2!2856)

(assert (=> b!25409 (= res!21938 (and (= (_2!1515 lt!36345) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1169 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!36342)) #b00000000000000000000000000000000))) (= (_1!1515 lt!36345) (_2!1504 lt!36339))))))

(declare-fun lt!36340 () tuple2!2854)

(declare-fun lt!36341 () BitStream!1258)

(assert (=> b!25409 (= lt!36340 (readBits!0 lt!36341 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1258) tuple2!2856)

(assert (=> b!25409 (= lt!36345 (readBitPure!0 lt!36341))))

(declare-fun readerFrom!0 (BitStream!1258 (_ BitVec 32) (_ BitVec 32)) BitStream!1258)

(assert (=> b!25409 (= lt!36341 (readerFrom!0 (_2!1504 lt!36339) (currentBit!2342 thiss!1379) (currentByte!2347 thiss!1379)))))

(declare-fun b!25410 () Bool)

(assert (=> b!25410 (= e!17328 (= (bitIndex!0 (size!713 (buf!1034 (_1!1515 lt!36345))) (currentByte!2347 (_1!1515 lt!36345)) (currentBit!2342 (_1!1515 lt!36345))) (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!36339))) (currentByte!2347 (_2!1504 lt!36339)) (currentBit!2342 (_2!1504 lt!36339)))))))

(declare-fun d!7598 () Bool)

(assert (=> d!7598 e!17327))

(declare-fun res!21940 () Bool)

(assert (=> d!7598 (=> (not res!21940) (not e!17327))))

(assert (=> d!7598 (= res!21940 (= (size!713 (buf!1034 (_2!1504 lt!36339))) (size!713 (buf!1034 thiss!1379))))))

(declare-fun lt!36343 () array!1655)

(assert (=> d!7598 (= lt!36342 (select (arr!1169 lt!36343) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!7598 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!713 lt!36343)))))

(assert (=> d!7598 (= lt!36343 (array!1656 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!36335 () tuple2!2834)

(assert (=> d!7598 (= lt!36339 (tuple2!2835 (_1!1504 lt!36335) (_2!1504 lt!36335)))))

(declare-fun lt!36336 () tuple2!2834)

(assert (=> d!7598 (= lt!36335 lt!36336)))

(declare-fun e!17329 () Bool)

(assert (=> d!7598 e!17329))

(declare-fun res!21939 () Bool)

(assert (=> d!7598 (=> (not res!21939) (not e!17329))))

(assert (=> d!7598 (= res!21939 (= (size!713 (buf!1034 thiss!1379)) (size!713 (buf!1034 (_2!1504 lt!36336)))))))

(declare-fun lt!36344 () Bool)

(declare-fun appendBit!0 (BitStream!1258 Bool) tuple2!2834)

(assert (=> d!7598 (= lt!36336 (appendBit!0 thiss!1379 lt!36344))))

(assert (=> d!7598 (= lt!36344 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1169 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!7598 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!7598 (= (appendBitFromByte!0 thiss!1379 (select (arr!1169 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!36339)))

(declare-fun b!25411 () Bool)

(declare-fun e!17330 () Bool)

(declare-fun lt!36346 () tuple2!2856)

(assert (=> b!25411 (= e!17330 (= (bitIndex!0 (size!713 (buf!1034 (_1!1515 lt!36346))) (currentByte!2347 (_1!1515 lt!36346)) (currentBit!2342 (_1!1515 lt!36346))) (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!36336))) (currentByte!2347 (_2!1504 lt!36336)) (currentBit!2342 (_2!1504 lt!36336)))))))

(declare-fun b!25412 () Bool)

(declare-fun res!21936 () Bool)

(assert (=> b!25412 (=> (not res!21936) (not e!17329))))

(assert (=> b!25412 (= res!21936 (isPrefixOf!0 thiss!1379 (_2!1504 lt!36336)))))

(declare-fun b!25413 () Bool)

(declare-fun res!21937 () Bool)

(assert (=> b!25413 (=> (not res!21937) (not e!17329))))

(assert (=> b!25413 (= res!21937 (= (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!36336))) (currentByte!2347 (_2!1504 lt!36336)) (currentBit!2342 (_2!1504 lt!36336))) (bvadd (bitIndex!0 (size!713 (buf!1034 thiss!1379)) (currentByte!2347 thiss!1379) (currentBit!2342 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!25414 () Bool)

(assert (=> b!25414 (= e!17329 e!17330)))

(declare-fun res!21935 () Bool)

(assert (=> b!25414 (=> (not res!21935) (not e!17330))))

(assert (=> b!25414 (= res!21935 (and (= (_2!1515 lt!36346) lt!36344) (= (_1!1515 lt!36346) (_2!1504 lt!36336))))))

(assert (=> b!25414 (= lt!36346 (readBitPure!0 (readerFrom!0 (_2!1504 lt!36336) (currentBit!2342 thiss!1379) (currentByte!2347 thiss!1379))))))

(declare-fun b!25415 () Bool)

(declare-fun res!21934 () Bool)

(assert (=> b!25415 (=> (not res!21934) (not e!17327))))

(assert (=> b!25415 (= res!21934 (isPrefixOf!0 thiss!1379 (_2!1504 lt!36339)))))

(assert (= (and d!7598 res!21939) b!25413))

(assert (= (and b!25413 res!21937) b!25412))

(assert (= (and b!25412 res!21936) b!25414))

(assert (= (and b!25414 res!21935) b!25411))

(assert (= (and d!7598 res!21940) b!25408))

(assert (= (and b!25408 res!21941) b!25415))

(assert (= (and b!25415 res!21934) b!25409))

(assert (= (and b!25409 res!21938) b!25410))

(declare-fun m!36159 () Bool)

(assert (=> b!25410 m!36159))

(declare-fun m!36161 () Bool)

(assert (=> b!25410 m!36161))

(declare-fun m!36163 () Bool)

(assert (=> d!7598 m!36163))

(declare-fun m!36165 () Bool)

(assert (=> d!7598 m!36165))

(declare-fun m!36167 () Bool)

(assert (=> d!7598 m!36167))

(declare-fun m!36169 () Bool)

(assert (=> b!25415 m!36169))

(declare-fun m!36171 () Bool)

(assert (=> b!25414 m!36171))

(assert (=> b!25414 m!36171))

(declare-fun m!36173 () Bool)

(assert (=> b!25414 m!36173))

(declare-fun m!36175 () Bool)

(assert (=> b!25411 m!36175))

(declare-fun m!36177 () Bool)

(assert (=> b!25411 m!36177))

(declare-fun m!36179 () Bool)

(assert (=> b!25409 m!36179))

(declare-fun m!36181 () Bool)

(assert (=> b!25409 m!36181))

(declare-fun m!36183 () Bool)

(assert (=> b!25409 m!36183))

(assert (=> b!25408 m!36161))

(assert (=> b!25408 m!35455))

(declare-fun m!36185 () Bool)

(assert (=> b!25412 m!36185))

(assert (=> b!25413 m!36177))

(assert (=> b!25413 m!35455))

(assert (=> b!25011 d!7598))

(declare-fun d!7600 () Bool)

(assert (=> d!7600 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!713 (buf!1034 thiss!1379))) ((_ sign_extend 32) (currentByte!2347 thiss!1379)) ((_ sign_extend 32) (currentBit!2342 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!713 (buf!1034 thiss!1379))) ((_ sign_extend 32) (currentByte!2347 thiss!1379)) ((_ sign_extend 32) (currentBit!2342 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2194 () Bool)

(assert (= bs!2194 d!7600))

(assert (=> bs!2194 m!35769))

(assert (=> b!25018 d!7600))

(declare-fun d!7602 () Bool)

(declare-fun e!17331 () Bool)

(assert (=> d!7602 e!17331))

(declare-fun res!21943 () Bool)

(assert (=> d!7602 (=> (not res!21943) (not e!17331))))

(declare-fun lt!36348 () (_ BitVec 64))

(declare-fun lt!36352 () (_ BitVec 64))

(declare-fun lt!36350 () (_ BitVec 64))

(assert (=> d!7602 (= res!21943 (= lt!36348 (bvsub lt!36352 lt!36350)))))

(assert (=> d!7602 (or (= (bvand lt!36352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!36350 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!36352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!36352 lt!36350) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7602 (= lt!36350 (remainingBits!0 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35491)))) ((_ sign_extend 32) (currentByte!2347 (_2!1504 lt!35491))) ((_ sign_extend 32) (currentBit!2342 (_2!1504 lt!35491)))))))

(declare-fun lt!36351 () (_ BitVec 64))

(declare-fun lt!36349 () (_ BitVec 64))

(assert (=> d!7602 (= lt!36352 (bvmul lt!36351 lt!36349))))

(assert (=> d!7602 (or (= lt!36351 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!36349 (bvsdiv (bvmul lt!36351 lt!36349) lt!36351)))))

(assert (=> d!7602 (= lt!36349 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7602 (= lt!36351 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35491)))))))

(assert (=> d!7602 (= lt!36348 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2347 (_2!1504 lt!35491))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2342 (_2!1504 lt!35491)))))))

(assert (=> d!7602 (invariant!0 (currentBit!2342 (_2!1504 lt!35491)) (currentByte!2347 (_2!1504 lt!35491)) (size!713 (buf!1034 (_2!1504 lt!35491))))))

(assert (=> d!7602 (= (bitIndex!0 (size!713 (buf!1034 (_2!1504 lt!35491))) (currentByte!2347 (_2!1504 lt!35491)) (currentBit!2342 (_2!1504 lt!35491))) lt!36348)))

(declare-fun b!25416 () Bool)

(declare-fun res!21942 () Bool)

(assert (=> b!25416 (=> (not res!21942) (not e!17331))))

(assert (=> b!25416 (= res!21942 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!36348))))

(declare-fun b!25417 () Bool)

(declare-fun lt!36347 () (_ BitVec 64))

(assert (=> b!25417 (= e!17331 (bvsle lt!36348 (bvmul lt!36347 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!25417 (or (= lt!36347 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!36347 #b0000000000000000000000000000000000000000000000000000000000001000) lt!36347)))))

(assert (=> b!25417 (= lt!36347 ((_ sign_extend 32) (size!713 (buf!1034 (_2!1504 lt!35491)))))))

(assert (= (and d!7602 res!21943) b!25416))

(assert (= (and b!25416 res!21942) b!25417))

(declare-fun m!36187 () Bool)

(assert (=> d!7602 m!36187))

(assert (=> d!7602 m!35491))

(assert (=> b!25008 d!7602))

(declare-fun d!7604 () Bool)

(assert (=> d!7604 (= (invariant!0 (currentBit!2342 (_2!1504 lt!35484)) (currentByte!2347 (_2!1504 lt!35484)) (size!713 (buf!1034 (_2!1504 lt!35484)))) (and (bvsge (currentBit!2342 (_2!1504 lt!35484)) #b00000000000000000000000000000000) (bvslt (currentBit!2342 (_2!1504 lt!35484)) #b00000000000000000000000000001000) (bvsge (currentByte!2347 (_2!1504 lt!35484)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2347 (_2!1504 lt!35484)) (size!713 (buf!1034 (_2!1504 lt!35484)))) (and (= (currentBit!2342 (_2!1504 lt!35484)) #b00000000000000000000000000000000) (= (currentByte!2347 (_2!1504 lt!35484)) (size!713 (buf!1034 (_2!1504 lt!35484))))))))))

(assert (=> b!25019 d!7604))

(declare-fun d!7606 () Bool)

(assert (=> d!7606 (= (head!167 (byteArrayBitContentToList!0 (_2!1504 lt!35484) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!445 (byteArrayBitContentToList!0 (_2!1504 lt!35484) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!25009 d!7606))

(declare-fun d!7608 () Bool)

(declare-fun c!1708 () Bool)

(assert (=> d!7608 (= c!1708 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!17334 () List!330)

(assert (=> d!7608 (= (byteArrayBitContentToList!0 (_2!1504 lt!35484) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!17334)))

(declare-fun b!25422 () Bool)

(assert (=> b!25422 (= e!17334 Nil!327)))

(declare-fun b!25423 () Bool)

(assert (=> b!25423 (= e!17334 (Cons!326 (not (= (bvand ((_ sign_extend 24) (select (arr!1169 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1504 lt!35484) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!7608 c!1708) b!25422))

(assert (= (and d!7608 (not c!1708)) b!25423))

(assert (=> b!25423 m!35479))

(assert (=> b!25423 m!36167))

(declare-fun m!36189 () Bool)

(assert (=> b!25423 m!36189))

(assert (=> b!25009 d!7608))

(declare-fun d!7610 () Bool)

(assert (=> d!7610 (= (head!167 (bitStreamReadBitsIntoList!0 (_2!1504 lt!35484) (_1!1505 lt!35497) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!445 (bitStreamReadBitsIntoList!0 (_2!1504 lt!35484) (_1!1505 lt!35497) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!25009 d!7610))

(declare-fun b!25434 () Bool)

(declare-fun e!17340 () Bool)

(declare-fun lt!36359 () List!330)

(declare-fun isEmpty!66 (List!330) Bool)

(assert (=> b!25434 (= e!17340 (isEmpty!66 lt!36359))))

(declare-fun d!7612 () Bool)

(assert (=> d!7612 e!17340))

(declare-fun c!1713 () Bool)

(assert (=> d!7612 (= c!1713 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!2862 0))(
  ( (tuple2!2863 (_1!1518 List!330) (_2!1518 BitStream!1258)) )
))
(declare-fun e!17339 () tuple2!2862)

(assert (=> d!7612 (= lt!36359 (_1!1518 e!17339))))

(declare-fun c!1714 () Bool)

(assert (=> d!7612 (= c!1714 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7612 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7612 (= (bitStreamReadBitsIntoList!0 (_2!1504 lt!35484) (_1!1505 lt!35497) #b0000000000000000000000000000000000000000000000000000000000000001) lt!36359)))

(declare-fun b!25435 () Bool)

(declare-fun length!61 (List!330) Int)

(assert (=> b!25435 (= e!17340 (> (length!61 lt!36359) 0))))

(declare-fun b!25432 () Bool)

(assert (=> b!25432 (= e!17339 (tuple2!2863 Nil!327 (_1!1505 lt!35497)))))

(declare-fun b!25433 () Bool)

(declare-fun lt!36360 () (_ BitVec 64))

(declare-datatypes ((tuple2!2864 0))(
  ( (tuple2!2865 (_1!1519 Bool) (_2!1519 BitStream!1258)) )
))
(declare-fun lt!36361 () tuple2!2864)

(assert (=> b!25433 (= e!17339 (tuple2!2863 (Cons!326 (_1!1519 lt!36361) (bitStreamReadBitsIntoList!0 (_2!1504 lt!35484) (_2!1519 lt!36361) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!36360))) (_2!1519 lt!36361)))))

(declare-fun readBit!0 (BitStream!1258) tuple2!2864)

(assert (=> b!25433 (= lt!36361 (readBit!0 (_1!1505 lt!35497)))))

(assert (=> b!25433 (= lt!36360 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!7612 c!1714) b!25432))

(assert (= (and d!7612 (not c!1714)) b!25433))

(assert (= (and d!7612 c!1713) b!25434))

(assert (= (and d!7612 (not c!1713)) b!25435))

(declare-fun m!36191 () Bool)

(assert (=> b!25434 m!36191))

(declare-fun m!36193 () Bool)

(assert (=> b!25435 m!36193))

(declare-fun m!36195 () Bool)

(assert (=> b!25433 m!36195))

(declare-fun m!36197 () Bool)

(assert (=> b!25433 m!36197))

(assert (=> b!25009 d!7612))

(push 1)

(assert (not bm!340))

(assert (not d!7598))

(assert (not b!25387))

(assert (not d!7490))

(assert (not b!25213))

(assert (not d!7594))

(assert (not b!25190))

(assert (not b!25192))

(assert (not b!25423))

(assert (not d!7596))

(assert (not b!25411))

(assert (not b!25385))

(assert (not b!25193))

(assert (not b!25221))

(assert (not b!25409))

(assert (not b!25198))

(assert (not b!25381))

(assert (not b!25194))

(assert (not d!7512))

(assert (not b!25218))

(assert (not b!25384))

(assert (not b!25390))

(assert (not d!7480))

(assert (not b!25413))

(assert (not d!7492))

(assert (not b!25219))

(assert (not d!7506))

(assert (not d!7488))

(assert (not d!7484))

(assert (not b!25377))

(assert (not b!25412))

(assert (not b!25408))

(assert (not b!25434))

(assert (not b!25206))

(assert (not b!25415))

(assert (not b!25214))

(assert (not b!25382))

(assert (not b!25410))

(assert (not b!25378))

(assert (not d!7478))

(assert (not d!7486))

(assert (not b!25414))

(assert (not b!25433))

(assert (not d!7520))

(assert (not d!7514))

(assert (not b!25199))

(assert (not b!25211))

(assert (not b!25217))

(assert (not b!25216))

(assert (not d!7602))

(assert (not b!25195))

(assert (not d!7510))

(assert (not d!7496))

(assert (not b!25435))

(assert (not d!7600))

(assert (not d!7482))

(assert (not b!25197))

(assert (not d!7498))

(assert (not b!25208))

(assert (not b!25379))

(assert (not d!7516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

