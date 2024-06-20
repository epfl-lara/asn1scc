; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6932 () Bool)

(assert start!6932)

(declare-fun b!33610 () Bool)

(declare-fun res!28808 () Bool)

(declare-fun e!22311 () Bool)

(assert (=> b!33610 (=> res!28808 e!22311)))

(declare-datatypes ((array!1868 0))(
  ( (array!1869 (arr!1301 (Array (_ BitVec 32) (_ BitVec 8))) (size!826 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1444 0))(
  ( (BitStream!1445 (buf!1154 array!1868) (currentByte!2521 (_ BitVec 32)) (currentBit!2516 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2507 0))(
  ( (Unit!2508) )
))
(declare-datatypes ((tuple2!3418 0))(
  ( (tuple2!3419 (_1!1796 Unit!2507) (_2!1796 BitStream!1444)) )
))
(declare-fun lt!49342 () tuple2!3418)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!33610 (= res!28808 (not (invariant!0 (currentBit!2516 (_2!1796 lt!49342)) (currentByte!2521 (_2!1796 lt!49342)) (size!826 (buf!1154 (_2!1796 lt!49342))))))))

(declare-fun b!33611 () Bool)

(declare-fun e!22313 () Bool)

(assert (=> b!33611 (= e!22311 e!22313)))

(declare-fun res!28818 () Bool)

(assert (=> b!33611 (=> res!28818 e!22313)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!33611 (= res!28818 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!49333 () tuple2!3418)

(declare-datatypes ((tuple2!3420 0))(
  ( (tuple2!3421 (_1!1797 BitStream!1444) (_2!1797 BitStream!1444)) )
))
(declare-fun lt!49334 () tuple2!3420)

(declare-fun lt!49337 () (_ BitVec 64))

(declare-datatypes ((List!423 0))(
  ( (Nil!420) (Cons!419 (h!538 Bool) (t!1173 List!423)) )
))
(declare-fun lt!49346 () List!423)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1444 BitStream!1444 (_ BitVec 64)) List!423)

(assert (=> b!33611 (= lt!49346 (bitStreamReadBitsIntoList!0 (_2!1796 lt!49333) (_1!1797 lt!49334) lt!49337))))

(declare-fun lt!49335 () tuple2!3420)

(declare-fun lt!49338 () List!423)

(assert (=> b!33611 (= lt!49338 (bitStreamReadBitsIntoList!0 (_2!1796 lt!49333) (_1!1797 lt!49335) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33611 (validate_offset_bits!1 ((_ sign_extend 32) (size!826 (buf!1154 (_2!1796 lt!49333)))) ((_ sign_extend 32) (currentByte!2521 (_2!1796 lt!49342))) ((_ sign_extend 32) (currentBit!2516 (_2!1796 lt!49342))) lt!49337)))

(declare-fun lt!49343 () Unit!2507)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1444 array!1868 (_ BitVec 64)) Unit!2507)

(assert (=> b!33611 (= lt!49343 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1796 lt!49342) (buf!1154 (_2!1796 lt!49333)) lt!49337))))

(declare-fun reader!0 (BitStream!1444 BitStream!1444) tuple2!3420)

(assert (=> b!33611 (= lt!49334 (reader!0 (_2!1796 lt!49342) (_2!1796 lt!49333)))))

(declare-fun thiss!1379 () BitStream!1444)

