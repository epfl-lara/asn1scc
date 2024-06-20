; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52616 () Bool)

(assert start!52616)

(declare-fun b!243064 () Bool)

(declare-fun res!203041 () Bool)

(declare-fun e!168485 () Bool)

(assert (=> b!243064 (=> (not res!203041) (not e!168485))))

(declare-datatypes ((array!13328 0))(
  ( (array!13329 (arr!6829 (Array (_ BitVec 32) (_ BitVec 8))) (size!5842 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10606 0))(
  ( (BitStream!10607 (buf!6311 array!13328) (currentByte!11683 (_ BitVec 32)) (currentBit!11678 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17773 0))(
  ( (Unit!17774) )
))
(declare-datatypes ((tuple2!20808 0))(
  ( (tuple2!20809 (_1!11326 Unit!17773) (_2!11326 BitStream!10606)) )
))
(declare-fun lt!378890 () tuple2!20808)

(declare-fun lt!378887 () tuple2!20808)

(declare-fun isPrefixOf!0 (BitStream!10606 BitStream!10606) Bool)

(assert (=> b!243064 (= res!203041 (isPrefixOf!0 (_2!11326 lt!378890) (_2!11326 lt!378887)))))

(declare-fun b!243065 () Bool)

(declare-fun e!168489 () Bool)

(declare-fun e!168482 () Bool)

(assert (=> b!243065 (= e!168489 e!168482)))

(declare-fun res!203038 () Bool)

(assert (=> b!243065 (=> (not res!203038) (not e!168482))))

(declare-datatypes ((tuple2!20810 0))(
  ( (tuple2!20811 (_1!11327 BitStream!10606) (_2!11327 Bool)) )
))
(declare-fun lt!378894 () tuple2!20810)

(declare-fun bit!26 () Bool)

(assert (=> b!243065 (= res!203038 (and (= (_2!11327 lt!378894) bit!26) (= (_1!11327 lt!378894) (_2!11326 lt!378890))))))

(declare-fun thiss!1005 () BitStream!10606)

(declare-fun readBitPure!0 (BitStream!10606) tuple2!20810)

(declare-fun readerFrom!0 (BitStream!10606 (_ BitVec 32) (_ BitVec 32)) BitStream!10606)

(assert (=> b!243065 (= lt!378894 (readBitPure!0 (readerFrom!0 (_2!11326 lt!378890) (currentBit!11678 thiss!1005) (currentByte!11683 thiss!1005))))))

(declare-fun b!243066 () Bool)

(declare-fun lt!378891 () tuple2!20810)

(declare-datatypes ((tuple2!20812 0))(
  ( (tuple2!20813 (_1!11328 BitStream!10606) (_2!11328 BitStream!10606)) )
))
(declare-fun lt!378888 () tuple2!20812)

(assert (=> b!243066 (= e!168485 (not (or (not (_2!11327 lt!378891)) (not (= (_1!11327 lt!378891) (_2!11328 lt!378888))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10606 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20810)

(assert (=> b!243066 (= lt!378891 (checkBitsLoopPure!0 (_1!11328 lt!378888) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!378897 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243066 (validate_offset_bits!1 ((_ sign_extend 32) (size!5842 (buf!6311 (_2!11326 lt!378887)))) ((_ sign_extend 32) (currentByte!11683 (_2!11326 lt!378890))) ((_ sign_extend 32) (currentBit!11678 (_2!11326 lt!378890))) lt!378897)))

(declare-fun lt!378884 () Unit!17773)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10606 array!13328 (_ BitVec 64)) Unit!17773)

(assert (=> b!243066 (= lt!378884 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11326 lt!378890) (buf!6311 (_2!11326 lt!378887)) lt!378897))))

(declare-fun reader!0 (BitStream!10606 BitStream!10606) tuple2!20812)

(assert (=> b!243066 (= lt!378888 (reader!0 (_2!11326 lt!378890) (_2!11326 lt!378887)))))

(declare-fun b!243067 () Bool)

(declare-fun res!203045 () Bool)

(declare-fun e!168483 () Bool)

(assert (=> b!243067 (=> (not res!203045) (not e!168483))))

(assert (=> b!243067 (= res!203045 (bvslt from!289 nBits!297))))

(declare-fun b!243068 () Bool)

(declare-fun res!203039 () Bool)

(declare-fun e!168490 () Bool)

(assert (=> b!243068 (=> (not res!203039) (not e!168490))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243068 (= res!203039 (invariant!0 (currentBit!11678 thiss!1005) (currentByte!11683 thiss!1005) (size!5842 (buf!6311 (_2!11326 lt!378890)))))))

(declare-fun b!243069 () Bool)

(declare-fun res!203035 () Bool)

(assert (=> b!243069 (=> (not res!203035) (not e!168489))))

(assert (=> b!243069 (= res!203035 (isPrefixOf!0 thiss!1005 (_2!11326 lt!378890)))))

(declare-fun b!243070 () Bool)

(assert (=> b!243070 (= e!168483 (not true))))

(declare-fun lt!378886 () tuple2!20812)

(assert (=> b!243070 (= (_2!11327 (readBitPure!0 (_1!11328 lt!378886))) bit!26)))

(declare-fun lt!378885 () tuple2!20812)

(assert (=> b!243070 (= lt!378885 (reader!0 (_2!11326 lt!378890) (_2!11326 lt!378887)))))

(assert (=> b!243070 (= lt!378886 (reader!0 thiss!1005 (_2!11326 lt!378887)))))

(declare-fun e!168488 () Bool)

(assert (=> b!243070 e!168488))

(declare-fun res!203034 () Bool)

(assert (=> b!243070 (=> (not res!203034) (not e!168488))))

(declare-fun lt!378881 () tuple2!20810)

(declare-fun lt!378896 () tuple2!20810)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!243070 (= res!203034 (= (bitIndex!0 (size!5842 (buf!6311 (_1!11327 lt!378881))) (currentByte!11683 (_1!11327 lt!378881)) (currentBit!11678 (_1!11327 lt!378881))) (bitIndex!0 (size!5842 (buf!6311 (_1!11327 lt!378896))) (currentByte!11683 (_1!11327 lt!378896)) (currentBit!11678 (_1!11327 lt!378896)))))))

(declare-fun lt!378883 () Unit!17773)

(declare-fun lt!378893 () BitStream!10606)

(declare-fun readBitPrefixLemma!0 (BitStream!10606 BitStream!10606) Unit!17773)

(assert (=> b!243070 (= lt!378883 (readBitPrefixLemma!0 lt!378893 (_2!11326 lt!378887)))))

(assert (=> b!243070 (= lt!378896 (readBitPure!0 (BitStream!10607 (buf!6311 (_2!11326 lt!378887)) (currentByte!11683 thiss!1005) (currentBit!11678 thiss!1005))))))

(assert (=> b!243070 (= lt!378881 (readBitPure!0 lt!378893))))

(assert (=> b!243070 (= lt!378893 (BitStream!10607 (buf!6311 (_2!11326 lt!378890)) (currentByte!11683 thiss!1005) (currentBit!11678 thiss!1005)))))

(assert (=> b!243070 e!168490))

(declare-fun res!203043 () Bool)

(assert (=> b!243070 (=> (not res!203043) (not e!168490))))

(assert (=> b!243070 (= res!203043 (isPrefixOf!0 thiss!1005 (_2!11326 lt!378887)))))

(declare-fun lt!378889 () Unit!17773)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10606 BitStream!10606 BitStream!10606) Unit!17773)

(assert (=> b!243070 (= lt!378889 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11326 lt!378890) (_2!11326 lt!378887)))))

(declare-fun e!168484 () Bool)

(assert (=> b!243070 e!168484))

(declare-fun res!203042 () Bool)

(assert (=> b!243070 (=> (not res!203042) (not e!168484))))

(assert (=> b!243070 (= res!203042 (= (size!5842 (buf!6311 (_2!11326 lt!378890))) (size!5842 (buf!6311 (_2!11326 lt!378887)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10606 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20808)

(assert (=> b!243070 (= lt!378887 (appendNBitsLoop!0 (_2!11326 lt!378890) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243070 (validate_offset_bits!1 ((_ sign_extend 32) (size!5842 (buf!6311 (_2!11326 lt!378890)))) ((_ sign_extend 32) (currentByte!11683 (_2!11326 lt!378890))) ((_ sign_extend 32) (currentBit!11678 (_2!11326 lt!378890))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!378892 () Unit!17773)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10606 BitStream!10606 (_ BitVec 64) (_ BitVec 64)) Unit!17773)

(assert (=> b!243070 (= lt!378892 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11326 lt!378890) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!168486 () Bool)

(assert (=> b!243070 e!168486))

(declare-fun res!203044 () Bool)

(assert (=> b!243070 (=> (not res!203044) (not e!168486))))

(assert (=> b!243070 (= res!203044 (= (size!5842 (buf!6311 thiss!1005)) (size!5842 (buf!6311 (_2!11326 lt!378890)))))))

(declare-fun appendBit!0 (BitStream!10606 Bool) tuple2!20808)

(assert (=> b!243070 (= lt!378890 (appendBit!0 thiss!1005 bit!26))))

(declare-fun res!203037 () Bool)

(assert (=> start!52616 (=> (not res!203037) (not e!168483))))

(assert (=> start!52616 (= res!203037 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52616 e!168483))

(assert (=> start!52616 true))

(declare-fun e!168491 () Bool)

(declare-fun inv!12 (BitStream!10606) Bool)

(assert (=> start!52616 (and (inv!12 thiss!1005) e!168491)))

(declare-fun b!243071 () Bool)

(assert (=> b!243071 (= e!168490 (invariant!0 (currentBit!11678 thiss!1005) (currentByte!11683 thiss!1005) (size!5842 (buf!6311 (_2!11326 lt!378887)))))))

(declare-fun b!243072 () Bool)

(assert (=> b!243072 (= e!168488 (= (_2!11327 lt!378881) (_2!11327 lt!378896)))))

(declare-fun b!243073 () Bool)

(declare-fun array_inv!5583 (array!13328) Bool)

(assert (=> b!243073 (= e!168491 (array_inv!5583 (buf!6311 thiss!1005)))))

(declare-fun b!243074 () Bool)

(declare-fun lt!378882 () (_ BitVec 64))

(assert (=> b!243074 (= e!168482 (= (bitIndex!0 (size!5842 (buf!6311 (_1!11327 lt!378894))) (currentByte!11683 (_1!11327 lt!378894)) (currentBit!11678 (_1!11327 lt!378894))) lt!378882))))

(declare-fun b!243075 () Bool)

(assert (=> b!243075 (= e!168484 e!168485)))

(declare-fun res!203046 () Bool)

(assert (=> b!243075 (=> (not res!203046) (not e!168485))))

(assert (=> b!243075 (= res!203046 (= (bitIndex!0 (size!5842 (buf!6311 (_2!11326 lt!378887))) (currentByte!11683 (_2!11326 lt!378887)) (currentBit!11678 (_2!11326 lt!378887))) (bvadd (bitIndex!0 (size!5842 (buf!6311 (_2!11326 lt!378890))) (currentByte!11683 (_2!11326 lt!378890)) (currentBit!11678 (_2!11326 lt!378890))) lt!378897)))))

(assert (=> b!243075 (= lt!378897 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!243076 () Bool)

(assert (=> b!243076 (= e!168486 e!168489)))

(declare-fun res!203040 () Bool)

(assert (=> b!243076 (=> (not res!203040) (not e!168489))))

(declare-fun lt!378895 () (_ BitVec 64))

(assert (=> b!243076 (= res!203040 (= lt!378882 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!378895)))))

(assert (=> b!243076 (= lt!378882 (bitIndex!0 (size!5842 (buf!6311 (_2!11326 lt!378890))) (currentByte!11683 (_2!11326 lt!378890)) (currentBit!11678 (_2!11326 lt!378890))))))

(assert (=> b!243076 (= lt!378895 (bitIndex!0 (size!5842 (buf!6311 thiss!1005)) (currentByte!11683 thiss!1005) (currentBit!11678 thiss!1005)))))

(declare-fun b!243077 () Bool)

(declare-fun res!203036 () Bool)

(assert (=> b!243077 (=> (not res!203036) (not e!168483))))

(assert (=> b!243077 (= res!203036 (validate_offset_bits!1 ((_ sign_extend 32) (size!5842 (buf!6311 thiss!1005))) ((_ sign_extend 32) (currentByte!11683 thiss!1005)) ((_ sign_extend 32) (currentBit!11678 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!52616 res!203037) b!243077))

(assert (= (and b!243077 res!203036) b!243067))

(assert (= (and b!243067 res!203045) b!243070))

(assert (= (and b!243070 res!203044) b!243076))

(assert (= (and b!243076 res!203040) b!243069))

(assert (= (and b!243069 res!203035) b!243065))

(assert (= (and b!243065 res!203038) b!243074))

(assert (= (and b!243070 res!203042) b!243075))

(assert (= (and b!243075 res!203046) b!243064))

(assert (= (and b!243064 res!203041) b!243066))

(assert (= (and b!243070 res!203043) b!243068))

(assert (= (and b!243068 res!203039) b!243071))

(assert (= (and b!243070 res!203034) b!243072))

(assert (= start!52616 b!243073))

(declare-fun m!366233 () Bool)

(assert (=> b!243064 m!366233))

(declare-fun m!366235 () Bool)

(assert (=> b!243073 m!366235))

(declare-fun m!366237 () Bool)

(assert (=> b!243075 m!366237))

(declare-fun m!366239 () Bool)

(assert (=> b!243075 m!366239))

(declare-fun m!366241 () Bool)

(assert (=> b!243077 m!366241))

(declare-fun m!366243 () Bool)

(assert (=> start!52616 m!366243))

(declare-fun m!366245 () Bool)

(assert (=> b!243071 m!366245))

(declare-fun m!366247 () Bool)

(assert (=> b!243066 m!366247))

(declare-fun m!366249 () Bool)

(assert (=> b!243066 m!366249))

(declare-fun m!366251 () Bool)

(assert (=> b!243066 m!366251))

(declare-fun m!366253 () Bool)

(assert (=> b!243066 m!366253))

(declare-fun m!366255 () Bool)

(assert (=> b!243070 m!366255))

(declare-fun m!366257 () Bool)

(assert (=> b!243070 m!366257))

(declare-fun m!366259 () Bool)

(assert (=> b!243070 m!366259))

(declare-fun m!366261 () Bool)

(assert (=> b!243070 m!366261))

(declare-fun m!366263 () Bool)

(assert (=> b!243070 m!366263))

(declare-fun m!366265 () Bool)

(assert (=> b!243070 m!366265))

(declare-fun m!366267 () Bool)

(assert (=> b!243070 m!366267))

(declare-fun m!366269 () Bool)

(assert (=> b!243070 m!366269))

(declare-fun m!366271 () Bool)

(assert (=> b!243070 m!366271))

(assert (=> b!243070 m!366253))

(declare-fun m!366273 () Bool)

(assert (=> b!243070 m!366273))

(declare-fun m!366275 () Bool)

(assert (=> b!243070 m!366275))

(declare-fun m!366277 () Bool)

(assert (=> b!243070 m!366277))

(declare-fun m!366279 () Bool)

(assert (=> b!243070 m!366279))

(declare-fun m!366281 () Bool)

(assert (=> b!243074 m!366281))

(declare-fun m!366283 () Bool)

(assert (=> b!243068 m!366283))

(declare-fun m!366285 () Bool)

(assert (=> b!243065 m!366285))

(assert (=> b!243065 m!366285))

(declare-fun m!366287 () Bool)

(assert (=> b!243065 m!366287))

(assert (=> b!243076 m!366239))

(declare-fun m!366289 () Bool)

(assert (=> b!243076 m!366289))

(declare-fun m!366291 () Bool)

(assert (=> b!243069 m!366291))

(push 1)

(assert (not b!243065))

(assert (not b!243076))

(assert (not b!243068))

(assert (not b!243074))

(assert (not b!243070))

(assert (not start!52616))

(assert (not b!243075))

(assert (not b!243077))

(assert (not b!243071))

(assert (not b!243064))

(assert (not b!243069))

(assert (not b!243066))

(assert (not b!243073))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

