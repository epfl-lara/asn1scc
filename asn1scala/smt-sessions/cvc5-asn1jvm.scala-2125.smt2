; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53736 () Bool)

(assert start!53736)

(declare-fun b!250185 () Bool)

(declare-fun e!173415 () Bool)

(declare-datatypes ((array!13645 0))(
  ( (array!13646 (arr!6973 (Array (_ BitVec 32) (_ BitVec 8))) (size!5986 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10894 0))(
  ( (BitStream!10895 (buf!6479 array!13645) (currentByte!11910 (_ BitVec 32)) (currentBit!11905 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21468 0))(
  ( (tuple2!21469 (_1!11659 BitStream!10894) (_2!11659 Bool)) )
))
(declare-fun lt!388760 () tuple2!21468)

(declare-fun lt!388762 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!250185 (= e!173415 (= (bitIndex!0 (size!5986 (buf!6479 (_1!11659 lt!388760))) (currentByte!11910 (_1!11659 lt!388760)) (currentBit!11905 (_1!11659 lt!388760))) lt!388762))))

(declare-fun b!250186 () Bool)

(declare-fun res!209431 () Bool)

(declare-fun e!173412 () Bool)

(assert (=> b!250186 (=> (not res!209431) (not e!173412))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun thiss!1005 () BitStream!10894)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250186 (= res!209431 (validate_offset_bits!1 ((_ sign_extend 32) (size!5986 (buf!6479 thiss!1005))) ((_ sign_extend 32) (currentByte!11910 thiss!1005)) ((_ sign_extend 32) (currentBit!11905 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!250187 () Bool)

(declare-fun res!209432 () Bool)

(declare-fun e!173417 () Bool)

(assert (=> b!250187 (=> (not res!209432) (not e!173417))))

(declare-datatypes ((Unit!18108 0))(
  ( (Unit!18109) )
))
(declare-datatypes ((tuple2!21470 0))(
  ( (tuple2!21471 (_1!11660 Unit!18108) (_2!11660 BitStream!10894)) )
))
(declare-fun lt!388766 () tuple2!21470)

(declare-fun isPrefixOf!0 (BitStream!10894 BitStream!10894) Bool)

(assert (=> b!250187 (= res!209432 (isPrefixOf!0 thiss!1005 (_2!11660 lt!388766)))))

(declare-fun b!250188 () Bool)

(declare-fun res!209429 () Bool)

(assert (=> b!250188 (=> (not res!209429) (not e!173412))))

(assert (=> b!250188 (= res!209429 (bvslt from!289 nBits!297))))

(declare-fun b!250189 () Bool)

(declare-fun e!173413 () Bool)

(assert (=> b!250189 (= e!173413 e!173417)))

(declare-fun res!209436 () Bool)

(assert (=> b!250189 (=> (not res!209436) (not e!173417))))

(declare-fun lt!388768 () (_ BitVec 64))

(assert (=> b!250189 (= res!209436 (= lt!388762 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388768)))))

(assert (=> b!250189 (= lt!388762 (bitIndex!0 (size!5986 (buf!6479 (_2!11660 lt!388766))) (currentByte!11910 (_2!11660 lt!388766)) (currentBit!11905 (_2!11660 lt!388766))))))

(assert (=> b!250189 (= lt!388768 (bitIndex!0 (size!5986 (buf!6479 thiss!1005)) (currentByte!11910 thiss!1005) (currentBit!11905 thiss!1005)))))

(declare-fun b!250190 () Bool)

(declare-fun e!173411 () Bool)

(declare-fun array_inv!5727 (array!13645) Bool)

(assert (=> b!250190 (= e!173411 (array_inv!5727 (buf!6479 thiss!1005)))))

(declare-fun b!250191 () Bool)

(declare-fun e!173410 () Bool)

(declare-fun e!173416 () Bool)

(assert (=> b!250191 (= e!173410 e!173416)))

(declare-fun res!209426 () Bool)

(assert (=> b!250191 (=> (not res!209426) (not e!173416))))

(declare-fun lt!388770 () (_ BitVec 64))

(declare-fun lt!388767 () tuple2!21470)

(assert (=> b!250191 (= res!209426 (= (bitIndex!0 (size!5986 (buf!6479 (_2!11660 lt!388767))) (currentByte!11910 (_2!11660 lt!388767)) (currentBit!11905 (_2!11660 lt!388767))) (bvadd (bitIndex!0 (size!5986 (buf!6479 (_2!11660 lt!388766))) (currentByte!11910 (_2!11660 lt!388766)) (currentBit!11905 (_2!11660 lt!388766))) lt!388770)))))

(assert (=> b!250191 (= lt!388770 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!250192 () Bool)

(assert (=> b!250192 (= e!173412 (not true))))

(declare-fun e!173414 () Bool)

(assert (=> b!250192 e!173414))

(declare-fun res!209427 () Bool)

(assert (=> b!250192 (=> (not res!209427) (not e!173414))))

(assert (=> b!250192 (= res!209427 (isPrefixOf!0 thiss!1005 (_2!11660 lt!388767)))))

(declare-fun lt!388763 () Unit!18108)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10894 BitStream!10894 BitStream!10894) Unit!18108)

(assert (=> b!250192 (= lt!388763 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11660 lt!388766) (_2!11660 lt!388767)))))

(assert (=> b!250192 e!173410))

(declare-fun res!209428 () Bool)

(assert (=> b!250192 (=> (not res!209428) (not e!173410))))

(assert (=> b!250192 (= res!209428 (= (size!5986 (buf!6479 (_2!11660 lt!388766))) (size!5986 (buf!6479 (_2!11660 lt!388767)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10894 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21470)

(assert (=> b!250192 (= lt!388767 (appendNBitsLoop!0 (_2!11660 lt!388766) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250192 (validate_offset_bits!1 ((_ sign_extend 32) (size!5986 (buf!6479 (_2!11660 lt!388766)))) ((_ sign_extend 32) (currentByte!11910 (_2!11660 lt!388766))) ((_ sign_extend 32) (currentBit!11905 (_2!11660 lt!388766))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388769 () Unit!18108)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10894 BitStream!10894 (_ BitVec 64) (_ BitVec 64)) Unit!18108)

(assert (=> b!250192 (= lt!388769 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11660 lt!388766) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!250192 e!173413))

(declare-fun res!209430 () Bool)

(assert (=> b!250192 (=> (not res!209430) (not e!173413))))

(assert (=> b!250192 (= res!209430 (= (size!5986 (buf!6479 thiss!1005)) (size!5986 (buf!6479 (_2!11660 lt!388766)))))))

(declare-fun appendBit!0 (BitStream!10894 Bool) tuple2!21470)

(assert (=> b!250192 (= lt!388766 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!250193 () Bool)

(declare-fun lt!388764 () tuple2!21468)

(declare-datatypes ((tuple2!21472 0))(
  ( (tuple2!21473 (_1!11661 BitStream!10894) (_2!11661 BitStream!10894)) )
))
(declare-fun lt!388761 () tuple2!21472)

(assert (=> b!250193 (= e!173416 (not (or (not (_2!11659 lt!388764)) (not (= (_1!11659 lt!388764) (_2!11661 lt!388761))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10894 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21468)

(assert (=> b!250193 (= lt!388764 (checkBitsLoopPure!0 (_1!11661 lt!388761) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250193 (validate_offset_bits!1 ((_ sign_extend 32) (size!5986 (buf!6479 (_2!11660 lt!388767)))) ((_ sign_extend 32) (currentByte!11910 (_2!11660 lt!388766))) ((_ sign_extend 32) (currentBit!11905 (_2!11660 lt!388766))) lt!388770)))

(declare-fun lt!388765 () Unit!18108)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10894 array!13645 (_ BitVec 64)) Unit!18108)

(assert (=> b!250193 (= lt!388765 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11660 lt!388766) (buf!6479 (_2!11660 lt!388767)) lt!388770))))

(declare-fun reader!0 (BitStream!10894 BitStream!10894) tuple2!21472)

(assert (=> b!250193 (= lt!388761 (reader!0 (_2!11660 lt!388766) (_2!11660 lt!388767)))))

(declare-fun res!209433 () Bool)

(assert (=> start!53736 (=> (not res!209433) (not e!173412))))

(assert (=> start!53736 (= res!209433 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53736 e!173412))

(assert (=> start!53736 true))

(declare-fun inv!12 (BitStream!10894) Bool)

(assert (=> start!53736 (and (inv!12 thiss!1005) e!173411)))

(declare-fun b!250194 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250194 (= e!173414 (invariant!0 (currentBit!11905 thiss!1005) (currentByte!11910 thiss!1005) (size!5986 (buf!6479 (_2!11660 lt!388766)))))))

(declare-fun b!250195 () Bool)

(assert (=> b!250195 (= e!173417 e!173415)))

(declare-fun res!209434 () Bool)

(assert (=> b!250195 (=> (not res!209434) (not e!173415))))

(assert (=> b!250195 (= res!209434 (and (= (_2!11659 lt!388760) bit!26) (= (_1!11659 lt!388760) (_2!11660 lt!388766))))))

(declare-fun readBitPure!0 (BitStream!10894) tuple2!21468)

(declare-fun readerFrom!0 (BitStream!10894 (_ BitVec 32) (_ BitVec 32)) BitStream!10894)

(assert (=> b!250195 (= lt!388760 (readBitPure!0 (readerFrom!0 (_2!11660 lt!388766) (currentBit!11905 thiss!1005) (currentByte!11910 thiss!1005))))))

(declare-fun b!250196 () Bool)

(declare-fun res!209435 () Bool)

(assert (=> b!250196 (=> (not res!209435) (not e!173416))))

(assert (=> b!250196 (= res!209435 (isPrefixOf!0 (_2!11660 lt!388766) (_2!11660 lt!388767)))))

(assert (= (and start!53736 res!209433) b!250186))

(assert (= (and b!250186 res!209431) b!250188))

(assert (= (and b!250188 res!209429) b!250192))

(assert (= (and b!250192 res!209430) b!250189))

(assert (= (and b!250189 res!209436) b!250187))

(assert (= (and b!250187 res!209432) b!250195))

(assert (= (and b!250195 res!209434) b!250185))

(assert (= (and b!250192 res!209428) b!250191))

(assert (= (and b!250191 res!209426) b!250196))

(assert (= (and b!250196 res!209435) b!250193))

(assert (= (and b!250192 res!209427) b!250194))

(assert (= start!53736 b!250190))

(declare-fun m!376611 () Bool)

(assert (=> b!250192 m!376611))

(declare-fun m!376613 () Bool)

(assert (=> b!250192 m!376613))

(declare-fun m!376615 () Bool)

(assert (=> b!250192 m!376615))

(declare-fun m!376617 () Bool)

(assert (=> b!250192 m!376617))

(declare-fun m!376619 () Bool)

(assert (=> b!250192 m!376619))

(declare-fun m!376621 () Bool)

(assert (=> b!250192 m!376621))

(declare-fun m!376623 () Bool)

(assert (=> b!250189 m!376623))

(declare-fun m!376625 () Bool)

(assert (=> b!250189 m!376625))

(declare-fun m!376627 () Bool)

(assert (=> b!250195 m!376627))

(assert (=> b!250195 m!376627))

(declare-fun m!376629 () Bool)

(assert (=> b!250195 m!376629))

(declare-fun m!376631 () Bool)

(assert (=> b!250190 m!376631))

(declare-fun m!376633 () Bool)

(assert (=> b!250191 m!376633))

(assert (=> b!250191 m!376623))

(declare-fun m!376635 () Bool)

(assert (=> b!250196 m!376635))

(declare-fun m!376637 () Bool)

(assert (=> b!250185 m!376637))

(declare-fun m!376639 () Bool)

(assert (=> b!250194 m!376639))

(declare-fun m!376641 () Bool)

(assert (=> start!53736 m!376641))

(declare-fun m!376643 () Bool)

(assert (=> b!250193 m!376643))

(declare-fun m!376645 () Bool)

(assert (=> b!250193 m!376645))

(declare-fun m!376647 () Bool)

(assert (=> b!250193 m!376647))

(declare-fun m!376649 () Bool)

(assert (=> b!250193 m!376649))

(declare-fun m!376651 () Bool)

(assert (=> b!250186 m!376651))

(declare-fun m!376653 () Bool)

(assert (=> b!250187 m!376653))

(push 1)

(assert (not b!250191))

(assert (not b!250187))

(assert (not b!250186))

(assert (not b!250193))

(assert (not b!250190))

(assert (not b!250192))

(assert (not b!250195))

(assert (not b!250185))

(assert (not b!250196))

(assert (not b!250194))

(assert (not start!53736))

(assert (not b!250189))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

