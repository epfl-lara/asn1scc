; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5174 () Bool)

(assert start!5174)

(declare-fun b!20897 () Bool)

(declare-fun e!14250 () Bool)

(declare-fun e!14246 () Bool)

(assert (=> b!20897 (= e!14250 e!14246)))

(declare-fun res!18142 () Bool)

(assert (=> b!20897 (=> res!18142 e!14246)))

(declare-datatypes ((array!1509 0))(
  ( (array!1510 (arr!1089 (Array (_ BitVec 32) (_ BitVec 8))) (size!645 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1124 0))(
  ( (BitStream!1125 (buf!954 array!1509) (currentByte!2243 (_ BitVec 32)) (currentBit!2238 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1843 0))(
  ( (Unit!1844) )
))
(declare-datatypes ((tuple2!2488 0))(
  ( (tuple2!2489 (_1!1329 Unit!1843) (_2!1329 BitStream!1124)) )
))
(declare-fun lt!29618 () tuple2!2488)

(declare-fun lt!29622 () tuple2!2488)

(declare-fun isPrefixOf!0 (BitStream!1124 BitStream!1124) Bool)

(assert (=> b!20897 (= res!18142 (not (isPrefixOf!0 (_2!1329 lt!29618) (_2!1329 lt!29622))))))

(declare-fun thiss!1379 () BitStream!1124)

(assert (=> b!20897 (isPrefixOf!0 thiss!1379 (_2!1329 lt!29622))))

(declare-fun lt!29617 () Unit!1843)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1124 BitStream!1124 BitStream!1124) Unit!1843)

(assert (=> b!20897 (= lt!29617 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1329 lt!29618) (_2!1329 lt!29622)))))

(declare-fun srcBuffer!2 () array!1509)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1124 array!1509 (_ BitVec 64) (_ BitVec 64)) tuple2!2488)

