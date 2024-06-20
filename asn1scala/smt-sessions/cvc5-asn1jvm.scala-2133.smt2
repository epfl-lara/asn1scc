; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54078 () Bool)

(assert start!54078)

(declare-fun res!211007 () Bool)

(declare-fun e!174554 () Bool)

(assert (=> start!54078 (=> (not res!211007) (not e!174554))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!54078 (= res!211007 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54078 e!174554))

(assert (=> start!54078 true))

(declare-datatypes ((array!13702 0))(
  ( (array!13703 (arr!6997 (Array (_ BitVec 32) (_ BitVec 8))) (size!6010 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10942 0))(
  ( (BitStream!10943 (buf!6512 array!13702) (currentByte!11967 (_ BitVec 32)) (currentBit!11962 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10942)

(declare-fun e!174558 () Bool)

(declare-fun inv!12 (BitStream!10942) Bool)

(assert (=> start!54078 (and (inv!12 thiss!1005) e!174558)))

(declare-fun b!251914 () Bool)

(declare-fun e!174559 () Bool)

(declare-fun e!174553 () Bool)

(assert (=> b!251914 (= e!174559 e!174553)))

(declare-fun res!211016 () Bool)

(assert (=> b!251914 (=> (not res!211016) (not e!174553))))

(declare-fun lt!391347 () (_ BitVec 64))

(declare-fun lt!391354 () (_ BitVec 64))

(assert (=> b!251914 (= res!211016 (= lt!391347 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!391354)))))

(declare-datatypes ((Unit!18168 0))(
  ( (Unit!18169) )
))
(declare-datatypes ((tuple2!21630 0))(
  ( (tuple2!21631 (_1!11743 Unit!18168) (_2!11743 BitStream!10942)) )
))
(declare-fun lt!391351 () tuple2!21630)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!251914 (= lt!391347 (bitIndex!0 (size!6010 (buf!6512 (_2!11743 lt!391351))) (currentByte!11967 (_2!11743 lt!391351)) (currentBit!11962 (_2!11743 lt!391351))))))

(assert (=> b!251914 (= lt!391354 (bitIndex!0 (size!6010 (buf!6512 thiss!1005)) (currentByte!11967 thiss!1005) (currentBit!11962 thiss!1005)))))

(declare-fun b!251915 () Bool)

(declare-fun array_inv!5751 (array!13702) Bool)

(assert (=> b!251915 (= e!174558 (array_inv!5751 (buf!6512 thiss!1005)))))

(declare-fun b!251916 () Bool)

(declare-fun res!211015 () Bool)

(assert (=> b!251916 (=> (not res!211015) (not e!174553))))

(declare-fun isPrefixOf!0 (BitStream!10942 BitStream!10942) Bool)

(assert (=> b!251916 (= res!211015 (isPrefixOf!0 thiss!1005 (_2!11743 lt!391351)))))

(declare-fun b!251917 () Bool)

(declare-fun e!174560 () Bool)

(declare-datatypes ((tuple2!21632 0))(
  ( (tuple2!21633 (_1!11744 BitStream!10942) (_2!11744 Bool)) )
))
(declare-fun lt!391358 () tuple2!21632)

(declare-fun lt!391355 () tuple2!21632)

(assert (=> b!251917 (= e!174560 (= (_2!11744 lt!391358) (_2!11744 lt!391355)))))

(declare-fun b!251918 () Bool)

(declare-fun e!174557 () Bool)

(declare-fun lt!391365 () tuple2!21632)

(assert (=> b!251918 (= e!174557 (= (bitIndex!0 (size!6010 (buf!6512 (_1!11744 lt!391365))) (currentByte!11967 (_1!11744 lt!391365)) (currentBit!11962 (_1!11744 lt!391365))) lt!391347))))

(declare-fun b!251919 () Bool)

(declare-fun e!174552 () Bool)

(declare-fun e!174555 () Bool)

(assert (=> b!251919 (= e!174552 e!174555)))

(declare-fun res!211013 () Bool)

(assert (=> b!251919 (=> (not res!211013) (not e!174555))))

(declare-fun lt!391352 () tuple2!21630)

(declare-fun lt!391356 () (_ BitVec 64))

(assert (=> b!251919 (= res!211013 (= (bitIndex!0 (size!6010 (buf!6512 (_2!11743 lt!391352))) (currentByte!11967 (_2!11743 lt!391352)) (currentBit!11962 (_2!11743 lt!391352))) (bvadd (bitIndex!0 (size!6010 (buf!6512 (_2!11743 lt!391351))) (currentByte!11967 (_2!11743 lt!391351)) (currentBit!11962 (_2!11743 lt!391351))) lt!391356)))))

(assert (=> b!251919 (= lt!391356 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!251920 () Bool)

(declare-fun res!211012 () Bool)

(assert (=> b!251920 (=> (not res!211012) (not e!174554))))

(assert (=> b!251920 (= res!211012 (bvslt from!289 nBits!297))))

(declare-fun b!251921 () Bool)

(declare-fun res!211005 () Bool)

(assert (=> b!251921 (=> (not res!211005) (not e!174554))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251921 (= res!211005 (validate_offset_bits!1 ((_ sign_extend 32) (size!6010 (buf!6512 thiss!1005))) ((_ sign_extend 32) (currentByte!11967 thiss!1005)) ((_ sign_extend 32) (currentBit!11962 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!251922 () Bool)

(assert (=> b!251922 (= e!174554 (not (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!391360 () tuple2!21632)

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!21634 0))(
  ( (tuple2!21635 (_1!11745 BitStream!10942) (_2!11745 BitStream!10942)) )
))
(declare-fun lt!391364 () tuple2!21634)

(declare-fun checkBitsLoopPure!0 (BitStream!10942 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21632)

(assert (=> b!251922 (= lt!391360 (checkBitsLoopPure!0 (_1!11745 lt!391364) nBits!297 bit!26 from!289))))

(assert (=> b!251922 (validate_offset_bits!1 ((_ sign_extend 32) (size!6010 (buf!6512 (_2!11743 lt!391352)))) ((_ sign_extend 32) (currentByte!11967 thiss!1005)) ((_ sign_extend 32) (currentBit!11962 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!391348 () Unit!18168)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10942 array!13702 (_ BitVec 64)) Unit!18168)

(assert (=> b!251922 (= lt!391348 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6512 (_2!11743 lt!391352)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10942) tuple2!21632)

(assert (=> b!251922 (= (_2!11744 (readBitPure!0 (_1!11745 lt!391364))) bit!26)))

(declare-fun lt!391361 () tuple2!21634)

(declare-fun reader!0 (BitStream!10942 BitStream!10942) tuple2!21634)

(assert (=> b!251922 (= lt!391361 (reader!0 (_2!11743 lt!391351) (_2!11743 lt!391352)))))

(assert (=> b!251922 (= lt!391364 (reader!0 thiss!1005 (_2!11743 lt!391352)))))

(assert (=> b!251922 e!174560))

(declare-fun res!211008 () Bool)

(assert (=> b!251922 (=> (not res!211008) (not e!174560))))

(assert (=> b!251922 (= res!211008 (= (bitIndex!0 (size!6010 (buf!6512 (_1!11744 lt!391358))) (currentByte!11967 (_1!11744 lt!391358)) (currentBit!11962 (_1!11744 lt!391358))) (bitIndex!0 (size!6010 (buf!6512 (_1!11744 lt!391355))) (currentByte!11967 (_1!11744 lt!391355)) (currentBit!11962 (_1!11744 lt!391355)))))))

(declare-fun lt!391353 () Unit!18168)

(declare-fun lt!391357 () BitStream!10942)

(declare-fun readBitPrefixLemma!0 (BitStream!10942 BitStream!10942) Unit!18168)

(assert (=> b!251922 (= lt!391353 (readBitPrefixLemma!0 lt!391357 (_2!11743 lt!391352)))))

(assert (=> b!251922 (= lt!391355 (readBitPure!0 (BitStream!10943 (buf!6512 (_2!11743 lt!391352)) (currentByte!11967 thiss!1005) (currentBit!11962 thiss!1005))))))

(assert (=> b!251922 (= lt!391358 (readBitPure!0 lt!391357))))

(assert (=> b!251922 (= lt!391357 (BitStream!10943 (buf!6512 (_2!11743 lt!391351)) (currentByte!11967 thiss!1005) (currentBit!11962 thiss!1005)))))

(declare-fun e!174551 () Bool)

(assert (=> b!251922 e!174551))

(declare-fun res!211010 () Bool)

(assert (=> b!251922 (=> (not res!211010) (not e!174551))))

(assert (=> b!251922 (= res!211010 (isPrefixOf!0 thiss!1005 (_2!11743 lt!391352)))))

(declare-fun lt!391362 () Unit!18168)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10942 BitStream!10942 BitStream!10942) Unit!18168)

(assert (=> b!251922 (= lt!391362 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11743 lt!391351) (_2!11743 lt!391352)))))

(assert (=> b!251922 e!174552))

(declare-fun res!211017 () Bool)

(assert (=> b!251922 (=> (not res!211017) (not e!174552))))

(assert (=> b!251922 (= res!211017 (= (size!6010 (buf!6512 (_2!11743 lt!391351))) (size!6010 (buf!6512 (_2!11743 lt!391352)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10942 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21630)

(assert (=> b!251922 (= lt!391352 (appendNBitsLoop!0 (_2!11743 lt!391351) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251922 (validate_offset_bits!1 ((_ sign_extend 32) (size!6010 (buf!6512 (_2!11743 lt!391351)))) ((_ sign_extend 32) (currentByte!11967 (_2!11743 lt!391351))) ((_ sign_extend 32) (currentBit!11962 (_2!11743 lt!391351))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!391359 () Unit!18168)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10942 BitStream!10942 (_ BitVec 64) (_ BitVec 64)) Unit!18168)

(assert (=> b!251922 (= lt!391359 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11743 lt!391351) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!251922 e!174559))

(declare-fun res!211014 () Bool)

(assert (=> b!251922 (=> (not res!211014) (not e!174559))))

(assert (=> b!251922 (= res!211014 (= (size!6010 (buf!6512 thiss!1005)) (size!6010 (buf!6512 (_2!11743 lt!391351)))))))

(declare-fun appendBit!0 (BitStream!10942 Bool) tuple2!21630)

(assert (=> b!251922 (= lt!391351 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!251923 () Bool)

(declare-fun lt!391350 () tuple2!21632)

(declare-fun lt!391363 () tuple2!21634)

(assert (=> b!251923 (= e!174555 (not (or (not (_2!11744 lt!391350)) (not (= (_1!11744 lt!391350) (_2!11745 lt!391363))))))))

(assert (=> b!251923 (= lt!391350 (checkBitsLoopPure!0 (_1!11745 lt!391363) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251923 (validate_offset_bits!1 ((_ sign_extend 32) (size!6010 (buf!6512 (_2!11743 lt!391352)))) ((_ sign_extend 32) (currentByte!11967 (_2!11743 lt!391351))) ((_ sign_extend 32) (currentBit!11962 (_2!11743 lt!391351))) lt!391356)))

(declare-fun lt!391349 () Unit!18168)

(assert (=> b!251923 (= lt!391349 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11743 lt!391351) (buf!6512 (_2!11743 lt!391352)) lt!391356))))

(assert (=> b!251923 (= lt!391363 (reader!0 (_2!11743 lt!391351) (_2!11743 lt!391352)))))

(declare-fun b!251924 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251924 (= e!174551 (invariant!0 (currentBit!11962 thiss!1005) (currentByte!11967 thiss!1005) (size!6010 (buf!6512 (_2!11743 lt!391352)))))))

(declare-fun b!251925 () Bool)

(declare-fun res!211006 () Bool)

(assert (=> b!251925 (=> (not res!211006) (not e!174555))))

(assert (=> b!251925 (= res!211006 (isPrefixOf!0 (_2!11743 lt!391351) (_2!11743 lt!391352)))))

(declare-fun b!251926 () Bool)

(assert (=> b!251926 (= e!174553 e!174557)))

(declare-fun res!211009 () Bool)

(assert (=> b!251926 (=> (not res!211009) (not e!174557))))

(assert (=> b!251926 (= res!211009 (and (= (_2!11744 lt!391365) bit!26) (= (_1!11744 lt!391365) (_2!11743 lt!391351))))))

(declare-fun readerFrom!0 (BitStream!10942 (_ BitVec 32) (_ BitVec 32)) BitStream!10942)

(assert (=> b!251926 (= lt!391365 (readBitPure!0 (readerFrom!0 (_2!11743 lt!391351) (currentBit!11962 thiss!1005) (currentByte!11967 thiss!1005))))))

(declare-fun b!251927 () Bool)

(declare-fun res!211011 () Bool)

(assert (=> b!251927 (=> (not res!211011) (not e!174551))))

(assert (=> b!251927 (= res!211011 (invariant!0 (currentBit!11962 thiss!1005) (currentByte!11967 thiss!1005) (size!6010 (buf!6512 (_2!11743 lt!391351)))))))

(assert (= (and start!54078 res!211007) b!251921))

(assert (= (and b!251921 res!211005) b!251920))

(assert (= (and b!251920 res!211012) b!251922))

(assert (= (and b!251922 res!211014) b!251914))

(assert (= (and b!251914 res!211016) b!251916))

(assert (= (and b!251916 res!211015) b!251926))

(assert (= (and b!251926 res!211009) b!251918))

(assert (= (and b!251922 res!211017) b!251919))

(assert (= (and b!251919 res!211013) b!251925))

(assert (= (and b!251925 res!211006) b!251923))

(assert (= (and b!251922 res!211010) b!251927))

(assert (= (and b!251927 res!211011) b!251924))

(assert (= (and b!251922 res!211008) b!251917))

(assert (= start!54078 b!251915))

(declare-fun m!378987 () Bool)

(assert (=> b!251915 m!378987))

(declare-fun m!378989 () Bool)

(assert (=> b!251925 m!378989))

(declare-fun m!378991 () Bool)

(assert (=> b!251918 m!378991))

(declare-fun m!378993 () Bool)

(assert (=> b!251924 m!378993))

(declare-fun m!378995 () Bool)

(assert (=> b!251923 m!378995))

(declare-fun m!378997 () Bool)

(assert (=> b!251923 m!378997))

(declare-fun m!378999 () Bool)

(assert (=> b!251923 m!378999))

(declare-fun m!379001 () Bool)

(assert (=> b!251923 m!379001))

(declare-fun m!379003 () Bool)

(assert (=> b!251922 m!379003))

(declare-fun m!379005 () Bool)

(assert (=> b!251922 m!379005))

(declare-fun m!379007 () Bool)

(assert (=> b!251922 m!379007))

(declare-fun m!379009 () Bool)

(assert (=> b!251922 m!379009))

(declare-fun m!379011 () Bool)

(assert (=> b!251922 m!379011))

(declare-fun m!379013 () Bool)

(assert (=> b!251922 m!379013))

(declare-fun m!379015 () Bool)

(assert (=> b!251922 m!379015))

(declare-fun m!379017 () Bool)

(assert (=> b!251922 m!379017))

(declare-fun m!379019 () Bool)

(assert (=> b!251922 m!379019))

(declare-fun m!379021 () Bool)

(assert (=> b!251922 m!379021))

(declare-fun m!379023 () Bool)

(assert (=> b!251922 m!379023))

(declare-fun m!379025 () Bool)

(assert (=> b!251922 m!379025))

(assert (=> b!251922 m!379001))

(declare-fun m!379027 () Bool)

(assert (=> b!251922 m!379027))

(declare-fun m!379029 () Bool)

(assert (=> b!251922 m!379029))

(declare-fun m!379031 () Bool)

(assert (=> b!251922 m!379031))

(declare-fun m!379033 () Bool)

(assert (=> b!251922 m!379033))

(declare-fun m!379035 () Bool)

(assert (=> b!251926 m!379035))

(assert (=> b!251926 m!379035))

(declare-fun m!379037 () Bool)

(assert (=> b!251926 m!379037))

(declare-fun m!379039 () Bool)

(assert (=> b!251914 m!379039))

(declare-fun m!379041 () Bool)

(assert (=> b!251914 m!379041))

(declare-fun m!379043 () Bool)

(assert (=> start!54078 m!379043))

(declare-fun m!379045 () Bool)

(assert (=> b!251927 m!379045))

(declare-fun m!379047 () Bool)

(assert (=> b!251919 m!379047))

(assert (=> b!251919 m!379039))

(declare-fun m!379049 () Bool)

(assert (=> b!251921 m!379049))

(declare-fun m!379051 () Bool)

(assert (=> b!251916 m!379051))

(push 1)

(assert (not b!251916))

(assert (not b!251918))

(assert (not b!251914))

(assert (not b!251921))

(assert (not b!251927))

(assert (not b!251915))

(assert (not b!251926))

(assert (not start!54078))

(assert (not b!251924))

(assert (not b!251923))

(assert (not b!251919))

(assert (not b!251925))

(assert (not b!251922))

(check-sat)

(pop 1)

(push 1)

(check-sat)