(assert (=> b!33611 (validate_offset_bits!1 ((_ sign_extend 32) (size!826 (buf!1154 (_2!1796 lt!49333)))) ((_ sign_extend 32) (currentByte!2521 thiss!1379)) ((_ sign_extend 32) (currentBit!2516 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!49348 () Unit!2507)

(assert (=> b!33611 (= lt!49348 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1154 (_2!1796 lt!49333)) (bvsub to!314 i!635)))))

(assert (=> b!33611 (= lt!49335 (reader!0 thiss!1379 (_2!1796 lt!49333)))))

(declare-fun e!22319 () Bool)

(declare-fun lt!49347 () (_ BitVec 64))

(declare-fun b!33612 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!33612 (= e!22319 (= lt!49347 (bvsub (bvsub (bvadd (bitIndex!0 (size!826 (buf!1154 (_2!1796 lt!49342))) (currentByte!2521 (_2!1796 lt!49342)) (currentBit!2516 (_2!1796 lt!49342))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!33613 () Bool)

(declare-fun e!22320 () Bool)

(declare-fun e!22318 () Bool)

(assert (=> b!33613 (= e!22320 (not e!22318))))

(declare-fun res!28805 () Bool)

(assert (=> b!33613 (=> res!28805 e!22318)))

(assert (=> b!33613 (= res!28805 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1444 BitStream!1444) Bool)

(assert (=> b!33613 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!49336 () Unit!2507)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1444) Unit!2507)

(assert (=> b!33613 (= lt!49336 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!49339 () (_ BitVec 64))

(assert (=> b!33613 (= lt!49339 (bitIndex!0 (size!826 (buf!1154 thiss!1379)) (currentByte!2521 thiss!1379) (currentBit!2516 thiss!1379)))))

(declare-fun b!33614 () Bool)

(declare-fun res!28804 () Bool)

(assert (=> b!33614 (=> (not res!28804) (not e!22320))))

(assert (=> b!33614 (= res!28804 (validate_offset_bits!1 ((_ sign_extend 32) (size!826 (buf!1154 thiss!1379))) ((_ sign_extend 32) (currentByte!2521 thiss!1379)) ((_ sign_extend 32) (currentBit!2516 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!33615 () Bool)

(declare-fun res!28813 () Bool)

(declare-fun e!22310 () Bool)

(assert (=> b!33615 (=> res!28813 e!22310)))

(assert (=> b!33615 (= res!28813 (not (= (size!826 (buf!1154 thiss!1379)) (size!826 (buf!1154 (_2!1796 lt!49333))))))))

(declare-fun res!28816 () Bool)

(assert (=> start!6932 (=> (not res!28816) (not e!22320))))

(declare-fun srcBuffer!2 () array!1868)

(assert (=> start!6932 (= res!28816 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!826 srcBuffer!2))))))))

(assert (=> start!6932 e!22320))

(assert (=> start!6932 true))

(declare-fun array_inv!775 (array!1868) Bool)

(assert (=> start!6932 (array_inv!775 srcBuffer!2)))

(declare-fun e!22312 () Bool)

(declare-fun inv!12 (BitStream!1444) Bool)

(assert (=> start!6932 (and (inv!12 thiss!1379) e!22312)))

(declare-fun b!33616 () Bool)

(assert (=> b!33616 (= e!22312 (array_inv!775 (buf!1154 thiss!1379)))))

(declare-fun b!33617 () Bool)

(declare-fun e!22315 () Bool)

(assert (=> b!33617 (= e!22318 e!22315)))

(declare-fun res!28810 () Bool)

(assert (=> b!33617 (=> res!28810 e!22315)))

(assert (=> b!33617 (= res!28810 (not (isPrefixOf!0 thiss!1379 (_2!1796 lt!49342))))))

(assert (=> b!33617 (validate_offset_bits!1 ((_ sign_extend 32) (size!826 (buf!1154 (_2!1796 lt!49342)))) ((_ sign_extend 32) (currentByte!2521 (_2!1796 lt!49342))) ((_ sign_extend 32) (currentBit!2516 (_2!1796 lt!49342))) lt!49337)))

(assert (=> b!33617 (= lt!49337 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49344 () Unit!2507)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1444 BitStream!1444 (_ BitVec 64) (_ BitVec 64)) Unit!2507)

(assert (=> b!33617 (= lt!49344 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1796 lt!49342) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1444 (_ BitVec 8) (_ BitVec 32)) tuple2!3418)

(assert (=> b!33617 (= lt!49342 (appendBitFromByte!0 thiss!1379 (select (arr!1301 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!33618 () Bool)

(declare-fun e!22317 () Bool)

(assert (=> b!33618 (= e!22317 e!22310)))

(declare-fun res!28814 () Bool)

(assert (=> b!33618 (=> res!28814 e!22310)))

(assert (=> b!33618 (= res!28814 (not (= lt!49347 (bvsub (bvadd lt!49339 to!314) i!635))))))

(assert (=> b!33618 (= lt!49347 (bitIndex!0 (size!826 (buf!1154 (_2!1796 lt!49333))) (currentByte!2521 (_2!1796 lt!49333)) (currentBit!2516 (_2!1796 lt!49333))))))

(declare-fun b!33619 () Bool)

(declare-fun res!28817 () Bool)

(assert (=> b!33619 (=> res!28817 e!22310)))

(assert (=> b!33619 (= res!28817 (not (invariant!0 (currentBit!2516 (_2!1796 lt!49333)) (currentByte!2521 (_2!1796 lt!49333)) (size!826 (buf!1154 (_2!1796 lt!49333))))))))

(declare-fun b!33620 () Bool)

(assert (=> b!33620 (= e!22313 true)))

(declare-fun tail!140 (List!423) List!423)

(assert (=> b!33620 (= lt!49346 (tail!140 lt!49338))))

(declare-fun lt!49332 () Unit!2507)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1444 BitStream!1444 BitStream!1444 BitStream!1444 (_ BitVec 64) List!423) Unit!2507)

(assert (=> b!33620 (= lt!49332 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1796 lt!49333) (_2!1796 lt!49333) (_1!1797 lt!49335) (_1!1797 lt!49334) (bvsub to!314 i!635) lt!49338))))

(declare-fun b!33621 () Bool)

(declare-fun res!28807 () Bool)

(assert (=> b!33621 (=> res!28807 e!22311)))

(assert (=> b!33621 (= res!28807 (not (invariant!0 (currentBit!2516 (_2!1796 lt!49342)) (currentByte!2521 (_2!1796 lt!49342)) (size!826 (buf!1154 (_2!1796 lt!49333))))))))

(declare-fun b!33622 () Bool)

(assert (=> b!33622 (= e!22315 e!22317)))

(declare-fun res!28811 () Bool)

(assert (=> b!33622 (=> res!28811 e!22317)))

(assert (=> b!33622 (= res!28811 (not (isPrefixOf!0 (_2!1796 lt!49342) (_2!1796 lt!49333))))))

(assert (=> b!33622 (isPrefixOf!0 thiss!1379 (_2!1796 lt!49333))))

(declare-fun lt!49345 () Unit!2507)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1444 BitStream!1444 BitStream!1444) Unit!2507)

(assert (=> b!33622 (= lt!49345 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1796 lt!49342) (_2!1796 lt!49333)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1444 array!1868 (_ BitVec 64) (_ BitVec 64)) tuple2!3418)

(assert (=> b!33622 (= lt!49333 (appendBitsMSBFirstLoop!0 (_2!1796 lt!49342) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!22314 () Bool)

(assert (=> b!33622 e!22314))

(declare-fun res!28806 () Bool)

(assert (=> b!33622 (=> (not res!28806) (not e!22314))))

(assert (=> b!33622 (= res!28806 (validate_offset_bits!1 ((_ sign_extend 32) (size!826 (buf!1154 (_2!1796 lt!49342)))) ((_ sign_extend 32) (currentByte!2521 thiss!1379)) ((_ sign_extend 32) (currentBit!2516 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49341 () Unit!2507)

(assert (=> b!33622 (= lt!49341 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1154 (_2!1796 lt!49342)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49340 () tuple2!3420)

(assert (=> b!33622 (= lt!49340 (reader!0 thiss!1379 (_2!1796 lt!49342)))))

(declare-fun b!33623 () Bool)

(declare-fun head!260 (List!423) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1444 array!1868 (_ BitVec 64) (_ BitVec 64)) List!423)

(assert (=> b!33623 (= e!22314 (= (head!260 (byteArrayBitContentToList!0 (_2!1796 lt!49342) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!260 (bitStreamReadBitsIntoList!0 (_2!1796 lt!49342) (_1!1797 lt!49340) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!33624 () Bool)

(assert (=> b!33624 (= e!22310 e!22311)))

(declare-fun res!28809 () Bool)

(assert (=> b!33624 (=> res!28809 e!22311)))

(assert (=> b!33624 (= res!28809 (not (= (size!826 (buf!1154 (_2!1796 lt!49342))) (size!826 (buf!1154 (_2!1796 lt!49333))))))))

(assert (=> b!33624 e!22319))

(declare-fun res!28815 () Bool)

(assert (=> b!33624 (=> (not res!28815) (not e!22319))))

(assert (=> b!33624 (= res!28815 (= (size!826 (buf!1154 (_2!1796 lt!49333))) (size!826 (buf!1154 thiss!1379))))))

(declare-fun b!33625 () Bool)

(declare-fun res!28812 () Bool)

(assert (=> b!33625 (=> res!28812 e!22313)))

(declare-fun length!149 (List!423) Int)

(assert (=> b!33625 (= res!28812 (<= (length!149 lt!49338) 0))))

(assert (= (and start!6932 res!28816) b!33614))

(assert (= (and b!33614 res!28804) b!33613))

(assert (= (and b!33613 (not res!28805)) b!33617))

(assert (= (and b!33617 (not res!28810)) b!33622))

(assert (= (and b!33622 res!28806) b!33623))

(assert (= (and b!33622 (not res!28811)) b!33618))

(assert (= (and b!33618 (not res!28814)) b!33619))

(assert (= (and b!33619 (not res!28817)) b!33615))

(assert (= (and b!33615 (not res!28813)) b!33624))

(assert (= (and b!33624 res!28815) b!33612))

(assert (= (and b!33624 (not res!28809)) b!33610))

(assert (= (and b!33610 (not res!28808)) b!33621))

(assert (= (and b!33621 (not res!28807)) b!33611))

(assert (= (and b!33611 (not res!28818)) b!33625))

(assert (= (and b!33625 (not res!28812)) b!33620))

(assert (= start!6932 b!33616))

(declare-fun m!49875 () Bool)

(assert (=> start!6932 m!49875))

(declare-fun m!49877 () Bool)

(assert (=> start!6932 m!49877))

(declare-fun m!49879 () Bool)

(assert (=> b!33625 m!49879))

(declare-fun m!49881 () Bool)

(assert (=> b!33620 m!49881))

(declare-fun m!49883 () Bool)

(assert (=> b!33620 m!49883))

(declare-fun m!49885 () Bool)

(assert (=> b!33613 m!49885))

(declare-fun m!49887 () Bool)

(assert (=> b!33613 m!49887))

(declare-fun m!49889 () Bool)

(assert (=> b!33613 m!49889))

(declare-fun m!49891 () Bool)

(assert (=> b!33619 m!49891))

(declare-fun m!49893 () Bool)

(assert (=> b!33614 m!49893))

(declare-fun m!49895 () Bool)

(assert (=> b!33621 m!49895))

(declare-fun m!49897 () Bool)

(assert (=> b!33616 m!49897))

(declare-fun m!49899 () Bool)

(assert (=> b!33617 m!49899))

(declare-fun m!49901 () Bool)

(assert (=> b!33617 m!49901))

(assert (=> b!33617 m!49899))

(declare-fun m!49903 () Bool)

(assert (=> b!33617 m!49903))

(declare-fun m!49905 () Bool)

(assert (=> b!33617 m!49905))

(declare-fun m!49907 () Bool)

(assert (=> b!33617 m!49907))

(declare-fun m!49909 () Bool)

(assert (=> b!33611 m!49909))

(declare-fun m!49911 () Bool)

(assert (=> b!33611 m!49911))

(declare-fun m!49913 () Bool)

(assert (=> b!33611 m!49913))

(declare-fun m!49915 () Bool)

(assert (=> b!33611 m!49915))

(declare-fun m!49917 () Bool)

(assert (=> b!33611 m!49917))

(declare-fun m!49919 () Bool)

(assert (=> b!33611 m!49919))

(declare-fun m!49921 () Bool)

(assert (=> b!33611 m!49921))

(declare-fun m!49923 () Bool)

(assert (=> b!33611 m!49923))

(declare-fun m!49925 () Bool)

(assert (=> b!33623 m!49925))

(assert (=> b!33623 m!49925))

(declare-fun m!49927 () Bool)

(assert (=> b!33623 m!49927))

(declare-fun m!49929 () Bool)

(assert (=> b!33623 m!49929))

(assert (=> b!33623 m!49929))

(declare-fun m!49931 () Bool)

(assert (=> b!33623 m!49931))

(declare-fun m!49933 () Bool)

(assert (=> b!33618 m!49933))

(declare-fun m!49935 () Bool)

(assert (=> b!33622 m!49935))

(declare-fun m!49937 () Bool)

(assert (=> b!33622 m!49937))

(declare-fun m!49939 () Bool)

(assert (=> b!33622 m!49939))

(declare-fun m!49941 () Bool)

(assert (=> b!33622 m!49941))

(declare-fun m!49943 () Bool)

(assert (=> b!33622 m!49943))

(declare-fun m!49945 () Bool)

(assert (=> b!33622 m!49945))

(declare-fun m!49947 () Bool)

(assert (=> b!33622 m!49947))

(declare-fun m!49949 () Bool)

(assert (=> b!33612 m!49949))

(declare-fun m!49951 () Bool)

(assert (=> b!33610 m!49951))

(push 1)

(assert (not b!33617))

(assert (not b!33618))

(assert (not b!33611))

(assert (not b!33625))

(assert (not b!33619))

(assert (not start!6932))

(assert (not b!33620))

(assert (not b!33614))

(assert (not b!33612))

(assert (not b!33616))

(assert (not b!33623))

(assert (not b!33621))

(assert (not b!33610))

(assert (not b!33613))

(assert (not b!33622))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

