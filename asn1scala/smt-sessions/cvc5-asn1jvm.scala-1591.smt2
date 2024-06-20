; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45300 () Bool)

(assert start!45300)

(declare-fun b!219567 () Bool)

(declare-fun res!184965 () Bool)

(declare-fun e!149102 () Bool)

(assert (=> b!219567 (=> (not res!184965) (not e!149102))))

(declare-datatypes ((array!10664 0))(
  ( (array!10665 (arr!5614 (Array (_ BitVec 32) (_ BitVec 8))) (size!4684 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8476 0))(
  ( (BitStream!8477 (buf!5231 array!10664) (currentByte!9830 (_ BitVec 32)) (currentBit!9825 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18734 0))(
  ( (tuple2!18735 (_1!10025 BitStream!8476) (_2!10025 (_ BitVec 64))) )
))
(declare-fun lt!347450 () tuple2!18734)

(declare-fun v!189 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!219567 (= res!184965 (= (_2!10025 lt!347450) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!219568 () Bool)

(declare-fun e!149108 () Bool)

(declare-fun thiss!1204 () BitStream!8476)

(declare-datatypes ((Unit!15565 0))(
  ( (Unit!15566) )
))
(declare-datatypes ((tuple2!18736 0))(
  ( (tuple2!18737 (_1!10026 Unit!15565) (_2!10026 BitStream!8476)) )
))
(declare-fun lt!347442 () tuple2!18736)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!219568 (= e!149108 (invariant!0 (currentBit!9825 thiss!1204) (currentByte!9830 thiss!1204) (size!4684 (buf!5231 (_2!10026 lt!347442)))))))

(declare-fun b!219569 () Bool)

(declare-fun e!149099 () Bool)

(declare-fun e!149097 () Bool)

(assert (=> b!219569 (= e!149099 e!149097)))

(declare-fun res!184958 () Bool)

(assert (=> b!219569 (=> (not res!184958) (not e!149097))))

(declare-fun lt!347432 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!219569 (= res!184958 (validate_offset_bits!1 ((_ sign_extend 32) (size!4684 (buf!5231 thiss!1204))) ((_ sign_extend 32) (currentByte!9830 thiss!1204)) ((_ sign_extend 32) (currentBit!9825 thiss!1204)) lt!347432))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!219569 (= lt!347432 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!219570 () Bool)

(declare-fun res!184967 () Bool)

(declare-fun e!149104 () Bool)

(assert (=> b!219570 (=> res!184967 e!149104)))

(declare-fun lt!347451 () (_ BitVec 64))

(declare-fun lt!347444 () (_ BitVec 64))

(assert (=> b!219570 (= res!184967 (or (not (= (size!4684 (buf!5231 (_2!10026 lt!347442))) (size!4684 (buf!5231 thiss!1204)))) (not (= lt!347444 (bvsub (bvadd lt!347451 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!219571 () Bool)

(declare-fun res!184956 () Bool)

(declare-fun e!149105 () Bool)

(assert (=> b!219571 (=> (not res!184956) (not e!149105))))

(declare-fun lt!347431 () tuple2!18736)

(declare-fun isPrefixOf!0 (BitStream!8476 BitStream!8476) Bool)

(assert (=> b!219571 (= res!184956 (isPrefixOf!0 thiss!1204 (_2!10026 lt!347431)))))

(declare-fun b!219572 () Bool)

(declare-fun e!149109 () Bool)

(assert (=> b!219572 (= e!149109 true)))

(assert (=> b!219572 e!149102))

(declare-fun res!184977 () Bool)

(assert (=> b!219572 (=> (not res!184977) (not e!149102))))

(assert (=> b!219572 (= res!184977 (= (size!4684 (buf!5231 thiss!1204)) (size!4684 (buf!5231 (_2!10026 lt!347442)))))))

(declare-fun b!219573 () Bool)

(declare-fun e!149103 () Bool)

(assert (=> b!219573 (= e!149103 e!149104)))

(declare-fun res!184970 () Bool)

(assert (=> b!219573 (=> res!184970 e!149104)))

(declare-fun lt!347453 () (_ BitVec 64))

(assert (=> b!219573 (= res!184970 (not (= lt!347444 (bvsub (bvsub (bvadd lt!347453 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!219573 (= lt!347444 (bitIndex!0 (size!4684 (buf!5231 (_2!10026 lt!347442))) (currentByte!9830 (_2!10026 lt!347442)) (currentBit!9825 (_2!10026 lt!347442))))))

(assert (=> b!219573 (isPrefixOf!0 thiss!1204 (_2!10026 lt!347442))))

(declare-fun lt!347427 () Unit!15565)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8476 BitStream!8476 BitStream!8476) Unit!15565)

(assert (=> b!219573 (= lt!347427 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!10026 lt!347431) (_2!10026 lt!347442)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8476 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18736)

(assert (=> b!219573 (= lt!347442 (appendBitsLSBFirstLoopTR!0 (_2!10026 lt!347431) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!219574 () Bool)

(declare-fun res!184966 () Bool)

(assert (=> b!219574 (=> res!184966 e!149104)))

(assert (=> b!219574 (= res!184966 (not (invariant!0 (currentBit!9825 (_2!10026 lt!347442)) (currentByte!9830 (_2!10026 lt!347442)) (size!4684 (buf!5231 (_2!10026 lt!347442))))))))

(declare-fun b!219575 () Bool)

(declare-fun e!149098 () Bool)

(declare-datatypes ((tuple2!18738 0))(
  ( (tuple2!18739 (_1!10027 BitStream!8476) (_2!10027 Bool)) )
))
(declare-fun lt!347433 () tuple2!18738)

(declare-fun lt!347449 () tuple2!18738)

(assert (=> b!219575 (= e!149098 (= (_2!10027 lt!347433) (_2!10027 lt!347449)))))

(declare-fun b!219576 () Bool)

(declare-fun res!184973 () Bool)

(assert (=> b!219576 (=> res!184973 e!149109)))

(declare-datatypes ((tuple2!18740 0))(
  ( (tuple2!18741 (_1!10028 BitStream!8476) (_2!10028 BitStream!8476)) )
))
(declare-fun lt!347446 () tuple2!18740)

(assert (=> b!219576 (= res!184973 (not (= (bitIndex!0 (size!4684 (buf!5231 (_1!10025 lt!347450))) (currentByte!9830 (_1!10025 lt!347450)) (currentBit!9825 (_1!10025 lt!347450))) (bitIndex!0 (size!4684 (buf!5231 (_2!10028 lt!347446))) (currentByte!9830 (_2!10028 lt!347446)) (currentBit!9825 (_2!10028 lt!347446))))))))

(declare-fun b!219578 () Bool)

(declare-fun res!184962 () Bool)

(assert (=> b!219578 (=> res!184962 e!149104)))

(assert (=> b!219578 (= res!184962 (not (isPrefixOf!0 thiss!1204 (_2!10026 lt!347431))))))

(declare-fun b!219579 () Bool)

(declare-fun res!184979 () Bool)

(declare-fun e!149095 () Bool)

(assert (=> b!219579 (=> (not res!184979) (not e!149095))))

(declare-fun lt!347425 () tuple2!18740)

(declare-fun withMovedBitIndex!0 (BitStream!8476 (_ BitVec 64)) BitStream!8476)

(assert (=> b!219579 (= res!184979 (= (_1!10028 lt!347425) (withMovedBitIndex!0 (_2!10028 lt!347425) (bvsub lt!347453 lt!347444))))))

(declare-fun b!219580 () Bool)

(assert (=> b!219580 (= e!149102 (= (_1!10025 lt!347450) (_2!10028 lt!347446)))))

(declare-fun b!219581 () Bool)

(declare-fun res!184971 () Bool)

(assert (=> b!219581 (=> (not res!184971) (not e!149097))))

(assert (=> b!219581 (= res!184971 (invariant!0 (currentBit!9825 thiss!1204) (currentByte!9830 thiss!1204) (size!4684 (buf!5231 thiss!1204))))))

(declare-fun b!219582 () Bool)

(declare-fun e!149101 () Bool)

(declare-fun array_inv!4425 (array!10664) Bool)

(assert (=> b!219582 (= e!149101 (array_inv!4425 (buf!5231 thiss!1204)))))

(declare-fun b!219583 () Bool)

(declare-fun res!184963 () Bool)

(assert (=> b!219583 (=> (not res!184963) (not e!149095))))

(assert (=> b!219583 (= res!184963 (= (_1!10028 lt!347446) (withMovedBitIndex!0 (_2!10028 lt!347446) (bvsub lt!347451 lt!347444))))))

(declare-fun b!219584 () Bool)

(declare-fun e!149100 () Bool)

(declare-fun lt!347439 () tuple2!18738)

(declare-fun lt!347436 () (_ BitVec 64))

(assert (=> b!219584 (= e!149100 (= (bitIndex!0 (size!4684 (buf!5231 (_1!10027 lt!347439))) (currentByte!9830 (_1!10027 lt!347439)) (currentBit!9825 (_1!10027 lt!347439))) lt!347436))))

(declare-fun b!219585 () Bool)

(assert (=> b!219585 (= e!149097 (not e!149103))))

(declare-fun res!184974 () Bool)

(assert (=> b!219585 (=> res!184974 e!149103)))

(assert (=> b!219585 (= res!184974 (not (= lt!347453 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!347451))))))

(assert (=> b!219585 (= lt!347453 (bitIndex!0 (size!4684 (buf!5231 (_2!10026 lt!347431))) (currentByte!9830 (_2!10026 lt!347431)) (currentBit!9825 (_2!10026 lt!347431))))))

(assert (=> b!219585 (= lt!347451 (bitIndex!0 (size!4684 (buf!5231 thiss!1204)) (currentByte!9830 thiss!1204) (currentBit!9825 thiss!1204)))))

(declare-fun e!149107 () Bool)

(assert (=> b!219585 e!149107))

(declare-fun res!184978 () Bool)

(assert (=> b!219585 (=> (not res!184978) (not e!149107))))

(assert (=> b!219585 (= res!184978 (= (size!4684 (buf!5231 thiss!1204)) (size!4684 (buf!5231 (_2!10026 lt!347431)))))))

(declare-fun lt!347452 () Bool)

(declare-fun appendBit!0 (BitStream!8476 Bool) tuple2!18736)

(assert (=> b!219585 (= lt!347431 (appendBit!0 thiss!1204 lt!347452))))

(declare-fun lt!347445 () (_ BitVec 64))

(assert (=> b!219585 (= lt!347452 (not (= (bvand v!189 lt!347445) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!219585 (= lt!347445 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!219586 () Bool)

(assert (=> b!219586 (= e!149105 e!149100)))

(declare-fun res!184957 () Bool)

(assert (=> b!219586 (=> (not res!184957) (not e!149100))))

(assert (=> b!219586 (= res!184957 (and (= (_2!10027 lt!347439) lt!347452) (= (_1!10027 lt!347439) (_2!10026 lt!347431))))))

(declare-fun readBitPure!0 (BitStream!8476) tuple2!18738)

(declare-fun readerFrom!0 (BitStream!8476 (_ BitVec 32) (_ BitVec 32)) BitStream!8476)

(assert (=> b!219586 (= lt!347439 (readBitPure!0 (readerFrom!0 (_2!10026 lt!347431) (currentBit!9825 thiss!1204) (currentByte!9830 thiss!1204))))))

(declare-fun b!219587 () Bool)

(declare-fun res!184959 () Bool)

(assert (=> b!219587 (=> (not res!184959) (not e!149097))))

(assert (=> b!219587 (= res!184959 (not (= i!590 nBits!348)))))

(declare-fun b!219588 () Bool)

(assert (=> b!219588 (= e!149107 e!149105)))

(declare-fun res!184960 () Bool)

(assert (=> b!219588 (=> (not res!184960) (not e!149105))))

(declare-fun lt!347428 () (_ BitVec 64))

(assert (=> b!219588 (= res!184960 (= lt!347436 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!347428)))))

(assert (=> b!219588 (= lt!347436 (bitIndex!0 (size!4684 (buf!5231 (_2!10026 lt!347431))) (currentByte!9830 (_2!10026 lt!347431)) (currentBit!9825 (_2!10026 lt!347431))))))

(assert (=> b!219588 (= lt!347428 (bitIndex!0 (size!4684 (buf!5231 thiss!1204)) (currentByte!9830 thiss!1204) (currentBit!9825 thiss!1204)))))

(declare-fun b!219589 () Bool)

(declare-fun res!184964 () Bool)

(assert (=> b!219589 (=> res!184964 e!149104)))

(assert (=> b!219589 (= res!184964 (not (isPrefixOf!0 (_2!10026 lt!347431) (_2!10026 lt!347442))))))

(declare-fun res!184968 () Bool)

(assert (=> start!45300 (=> (not res!184968) (not e!149099))))

(assert (=> start!45300 (= res!184968 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!45300 e!149099))

(assert (=> start!45300 true))

(declare-fun inv!12 (BitStream!8476) Bool)

(assert (=> start!45300 (and (inv!12 thiss!1204) e!149101)))

(declare-fun b!219577 () Bool)

(declare-fun e!149106 () Bool)

(assert (=> b!219577 (= e!149104 e!149106)))

(declare-fun res!184976 () Bool)

(assert (=> b!219577 (=> res!184976 e!149106)))

(declare-fun lt!347440 () tuple2!18734)

(assert (=> b!219577 (= res!184976 (not (= (_1!10025 lt!347440) (_2!10028 lt!347425))))))

(declare-fun lt!347435 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8476 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18734)

(assert (=> b!219577 (= lt!347440 (readNBitsLSBFirstsLoopPure!0 (_1!10028 lt!347425) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!347435))))

(declare-fun lt!347447 () (_ BitVec 64))

(assert (=> b!219577 (validate_offset_bits!1 ((_ sign_extend 32) (size!4684 (buf!5231 (_2!10026 lt!347442)))) ((_ sign_extend 32) (currentByte!9830 (_2!10026 lt!347431))) ((_ sign_extend 32) (currentBit!9825 (_2!10026 lt!347431))) lt!347447)))

(declare-fun lt!347430 () Unit!15565)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8476 array!10664 (_ BitVec 64)) Unit!15565)

(assert (=> b!219577 (= lt!347430 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!10026 lt!347431) (buf!5231 (_2!10026 lt!347442)) lt!347447))))

(assert (=> b!219577 (= lt!347447 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!347438 () tuple2!18738)

(declare-fun lt!347441 () (_ BitVec 64))

(assert (=> b!219577 (= lt!347435 (bvor lt!347441 (ite (_2!10027 lt!347438) lt!347445 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!219577 (= lt!347450 (readNBitsLSBFirstsLoopPure!0 (_1!10028 lt!347446) nBits!348 i!590 lt!347441))))

(assert (=> b!219577 (validate_offset_bits!1 ((_ sign_extend 32) (size!4684 (buf!5231 (_2!10026 lt!347442)))) ((_ sign_extend 32) (currentByte!9830 thiss!1204)) ((_ sign_extend 32) (currentBit!9825 thiss!1204)) lt!347432)))

(declare-fun lt!347443 () Unit!15565)

(assert (=> b!219577 (= lt!347443 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5231 (_2!10026 lt!347442)) lt!347432))))

(assert (=> b!219577 (= lt!347441 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!219577 (= (_2!10027 lt!347438) lt!347452)))

(assert (=> b!219577 (= lt!347438 (readBitPure!0 (_1!10028 lt!347446)))))

(declare-fun reader!0 (BitStream!8476 BitStream!8476) tuple2!18740)

(assert (=> b!219577 (= lt!347425 (reader!0 (_2!10026 lt!347431) (_2!10026 lt!347442)))))

(assert (=> b!219577 (= lt!347446 (reader!0 thiss!1204 (_2!10026 lt!347442)))))

(assert (=> b!219577 e!149098))

(declare-fun res!184975 () Bool)

(assert (=> b!219577 (=> (not res!184975) (not e!149098))))

(assert (=> b!219577 (= res!184975 (= (bitIndex!0 (size!4684 (buf!5231 (_1!10027 lt!347433))) (currentByte!9830 (_1!10027 lt!347433)) (currentBit!9825 (_1!10027 lt!347433))) (bitIndex!0 (size!4684 (buf!5231 (_1!10027 lt!347449))) (currentByte!9830 (_1!10027 lt!347449)) (currentBit!9825 (_1!10027 lt!347449)))))))

(declare-fun lt!347448 () Unit!15565)

(declare-fun lt!347426 () BitStream!8476)

(declare-fun readBitPrefixLemma!0 (BitStream!8476 BitStream!8476) Unit!15565)

(assert (=> b!219577 (= lt!347448 (readBitPrefixLemma!0 lt!347426 (_2!10026 lt!347442)))))

(assert (=> b!219577 (= lt!347449 (readBitPure!0 (BitStream!8477 (buf!5231 (_2!10026 lt!347442)) (currentByte!9830 thiss!1204) (currentBit!9825 thiss!1204))))))

(assert (=> b!219577 (= lt!347433 (readBitPure!0 lt!347426))))

(assert (=> b!219577 e!149108))

(declare-fun res!184972 () Bool)

(assert (=> b!219577 (=> (not res!184972) (not e!149108))))

(assert (=> b!219577 (= res!184972 (invariant!0 (currentBit!9825 thiss!1204) (currentByte!9830 thiss!1204) (size!4684 (buf!5231 (_2!10026 lt!347431)))))))

(assert (=> b!219577 (= lt!347426 (BitStream!8477 (buf!5231 (_2!10026 lt!347431)) (currentByte!9830 thiss!1204) (currentBit!9825 thiss!1204)))))

(declare-fun b!219590 () Bool)

(assert (=> b!219590 (= e!149106 e!149109)))

(declare-fun res!184961 () Bool)

(assert (=> b!219590 (=> res!184961 e!149109)))

(declare-fun lt!347437 () BitStream!8476)

(assert (=> b!219590 (= res!184961 (not (= (_1!10028 lt!347425) lt!347437)))))

(assert (=> b!219590 e!149095))

(declare-fun res!184969 () Bool)

(assert (=> b!219590 (=> (not res!184969) (not e!149095))))

(declare-fun lt!347434 () tuple2!18734)

(assert (=> b!219590 (= res!184969 (and (= (_2!10025 lt!347450) (_2!10025 lt!347434)) (= (_1!10025 lt!347450) (_1!10025 lt!347434))))))

(declare-fun lt!347429 () Unit!15565)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8476 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15565)

(assert (=> b!219590 (= lt!347429 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!10028 lt!347446) nBits!348 i!590 lt!347441))))

(assert (=> b!219590 (= lt!347434 (readNBitsLSBFirstsLoopPure!0 lt!347437 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!347435))))

(assert (=> b!219590 (= lt!347437 (withMovedBitIndex!0 (_1!10028 lt!347446) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!219591 () Bool)

(assert (=> b!219591 (= e!149095 (and (= lt!347451 (bvsub lt!347453 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!10028 lt!347425) lt!347437)) (= (_2!10025 lt!347450) (_2!10025 lt!347440)))))))

(assert (= (and start!45300 res!184968) b!219569))

(assert (= (and b!219569 res!184958) b!219581))

(assert (= (and b!219581 res!184971) b!219587))

(assert (= (and b!219587 res!184959) b!219585))

(assert (= (and b!219585 res!184978) b!219588))

(assert (= (and b!219588 res!184960) b!219571))

(assert (= (and b!219571 res!184956) b!219586))

(assert (= (and b!219586 res!184957) b!219584))

(assert (= (and b!219585 (not res!184974)) b!219573))

(assert (= (and b!219573 (not res!184970)) b!219574))

(assert (= (and b!219574 (not res!184966)) b!219570))

(assert (= (and b!219570 (not res!184967)) b!219589))

(assert (= (and b!219589 (not res!184964)) b!219578))

(assert (= (and b!219578 (not res!184962)) b!219577))

(assert (= (and b!219577 res!184972) b!219568))

(assert (= (and b!219577 res!184975) b!219575))

(assert (= (and b!219577 (not res!184976)) b!219590))

(assert (= (and b!219590 res!184969) b!219583))

(assert (= (and b!219583 res!184963) b!219579))

(assert (= (and b!219579 res!184979) b!219591))

(assert (= (and b!219590 (not res!184961)) b!219576))

(assert (= (and b!219576 (not res!184973)) b!219572))

(assert (= (and b!219572 res!184977) b!219567))

(assert (= (and b!219567 res!184965) b!219580))

(assert (= start!45300 b!219582))

(declare-fun m!338199 () Bool)

(assert (=> b!219581 m!338199))

(declare-fun m!338201 () Bool)

(assert (=> b!219577 m!338201))

(declare-fun m!338203 () Bool)

(assert (=> b!219577 m!338203))

(declare-fun m!338205 () Bool)

(assert (=> b!219577 m!338205))

(declare-fun m!338207 () Bool)

(assert (=> b!219577 m!338207))

(declare-fun m!338209 () Bool)

(assert (=> b!219577 m!338209))

(declare-fun m!338211 () Bool)

(assert (=> b!219577 m!338211))

(declare-fun m!338213 () Bool)

(assert (=> b!219577 m!338213))

(declare-fun m!338215 () Bool)

(assert (=> b!219577 m!338215))

(declare-fun m!338217 () Bool)

(assert (=> b!219577 m!338217))

(declare-fun m!338219 () Bool)

(assert (=> b!219577 m!338219))

(declare-fun m!338221 () Bool)

(assert (=> b!219577 m!338221))

(declare-fun m!338223 () Bool)

(assert (=> b!219577 m!338223))

(declare-fun m!338225 () Bool)

(assert (=> b!219577 m!338225))

(declare-fun m!338227 () Bool)

(assert (=> b!219577 m!338227))

(declare-fun m!338229 () Bool)

(assert (=> b!219577 m!338229))

(declare-fun m!338231 () Bool)

(assert (=> b!219577 m!338231))

(declare-fun m!338233 () Bool)

(assert (=> b!219568 m!338233))

(declare-fun m!338235 () Bool)

(assert (=> b!219571 m!338235))

(declare-fun m!338237 () Bool)

(assert (=> b!219586 m!338237))

(assert (=> b!219586 m!338237))

(declare-fun m!338239 () Bool)

(assert (=> b!219586 m!338239))

(declare-fun m!338241 () Bool)

(assert (=> b!219567 m!338241))

(declare-fun m!338243 () Bool)

(assert (=> b!219583 m!338243))

(declare-fun m!338245 () Bool)

(assert (=> b!219589 m!338245))

(declare-fun m!338247 () Bool)

(assert (=> b!219574 m!338247))

(declare-fun m!338249 () Bool)

(assert (=> b!219579 m!338249))

(declare-fun m!338251 () Bool)

(assert (=> b!219582 m!338251))

(declare-fun m!338253 () Bool)

(assert (=> b!219588 m!338253))

(declare-fun m!338255 () Bool)

(assert (=> b!219588 m!338255))

(declare-fun m!338257 () Bool)

(assert (=> b!219576 m!338257))

(declare-fun m!338259 () Bool)

(assert (=> b!219576 m!338259))

(declare-fun m!338261 () Bool)

(assert (=> b!219573 m!338261))

(declare-fun m!338263 () Bool)

(assert (=> b!219573 m!338263))

(declare-fun m!338265 () Bool)

(assert (=> b!219573 m!338265))

(declare-fun m!338267 () Bool)

(assert (=> b!219573 m!338267))

(declare-fun m!338269 () Bool)

(assert (=> b!219584 m!338269))

(declare-fun m!338271 () Bool)

(assert (=> b!219590 m!338271))

(declare-fun m!338273 () Bool)

(assert (=> b!219590 m!338273))

(declare-fun m!338275 () Bool)

(assert (=> b!219590 m!338275))

(assert (=> b!219585 m!338253))

(assert (=> b!219585 m!338255))

(declare-fun m!338277 () Bool)

(assert (=> b!219585 m!338277))

(declare-fun m!338279 () Bool)

(assert (=> start!45300 m!338279))

(assert (=> b!219578 m!338235))

(declare-fun m!338281 () Bool)

(assert (=> b!219569 m!338281))

(push 1)

(assert (not b!219581))

(assert (not b!219568))

(assert (not b!219589))

(assert (not b!219569))

(assert (not b!219576))

(assert (not b!219573))

(assert (not b!219583))

(assert (not b!219578))

(assert (not b!219582))

(assert (not b!219571))

(assert (not b!219588))

(assert (not b!219586))

(assert (not b!219584))

(assert (not b!219590))

(assert (not b!219574))

(assert (not b!219577))

(assert (not b!219567))

(assert (not start!45300))

(assert (not b!219585))

(assert (not b!219579))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

