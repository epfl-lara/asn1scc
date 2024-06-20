; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53116 () Bool)

(assert start!53116)

(declare-fun b!246457 () Bool)

(declare-fun e!170747 () Bool)

(declare-datatypes ((array!13444 0))(
  ( (array!13445 (arr!6881 (Array (_ BitVec 32) (_ BitVec 8))) (size!5894 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10710 0))(
  ( (BitStream!10711 (buf!6375 array!13444) (currentByte!11771 (_ BitVec 32)) (currentBit!11766 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10710)

(declare-datatypes ((Unit!17900 0))(
  ( (Unit!17901) )
))
(declare-datatypes ((tuple2!21144 0))(
  ( (tuple2!21145 (_1!11494 Unit!17900) (_2!11494 BitStream!10710)) )
))
(declare-fun lt!384464 () tuple2!21144)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246457 (= e!170747 (invariant!0 (currentBit!11766 thiss!1005) (currentByte!11771 thiss!1005) (size!5894 (buf!6375 (_2!11494 lt!384464)))))))

(declare-fun b!246458 () Bool)

(declare-fun e!170749 () Bool)

(declare-datatypes ((tuple2!21146 0))(
  ( (tuple2!21147 (_1!11495 BitStream!10710) (_2!11495 Bool)) )
))
(declare-fun lt!384463 () tuple2!21146)

(declare-fun lt!384477 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246458 (= e!170749 (= (bitIndex!0 (size!5894 (buf!6375 (_1!11495 lt!384463))) (currentByte!11771 (_1!11495 lt!384463)) (currentBit!11766 (_1!11495 lt!384463))) lt!384477))))

(declare-fun res!206183 () Bool)

(declare-fun e!170752 () Bool)

(assert (=> start!53116 (=> (not res!206183) (not e!170752))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53116 (= res!206183 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53116 e!170752))

(assert (=> start!53116 true))

(declare-fun e!170744 () Bool)

(declare-fun inv!12 (BitStream!10710) Bool)

(assert (=> start!53116 (and (inv!12 thiss!1005) e!170744)))

(declare-fun b!246459 () Bool)

(declare-fun e!170742 () Bool)

(declare-fun e!170753 () Bool)

(assert (=> b!246459 (= e!170742 e!170753)))

(declare-fun res!206179 () Bool)

(assert (=> b!246459 (=> res!206179 e!170753)))

(assert (=> b!246459 (= res!206179 (not (= (size!5894 (buf!6375 thiss!1005)) (size!5894 (buf!6375 (_2!11494 lt!384464))))))))

(declare-fun lt!384465 () tuple2!21146)

(declare-fun lt!384470 () tuple2!21146)

(declare-datatypes ((tuple2!21148 0))(
  ( (tuple2!21149 (_1!11496 BitStream!10710) (_2!11496 BitStream!10710)) )
))
(declare-fun lt!384472 () tuple2!21148)

(assert (=> b!246459 (and (= (_2!11495 lt!384465) (_2!11495 lt!384470)) (= (_1!11495 lt!384465) (_2!11496 lt!384472)))))

(declare-fun b!246460 () Bool)

(declare-fun e!170750 () Bool)

(declare-fun lt!384473 () tuple2!21146)

(declare-fun lt!384471 () tuple2!21148)

(assert (=> b!246460 (= e!170750 (not (or (not (_2!11495 lt!384473)) (not (= (_1!11495 lt!384473) (_2!11496 lt!384471))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10710 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21146)

(assert (=> b!246460 (= lt!384473 (checkBitsLoopPure!0 (_1!11496 lt!384471) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384474 () tuple2!21144)

(declare-fun lt!384479 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246460 (validate_offset_bits!1 ((_ sign_extend 32) (size!5894 (buf!6375 (_2!11494 lt!384464)))) ((_ sign_extend 32) (currentByte!11771 (_2!11494 lt!384474))) ((_ sign_extend 32) (currentBit!11766 (_2!11494 lt!384474))) lt!384479)))

(declare-fun lt!384482 () Unit!17900)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10710 array!13444 (_ BitVec 64)) Unit!17900)

(assert (=> b!246460 (= lt!384482 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11494 lt!384474) (buf!6375 (_2!11494 lt!384464)) lt!384479))))

(declare-fun reader!0 (BitStream!10710 BitStream!10710) tuple2!21148)

(assert (=> b!246460 (= lt!384471 (reader!0 (_2!11494 lt!384474) (_2!11494 lt!384464)))))

(declare-fun b!246461 () Bool)

(assert (=> b!246461 (= e!170752 (not e!170742))))

(declare-fun res!206187 () Bool)

(assert (=> b!246461 (=> res!206187 e!170742)))

(declare-fun lt!384483 () tuple2!21148)

(assert (=> b!246461 (= res!206187 (not (= (_1!11495 lt!384470) (_2!11496 lt!384483))))))

(assert (=> b!246461 (= lt!384470 (checkBitsLoopPure!0 (_1!11496 lt!384483) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384469 () (_ BitVec 64))

(assert (=> b!246461 (validate_offset_bits!1 ((_ sign_extend 32) (size!5894 (buf!6375 (_2!11494 lt!384464)))) ((_ sign_extend 32) (currentByte!11771 (_2!11494 lt!384474))) ((_ sign_extend 32) (currentBit!11766 (_2!11494 lt!384474))) lt!384469)))

(declare-fun lt!384486 () Unit!17900)

(assert (=> b!246461 (= lt!384486 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11494 lt!384474) (buf!6375 (_2!11494 lt!384464)) lt!384469))))

(assert (=> b!246461 (= lt!384465 (checkBitsLoopPure!0 (_1!11496 lt!384472) nBits!297 bit!26 from!289))))

(assert (=> b!246461 (validate_offset_bits!1 ((_ sign_extend 32) (size!5894 (buf!6375 (_2!11494 lt!384464)))) ((_ sign_extend 32) (currentByte!11771 thiss!1005)) ((_ sign_extend 32) (currentBit!11766 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!384484 () Unit!17900)

(assert (=> b!246461 (= lt!384484 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6375 (_2!11494 lt!384464)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10710) tuple2!21146)

(assert (=> b!246461 (= (_2!11495 (readBitPure!0 (_1!11496 lt!384472))) bit!26)))

(assert (=> b!246461 (= lt!384483 (reader!0 (_2!11494 lt!384474) (_2!11494 lt!384464)))))

(assert (=> b!246461 (= lt!384472 (reader!0 thiss!1005 (_2!11494 lt!384464)))))

(declare-fun e!170748 () Bool)

(assert (=> b!246461 e!170748))

(declare-fun res!206177 () Bool)

(assert (=> b!246461 (=> (not res!206177) (not e!170748))))

(declare-fun lt!384481 () tuple2!21146)

(declare-fun lt!384478 () tuple2!21146)

(assert (=> b!246461 (= res!206177 (= (bitIndex!0 (size!5894 (buf!6375 (_1!11495 lt!384481))) (currentByte!11771 (_1!11495 lt!384481)) (currentBit!11766 (_1!11495 lt!384481))) (bitIndex!0 (size!5894 (buf!6375 (_1!11495 lt!384478))) (currentByte!11771 (_1!11495 lt!384478)) (currentBit!11766 (_1!11495 lt!384478)))))))

(declare-fun lt!384467 () Unit!17900)

(declare-fun lt!384480 () BitStream!10710)

(declare-fun readBitPrefixLemma!0 (BitStream!10710 BitStream!10710) Unit!17900)

(assert (=> b!246461 (= lt!384467 (readBitPrefixLemma!0 lt!384480 (_2!11494 lt!384464)))))

(assert (=> b!246461 (= lt!384478 (readBitPure!0 (BitStream!10711 (buf!6375 (_2!11494 lt!384464)) (currentByte!11771 thiss!1005) (currentBit!11766 thiss!1005))))))

(assert (=> b!246461 (= lt!384481 (readBitPure!0 lt!384480))))

(assert (=> b!246461 (= lt!384480 (BitStream!10711 (buf!6375 (_2!11494 lt!384474)) (currentByte!11771 thiss!1005) (currentBit!11766 thiss!1005)))))

(assert (=> b!246461 e!170747))

(declare-fun res!206172 () Bool)

(assert (=> b!246461 (=> (not res!206172) (not e!170747))))

(declare-fun isPrefixOf!0 (BitStream!10710 BitStream!10710) Bool)

(assert (=> b!246461 (= res!206172 (isPrefixOf!0 thiss!1005 (_2!11494 lt!384464)))))

(declare-fun lt!384475 () Unit!17900)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10710 BitStream!10710 BitStream!10710) Unit!17900)

(assert (=> b!246461 (= lt!384475 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11494 lt!384474) (_2!11494 lt!384464)))))

(declare-fun e!170743 () Bool)

(assert (=> b!246461 e!170743))

(declare-fun res!206173 () Bool)

(assert (=> b!246461 (=> (not res!206173) (not e!170743))))

(assert (=> b!246461 (= res!206173 (= (size!5894 (buf!6375 (_2!11494 lt!384474))) (size!5894 (buf!6375 (_2!11494 lt!384464)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10710 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21144)

(assert (=> b!246461 (= lt!384464 (appendNBitsLoop!0 (_2!11494 lt!384474) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246461 (validate_offset_bits!1 ((_ sign_extend 32) (size!5894 (buf!6375 (_2!11494 lt!384474)))) ((_ sign_extend 32) (currentByte!11771 (_2!11494 lt!384474))) ((_ sign_extend 32) (currentBit!11766 (_2!11494 lt!384474))) lt!384469)))

(assert (=> b!246461 (= lt!384469 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!384476 () Unit!17900)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10710 BitStream!10710 (_ BitVec 64) (_ BitVec 64)) Unit!17900)

(assert (=> b!246461 (= lt!384476 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11494 lt!384474) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!170751 () Bool)

(assert (=> b!246461 e!170751))

(declare-fun res!206186 () Bool)

(assert (=> b!246461 (=> (not res!206186) (not e!170751))))

(assert (=> b!246461 (= res!206186 (= (size!5894 (buf!6375 thiss!1005)) (size!5894 (buf!6375 (_2!11494 lt!384474)))))))

(declare-fun appendBit!0 (BitStream!10710 Bool) tuple2!21144)

(assert (=> b!246461 (= lt!384474 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246462 () Bool)

(declare-fun array_inv!5635 (array!13444) Bool)

(assert (=> b!246462 (= e!170744 (array_inv!5635 (buf!6375 thiss!1005)))))

(declare-fun b!246463 () Bool)

(declare-fun res!206182 () Bool)

(declare-fun e!170746 () Bool)

(assert (=> b!246463 (=> (not res!206182) (not e!170746))))

(assert (=> b!246463 (= res!206182 (isPrefixOf!0 thiss!1005 (_2!11494 lt!384474)))))

(declare-fun b!246464 () Bool)

(assert (=> b!246464 (= e!170753 true)))

(declare-fun lt!384466 () (_ BitVec 64))

(assert (=> b!246464 (= lt!384466 (bitIndex!0 (size!5894 (buf!6375 (_2!11494 lt!384464))) (currentByte!11771 (_2!11494 lt!384464)) (currentBit!11766 (_2!11494 lt!384464))))))

(declare-fun lt!384485 () (_ BitVec 64))

(assert (=> b!246464 (= lt!384485 (bitIndex!0 (size!5894 (buf!6375 thiss!1005)) (currentByte!11771 thiss!1005) (currentBit!11766 thiss!1005)))))

(declare-fun b!246465 () Bool)

(assert (=> b!246465 (= e!170743 e!170750)))

(declare-fun res!206185 () Bool)

(assert (=> b!246465 (=> (not res!206185) (not e!170750))))

(assert (=> b!246465 (= res!206185 (= (bitIndex!0 (size!5894 (buf!6375 (_2!11494 lt!384464))) (currentByte!11771 (_2!11494 lt!384464)) (currentBit!11766 (_2!11494 lt!384464))) (bvadd (bitIndex!0 (size!5894 (buf!6375 (_2!11494 lt!384474))) (currentByte!11771 (_2!11494 lt!384474)) (currentBit!11766 (_2!11494 lt!384474))) lt!384479)))))

(assert (=> b!246465 (= lt!384479 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246466 () Bool)

(declare-fun res!206175 () Bool)

(assert (=> b!246466 (=> (not res!206175) (not e!170747))))

(assert (=> b!246466 (= res!206175 (invariant!0 (currentBit!11766 thiss!1005) (currentByte!11771 thiss!1005) (size!5894 (buf!6375 (_2!11494 lt!384474)))))))

(declare-fun b!246467 () Bool)

(declare-fun res!206174 () Bool)

(assert (=> b!246467 (=> res!206174 e!170742)))

(declare-fun withMovedBitIndex!0 (BitStream!10710 (_ BitVec 64)) BitStream!10710)

(assert (=> b!246467 (= res!206174 (not (= (_1!11496 lt!384483) (withMovedBitIndex!0 (_1!11496 lt!384472) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!246468 () Bool)

(declare-fun res!206176 () Bool)

(assert (=> b!246468 (=> (not res!206176) (not e!170752))))

(assert (=> b!246468 (= res!206176 (bvslt from!289 nBits!297))))

(declare-fun b!246469 () Bool)

(declare-fun res!206180 () Bool)

(assert (=> b!246469 (=> (not res!206180) (not e!170750))))

(assert (=> b!246469 (= res!206180 (isPrefixOf!0 (_2!11494 lt!384474) (_2!11494 lt!384464)))))

(declare-fun b!246470 () Bool)

(assert (=> b!246470 (= e!170748 (= (_2!11495 lt!384481) (_2!11495 lt!384478)))))

(declare-fun b!246471 () Bool)

(declare-fun res!206178 () Bool)

(assert (=> b!246471 (=> (not res!206178) (not e!170752))))

(assert (=> b!246471 (= res!206178 (validate_offset_bits!1 ((_ sign_extend 32) (size!5894 (buf!6375 thiss!1005))) ((_ sign_extend 32) (currentByte!11771 thiss!1005)) ((_ sign_extend 32) (currentBit!11766 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!246472 () Bool)

(assert (=> b!246472 (= e!170751 e!170746)))

(declare-fun res!206184 () Bool)

(assert (=> b!246472 (=> (not res!206184) (not e!170746))))

(declare-fun lt!384468 () (_ BitVec 64))

(assert (=> b!246472 (= res!206184 (= lt!384477 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!384468)))))

(assert (=> b!246472 (= lt!384477 (bitIndex!0 (size!5894 (buf!6375 (_2!11494 lt!384474))) (currentByte!11771 (_2!11494 lt!384474)) (currentBit!11766 (_2!11494 lt!384474))))))

(assert (=> b!246472 (= lt!384468 (bitIndex!0 (size!5894 (buf!6375 thiss!1005)) (currentByte!11771 thiss!1005) (currentBit!11766 thiss!1005)))))

(declare-fun b!246473 () Bool)

(assert (=> b!246473 (= e!170746 e!170749)))

(declare-fun res!206181 () Bool)

(assert (=> b!246473 (=> (not res!206181) (not e!170749))))

(assert (=> b!246473 (= res!206181 (and (= (_2!11495 lt!384463) bit!26) (= (_1!11495 lt!384463) (_2!11494 lt!384474))))))

(declare-fun readerFrom!0 (BitStream!10710 (_ BitVec 32) (_ BitVec 32)) BitStream!10710)

(assert (=> b!246473 (= lt!384463 (readBitPure!0 (readerFrom!0 (_2!11494 lt!384474) (currentBit!11766 thiss!1005) (currentByte!11771 thiss!1005))))))

(assert (= (and start!53116 res!206183) b!246471))

(assert (= (and b!246471 res!206178) b!246468))

(assert (= (and b!246468 res!206176) b!246461))

(assert (= (and b!246461 res!206186) b!246472))

(assert (= (and b!246472 res!206184) b!246463))

(assert (= (and b!246463 res!206182) b!246473))

(assert (= (and b!246473 res!206181) b!246458))

(assert (= (and b!246461 res!206173) b!246465))

(assert (= (and b!246465 res!206185) b!246469))

(assert (= (and b!246469 res!206180) b!246460))

(assert (= (and b!246461 res!206172) b!246466))

(assert (= (and b!246466 res!206175) b!246457))

(assert (= (and b!246461 res!206177) b!246470))

(assert (= (and b!246461 (not res!206187)) b!246467))

(assert (= (and b!246467 (not res!206174)) b!246459))

(assert (= (and b!246459 (not res!206179)) b!246464))

(assert (= start!53116 b!246462))

(declare-fun m!371701 () Bool)

(assert (=> b!246461 m!371701))

(declare-fun m!371703 () Bool)

(assert (=> b!246461 m!371703))

(declare-fun m!371705 () Bool)

(assert (=> b!246461 m!371705))

(declare-fun m!371707 () Bool)

(assert (=> b!246461 m!371707))

(declare-fun m!371709 () Bool)

(assert (=> b!246461 m!371709))

(declare-fun m!371711 () Bool)

(assert (=> b!246461 m!371711))

(declare-fun m!371713 () Bool)

(assert (=> b!246461 m!371713))

(declare-fun m!371715 () Bool)

(assert (=> b!246461 m!371715))

(declare-fun m!371717 () Bool)

(assert (=> b!246461 m!371717))

(declare-fun m!371719 () Bool)

(assert (=> b!246461 m!371719))

(declare-fun m!371721 () Bool)

(assert (=> b!246461 m!371721))

(declare-fun m!371723 () Bool)

(assert (=> b!246461 m!371723))

(declare-fun m!371725 () Bool)

(assert (=> b!246461 m!371725))

(declare-fun m!371727 () Bool)

(assert (=> b!246461 m!371727))

(declare-fun m!371729 () Bool)

(assert (=> b!246461 m!371729))

(declare-fun m!371731 () Bool)

(assert (=> b!246461 m!371731))

(declare-fun m!371733 () Bool)

(assert (=> b!246461 m!371733))

(declare-fun m!371735 () Bool)

(assert (=> b!246461 m!371735))

(declare-fun m!371737 () Bool)

(assert (=> b!246461 m!371737))

(declare-fun m!371739 () Bool)

(assert (=> b!246461 m!371739))

(declare-fun m!371741 () Bool)

(assert (=> start!53116 m!371741))

(declare-fun m!371743 () Bool)

(assert (=> b!246466 m!371743))

(declare-fun m!371745 () Bool)

(assert (=> b!246469 m!371745))

(declare-fun m!371747 () Bool)

(assert (=> b!246464 m!371747))

(declare-fun m!371749 () Bool)

(assert (=> b!246464 m!371749))

(declare-fun m!371751 () Bool)

(assert (=> b!246463 m!371751))

(assert (=> b!246465 m!371747))

(declare-fun m!371753 () Bool)

(assert (=> b!246465 m!371753))

(assert (=> b!246472 m!371753))

(assert (=> b!246472 m!371749))

(declare-fun m!371755 () Bool)

(assert (=> b!246457 m!371755))

(declare-fun m!371757 () Bool)

(assert (=> b!246467 m!371757))

(declare-fun m!371759 () Bool)

(assert (=> b!246458 m!371759))

(declare-fun m!371761 () Bool)

(assert (=> b!246471 m!371761))

(declare-fun m!371763 () Bool)

(assert (=> b!246462 m!371763))

(declare-fun m!371765 () Bool)

(assert (=> b!246473 m!371765))

(assert (=> b!246473 m!371765))

(declare-fun m!371767 () Bool)

(assert (=> b!246473 m!371767))

(declare-fun m!371769 () Bool)

(assert (=> b!246460 m!371769))

(declare-fun m!371771 () Bool)

(assert (=> b!246460 m!371771))

(declare-fun m!371773 () Bool)

(assert (=> b!246460 m!371773))

(assert (=> b!246460 m!371729))

(check-sat (not b!246469) (not b!246471) (not b!246457) (not b!246465) (not b!246464) (not b!246472) (not b!246458) (not b!246466) (not b!246473) (not b!246463) (not b!246467) (not b!246460) (not b!246461) (not start!53116) (not b!246462))