(assert (=> b!20897 (= lt!29622 (appendBitsMSBFirstLoop!0 (_2!1329 lt!29618) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!14248 () Bool)

(assert (=> b!20897 e!14248))

(declare-fun res!18139 () Bool)

(assert (=> b!20897 (=> (not res!18139) (not e!14248))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20897 (= res!18139 (validate_offset_bits!1 ((_ sign_extend 32) (size!645 (buf!954 (_2!1329 lt!29618)))) ((_ sign_extend 32) (currentByte!2243 thiss!1379)) ((_ sign_extend 32) (currentBit!2238 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29616 () Unit!1843)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1124 array!1509 (_ BitVec 64)) Unit!1843)

(assert (=> b!20897 (= lt!29616 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!954 (_2!1329 lt!29618)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2490 0))(
  ( (tuple2!2491 (_1!1330 BitStream!1124) (_2!1330 BitStream!1124)) )
))
(declare-fun lt!29623 () tuple2!2490)

(declare-fun reader!0 (BitStream!1124 BitStream!1124) tuple2!2490)

(assert (=> b!20897 (= lt!29623 (reader!0 thiss!1379 (_2!1329 lt!29618)))))

(declare-fun b!20898 () Bool)

(declare-fun e!14249 () Bool)

(declare-fun e!14251 () Bool)

(assert (=> b!20898 (= e!14249 (not e!14251))))

(declare-fun res!18143 () Bool)

(assert (=> b!20898 (=> res!18143 e!14251)))

(assert (=> b!20898 (= res!18143 (bvsge i!635 to!314))))

(assert (=> b!20898 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29620 () Unit!1843)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1124) Unit!1843)

(assert (=> b!20898 (= lt!29620 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29619 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20898 (= lt!29619 (bitIndex!0 (size!645 (buf!954 thiss!1379)) (currentByte!2243 thiss!1379) (currentBit!2238 thiss!1379)))))

(declare-fun res!18138 () Bool)

(assert (=> start!5174 (=> (not res!18138) (not e!14249))))

(assert (=> start!5174 (= res!18138 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!645 srcBuffer!2))))))))

(assert (=> start!5174 e!14249))

(assert (=> start!5174 true))

(declare-fun array_inv!615 (array!1509) Bool)

(assert (=> start!5174 (array_inv!615 srcBuffer!2)))

(declare-fun e!14253 () Bool)

(declare-fun inv!12 (BitStream!1124) Bool)

(assert (=> start!5174 (and (inv!12 thiss!1379) e!14253)))

(declare-fun b!20899 () Bool)

(assert (=> b!20899 (= e!14251 e!14250)))

(declare-fun res!18141 () Bool)

(assert (=> b!20899 (=> res!18141 e!14250)))

(assert (=> b!20899 (= res!18141 (not (isPrefixOf!0 thiss!1379 (_2!1329 lt!29618))))))

(assert (=> b!20899 (validate_offset_bits!1 ((_ sign_extend 32) (size!645 (buf!954 (_2!1329 lt!29618)))) ((_ sign_extend 32) (currentByte!2243 (_2!1329 lt!29618))) ((_ sign_extend 32) (currentBit!2238 (_2!1329 lt!29618))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29621 () Unit!1843)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1124 BitStream!1124 (_ BitVec 64) (_ BitVec 64)) Unit!1843)

(assert (=> b!20899 (= lt!29621 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1329 lt!29618) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1124 (_ BitVec 8) (_ BitVec 32)) tuple2!2488)

(assert (=> b!20899 (= lt!29618 (appendBitFromByte!0 thiss!1379 (select (arr!1089 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20900 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!20900 (= e!14246 (invariant!0 (currentBit!2238 (_2!1329 lt!29622)) (currentByte!2243 (_2!1329 lt!29622)) (size!645 (buf!954 (_2!1329 lt!29622)))))))

(declare-fun b!20901 () Bool)

(assert (=> b!20901 (= e!14253 (array_inv!615 (buf!954 thiss!1379)))))

(declare-fun b!20902 () Bool)

(declare-fun res!18140 () Bool)

(assert (=> b!20902 (=> (not res!18140) (not e!14249))))

(assert (=> b!20902 (= res!18140 (validate_offset_bits!1 ((_ sign_extend 32) (size!645 (buf!954 thiss!1379))) ((_ sign_extend 32) (currentByte!2243 thiss!1379)) ((_ sign_extend 32) (currentBit!2238 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20903 () Bool)

(declare-datatypes ((List!263 0))(
  ( (Nil!260) (Cons!259 (h!378 Bool) (t!1013 List!263)) )
))
(declare-fun head!100 (List!263) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1124 array!1509 (_ BitVec 64) (_ BitVec 64)) List!263)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1124 BitStream!1124 (_ BitVec 64)) List!263)

(assert (=> b!20903 (= e!14248 (= (head!100 (byteArrayBitContentToList!0 (_2!1329 lt!29618) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!100 (bitStreamReadBitsIntoList!0 (_2!1329 lt!29618) (_1!1330 lt!29623) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!5174 res!18138) b!20902))

(assert (= (and b!20902 res!18140) b!20898))

(assert (= (and b!20898 (not res!18143)) b!20899))

(assert (= (and b!20899 (not res!18141)) b!20897))

(assert (= (and b!20897 res!18139) b!20903))

(assert (= (and b!20897 (not res!18142)) b!20900))

(assert (= start!5174 b!20901))

(declare-fun m!28701 () Bool)

(assert (=> b!20901 m!28701))

(declare-fun m!28703 () Bool)

(assert (=> b!20902 m!28703))

(declare-fun m!28705 () Bool)

(assert (=> b!20900 m!28705))

(declare-fun m!28707 () Bool)

(assert (=> b!20899 m!28707))

(declare-fun m!28709 () Bool)

(assert (=> b!20899 m!28709))

(declare-fun m!28711 () Bool)

(assert (=> b!20899 m!28711))

(assert (=> b!20899 m!28711))

(declare-fun m!28713 () Bool)

(assert (=> b!20899 m!28713))

(declare-fun m!28715 () Bool)

(assert (=> b!20899 m!28715))

(declare-fun m!28717 () Bool)

(assert (=> start!5174 m!28717))

(declare-fun m!28719 () Bool)

(assert (=> start!5174 m!28719))

(declare-fun m!28721 () Bool)

(assert (=> b!20903 m!28721))

(assert (=> b!20903 m!28721))

(declare-fun m!28723 () Bool)

(assert (=> b!20903 m!28723))

(declare-fun m!28725 () Bool)

(assert (=> b!20903 m!28725))

(assert (=> b!20903 m!28725))

(declare-fun m!28727 () Bool)

(assert (=> b!20903 m!28727))

(declare-fun m!28729 () Bool)

(assert (=> b!20898 m!28729))

(declare-fun m!28731 () Bool)

(assert (=> b!20898 m!28731))

(declare-fun m!28733 () Bool)

(assert (=> b!20898 m!28733))

(declare-fun m!28735 () Bool)

(assert (=> b!20897 m!28735))

(declare-fun m!28737 () Bool)

(assert (=> b!20897 m!28737))

(declare-fun m!28739 () Bool)

(assert (=> b!20897 m!28739))

(declare-fun m!28741 () Bool)

(assert (=> b!20897 m!28741))

(declare-fun m!28743 () Bool)

(assert (=> b!20897 m!28743))

(declare-fun m!28745 () Bool)

(assert (=> b!20897 m!28745))

(declare-fun m!28747 () Bool)

(assert (=> b!20897 m!28747))

(push 1)

(assert (not b!20902))

(assert (not b!20897))

(assert (not b!20899))

(assert (not start!5174))

(assert (not b!20900))

(assert (not b!20898))

(assert (not b!20903))

(assert (not b!20901))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6666 () Bool)

(declare-fun res!18163 () Bool)

(declare-fun e!14276 () Bool)

(assert (=> d!6666 (=> (not res!18163) (not e!14276))))

(assert (=> d!6666 (= res!18163 (= (size!645 (buf!954 thiss!1379)) (size!645 (buf!954 thiss!1379))))))

(assert (=> d!6666 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!14276)))

(declare-fun b!20940 () Bool)

(declare-fun res!18162 () Bool)

(assert (=> b!20940 (=> (not res!18162) (not e!14276))))

(assert (=> b!20940 (= res!18162 (bvsle (bitIndex!0 (size!645 (buf!954 thiss!1379)) (currentByte!2243 thiss!1379) (currentBit!2238 thiss!1379)) (bitIndex!0 (size!645 (buf!954 thiss!1379)) (currentByte!2243 thiss!1379) (currentBit!2238 thiss!1379))))))

(declare-fun b!20941 () Bool)

(declare-fun e!14275 () Bool)

(assert (=> b!20941 (= e!14276 e!14275)))

(declare-fun res!18164 () Bool)

(assert (=> b!20941 (=> res!18164 e!14275)))

(assert (=> b!20941 (= res!18164 (= (size!645 (buf!954 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!20942 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1509 array!1509 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20942 (= e!14275 (arrayBitRangesEq!0 (buf!954 thiss!1379) (buf!954 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!645 (buf!954 thiss!1379)) (currentByte!2243 thiss!1379) (currentBit!2238 thiss!1379))))))

(assert (= (and d!6666 res!18163) b!20940))

(assert (= (and b!20940 res!18162) b!20941))

(assert (= (and b!20941 (not res!18164)) b!20942))

(assert (=> b!20940 m!28733))

(assert (=> b!20940 m!28733))

(assert (=> b!20942 m!28733))

(assert (=> b!20942 m!28733))

(declare-fun m!28777 () Bool)

(assert (=> b!20942 m!28777))

(assert (=> b!20898 d!6666))

(declare-fun d!6676 () Bool)

(assert (=> d!6676 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29641 () Unit!1843)

(declare-fun choose!11 (BitStream!1124) Unit!1843)

(assert (=> d!6676 (= lt!29641 (choose!11 thiss!1379))))

(assert (=> d!6676 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!29641)))

(declare-fun bs!1978 () Bool)

(assert (= bs!1978 d!6676))

(assert (=> bs!1978 m!28729))

(declare-fun m!28779 () Bool)

(assert (=> bs!1978 m!28779))

(assert (=> b!20898 d!6676))

(declare-fun d!6678 () Bool)

(declare-fun e!14288 () Bool)

(assert (=> d!6678 e!14288))

(declare-fun res!18182 () Bool)

(assert (=> d!6678 (=> (not res!18182) (not e!14288))))

(declare-fun lt!29660 () (_ BitVec 64))

(declare-fun lt!29658 () (_ BitVec 64))

(declare-fun lt!29657 () (_ BitVec 64))

(assert (=> d!6678 (= res!18182 (= lt!29657 (bvsub lt!29660 lt!29658)))))

(assert (=> d!6678 (or (= (bvand lt!29660 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!29658 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!29660 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!29660 lt!29658) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6678 (= lt!29658 (remainingBits!0 ((_ sign_extend 32) (size!645 (buf!954 thiss!1379))) ((_ sign_extend 32) (currentByte!2243 thiss!1379)) ((_ sign_extend 32) (currentBit!2238 thiss!1379))))))

(declare-fun lt!29659 () (_ BitVec 64))

(declare-fun lt!29661 () (_ BitVec 64))

(assert (=> d!6678 (= lt!29660 (bvmul lt!29659 lt!29661))))

(assert (=> d!6678 (or (= lt!29659 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!29661 (bvsdiv (bvmul lt!29659 lt!29661) lt!29659)))))

(assert (=> d!6678 (= lt!29661 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6678 (= lt!29659 ((_ sign_extend 32) (size!645 (buf!954 thiss!1379))))))

(assert (=> d!6678 (= lt!29657 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2243 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2238 thiss!1379))))))

(assert (=> d!6678 (invariant!0 (currentBit!2238 thiss!1379) (currentByte!2243 thiss!1379) (size!645 (buf!954 thiss!1379)))))

(assert (=> d!6678 (= (bitIndex!0 (size!645 (buf!954 thiss!1379)) (currentByte!2243 thiss!1379) (currentBit!2238 thiss!1379)) lt!29657)))

(declare-fun b!20959 () Bool)

(declare-fun res!18181 () Bool)

(assert (=> b!20959 (=> (not res!18181) (not e!14288))))

(assert (=> b!20959 (= res!18181 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!29657))))

(declare-fun b!20960 () Bool)

(declare-fun lt!29662 () (_ BitVec 64))

(assert (=> b!20960 (= e!14288 (bvsle lt!29657 (bvmul lt!29662 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!20960 (or (= lt!29662 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!29662 #b0000000000000000000000000000000000000000000000000000000000001000) lt!29662)))))

(assert (=> b!20960 (= lt!29662 ((_ sign_extend 32) (size!645 (buf!954 thiss!1379))))))

(assert (= (and d!6678 res!18182) b!20959))

(assert (= (and b!20959 res!18181) b!20960))

(declare-fun m!28789 () Bool)

(assert (=> d!6678 m!28789))

(declare-fun m!28791 () Bool)

(assert (=> d!6678 m!28791))

(assert (=> b!20898 d!6678))

(declare-fun d!6686 () Bool)

(declare-fun res!18184 () Bool)

(declare-fun e!14290 () Bool)

(assert (=> d!6686 (=> (not res!18184) (not e!14290))))

(assert (=> d!6686 (= res!18184 (= (size!645 (buf!954 thiss!1379)) (size!645 (buf!954 (_2!1329 lt!29618)))))))

(assert (=> d!6686 (= (isPrefixOf!0 thiss!1379 (_2!1329 lt!29618)) e!14290)))

(declare-fun b!20961 () Bool)

(declare-fun res!18183 () Bool)

(assert (=> b!20961 (=> (not res!18183) (not e!14290))))

(assert (=> b!20961 (= res!18183 (bvsle (bitIndex!0 (size!645 (buf!954 thiss!1379)) (currentByte!2243 thiss!1379) (currentBit!2238 thiss!1379)) (bitIndex!0 (size!645 (buf!954 (_2!1329 lt!29618))) (currentByte!2243 (_2!1329 lt!29618)) (currentBit!2238 (_2!1329 lt!29618)))))))

(declare-fun b!20962 () Bool)

(declare-fun e!14289 () Bool)

(assert (=> b!20962 (= e!14290 e!14289)))

(declare-fun res!18185 () Bool)

(assert (=> b!20962 (=> res!18185 e!14289)))

(assert (=> b!20962 (= res!18185 (= (size!645 (buf!954 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!20963 () Bool)

(assert (=> b!20963 (= e!14289 (arrayBitRangesEq!0 (buf!954 thiss!1379) (buf!954 (_2!1329 lt!29618)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!645 (buf!954 thiss!1379)) (currentByte!2243 thiss!1379) (currentBit!2238 thiss!1379))))))

(assert (= (and d!6686 res!18184) b!20961))

(assert (= (and b!20961 res!18183) b!20962))

(assert (= (and b!20962 (not res!18185)) b!20963))

(assert (=> b!20961 m!28733))

(declare-fun m!28793 () Bool)

(assert (=> b!20961 m!28793))

(assert (=> b!20963 m!28733))

(assert (=> b!20963 m!28733))

(declare-fun m!28795 () Bool)

(assert (=> b!20963 m!28795))

(assert (=> b!20899 d!6686))

(declare-fun d!6688 () Bool)

(assert (=> d!6688 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!645 (buf!954 (_2!1329 lt!29618)))) ((_ sign_extend 32) (currentByte!2243 (_2!1329 lt!29618))) ((_ sign_extend 32) (currentBit!2238 (_2!1329 lt!29618))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!645 (buf!954 (_2!1329 lt!29618)))) ((_ sign_extend 32) (currentByte!2243 (_2!1329 lt!29618))) ((_ sign_extend 32) (currentBit!2238 (_2!1329 lt!29618)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!1980 () Bool)

(assert (= bs!1980 d!6688))

(declare-fun m!28797 () Bool)

(assert (=> bs!1980 m!28797))

(assert (=> b!20899 d!6688))

(declare-fun d!6690 () Bool)

(declare-fun e!14293 () Bool)

(assert (=> d!6690 e!14293))

(declare-fun res!18188 () Bool)

(assert (=> d!6690 (=> (not res!18188) (not e!14293))))

(assert (=> d!6690 (= res!18188 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!29665 () Unit!1843)

(declare-fun choose!27 (BitStream!1124 BitStream!1124 (_ BitVec 64) (_ BitVec 64)) Unit!1843)

(assert (=> d!6690 (= lt!29665 (choose!27 thiss!1379 (_2!1329 lt!29618) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!6690 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!6690 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1329 lt!29618) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!29665)))

(declare-fun b!20966 () Bool)

(assert (=> b!20966 (= e!14293 (validate_offset_bits!1 ((_ sign_extend 32) (size!645 (buf!954 (_2!1329 lt!29618)))) ((_ sign_extend 32) (currentByte!2243 (_2!1329 lt!29618))) ((_ sign_extend 32) (currentBit!2238 (_2!1329 lt!29618))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!6690 res!18188) b!20966))

(declare-fun m!28799 () Bool)

(assert (=> d!6690 m!28799))

(assert (=> b!20966 m!28707))

(assert (=> b!20899 d!6690))

(declare-fun b!21024 () Bool)

(declare-fun res!18240 () Bool)

(declare-fun e!14322 () Bool)

(assert (=> b!21024 (=> (not res!18240) (not e!14322))))

(declare-fun lt!29793 () tuple2!2488)

(assert (=> b!21024 (= res!18240 (isPrefixOf!0 thiss!1379 (_2!1329 lt!29793)))))

(declare-fun b!21025 () Bool)

(declare-fun e!14321 () Bool)

(assert (=> b!21025 (= e!14322 e!14321)))

(declare-fun res!18241 () Bool)

(assert (=> b!21025 (=> (not res!18241) (not e!14321))))

(declare-datatypes ((tuple2!2500 0))(
  ( (tuple2!2501 (_1!1335 BitStream!1124) (_2!1335 Bool)) )
))
(declare-fun lt!29790 () tuple2!2500)

(declare-fun lt!29795 () Bool)

(assert (=> b!21025 (= res!18241 (and (= (_2!1335 lt!29790) lt!29795) (= (_1!1335 lt!29790) (_2!1329 lt!29793))))))

(declare-fun readBitPure!0 (BitStream!1124) tuple2!2500)

(declare-fun readerFrom!0 (BitStream!1124 (_ BitVec 32) (_ BitVec 32)) BitStream!1124)

(assert (=> b!21025 (= lt!29790 (readBitPure!0 (readerFrom!0 (_2!1329 lt!29793) (currentBit!2238 thiss!1379) (currentByte!2243 thiss!1379))))))

(declare-fun b!21026 () Bool)

(declare-fun e!14323 () Bool)

(declare-fun lt!29796 () tuple2!2500)

(declare-fun lt!29792 () tuple2!2488)

(assert (=> b!21026 (= e!14323 (= (bitIndex!0 (size!645 (buf!954 (_1!1335 lt!29796))) (currentByte!2243 (_1!1335 lt!29796)) (currentBit!2238 (_1!1335 lt!29796))) (bitIndex!0 (size!645 (buf!954 (_2!1329 lt!29792))) (currentByte!2243 (_2!1329 lt!29792)) (currentBit!2238 (_2!1329 lt!29792)))))))

(declare-fun b!21027 () Bool)

(declare-fun res!18238 () Bool)

(declare-fun e!14320 () Bool)

(assert (=> b!21027 (=> (not res!18238) (not e!14320))))

(declare-fun lt!29798 () (_ BitVec 64))

(declare-fun lt!29799 () (_ BitVec 64))

(assert (=> b!21027 (= res!18238 (= (bitIndex!0 (size!645 (buf!954 (_2!1329 lt!29792))) (currentByte!2243 (_2!1329 lt!29792)) (currentBit!2238 (_2!1329 lt!29792))) (bvadd lt!29798 lt!29799)))))

(assert (=> b!21027 (or (not (= (bvand lt!29798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!29799 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!29798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!29798 lt!29799) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21027 (= lt!29799 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!21027 (= lt!29798 (bitIndex!0 (size!645 (buf!954 thiss!1379)) (currentByte!2243 thiss!1379) (currentBit!2238 thiss!1379)))))

(declare-fun d!6692 () Bool)

(assert (=> d!6692 e!14320))

(declare-fun res!18245 () Bool)

(assert (=> d!6692 (=> (not res!18245) (not e!14320))))

(assert (=> d!6692 (= res!18245 (= (size!645 (buf!954 (_2!1329 lt!29792))) (size!645 (buf!954 thiss!1379))))))

(declare-fun lt!29791 () (_ BitVec 8))

(declare-fun lt!29797 () array!1509)

(assert (=> d!6692 (= lt!29791 (select (arr!1089 lt!29797) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!6692 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!645 lt!29797)))))

(assert (=> d!6692 (= lt!29797 (array!1510 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!29794 () tuple2!2488)

(assert (=> d!6692 (= lt!29792 (tuple2!2489 (_1!1329 lt!29794) (_2!1329 lt!29794)))))

(assert (=> d!6692 (= lt!29794 lt!29793)))

(assert (=> d!6692 e!14322))

(declare-fun res!18243 () Bool)

(assert (=> d!6692 (=> (not res!18243) (not e!14322))))

(assert (=> d!6692 (= res!18243 (= (size!645 (buf!954 thiss!1379)) (size!645 (buf!954 (_2!1329 lt!29793)))))))

(declare-fun appendBit!0 (BitStream!1124 Bool) tuple2!2488)

(assert (=> d!6692 (= lt!29793 (appendBit!0 thiss!1379 lt!29795))))

(assert (=> d!6692 (= lt!29795 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1089 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!6692 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!6692 (= (appendBitFromByte!0 thiss!1379 (select (arr!1089 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!29792)))

(declare-fun b!21028 () Bool)

(assert (=> b!21028 (= e!14321 (= (bitIndex!0 (size!645 (buf!954 (_1!1335 lt!29790))) (currentByte!2243 (_1!1335 lt!29790)) (currentBit!2238 (_1!1335 lt!29790))) (bitIndex!0 (size!645 (buf!954 (_2!1329 lt!29793))) (currentByte!2243 (_2!1329 lt!29793)) (currentBit!2238 (_2!1329 lt!29793)))))))

(declare-fun b!21029 () Bool)

(assert (=> b!21029 (= e!14320 e!14323)))

(declare-fun res!18242 () Bool)

(assert (=> b!21029 (=> (not res!18242) (not e!14323))))

(assert (=> b!21029 (= res!18242 (and (= (_2!1335 lt!29796) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1089 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!29791)) #b00000000000000000000000000000000))) (= (_1!1335 lt!29796) (_2!1329 lt!29792))))))

(declare-datatypes ((tuple2!2502 0))(
  ( (tuple2!2503 (_1!1336 array!1509) (_2!1336 BitStream!1124)) )
))
(declare-fun lt!29789 () tuple2!2502)

(declare-fun lt!29800 () BitStream!1124)

(declare-fun readBits!0 (BitStream!1124 (_ BitVec 64)) tuple2!2502)

(assert (=> b!21029 (= lt!29789 (readBits!0 lt!29800 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!21029 (= lt!29796 (readBitPure!0 lt!29800))))

(assert (=> b!21029 (= lt!29800 (readerFrom!0 (_2!1329 lt!29792) (currentBit!2238 thiss!1379) (currentByte!2243 thiss!1379)))))

(declare-fun b!21030 () Bool)

(declare-fun res!18244 () Bool)

(assert (=> b!21030 (=> (not res!18244) (not e!14322))))

(assert (=> b!21030 (= res!18244 (= (bitIndex!0 (size!645 (buf!954 (_2!1329 lt!29793))) (currentByte!2243 (_2!1329 lt!29793)) (currentBit!2238 (_2!1329 lt!29793))) (bvadd (bitIndex!0 (size!645 (buf!954 thiss!1379)) (currentByte!2243 thiss!1379) (currentBit!2238 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!21031 () Bool)

(declare-fun res!18239 () Bool)

(assert (=> b!21031 (=> (not res!18239) (not e!14320))))

(assert (=> b!21031 (= res!18239 (isPrefixOf!0 thiss!1379 (_2!1329 lt!29792)))))

(assert (= (and d!6692 res!18243) b!21030))

(assert (= (and b!21030 res!18244) b!21024))

(assert (= (and b!21024 res!18240) b!21025))

(assert (= (and b!21025 res!18241) b!21028))

(assert (= (and d!6692 res!18245) b!21027))

(assert (= (and b!21027 res!18238) b!21031))

(assert (= (and b!21031 res!18239) b!21029))

(assert (= (and b!21029 res!18242) b!21026))

(declare-fun m!28855 () Bool)

(assert (=> b!21028 m!28855))

(declare-fun m!28857 () Bool)

(assert (=> b!21028 m!28857))

(declare-fun m!28859 () Bool)

(assert (=> d!6692 m!28859))

(declare-fun m!28861 () Bool)

(assert (=> d!6692 m!28861))

(declare-fun m!28863 () Bool)

(assert (=> d!6692 m!28863))

(declare-fun m!28865 () Bool)

(assert (=> b!21029 m!28865))

(declare-fun m!28867 () Bool)

(assert (=> b!21029 m!28867))

(declare-fun m!28869 () Bool)

(assert (=> b!21029 m!28869))

(declare-fun m!28871 () Bool)

(assert (=> b!21024 m!28871))

(assert (=> b!21030 m!28857))

(assert (=> b!21030 m!28733))

(declare-fun m!28873 () Bool)

(assert (=> b!21026 m!28873))

(declare-fun m!28875 () Bool)

(assert (=> b!21026 m!28875))

(declare-fun m!28877 () Bool)

(assert (=> b!21025 m!28877))

(assert (=> b!21025 m!28877))

(declare-fun m!28879 () Bool)

(assert (=> b!21025 m!28879))

(declare-fun m!28881 () Bool)

(assert (=> b!21031 m!28881))

(assert (=> b!21027 m!28875))

(assert (=> b!21027 m!28733))

(assert (=> b!20899 d!6692))

(declare-fun d!6700 () Bool)

(assert (=> d!6700 (isPrefixOf!0 thiss!1379 (_2!1329 lt!29622))))

(declare-fun lt!29803 () Unit!1843)

(declare-fun choose!30 (BitStream!1124 BitStream!1124 BitStream!1124) Unit!1843)

(assert (=> d!6700 (= lt!29803 (choose!30 thiss!1379 (_2!1329 lt!29618) (_2!1329 lt!29622)))))

(assert (=> d!6700 (isPrefixOf!0 thiss!1379 (_2!1329 lt!29618))))

(assert (=> d!6700 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1329 lt!29618) (_2!1329 lt!29622)) lt!29803)))

(declare-fun bs!1982 () Bool)

(assert (= bs!1982 d!6700))

(assert (=> bs!1982 m!28743))

(declare-fun m!28883 () Bool)

(assert (=> bs!1982 m!28883))

(assert (=> bs!1982 m!28715))

(assert (=> b!20897 d!6700))

(declare-fun d!6702 () Bool)

(assert (=> d!6702 (validate_offset_bits!1 ((_ sign_extend 32) (size!645 (buf!954 (_2!1329 lt!29618)))) ((_ sign_extend 32) (currentByte!2243 thiss!1379)) ((_ sign_extend 32) (currentBit!2238 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!29806 () Unit!1843)

(declare-fun choose!9 (BitStream!1124 array!1509 (_ BitVec 64) BitStream!1124) Unit!1843)

(assert (=> d!6702 (= lt!29806 (choose!9 thiss!1379 (buf!954 (_2!1329 lt!29618)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1125 (buf!954 (_2!1329 lt!29618)) (currentByte!2243 thiss!1379) (currentBit!2238 thiss!1379))))))

(assert (=> d!6702 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!954 (_2!1329 lt!29618)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!29806)))

(declare-fun bs!1983 () Bool)

(assert (= bs!1983 d!6702))

(assert (=> bs!1983 m!28735))

(declare-fun m!28885 () Bool)

(assert (=> bs!1983 m!28885))

(assert (=> b!20897 d!6702))

(declare-fun d!6704 () Bool)

(declare-fun res!18247 () Bool)

(declare-fun e!14325 () Bool)

(assert (=> d!6704 (=> (not res!18247) (not e!14325))))

(assert (=> d!6704 (= res!18247 (= (size!645 (buf!954 (_2!1329 lt!29618))) (size!645 (buf!954 (_2!1329 lt!29622)))))))

(assert (=> d!6704 (= (isPrefixOf!0 (_2!1329 lt!29618) (_2!1329 lt!29622)) e!14325)))

(declare-fun b!21032 () Bool)

(declare-fun res!18246 () Bool)

(assert (=> b!21032 (=> (not res!18246) (not e!14325))))

(assert (=> b!21032 (= res!18246 (bvsle (bitIndex!0 (size!645 (buf!954 (_2!1329 lt!29618))) (currentByte!2243 (_2!1329 lt!29618)) (currentBit!2238 (_2!1329 lt!29618))) (bitIndex!0 (size!645 (buf!954 (_2!1329 lt!29622))) (currentByte!2243 (_2!1329 lt!29622)) (currentBit!2238 (_2!1329 lt!29622)))))))

(declare-fun b!21033 () Bool)

(declare-fun e!14324 () Bool)

(assert (=> b!21033 (= e!14325 e!14324)))

(declare-fun res!18248 () Bool)

(assert (=> b!21033 (=> res!18248 e!14324)))

(assert (=> b!21033 (= res!18248 (= (size!645 (buf!954 (_2!1329 lt!29618))) #b00000000000000000000000000000000))))

(declare-fun b!21034 () Bool)

(assert (=> b!21034 (= e!14324 (arrayBitRangesEq!0 (buf!954 (_2!1329 lt!29618)) (buf!954 (_2!1329 lt!29622)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!645 (buf!954 (_2!1329 lt!29618))) (currentByte!2243 (_2!1329 lt!29618)) (currentBit!2238 (_2!1329 lt!29618)))))))

(assert (= (and d!6704 res!18247) b!21032))

(assert (= (and b!21032 res!18246) b!21033))

(assert (= (and b!21033 (not res!18248)) b!21034))

(assert (=> b!21032 m!28793))

(declare-fun m!28887 () Bool)

(assert (=> b!21032 m!28887))

(assert (=> b!21034 m!28793))

(assert (=> b!21034 m!28793))

(declare-fun m!28889 () Bool)

(assert (=> b!21034 m!28889))

(assert (=> b!20897 d!6704))

(declare-fun d!6706 () Bool)

(assert (=> d!6706 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!645 (buf!954 (_2!1329 lt!29618)))) ((_ sign_extend 32) (currentByte!2243 thiss!1379)) ((_ sign_extend 32) (currentBit!2238 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!645 (buf!954 (_2!1329 lt!29618)))) ((_ sign_extend 32) (currentByte!2243 thiss!1379)) ((_ sign_extend 32) (currentBit!2238 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1984 () Bool)

(assert (= bs!1984 d!6706))

(declare-fun m!28891 () Bool)

(assert (=> bs!1984 m!28891))

(assert (=> b!20897 d!6706))

(declare-fun lt!30055 () tuple2!2490)

(declare-fun b!21081 () Bool)

(declare-fun e!14345 () Bool)

(declare-fun lt!30052 () tuple2!2488)

(assert (=> b!21081 (= e!14345 (= (bitStreamReadBitsIntoList!0 (_2!1329 lt!30052) (_1!1330 lt!30055) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1329 lt!30052) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!21081 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21081 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!30058 () Unit!1843)

(declare-fun lt!30036 () Unit!1843)

(assert (=> b!21081 (= lt!30058 lt!30036)))

(declare-fun lt!30059 () (_ BitVec 64))

(assert (=> b!21081 (validate_offset_bits!1 ((_ sign_extend 32) (size!645 (buf!954 (_2!1329 lt!30052)))) ((_ sign_extend 32) (currentByte!2243 (_2!1329 lt!29618))) ((_ sign_extend 32) (currentBit!2238 (_2!1329 lt!29618))) lt!30059)))

(assert (=> b!21081 (= lt!30036 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1329 lt!29618) (buf!954 (_2!1329 lt!30052)) lt!30059))))

(declare-fun e!14346 () Bool)

(assert (=> b!21081 e!14346))

(declare-fun res!18290 () Bool)

(assert (=> b!21081 (=> (not res!18290) (not e!14346))))

(assert (=> b!21081 (= res!18290 (and (= (size!645 (buf!954 (_2!1329 lt!29618))) (size!645 (buf!954 (_2!1329 lt!30052)))) (bvsge lt!30059 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21081 (= lt!30059 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!21081 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21081 (= lt!30055 (reader!0 (_2!1329 lt!29618) (_2!1329 lt!30052)))))

(declare-fun b!21082 () Bool)

(declare-fun e!14347 () tuple2!2488)

(declare-fun Unit!1852 () Unit!1843)

(assert (=> b!21082 (= e!14347 (tuple2!2489 Unit!1852 (_2!1329 lt!29618)))))

(assert (=> b!21082 (= (size!645 (buf!954 (_2!1329 lt!29618))) (size!645 (buf!954 (_2!1329 lt!29618))))))

(declare-fun lt!30030 () Unit!1843)

(declare-fun Unit!1853 () Unit!1843)

(assert (=> b!21082 (= lt!30030 Unit!1853)))

(declare-fun call!299 () tuple2!2490)

(declare-fun checkByteArrayBitContent!0 (BitStream!1124 array!1509 array!1509 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!21082 (checkByteArrayBitContent!0 (_2!1329 lt!29618) srcBuffer!2 (_1!1336 (readBits!0 (_1!1330 call!299) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun c!1477 () Bool)

(declare-fun lt!30057 () tuple2!2488)

(declare-fun bm!296 () Bool)

(assert (=> bm!296 (= call!299 (reader!0 (_2!1329 lt!29618) (ite c!1477 (_2!1329 lt!30057) (_2!1329 lt!29618))))))

(declare-fun b!21083 () Bool)

(declare-fun lt!30034 () tuple2!2488)

(declare-fun Unit!1855 () Unit!1843)

(assert (=> b!21083 (= e!14347 (tuple2!2489 Unit!1855 (_2!1329 lt!30034)))))

(assert (=> b!21083 (= lt!30057 (appendBitFromByte!0 (_2!1329 lt!29618) (select (arr!1089 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!30046 () (_ BitVec 64))

(assert (=> b!21083 (= lt!30046 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!30070 () (_ BitVec 64))

(assert (=> b!21083 (= lt!30070 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!30037 () Unit!1843)

(assert (=> b!21083 (= lt!30037 (validateOffsetBitsIneqLemma!0 (_2!1329 lt!29618) (_2!1329 lt!30057) lt!30046 lt!30070))))

(assert (=> b!21083 (validate_offset_bits!1 ((_ sign_extend 32) (size!645 (buf!954 (_2!1329 lt!30057)))) ((_ sign_extend 32) (currentByte!2243 (_2!1329 lt!30057))) ((_ sign_extend 32) (currentBit!2238 (_2!1329 lt!30057))) (bvsub lt!30046 lt!30070))))

(declare-fun lt!30066 () Unit!1843)

(assert (=> b!21083 (= lt!30066 lt!30037)))

(declare-fun lt!30032 () tuple2!2490)

(assert (=> b!21083 (= lt!30032 call!299)))

(declare-fun lt!30061 () (_ BitVec 64))

(assert (=> b!21083 (= lt!30061 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!30051 () Unit!1843)

(assert (=> b!21083 (= lt!30051 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1329 lt!29618) (buf!954 (_2!1329 lt!30057)) lt!30061))))

(assert (=> b!21083 (validate_offset_bits!1 ((_ sign_extend 32) (size!645 (buf!954 (_2!1329 lt!30057)))) ((_ sign_extend 32) (currentByte!2243 (_2!1329 lt!29618))) ((_ sign_extend 32) (currentBit!2238 (_2!1329 lt!29618))) lt!30061)))

(declare-fun lt!30045 () Unit!1843)

(assert (=> b!21083 (= lt!30045 lt!30051)))

(assert (=> b!21083 (= (head!100 (byteArrayBitContentToList!0 (_2!1329 lt!30057) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!100 (bitStreamReadBitsIntoList!0 (_2!1329 lt!30057) (_1!1330 lt!30032) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!30043 () Unit!1843)

(declare-fun Unit!1856 () Unit!1843)

(assert (=> b!21083 (= lt!30043 Unit!1856)))

(assert (=> b!21083 (= lt!30034 (appendBitsMSBFirstLoop!0 (_2!1329 lt!30057) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!30049 () Unit!1843)

(assert (=> b!21083 (= lt!30049 (lemmaIsPrefixTransitive!0 (_2!1329 lt!29618) (_2!1329 lt!30057) (_2!1329 lt!30034)))))

(assert (=> b!21083 (isPrefixOf!0 (_2!1329 lt!29618) (_2!1329 lt!30034))))

(declare-fun lt!30047 () Unit!1843)

(assert (=> b!21083 (= lt!30047 lt!30049)))

(assert (=> b!21083 (= (size!645 (buf!954 (_2!1329 lt!30034))) (size!645 (buf!954 (_2!1329 lt!29618))))))

(declare-fun lt!30073 () Unit!1843)

(declare-fun Unit!1857 () Unit!1843)

(assert (=> b!21083 (= lt!30073 Unit!1857)))

(assert (=> b!21083 (= (bitIndex!0 (size!645 (buf!954 (_2!1329 lt!30034))) (currentByte!2243 (_2!1329 lt!30034)) (currentBit!2238 (_2!1329 lt!30034))) (bvsub (bvadd (bitIndex!0 (size!645 (buf!954 (_2!1329 lt!29618))) (currentByte!2243 (_2!1329 lt!29618)) (currentBit!2238 (_2!1329 lt!29618))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!30063 () Unit!1843)

(declare-fun Unit!1858 () Unit!1843)

(assert (=> b!21083 (= lt!30063 Unit!1858)))

(assert (=> b!21083 (= (bitIndex!0 (size!645 (buf!954 (_2!1329 lt!30034))) (currentByte!2243 (_2!1329 lt!30034)) (currentBit!2238 (_2!1329 lt!30034))) (bvsub (bvsub (bvadd (bitIndex!0 (size!645 (buf!954 (_2!1329 lt!30057))) (currentByte!2243 (_2!1329 lt!30057)) (currentBit!2238 (_2!1329 lt!30057))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!30042 () Unit!1843)

(declare-fun Unit!1859 () Unit!1843)

(assert (=> b!21083 (= lt!30042 Unit!1859)))

(declare-fun lt!30056 () tuple2!2490)

(assert (=> b!21083 (= lt!30056 (reader!0 (_2!1329 lt!29618) (_2!1329 lt!30034)))))

(declare-fun lt!30053 () (_ BitVec 64))

(assert (=> b!21083 (= lt!30053 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!30033 () Unit!1843)

(assert (=> b!21083 (= lt!30033 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1329 lt!29618) (buf!954 (_2!1329 lt!30034)) lt!30053))))

(assert (=> b!21083 (validate_offset_bits!1 ((_ sign_extend 32) (size!645 (buf!954 (_2!1329 lt!30034)))) ((_ sign_extend 32) (currentByte!2243 (_2!1329 lt!29618))) ((_ sign_extend 32) (currentBit!2238 (_2!1329 lt!29618))) lt!30053)))

(declare-fun lt!30038 () Unit!1843)

(assert (=> b!21083 (= lt!30038 lt!30033)))

(declare-fun lt!30072 () tuple2!2490)

(assert (=> b!21083 (= lt!30072 (reader!0 (_2!1329 lt!30057) (_2!1329 lt!30034)))))

(declare-fun lt!30068 () (_ BitVec 64))

(assert (=> b!21083 (= lt!30068 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!30040 () Unit!1843)

(assert (=> b!21083 (= lt!30040 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1329 lt!30057) (buf!954 (_2!1329 lt!30034)) lt!30068))))

(assert (=> b!21083 (validate_offset_bits!1 ((_ sign_extend 32) (size!645 (buf!954 (_2!1329 lt!30034)))) ((_ sign_extend 32) (currentByte!2243 (_2!1329 lt!30057))) ((_ sign_extend 32) (currentBit!2238 (_2!1329 lt!30057))) lt!30068)))

(declare-fun lt!30041 () Unit!1843)

(assert (=> b!21083 (= lt!30041 lt!30040)))

(declare-fun lt!30069 () List!263)

(assert (=> b!21083 (= lt!30069 (byteArrayBitContentToList!0 (_2!1329 lt!30034) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!30064 () List!263)

(assert (=> b!21083 (= lt!30064 (byteArrayBitContentToList!0 (_2!1329 lt!30034) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!30071 () List!263)

(assert (=> b!21083 (= lt!30071 (bitStreamReadBitsIntoList!0 (_2!1329 lt!30034) (_1!1330 lt!30056) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!30060 () List!263)

(assert (=> b!21083 (= lt!30060 (bitStreamReadBitsIntoList!0 (_2!1329 lt!30034) (_1!1330 lt!30072) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!30039 () (_ BitVec 64))

(assert (=> b!21083 (= lt!30039 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!30065 () Unit!1843)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1124 BitStream!1124 BitStream!1124 BitStream!1124 (_ BitVec 64) List!263) Unit!1843)

(assert (=> b!21083 (= lt!30065 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1329 lt!30034) (_2!1329 lt!30034) (_1!1330 lt!30056) (_1!1330 lt!30072) lt!30039 lt!30071))))

(declare-fun tail!77 (List!263) List!263)

(assert (=> b!21083 (= (bitStreamReadBitsIntoList!0 (_2!1329 lt!30034) (_1!1330 lt!30072) (bvsub lt!30039 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!77 lt!30071))))

(declare-fun lt!30031 () Unit!1843)

(assert (=> b!21083 (= lt!30031 lt!30065)))

(declare-fun lt!30062 () Unit!1843)

(declare-fun lt!30054 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1509 array!1509 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1843)

(assert (=> b!21083 (= lt!30062 (arrayBitRangesEqImpliesEq!0 (buf!954 (_2!1329 lt!30057)) (buf!954 (_2!1329 lt!30034)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!30054 (bitIndex!0 (size!645 (buf!954 (_2!1329 lt!30057))) (currentByte!2243 (_2!1329 lt!30057)) (currentBit!2238 (_2!1329 lt!30057)))))))

(declare-fun bitAt!0 (array!1509 (_ BitVec 64)) Bool)

(assert (=> b!21083 (= (bitAt!0 (buf!954 (_2!1329 lt!30057)) lt!30054) (bitAt!0 (buf!954 (_2!1329 lt!30034)) lt!30054))))

(declare-fun lt!30044 () Unit!1843)

(assert (=> b!21083 (= lt!30044 lt!30062)))

(declare-fun b!21084 () Bool)

(declare-fun res!18285 () Bool)

(assert (=> b!21084 (=> (not res!18285) (not e!14345))))

(assert (=> b!21084 (= res!18285 (isPrefixOf!0 (_2!1329 lt!29618) (_2!1329 lt!30052)))))

(declare-fun b!21085 () Bool)

(declare-fun res!18286 () Bool)

(assert (=> b!21085 (=> (not res!18286) (not e!14345))))

(assert (=> b!21085 (= res!18286 (= (size!645 (buf!954 (_2!1329 lt!30052))) (size!645 (buf!954 (_2!1329 lt!29618)))))))

(declare-fun b!21087 () Bool)

(assert (=> b!21087 (= e!14346 (validate_offset_bits!1 ((_ sign_extend 32) (size!645 (buf!954 (_2!1329 lt!29618)))) ((_ sign_extend 32) (currentByte!2243 (_2!1329 lt!29618))) ((_ sign_extend 32) (currentBit!2238 (_2!1329 lt!29618))) lt!30059))))

(declare-fun b!21088 () Bool)

(declare-fun res!18287 () Bool)

(assert (=> b!21088 (=> (not res!18287) (not e!14345))))

(assert (=> b!21088 (= res!18287 (= (size!645 (buf!954 (_2!1329 lt!29618))) (size!645 (buf!954 (_2!1329 lt!30052)))))))

(declare-fun d!6708 () Bool)

(assert (=> d!6708 e!14345))

(declare-fun res!18289 () Bool)

(assert (=> d!6708 (=> (not res!18289) (not e!14345))))

(declare-fun lt!30050 () (_ BitVec 64))

(assert (=> d!6708 (= res!18289 (= (bitIndex!0 (size!645 (buf!954 (_2!1329 lt!30052))) (currentByte!2243 (_2!1329 lt!30052)) (currentBit!2238 (_2!1329 lt!30052))) (bvsub lt!30050 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!6708 (or (= (bvand lt!30050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!30050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!30050 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!30035 () (_ BitVec 64))

(assert (=> d!6708 (= lt!30050 (bvadd lt!30035 to!314))))

(assert (=> d!6708 (or (not (= (bvand lt!30035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!30035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!30035 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6708 (= lt!30035 (bitIndex!0 (size!645 (buf!954 (_2!1329 lt!29618))) (currentByte!2243 (_2!1329 lt!29618)) (currentBit!2238 (_2!1329 lt!29618))))))

(assert (=> d!6708 (= lt!30052 e!14347)))

(assert (=> d!6708 (= c!1477 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!30067 () Unit!1843)

(declare-fun lt!30048 () Unit!1843)

(assert (=> d!6708 (= lt!30067 lt!30048)))

(assert (=> d!6708 (isPrefixOf!0 (_2!1329 lt!29618) (_2!1329 lt!29618))))

(assert (=> d!6708 (= lt!30048 (lemmaIsPrefixRefl!0 (_2!1329 lt!29618)))))

(assert (=> d!6708 (= lt!30054 (bitIndex!0 (size!645 (buf!954 (_2!1329 lt!29618))) (currentByte!2243 (_2!1329 lt!29618)) (currentBit!2238 (_2!1329 lt!29618))))))

(assert (=> d!6708 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6708 (= (appendBitsMSBFirstLoop!0 (_2!1329 lt!29618) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!30052)))

(declare-fun b!21086 () Bool)

(declare-fun res!18288 () Bool)

(assert (=> b!21086 (=> (not res!18288) (not e!14345))))

(assert (=> b!21086 (= res!18288 (invariant!0 (currentBit!2238 (_2!1329 lt!30052)) (currentByte!2243 (_2!1329 lt!30052)) (size!645 (buf!954 (_2!1329 lt!30052)))))))

(assert (= (and d!6708 c!1477) b!21083))

(assert (= (and d!6708 (not c!1477)) b!21082))

(assert (= (or b!21083 b!21082) bm!296))

(assert (= (and d!6708 res!18289) b!21086))

(assert (= (and b!21086 res!18288) b!21088))

(assert (= (and b!21088 res!18287) b!21084))

(assert (= (and b!21084 res!18285) b!21085))

(assert (= (and b!21085 res!18286) b!21081))

(assert (= (and b!21081 res!18290) b!21087))

(declare-fun m!28991 () Bool)

(assert (=> b!21086 m!28991))

(declare-fun m!28993 () Bool)

(assert (=> b!21087 m!28993))

(declare-fun m!28995 () Bool)

(assert (=> b!21081 m!28995))

(declare-fun m!28997 () Bool)

(assert (=> b!21081 m!28997))

(declare-fun m!28999 () Bool)

(assert (=> b!21081 m!28999))

(declare-fun m!29001 () Bool)

(assert (=> b!21081 m!29001))

(declare-fun m!29003 () Bool)

(assert (=> b!21081 m!29003))

(declare-fun m!29005 () Bool)

(assert (=> bm!296 m!29005))

(declare-fun m!29007 () Bool)

(assert (=> b!21084 m!29007))

(declare-fun m!29009 () Bool)

(assert (=> b!21082 m!29009))

(declare-fun m!29011 () Bool)

(assert (=> b!21082 m!29011))

(declare-fun m!29013 () Bool)

(assert (=> b!21083 m!29013))

(declare-fun m!29015 () Bool)

(assert (=> b!21083 m!29015))

(declare-fun m!29017 () Bool)

(assert (=> b!21083 m!29017))

(declare-fun m!29019 () Bool)

(assert (=> b!21083 m!29019))

(declare-fun m!29021 () Bool)

(assert (=> b!21083 m!29021))

(declare-fun m!29023 () Bool)

(assert (=> b!21083 m!29023))

(declare-fun m!29025 () Bool)

(assert (=> b!21083 m!29025))

(declare-fun m!29027 () Bool)

(assert (=> b!21083 m!29027))

(declare-fun m!29029 () Bool)

(assert (=> b!21083 m!29029))

(declare-fun m!29031 () Bool)

(assert (=> b!21083 m!29031))

(declare-fun m!29033 () Bool)

(assert (=> b!21083 m!29033))

(assert (=> b!21083 m!28793))

(declare-fun m!29035 () Bool)

(assert (=> b!21083 m!29035))

(declare-fun m!29037 () Bool)

(assert (=> b!21083 m!29037))

(declare-fun m!29039 () Bool)

(assert (=> b!21083 m!29039))

(declare-fun m!29041 () Bool)

(assert (=> b!21083 m!29041))

(assert (=> b!21083 m!29021))

(declare-fun m!29043 () Bool)

(assert (=> b!21083 m!29043))

(declare-fun m!29045 () Bool)

(assert (=> b!21083 m!29045))

(declare-fun m!29047 () Bool)

(assert (=> b!21083 m!29047))

(declare-fun m!29049 () Bool)

(assert (=> b!21083 m!29049))

(declare-fun m!29051 () Bool)

(assert (=> b!21083 m!29051))

(declare-fun m!29053 () Bool)

(assert (=> b!21083 m!29053))

(declare-fun m!29055 () Bool)

(assert (=> b!21083 m!29055))

(declare-fun m!29057 () Bool)

(assert (=> b!21083 m!29057))

(declare-fun m!29059 () Bool)

(assert (=> b!21083 m!29059))

(declare-fun m!29061 () Bool)

(assert (=> b!21083 m!29061))

(assert (=> b!21083 m!29029))

(declare-fun m!29063 () Bool)

(assert (=> b!21083 m!29063))

(assert (=> b!21083 m!29035))

(declare-fun m!29065 () Bool)

(assert (=> b!21083 m!29065))

(assert (=> b!21083 m!29015))

(declare-fun m!29067 () Bool)

(assert (=> b!21083 m!29067))

(declare-fun m!29069 () Bool)

(assert (=> b!21083 m!29069))

(declare-fun m!29071 () Bool)

(assert (=> b!21083 m!29071))

(declare-fun m!29073 () Bool)

(assert (=> b!21083 m!29073))

(declare-fun m!29075 () Bool)

(assert (=> d!6708 m!29075))

(assert (=> d!6708 m!28793))

(declare-fun m!29077 () Bool)

(assert (=> d!6708 m!29077))

(declare-fun m!29079 () Bool)

(assert (=> d!6708 m!29079))

(assert (=> b!20897 d!6708))

(declare-fun b!21141 () Bool)

(declare-fun e!14370 () Unit!1843)

(declare-fun Unit!1860 () Unit!1843)

(assert (=> b!21141 (= e!14370 Unit!1860)))

(declare-fun b!21142 () Bool)

(declare-fun res!18328 () Bool)

(declare-fun e!14369 () Bool)

(assert (=> b!21142 (=> (not res!18328) (not e!14369))))

(declare-fun lt!30315 () tuple2!2490)

(assert (=> b!21142 (= res!18328 (isPrefixOf!0 (_2!1330 lt!30315) (_2!1329 lt!29618)))))

(declare-fun b!21143 () Bool)

(declare-fun lt!30310 () Unit!1843)

(assert (=> b!21143 (= e!14370 lt!30310)))

(declare-fun lt!30314 () (_ BitVec 64))

(assert (=> b!21143 (= lt!30314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!30323 () (_ BitVec 64))

(assert (=> b!21143 (= lt!30323 (bitIndex!0 (size!645 (buf!954 thiss!1379)) (currentByte!2243 thiss!1379) (currentBit!2238 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1509 array!1509 (_ BitVec 64) (_ BitVec 64)) Unit!1843)

(assert (=> b!21143 (= lt!30310 (arrayBitRangesEqSymmetric!0 (buf!954 thiss!1379) (buf!954 (_2!1329 lt!29618)) lt!30314 lt!30323))))

(assert (=> b!21143 (arrayBitRangesEq!0 (buf!954 (_2!1329 lt!29618)) (buf!954 thiss!1379) lt!30314 lt!30323)))

(declare-fun b!21144 () Bool)

(declare-fun lt!30309 () (_ BitVec 64))

(declare-fun lt!30311 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1124 (_ BitVec 64)) BitStream!1124)

(assert (=> b!21144 (= e!14369 (= (_1!1330 lt!30315) (withMovedBitIndex!0 (_2!1330 lt!30315) (bvsub lt!30309 lt!30311))))))

(assert (=> b!21144 (or (= (bvand lt!30309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!30311 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!30309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!30309 lt!30311) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21144 (= lt!30311 (bitIndex!0 (size!645 (buf!954 (_2!1329 lt!29618))) (currentByte!2243 (_2!1329 lt!29618)) (currentBit!2238 (_2!1329 lt!29618))))))

(assert (=> b!21144 (= lt!30309 (bitIndex!0 (size!645 (buf!954 thiss!1379)) (currentByte!2243 thiss!1379) (currentBit!2238 thiss!1379)))))

(declare-fun d!6718 () Bool)

(assert (=> d!6718 e!14369))

(declare-fun res!18329 () Bool)

(assert (=> d!6718 (=> (not res!18329) (not e!14369))))

(assert (=> d!6718 (= res!18329 (isPrefixOf!0 (_1!1330 lt!30315) (_2!1330 lt!30315)))))

(declare-fun lt!30327 () BitStream!1124)

(assert (=> d!6718 (= lt!30315 (tuple2!2491 lt!30327 (_2!1329 lt!29618)))))

(declare-fun lt!30317 () Unit!1843)

(declare-fun lt!30325 () Unit!1843)

(assert (=> d!6718 (= lt!30317 lt!30325)))

(assert (=> d!6718 (isPrefixOf!0 lt!30327 (_2!1329 lt!29618))))

(assert (=> d!6718 (= lt!30325 (lemmaIsPrefixTransitive!0 lt!30327 (_2!1329 lt!29618) (_2!1329 lt!29618)))))

(declare-fun lt!30312 () Unit!1843)

(declare-fun lt!30326 () Unit!1843)

(assert (=> d!6718 (= lt!30312 lt!30326)))

(assert (=> d!6718 (isPrefixOf!0 lt!30327 (_2!1329 lt!29618))))

(assert (=> d!6718 (= lt!30326 (lemmaIsPrefixTransitive!0 lt!30327 thiss!1379 (_2!1329 lt!29618)))))

(declare-fun lt!30320 () Unit!1843)

(assert (=> d!6718 (= lt!30320 e!14370)))

(declare-fun c!1486 () Bool)

(assert (=> d!6718 (= c!1486 (not (= (size!645 (buf!954 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!30328 () Unit!1843)

(declare-fun lt!30319 () Unit!1843)

(assert (=> d!6718 (= lt!30328 lt!30319)))

(assert (=> d!6718 (isPrefixOf!0 (_2!1329 lt!29618) (_2!1329 lt!29618))))

(assert (=> d!6718 (= lt!30319 (lemmaIsPrefixRefl!0 (_2!1329 lt!29618)))))

(declare-fun lt!30313 () Unit!1843)

(declare-fun lt!30321 () Unit!1843)

(assert (=> d!6718 (= lt!30313 lt!30321)))

(assert (=> d!6718 (= lt!30321 (lemmaIsPrefixRefl!0 (_2!1329 lt!29618)))))

(declare-fun lt!30324 () Unit!1843)

(declare-fun lt!30318 () Unit!1843)

(assert (=> d!6718 (= lt!30324 lt!30318)))

(assert (=> d!6718 (isPrefixOf!0 lt!30327 lt!30327)))

(assert (=> d!6718 (= lt!30318 (lemmaIsPrefixRefl!0 lt!30327))))

(declare-fun lt!30322 () Unit!1843)

(declare-fun lt!30316 () Unit!1843)

(assert (=> d!6718 (= lt!30322 lt!30316)))

(assert (=> d!6718 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!6718 (= lt!30316 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!6718 (= lt!30327 (BitStream!1125 (buf!954 (_2!1329 lt!29618)) (currentByte!2243 thiss!1379) (currentBit!2238 thiss!1379)))))

(assert (=> d!6718 (isPrefixOf!0 thiss!1379 (_2!1329 lt!29618))))

(assert (=> d!6718 (= (reader!0 thiss!1379 (_2!1329 lt!29618)) lt!30315)))

(declare-fun b!21145 () Bool)

(declare-fun res!18327 () Bool)

(assert (=> b!21145 (=> (not res!18327) (not e!14369))))

(assert (=> b!21145 (= res!18327 (isPrefixOf!0 (_1!1330 lt!30315) thiss!1379))))

(assert (= (and d!6718 c!1486) b!21143))

(assert (= (and d!6718 (not c!1486)) b!21141))

(assert (= (and d!6718 res!18329) b!21145))

(assert (= (and b!21145 res!18327) b!21142))

(assert (= (and b!21142 res!18328) b!21144))

(assert (=> b!21143 m!28733))

(declare-fun m!29123 () Bool)

(assert (=> b!21143 m!29123))

(declare-fun m!29127 () Bool)

(assert (=> b!21143 m!29127))

(declare-fun m!29129 () Bool)

(assert (=> b!21142 m!29129))

(declare-fun m!29133 () Bool)

(assert (=> d!6718 m!29133))

(assert (=> d!6718 m!29079))

(assert (=> d!6718 m!28731))

(declare-fun m!29137 () Bool)

(assert (=> d!6718 m!29137))

(declare-fun m!29139 () Bool)

(assert (=> d!6718 m!29139))

(declare-fun m!29143 () Bool)

(assert (=> d!6718 m!29143))

(assert (=> d!6718 m!28729))

(declare-fun m!29145 () Bool)

(assert (=> d!6718 m!29145))

(assert (=> d!6718 m!28715))

(assert (=> d!6718 m!29077))

(declare-fun m!29149 () Bool)

(assert (=> d!6718 m!29149))

(declare-fun m!29151 () Bool)

(assert (=> b!21144 m!29151))

(assert (=> b!21144 m!28793))

(assert (=> b!21144 m!28733))

(declare-fun m!29155 () Bool)

(assert (=> b!21145 m!29155))

(assert (=> b!20897 d!6718))

(declare-fun d!6730 () Bool)

(declare-fun res!18331 () Bool)

(declare-fun e!14372 () Bool)

(assert (=> d!6730 (=> (not res!18331) (not e!14372))))

(assert (=> d!6730 (= res!18331 (= (size!645 (buf!954 thiss!1379)) (size!645 (buf!954 (_2!1329 lt!29622)))))))

(assert (=> d!6730 (= (isPrefixOf!0 thiss!1379 (_2!1329 lt!29622)) e!14372)))

(declare-fun b!21146 () Bool)

(declare-fun res!18330 () Bool)

(assert (=> b!21146 (=> (not res!18330) (not e!14372))))

(assert (=> b!21146 (= res!18330 (bvsle (bitIndex!0 (size!645 (buf!954 thiss!1379)) (currentByte!2243 thiss!1379) (currentBit!2238 thiss!1379)) (bitIndex!0 (size!645 (buf!954 (_2!1329 lt!29622))) (currentByte!2243 (_2!1329 lt!29622)) (currentBit!2238 (_2!1329 lt!29622)))))))

(declare-fun b!21147 () Bool)

(declare-fun e!14371 () Bool)

(assert (=> b!21147 (= e!14372 e!14371)))

(declare-fun res!18332 () Bool)

(assert (=> b!21147 (=> res!18332 e!14371)))

(assert (=> b!21147 (= res!18332 (= (size!645 (buf!954 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!21148 () Bool)

(assert (=> b!21148 (= e!14371 (arrayBitRangesEq!0 (buf!954 thiss!1379) (buf!954 (_2!1329 lt!29622)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!645 (buf!954 thiss!1379)) (currentByte!2243 thiss!1379) (currentBit!2238 thiss!1379))))))

(assert (= (and d!6730 res!18331) b!21146))

(assert (= (and b!21146 res!18330) b!21147))

(assert (= (and b!21147 (not res!18332)) b!21148))

(assert (=> b!21146 m!28733))

(assert (=> b!21146 m!28887))

(assert (=> b!21148 m!28733))

(assert (=> b!21148 m!28733))

(declare-fun m!29183 () Bool)

(assert (=> b!21148 m!29183))

(assert (=> b!20897 d!6730))

(declare-fun d!6732 () Bool)

(assert (=> d!6732 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!645 (buf!954 thiss!1379))) ((_ sign_extend 32) (currentByte!2243 thiss!1379)) ((_ sign_extend 32) (currentBit!2238 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!645 (buf!954 thiss!1379))) ((_ sign_extend 32) (currentByte!2243 thiss!1379)) ((_ sign_extend 32) (currentBit!2238 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!1990 () Bool)

(assert (= bs!1990 d!6732))

(assert (=> bs!1990 m!28789))

(assert (=> b!20902 d!6732))

(declare-fun d!6734 () Bool)

(assert (=> d!6734 (= (head!100 (byteArrayBitContentToList!0 (_2!1329 lt!29618) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!378 (byteArrayBitContentToList!0 (_2!1329 lt!29618) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!20903 d!6734))

(declare-fun d!6736 () Bool)

(declare-fun c!1489 () Bool)

(assert (=> d!6736 (= c!1489 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14380 () List!263)

(assert (=> d!6736 (= (byteArrayBitContentToList!0 (_2!1329 lt!29618) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!14380)))

(declare-fun b!21162 () Bool)

(assert (=> b!21162 (= e!14380 Nil!260)))

(declare-fun b!21163 () Bool)

(assert (=> b!21163 (= e!14380 (Cons!259 (not (= (bvand ((_ sign_extend 24) (select (arr!1089 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1329 lt!29618) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!6736 c!1489) b!21162))

(assert (= (and d!6736 (not c!1489)) b!21163))

(assert (=> b!21163 m!28711))

(assert (=> b!21163 m!28863))

(declare-fun m!29227 () Bool)

(assert (=> b!21163 m!29227))

(assert (=> b!20903 d!6736))

(declare-fun d!6746 () Bool)

(assert (=> d!6746 (= (head!100 (bitStreamReadBitsIntoList!0 (_2!1329 lt!29618) (_1!1330 lt!29623) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!378 (bitStreamReadBitsIntoList!0 (_2!1329 lt!29618) (_1!1330 lt!29623) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!20903 d!6746))

(declare-datatypes ((tuple2!2504 0))(
  ( (tuple2!2505 (_1!1337 Bool) (_2!1337 BitStream!1124)) )
))
(declare-fun lt!30368 () tuple2!2504)

(declare-fun b!21177 () Bool)

(declare-fun lt!30369 () (_ BitVec 64))

(declare-datatypes ((tuple2!2506 0))(
  ( (tuple2!2507 (_1!1338 List!263) (_2!1338 BitStream!1124)) )
))
(declare-fun e!14388 () tuple2!2506)

(assert (=> b!21177 (= e!14388 (tuple2!2507 (Cons!259 (_1!1337 lt!30368) (bitStreamReadBitsIntoList!0 (_2!1329 lt!29618) (_2!1337 lt!30368) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!30369))) (_2!1337 lt!30368)))))

(declare-fun readBit!0 (BitStream!1124) tuple2!2504)

(assert (=> b!21177 (= lt!30368 (readBit!0 (_1!1330 lt!29623)))))

(assert (=> b!21177 (= lt!30369 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!21176 () Bool)

(assert (=> b!21176 (= e!14388 (tuple2!2507 Nil!260 (_1!1330 lt!29623)))))

(declare-fun b!21178 () Bool)

(declare-fun e!14387 () Bool)

(declare-fun lt!30370 () List!263)

(declare-fun isEmpty!56 (List!263) Bool)

(assert (=> b!21178 (= e!14387 (isEmpty!56 lt!30370))))

(declare-fun d!6748 () Bool)

(assert (=> d!6748 e!14387))

(declare-fun c!1495 () Bool)

(assert (=> d!6748 (= c!1495 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6748 (= lt!30370 (_1!1338 e!14388))))

(declare-fun c!1494 () Bool)

(assert (=> d!6748 (= c!1494 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6748 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6748 (= (bitStreamReadBitsIntoList!0 (_2!1329 lt!29618) (_1!1330 lt!29623) #b0000000000000000000000000000000000000000000000000000000000000001) lt!30370)))

(declare-fun b!21179 () Bool)

(declare-fun length!51 (List!263) Int)

(assert (=> b!21179 (= e!14387 (> (length!51 lt!30370) 0))))

(assert (= (and d!6748 c!1494) b!21176))

(assert (= (and d!6748 (not c!1494)) b!21177))

(assert (= (and d!6748 c!1495) b!21178))

(assert (= (and d!6748 (not c!1495)) b!21179))

(declare-fun m!29229 () Bool)

(assert (=> b!21177 m!29229))

