; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43638 () Bool)

(assert start!43638)

(declare-fun i!590 () (_ BitVec 32))

(declare-fun e!141678 () Bool)

(declare-fun b!207257 () Bool)

(declare-datatypes ((array!10421 0))(
  ( (array!10422 (arr!5512 (Array (_ BitVec 32) (_ BitVec 8))) (size!4582 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8272 0))(
  ( (BitStream!8273 (buf!5087 array!10421) (currentByte!9605 (_ BitVec 32)) (currentBit!9600 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14758 0))(
  ( (Unit!14759) )
))
(declare-datatypes ((tuple2!17762 0))(
  ( (tuple2!17763 (_1!9536 Unit!14758) (_2!9536 BitStream!8272)) )
))
(declare-fun lt!323538 () tuple2!17762)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!323523 () tuple2!17762)

(assert (=> b!207257 (= e!141678 (or (not (= (size!4582 (buf!5087 (_2!9536 lt!323523))) (size!4582 (buf!5087 (_2!9536 lt!323538))))) (bvsge ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-datatypes ((tuple2!17764 0))(
  ( (tuple2!17765 (_1!9537 BitStream!8272) (_2!9537 BitStream!8272)) )
))
(declare-fun lt!323532 () tuple2!17764)

(declare-datatypes ((tuple2!17766 0))(
  ( (tuple2!17767 (_1!9538 BitStream!8272) (_2!9538 (_ BitVec 64))) )
))
(declare-fun lt!323526 () tuple2!17766)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17766)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207257 (= lt!323526 (readNBitsLSBFirstsLoopPure!0 (_1!9537 lt!323532) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun thiss!1204 () BitStream!8272)

(declare-fun lt!323522 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!207257 (validate_offset_bits!1 ((_ sign_extend 32) (size!4582 (buf!5087 (_2!9536 lt!323538)))) ((_ sign_extend 32) (currentByte!9605 thiss!1204)) ((_ sign_extend 32) (currentBit!9600 thiss!1204)) lt!323522)))

(declare-fun lt!323535 () Unit!14758)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8272 array!10421 (_ BitVec 64)) Unit!14758)

(assert (=> b!207257 (= lt!323535 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5087 (_2!9536 lt!323538)) lt!323522))))

(declare-fun lt!323524 () Bool)

(declare-datatypes ((tuple2!17768 0))(
  ( (tuple2!17769 (_1!9539 BitStream!8272) (_2!9539 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!8272) tuple2!17768)

(assert (=> b!207257 (= (_2!9539 (readBitPure!0 (_1!9537 lt!323532))) lt!323524)))

(declare-fun lt!323536 () tuple2!17764)

(declare-fun reader!0 (BitStream!8272 BitStream!8272) tuple2!17764)

(assert (=> b!207257 (= lt!323536 (reader!0 (_2!9536 lt!323523) (_2!9536 lt!323538)))))

(assert (=> b!207257 (= lt!323532 (reader!0 thiss!1204 (_2!9536 lt!323538)))))

(declare-fun e!141682 () Bool)

(assert (=> b!207257 e!141682))

(declare-fun res!173875 () Bool)

(assert (=> b!207257 (=> (not res!173875) (not e!141682))))

(declare-fun lt!323539 () tuple2!17768)

(declare-fun lt!323534 () tuple2!17768)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207257 (= res!173875 (= (bitIndex!0 (size!4582 (buf!5087 (_1!9539 lt!323539))) (currentByte!9605 (_1!9539 lt!323539)) (currentBit!9600 (_1!9539 lt!323539))) (bitIndex!0 (size!4582 (buf!5087 (_1!9539 lt!323534))) (currentByte!9605 (_1!9539 lt!323534)) (currentBit!9600 (_1!9539 lt!323534)))))))

(declare-fun lt!323533 () Unit!14758)

(declare-fun lt!323528 () BitStream!8272)

(declare-fun readBitPrefixLemma!0 (BitStream!8272 BitStream!8272) Unit!14758)

(assert (=> b!207257 (= lt!323533 (readBitPrefixLemma!0 lt!323528 (_2!9536 lt!323538)))))

(assert (=> b!207257 (= lt!323534 (readBitPure!0 (BitStream!8273 (buf!5087 (_2!9536 lt!323538)) (currentByte!9605 thiss!1204) (currentBit!9600 thiss!1204))))))

(assert (=> b!207257 (= lt!323539 (readBitPure!0 lt!323528))))

(declare-fun e!141683 () Bool)

(assert (=> b!207257 e!141683))

(declare-fun res!173873 () Bool)

(assert (=> b!207257 (=> (not res!173873) (not e!141683))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!207257 (= res!173873 (invariant!0 (currentBit!9600 thiss!1204) (currentByte!9605 thiss!1204) (size!4582 (buf!5087 (_2!9536 lt!323523)))))))

(assert (=> b!207257 (= lt!323528 (BitStream!8273 (buf!5087 (_2!9536 lt!323523)) (currentByte!9605 thiss!1204) (currentBit!9600 thiss!1204)))))

(declare-fun b!207258 () Bool)

(declare-fun e!141674 () Bool)

(declare-fun array_inv!4323 (array!10421) Bool)

(assert (=> b!207258 (= e!141674 (array_inv!4323 (buf!5087 thiss!1204)))))

(declare-fun b!207259 () Bool)

(declare-fun res!173876 () Bool)

(assert (=> b!207259 (=> res!173876 e!141678)))

(declare-fun isPrefixOf!0 (BitStream!8272 BitStream!8272) Bool)

(assert (=> b!207259 (= res!173876 (not (isPrefixOf!0 (_2!9536 lt!323523) (_2!9536 lt!323538))))))

(declare-fun b!207260 () Bool)

(declare-fun e!141675 () Bool)

(declare-fun e!141684 () Bool)

(assert (=> b!207260 (= e!141675 (not e!141684))))

(declare-fun res!173879 () Bool)

(assert (=> b!207260 (=> res!173879 e!141684)))

(declare-fun lt!323530 () (_ BitVec 64))

(declare-fun lt!323529 () (_ BitVec 64))

(assert (=> b!207260 (= res!173879 (not (= lt!323530 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323529))))))

(assert (=> b!207260 (= lt!323530 (bitIndex!0 (size!4582 (buf!5087 (_2!9536 lt!323523))) (currentByte!9605 (_2!9536 lt!323523)) (currentBit!9600 (_2!9536 lt!323523))))))

(assert (=> b!207260 (= lt!323529 (bitIndex!0 (size!4582 (buf!5087 thiss!1204)) (currentByte!9605 thiss!1204) (currentBit!9600 thiss!1204)))))

(declare-fun e!141679 () Bool)

(assert (=> b!207260 e!141679))

(declare-fun res!173872 () Bool)

(assert (=> b!207260 (=> (not res!173872) (not e!141679))))

(assert (=> b!207260 (= res!173872 (= (size!4582 (buf!5087 thiss!1204)) (size!4582 (buf!5087 (_2!9536 lt!323523)))))))

(declare-fun appendBit!0 (BitStream!8272 Bool) tuple2!17762)

(assert (=> b!207260 (= lt!323523 (appendBit!0 thiss!1204 lt!323524))))

(assert (=> b!207260 (= lt!323524 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!207261 () Bool)

(declare-fun res!173871 () Bool)

(assert (=> b!207261 (=> (not res!173871) (not e!141675))))

(assert (=> b!207261 (= res!173871 (invariant!0 (currentBit!9600 thiss!1204) (currentByte!9605 thiss!1204) (size!4582 (buf!5087 thiss!1204))))))

(declare-fun b!207262 () Bool)

(declare-fun res!173870 () Bool)

(assert (=> b!207262 (=> res!173870 e!141678)))

(declare-fun lt!323540 () (_ BitVec 64))

(assert (=> b!207262 (= res!173870 (or (not (= (size!4582 (buf!5087 (_2!9536 lt!323538))) (size!4582 (buf!5087 thiss!1204)))) (not (= lt!323540 (bvsub (bvadd lt!323529 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!207263 () Bool)

(declare-fun e!141676 () Bool)

(declare-fun lt!323525 () tuple2!17768)

(declare-fun lt!323531 () (_ BitVec 64))

(assert (=> b!207263 (= e!141676 (= (bitIndex!0 (size!4582 (buf!5087 (_1!9539 lt!323525))) (currentByte!9605 (_1!9539 lt!323525)) (currentBit!9600 (_1!9539 lt!323525))) lt!323531))))

(declare-fun b!207264 () Bool)

(assert (=> b!207264 (= e!141682 (= (_2!9539 lt!323539) (_2!9539 lt!323534)))))

(declare-fun b!207265 () Bool)

(declare-fun res!173867 () Bool)

(assert (=> b!207265 (=> res!173867 e!141678)))

(assert (=> b!207265 (= res!173867 (not (invariant!0 (currentBit!9600 (_2!9536 lt!323538)) (currentByte!9605 (_2!9536 lt!323538)) (size!4582 (buf!5087 (_2!9536 lt!323538))))))))

(declare-fun b!207266 () Bool)

(declare-fun res!173877 () Bool)

(assert (=> b!207266 (=> (not res!173877) (not e!141675))))

(assert (=> b!207266 (= res!173877 (not (= i!590 nBits!348)))))

(declare-fun b!207267 () Bool)

(declare-fun res!173868 () Bool)

(declare-fun e!141680 () Bool)

(assert (=> b!207267 (=> (not res!173868) (not e!141680))))

(assert (=> b!207267 (= res!173868 (isPrefixOf!0 thiss!1204 (_2!9536 lt!323523)))))

(declare-fun res!173878 () Bool)

(declare-fun e!141677 () Bool)

(assert (=> start!43638 (=> (not res!173878) (not e!141677))))

(assert (=> start!43638 (= res!173878 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43638 e!141677))

(assert (=> start!43638 true))

(declare-fun inv!12 (BitStream!8272) Bool)

(assert (=> start!43638 (and (inv!12 thiss!1204) e!141674)))

(declare-fun b!207268 () Bool)

(assert (=> b!207268 (= e!141680 e!141676)))

(declare-fun res!173880 () Bool)

(assert (=> b!207268 (=> (not res!173880) (not e!141676))))

(assert (=> b!207268 (= res!173880 (and (= (_2!9539 lt!323525) lt!323524) (= (_1!9539 lt!323525) (_2!9536 lt!323523))))))

(declare-fun readerFrom!0 (BitStream!8272 (_ BitVec 32) (_ BitVec 32)) BitStream!8272)

(assert (=> b!207268 (= lt!323525 (readBitPure!0 (readerFrom!0 (_2!9536 lt!323523) (currentBit!9600 thiss!1204) (currentByte!9605 thiss!1204))))))

(declare-fun b!207269 () Bool)

(declare-fun res!173881 () Bool)

(assert (=> b!207269 (=> res!173881 e!141678)))

(assert (=> b!207269 (= res!173881 (not (isPrefixOf!0 thiss!1204 (_2!9536 lt!323523))))))

(declare-fun b!207270 () Bool)

(assert (=> b!207270 (= e!141677 e!141675)))

(declare-fun res!173874 () Bool)

(assert (=> b!207270 (=> (not res!173874) (not e!141675))))

(assert (=> b!207270 (= res!173874 (validate_offset_bits!1 ((_ sign_extend 32) (size!4582 (buf!5087 thiss!1204))) ((_ sign_extend 32) (currentByte!9605 thiss!1204)) ((_ sign_extend 32) (currentBit!9600 thiss!1204)) lt!323522))))

(assert (=> b!207270 (= lt!323522 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!207271 () Bool)

(assert (=> b!207271 (= e!141683 (invariant!0 (currentBit!9600 thiss!1204) (currentByte!9605 thiss!1204) (size!4582 (buf!5087 (_2!9536 lt!323538)))))))

(declare-fun b!207272 () Bool)

(assert (=> b!207272 (= e!141684 e!141678)))

(declare-fun res!173882 () Bool)

(assert (=> b!207272 (=> res!173882 e!141678)))

(assert (=> b!207272 (= res!173882 (not (= lt!323540 (bvsub (bvsub (bvadd lt!323530 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!207272 (= lt!323540 (bitIndex!0 (size!4582 (buf!5087 (_2!9536 lt!323538))) (currentByte!9605 (_2!9536 lt!323538)) (currentBit!9600 (_2!9536 lt!323538))))))

(assert (=> b!207272 (isPrefixOf!0 thiss!1204 (_2!9536 lt!323538))))

(declare-fun lt!323527 () Unit!14758)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8272 BitStream!8272 BitStream!8272) Unit!14758)

(assert (=> b!207272 (= lt!323527 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9536 lt!323523) (_2!9536 lt!323538)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8272 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17762)

(assert (=> b!207272 (= lt!323538 (appendBitsLSBFirstLoopTR!0 (_2!9536 lt!323523) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!207273 () Bool)

(assert (=> b!207273 (= e!141679 e!141680)))

(declare-fun res!173869 () Bool)

(assert (=> b!207273 (=> (not res!173869) (not e!141680))))

(declare-fun lt!323537 () (_ BitVec 64))

(assert (=> b!207273 (= res!173869 (= lt!323531 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323537)))))

(assert (=> b!207273 (= lt!323531 (bitIndex!0 (size!4582 (buf!5087 (_2!9536 lt!323523))) (currentByte!9605 (_2!9536 lt!323523)) (currentBit!9600 (_2!9536 lt!323523))))))

(assert (=> b!207273 (= lt!323537 (bitIndex!0 (size!4582 (buf!5087 thiss!1204)) (currentByte!9605 thiss!1204) (currentBit!9600 thiss!1204)))))

(assert (= (and start!43638 res!173878) b!207270))

(assert (= (and b!207270 res!173874) b!207261))

(assert (= (and b!207261 res!173871) b!207266))

(assert (= (and b!207266 res!173877) b!207260))

(assert (= (and b!207260 res!173872) b!207273))

(assert (= (and b!207273 res!173869) b!207267))

(assert (= (and b!207267 res!173868) b!207268))

(assert (= (and b!207268 res!173880) b!207263))

(assert (= (and b!207260 (not res!173879)) b!207272))

(assert (= (and b!207272 (not res!173882)) b!207265))

(assert (= (and b!207265 (not res!173867)) b!207262))

(assert (= (and b!207262 (not res!173870)) b!207259))

(assert (= (and b!207259 (not res!173876)) b!207269))

(assert (= (and b!207269 (not res!173881)) b!207257))

(assert (= (and b!207257 res!173873) b!207271))

(assert (= (and b!207257 res!173875) b!207264))

(assert (= start!43638 b!207258))

(declare-fun m!318963 () Bool)

(assert (=> b!207268 m!318963))

(assert (=> b!207268 m!318963))

(declare-fun m!318965 () Bool)

(assert (=> b!207268 m!318965))

(declare-fun m!318967 () Bool)

(assert (=> b!207269 m!318967))

(declare-fun m!318969 () Bool)

(assert (=> b!207257 m!318969))

(declare-fun m!318971 () Bool)

(assert (=> b!207257 m!318971))

(declare-fun m!318973 () Bool)

(assert (=> b!207257 m!318973))

(declare-fun m!318975 () Bool)

(assert (=> b!207257 m!318975))

(declare-fun m!318977 () Bool)

(assert (=> b!207257 m!318977))

(declare-fun m!318979 () Bool)

(assert (=> b!207257 m!318979))

(declare-fun m!318981 () Bool)

(assert (=> b!207257 m!318981))

(declare-fun m!318983 () Bool)

(assert (=> b!207257 m!318983))

(declare-fun m!318985 () Bool)

(assert (=> b!207257 m!318985))

(declare-fun m!318987 () Bool)

(assert (=> b!207257 m!318987))

(declare-fun m!318989 () Bool)

(assert (=> b!207257 m!318989))

(declare-fun m!318991 () Bool)

(assert (=> b!207257 m!318991))

(declare-fun m!318993 () Bool)

(assert (=> b!207257 m!318993))

(declare-fun m!318995 () Bool)

(assert (=> b!207259 m!318995))

(declare-fun m!318997 () Bool)

(assert (=> b!207258 m!318997))

(declare-fun m!318999 () Bool)

(assert (=> b!207260 m!318999))

(declare-fun m!319001 () Bool)

(assert (=> b!207260 m!319001))

(declare-fun m!319003 () Bool)

(assert (=> b!207260 m!319003))

(declare-fun m!319005 () Bool)

(assert (=> b!207272 m!319005))

(declare-fun m!319007 () Bool)

(assert (=> b!207272 m!319007))

(declare-fun m!319009 () Bool)

(assert (=> b!207272 m!319009))

(declare-fun m!319011 () Bool)

(assert (=> b!207272 m!319011))

(declare-fun m!319013 () Bool)

(assert (=> b!207270 m!319013))

(assert (=> b!207267 m!318967))

(declare-fun m!319015 () Bool)

(assert (=> b!207265 m!319015))

(declare-fun m!319017 () Bool)

(assert (=> b!207263 m!319017))

(declare-fun m!319019 () Bool)

(assert (=> b!207271 m!319019))

(declare-fun m!319021 () Bool)

(assert (=> start!43638 m!319021))

(declare-fun m!319023 () Bool)

(assert (=> b!207261 m!319023))

(assert (=> b!207273 m!318999))

(assert (=> b!207273 m!319001))

(push 1)

(assert (not b!207263))

(assert (not b!207267))

(assert (not b!207257))

(assert (not b!207271))

(assert (not b!207273))

(assert (not b!207261))

(assert (not b!207265))

(assert (not b!207268))

(assert (not b!207269))

(assert (not b!207270))

(assert (not b!207260))

(assert (not start!43638))

(assert (not b!207259))

(assert (not b!207272))

(assert (not b!207258))

(check-sat)

(pop 1)

(push 1)

(check-sat)

