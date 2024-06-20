; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9642 () Bool)

(assert start!9642)

(declare-datatypes ((array!2306 0))(
  ( (array!2307 (arr!1567 (Array (_ BitVec 32) (_ BitVec 8))) (size!1044 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2306)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((BitStream!1814 0))(
  ( (BitStream!1815 (buf!1396 array!2306) (currentByte!2907 (_ BitVec 32)) (currentBit!2902 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3382 0))(
  ( (Unit!3383) )
))
(declare-datatypes ((tuple2!4568 0))(
  ( (tuple2!4569 (_1!2383 Unit!3382) (_2!2383 BitStream!1814)) )
))
(declare-fun lt!74643 () tuple2!4568)

(declare-fun b!48256 () Bool)

(declare-datatypes ((tuple2!4570 0))(
  ( (tuple2!4571 (_1!2384 BitStream!1814) (_2!2384 BitStream!1814)) )
))
(declare-fun lt!74642 () tuple2!4570)

(declare-fun e!31980 () Bool)

(declare-datatypes ((List!548 0))(
  ( (Nil!545) (Cons!544 (h!663 Bool) (t!1298 List!548)) )
))
(declare-fun head!367 (List!548) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1814 array!2306 (_ BitVec 64) (_ BitVec 64)) List!548)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1814 BitStream!1814 (_ BitVec 64)) List!548)

(assert (=> b!48256 (= e!31980 (= (head!367 (byteArrayBitContentToList!0 (_2!2383 lt!74643) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!367 (bitStreamReadBitsIntoList!0 (_2!2383 lt!74643) (_1!2384 lt!74642) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!48257 () Bool)

(declare-fun e!31985 () Bool)

(declare-fun e!31972 () Bool)

(assert (=> b!48257 (= e!31985 e!31972)))

(declare-fun res!40583 () Bool)

(assert (=> b!48257 (=> res!40583 e!31972)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!48257 (= res!40583 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!74635 () (_ BitVec 64))

(declare-fun lt!74634 () List!548)

(declare-fun lt!74640 () tuple2!4568)

(declare-fun lt!74628 () tuple2!4570)

(assert (=> b!48257 (= lt!74634 (bitStreamReadBitsIntoList!0 (_2!2383 lt!74640) (_1!2384 lt!74628) lt!74635))))

(declare-fun lt!74644 () tuple2!4570)

(declare-fun lt!74633 () List!548)

(assert (=> b!48257 (= lt!74633 (bitStreamReadBitsIntoList!0 (_2!2383 lt!74640) (_1!2384 lt!74644) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!48257 (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74640)))) ((_ sign_extend 32) (currentByte!2907 (_2!2383 lt!74643))) ((_ sign_extend 32) (currentBit!2902 (_2!2383 lt!74643))) lt!74635)))

(declare-fun lt!74638 () Unit!3382)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1814 array!2306 (_ BitVec 64)) Unit!3382)

(assert (=> b!48257 (= lt!74638 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2383 lt!74643) (buf!1396 (_2!2383 lt!74640)) lt!74635))))

(declare-fun reader!0 (BitStream!1814 BitStream!1814) tuple2!4570)

(assert (=> b!48257 (= lt!74628 (reader!0 (_2!2383 lt!74643) (_2!2383 lt!74640)))))

(declare-fun thiss!1379 () BitStream!1814)

(assert (=> b!48257 (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74640)))) ((_ sign_extend 32) (currentByte!2907 thiss!1379)) ((_ sign_extend 32) (currentBit!2902 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!74629 () Unit!3382)

(assert (=> b!48257 (= lt!74629 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1396 (_2!2383 lt!74640)) (bvsub to!314 i!635)))))

(assert (=> b!48257 (= lt!74644 (reader!0 thiss!1379 (_2!2383 lt!74640)))))

(declare-fun e!31984 () Bool)

(declare-fun lt!74639 () (_ BitVec 64))

(declare-fun b!48258 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!48258 (= e!31984 (= lt!74639 (bvsub (bvsub (bvadd (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74643))) (currentByte!2907 (_2!2383 lt!74643)) (currentBit!2902 (_2!2383 lt!74643))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!48259 () Bool)

(declare-fun e!31976 () Bool)

(declare-fun e!31977 () Bool)

(assert (=> b!48259 (= e!31976 e!31977)))

(declare-fun res!40573 () Bool)

(assert (=> b!48259 (=> res!40573 e!31977)))

(declare-fun lt!74626 () Bool)

(declare-fun lt!74641 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2306 (_ BitVec 64)) Bool)

(assert (=> b!48259 (= res!40573 (not (= lt!74626 (bitAt!0 (buf!1396 (_1!2384 lt!74628)) lt!74641))))))

(assert (=> b!48259 (= lt!74626 (bitAt!0 (buf!1396 (_1!2384 lt!74644)) lt!74641))))

(declare-fun res!40576 () Bool)

(declare-fun e!31974 () Bool)

(assert (=> start!9642 (=> (not res!40576) (not e!31974))))

(assert (=> start!9642 (= res!40576 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1044 srcBuffer!2))))))))

(assert (=> start!9642 e!31974))

(assert (=> start!9642 true))

(declare-fun array_inv!960 (array!2306) Bool)

(assert (=> start!9642 (array_inv!960 srcBuffer!2)))

(declare-fun e!31982 () Bool)

(declare-fun inv!12 (BitStream!1814) Bool)

(assert (=> start!9642 (and (inv!12 thiss!1379) e!31982)))

(declare-fun b!48260 () Bool)

(declare-fun res!40579 () Bool)

(assert (=> b!48260 (=> (not res!40579) (not e!31974))))

(assert (=> b!48260 (= res!40579 (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 thiss!1379))) ((_ sign_extend 32) (currentByte!2907 thiss!1379)) ((_ sign_extend 32) (currentBit!2902 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!48261 () Bool)

(declare-fun e!31981 () Bool)

(declare-fun e!31975 () Bool)

(assert (=> b!48261 (= e!31981 e!31975)))

(declare-fun res!40590 () Bool)

(assert (=> b!48261 (=> res!40590 e!31975)))

(declare-fun isPrefixOf!0 (BitStream!1814 BitStream!1814) Bool)

(assert (=> b!48261 (= res!40590 (not (isPrefixOf!0 thiss!1379 (_2!2383 lt!74643))))))

(assert (=> b!48261 (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74643)))) ((_ sign_extend 32) (currentByte!2907 (_2!2383 lt!74643))) ((_ sign_extend 32) (currentBit!2902 (_2!2383 lt!74643))) lt!74635)))

(assert (=> b!48261 (= lt!74635 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!74627 () Unit!3382)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1814 BitStream!1814 (_ BitVec 64) (_ BitVec 64)) Unit!3382)

(assert (=> b!48261 (= lt!74627 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2383 lt!74643) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1814 (_ BitVec 8) (_ BitVec 32)) tuple2!4568)

(assert (=> b!48261 (= lt!74643 (appendBitFromByte!0 thiss!1379 (select (arr!1567 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!48262 () Bool)

(declare-fun res!40584 () Bool)

(declare-fun e!31973 () Bool)

(assert (=> b!48262 (=> res!40584 e!31973)))

(assert (=> b!48262 (= res!40584 (not (= (size!1044 (buf!1396 thiss!1379)) (size!1044 (buf!1396 (_2!2383 lt!74640))))))))

(declare-fun b!48263 () Bool)

(assert (=> b!48263 (= e!31973 e!31985)))

(declare-fun res!40577 () Bool)

(assert (=> b!48263 (=> res!40577 e!31985)))

(assert (=> b!48263 (= res!40577 (not (= (size!1044 (buf!1396 (_2!2383 lt!74643))) (size!1044 (buf!1396 (_2!2383 lt!74640))))))))

(assert (=> b!48263 e!31984))

(declare-fun res!40588 () Bool)

(assert (=> b!48263 (=> (not res!40588) (not e!31984))))

(assert (=> b!48263 (= res!40588 (= (size!1044 (buf!1396 (_2!2383 lt!74640))) (size!1044 (buf!1396 thiss!1379))))))

(declare-fun b!48264 () Bool)

(assert (=> b!48264 (= e!31982 (array_inv!960 (buf!1396 thiss!1379)))))

(declare-fun b!48265 () Bool)

(declare-fun res!40574 () Bool)

(assert (=> b!48265 (=> res!40574 e!31972)))

(declare-fun length!243 (List!548) Int)

(assert (=> b!48265 (= res!40574 (<= (length!243 lt!74633) 0))))

(declare-fun b!48266 () Bool)

(declare-fun res!40589 () Bool)

(assert (=> b!48266 (=> res!40589 e!31985)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!48266 (= res!40589 (not (invariant!0 (currentBit!2902 (_2!2383 lt!74643)) (currentByte!2907 (_2!2383 lt!74643)) (size!1044 (buf!1396 (_2!2383 lt!74643))))))))

(declare-fun b!48267 () Bool)

(declare-fun res!40582 () Bool)

(assert (=> b!48267 (=> res!40582 e!31973)))

(assert (=> b!48267 (= res!40582 (not (invariant!0 (currentBit!2902 (_2!2383 lt!74640)) (currentByte!2907 (_2!2383 lt!74640)) (size!1044 (buf!1396 (_2!2383 lt!74640))))))))

(declare-fun b!48268 () Bool)

(declare-fun e!31978 () Bool)

(assert (=> b!48268 (= e!31975 e!31978)))

(declare-fun res!40586 () Bool)

(assert (=> b!48268 (=> res!40586 e!31978)))

(assert (=> b!48268 (= res!40586 (not (isPrefixOf!0 (_2!2383 lt!74643) (_2!2383 lt!74640))))))

(assert (=> b!48268 (isPrefixOf!0 thiss!1379 (_2!2383 lt!74640))))

(declare-fun lt!74631 () Unit!3382)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1814 BitStream!1814 BitStream!1814) Unit!3382)

(assert (=> b!48268 (= lt!74631 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2383 lt!74643) (_2!2383 lt!74640)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1814 array!2306 (_ BitVec 64) (_ BitVec 64)) tuple2!4568)

(assert (=> b!48268 (= lt!74640 (appendBitsMSBFirstLoop!0 (_2!2383 lt!74643) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!48268 e!31980))

(declare-fun res!40585 () Bool)

(assert (=> b!48268 (=> (not res!40585) (not e!31980))))

(assert (=> b!48268 (= res!40585 (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74643)))) ((_ sign_extend 32) (currentByte!2907 thiss!1379)) ((_ sign_extend 32) (currentBit!2902 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!74636 () Unit!3382)

(assert (=> b!48268 (= lt!74636 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1396 (_2!2383 lt!74643)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!48268 (= lt!74642 (reader!0 thiss!1379 (_2!2383 lt!74643)))))

(declare-fun b!48269 () Bool)

(assert (=> b!48269 (= e!31972 e!31976)))

(declare-fun res!40581 () Bool)

(assert (=> b!48269 (=> res!40581 e!31976)))

(declare-fun lt!74637 () List!548)

(assert (=> b!48269 (= res!40581 (not (= lt!74637 lt!74634)))))

(assert (=> b!48269 (= lt!74634 lt!74637)))

(declare-fun tail!234 (List!548) List!548)

(assert (=> b!48269 (= lt!74637 (tail!234 lt!74633))))

(declare-fun lt!74632 () Unit!3382)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1814 BitStream!1814 BitStream!1814 BitStream!1814 (_ BitVec 64) List!548) Unit!3382)

(assert (=> b!48269 (= lt!74632 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2383 lt!74640) (_2!2383 lt!74640) (_1!2384 lt!74644) (_1!2384 lt!74628) (bvsub to!314 i!635) lt!74633))))

(declare-fun b!48270 () Bool)

(declare-fun res!40578 () Bool)

(assert (=> b!48270 (=> res!40578 e!31985)))

(assert (=> b!48270 (= res!40578 (not (invariant!0 (currentBit!2902 (_2!2383 lt!74643)) (currentByte!2907 (_2!2383 lt!74643)) (size!1044 (buf!1396 (_2!2383 lt!74640))))))))

(declare-fun b!48271 () Bool)

(assert (=> b!48271 (= e!31978 e!31973)))

(declare-fun res!40587 () Bool)

(assert (=> b!48271 (=> res!40587 e!31973)))

(assert (=> b!48271 (= res!40587 (not (= lt!74639 (bvsub (bvadd lt!74641 to!314) i!635))))))

(assert (=> b!48271 (= lt!74639 (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74640))) (currentByte!2907 (_2!2383 lt!74640)) (currentBit!2902 (_2!2383 lt!74640))))))

(declare-fun b!48272 () Bool)

(assert (=> b!48272 (= e!31974 (not e!31981))))

(declare-fun res!40575 () Bool)

(assert (=> b!48272 (=> res!40575 e!31981)))

(assert (=> b!48272 (= res!40575 (bvsge i!635 to!314))))

(assert (=> b!48272 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!74630 () Unit!3382)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1814) Unit!3382)

(assert (=> b!48272 (= lt!74630 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!48272 (= lt!74641 (bitIndex!0 (size!1044 (buf!1396 thiss!1379)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379)))))

(declare-fun b!48273 () Bool)

(assert (=> b!48273 (= e!31977 (= (head!367 (byteArrayBitContentToList!0 (_2!2383 lt!74640) srcBuffer!2 i!635 (bvsub to!314 i!635))) (bitAt!0 srcBuffer!2 i!635)))))

(declare-fun b!48274 () Bool)

(declare-fun res!40580 () Bool)

(assert (=> b!48274 (=> res!40580 e!31977)))

(assert (=> b!48274 (= res!40580 (not (= (head!367 lt!74633) lt!74626)))))

(assert (= (and start!9642 res!40576) b!48260))

(assert (= (and b!48260 res!40579) b!48272))

(assert (= (and b!48272 (not res!40575)) b!48261))

(assert (= (and b!48261 (not res!40590)) b!48268))

(assert (= (and b!48268 res!40585) b!48256))

(assert (= (and b!48268 (not res!40586)) b!48271))

(assert (= (and b!48271 (not res!40587)) b!48267))

(assert (= (and b!48267 (not res!40582)) b!48262))

(assert (= (and b!48262 (not res!40584)) b!48263))

(assert (= (and b!48263 res!40588) b!48258))

(assert (= (and b!48263 (not res!40577)) b!48266))

(assert (= (and b!48266 (not res!40589)) b!48270))

(assert (= (and b!48270 (not res!40578)) b!48257))

(assert (= (and b!48257 (not res!40583)) b!48265))

(assert (= (and b!48265 (not res!40574)) b!48269))

(assert (= (and b!48269 (not res!40581)) b!48259))

(assert (= (and b!48259 (not res!40573)) b!48274))

(assert (= (and b!48274 (not res!40580)) b!48273))

(assert (= start!9642 b!48264))

(declare-fun m!74909 () Bool)

(assert (=> start!9642 m!74909))

(declare-fun m!74911 () Bool)

(assert (=> start!9642 m!74911))

(declare-fun m!74913 () Bool)

(assert (=> b!48258 m!74913))

(declare-fun m!74915 () Bool)

(assert (=> b!48261 m!74915))

(declare-fun m!74917 () Bool)

(assert (=> b!48261 m!74917))

(declare-fun m!74919 () Bool)

(assert (=> b!48261 m!74919))

(declare-fun m!74921 () Bool)

(assert (=> b!48261 m!74921))

(assert (=> b!48261 m!74919))

(declare-fun m!74923 () Bool)

(assert (=> b!48261 m!74923))

(declare-fun m!74925 () Bool)

(assert (=> b!48267 m!74925))

(declare-fun m!74927 () Bool)

(assert (=> b!48269 m!74927))

(declare-fun m!74929 () Bool)

(assert (=> b!48269 m!74929))

(declare-fun m!74931 () Bool)

(assert (=> b!48273 m!74931))

(assert (=> b!48273 m!74931))

(declare-fun m!74933 () Bool)

(assert (=> b!48273 m!74933))

(declare-fun m!74935 () Bool)

(assert (=> b!48273 m!74935))

(declare-fun m!74937 () Bool)

(assert (=> b!48256 m!74937))

(assert (=> b!48256 m!74937))

(declare-fun m!74939 () Bool)

(assert (=> b!48256 m!74939))

(declare-fun m!74941 () Bool)

(assert (=> b!48256 m!74941))

(assert (=> b!48256 m!74941))

(declare-fun m!74943 () Bool)

(assert (=> b!48256 m!74943))

(declare-fun m!74945 () Bool)

(assert (=> b!48268 m!74945))

(declare-fun m!74947 () Bool)

(assert (=> b!48268 m!74947))

(declare-fun m!74949 () Bool)

(assert (=> b!48268 m!74949))

(declare-fun m!74951 () Bool)

(assert (=> b!48268 m!74951))

(declare-fun m!74953 () Bool)

(assert (=> b!48268 m!74953))

(declare-fun m!74955 () Bool)

(assert (=> b!48268 m!74955))

(declare-fun m!74957 () Bool)

(assert (=> b!48268 m!74957))

(declare-fun m!74959 () Bool)

(assert (=> b!48265 m!74959))

(declare-fun m!74961 () Bool)

(assert (=> b!48259 m!74961))

(declare-fun m!74963 () Bool)

(assert (=> b!48259 m!74963))

(declare-fun m!74965 () Bool)

(assert (=> b!48260 m!74965))

(declare-fun m!74967 () Bool)

(assert (=> b!48266 m!74967))

(declare-fun m!74969 () Bool)

(assert (=> b!48274 m!74969))

(declare-fun m!74971 () Bool)

(assert (=> b!48271 m!74971))

(declare-fun m!74973 () Bool)

(assert (=> b!48257 m!74973))

(declare-fun m!74975 () Bool)

(assert (=> b!48257 m!74975))

(declare-fun m!74977 () Bool)

(assert (=> b!48257 m!74977))

(declare-fun m!74979 () Bool)

(assert (=> b!48257 m!74979))

(declare-fun m!74981 () Bool)

(assert (=> b!48257 m!74981))

(declare-fun m!74983 () Bool)

(assert (=> b!48257 m!74983))

(declare-fun m!74985 () Bool)

(assert (=> b!48257 m!74985))

(declare-fun m!74987 () Bool)

(assert (=> b!48257 m!74987))

(declare-fun m!74989 () Bool)

(assert (=> b!48272 m!74989))

(declare-fun m!74991 () Bool)

(assert (=> b!48272 m!74991))

(declare-fun m!74993 () Bool)

(assert (=> b!48272 m!74993))

(declare-fun m!74995 () Bool)

(assert (=> b!48264 m!74995))

(declare-fun m!74997 () Bool)

(assert (=> b!48270 m!74997))

(push 1)

(assert (not b!48259))

(assert (not b!48274))

(assert (not b!48269))

(assert (not b!48271))

(assert (not b!48266))

(assert (not b!48257))

(assert (not b!48260))

(assert (not b!48268))

(assert (not b!48258))

(assert (not b!48272))

(assert (not b!48256))

(assert (not b!48264))

(assert (not b!48267))

(assert (not b!48273))

(assert (not b!48265))

(assert (not b!48270))

(assert (not start!9642))

(assert (not b!48261))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!14692 () Bool)

(assert (=> d!14692 (= (tail!234 lt!74633) (t!1298 lt!74633))))

(assert (=> b!48269 d!14692))

(declare-fun d!14694 () Bool)

(declare-fun e!32002 () Bool)

(assert (=> d!14694 e!32002))

(declare-fun res!40614 () Bool)

(assert (=> d!14694 (=> (not res!40614) (not e!32002))))

(declare-fun lt!74716 () (_ BitVec 64))

(assert (=> d!14694 (= res!40614 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74716 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!74716) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!14694 (= lt!74716 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!74715 () Unit!3382)

(declare-fun choose!42 (BitStream!1814 BitStream!1814 BitStream!1814 BitStream!1814 (_ BitVec 64) List!548) Unit!3382)

(assert (=> d!14694 (= lt!74715 (choose!42 (_2!2383 lt!74640) (_2!2383 lt!74640) (_1!2384 lt!74644) (_1!2384 lt!74628) (bvsub to!314 i!635) lt!74633))))

(assert (=> d!14694 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14694 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2383 lt!74640) (_2!2383 lt!74640) (_1!2384 lt!74644) (_1!2384 lt!74628) (bvsub to!314 i!635) lt!74633) lt!74715)))

(declare-fun b!48304 () Bool)

(assert (=> b!48304 (= e!32002 (= (bitStreamReadBitsIntoList!0 (_2!2383 lt!74640) (_1!2384 lt!74628) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!234 lt!74633)))))

(assert (= (and d!14694 res!40614) b!48304))

(declare-fun m!75037 () Bool)

(assert (=> d!14694 m!75037))

(declare-fun m!75039 () Bool)

(assert (=> b!48304 m!75039))

(assert (=> b!48304 m!74927))

(assert (=> b!48269 d!14694))

(declare-fun d!14696 () Bool)

(declare-fun e!32005 () Bool)

(assert (=> d!14696 e!32005))

(declare-fun res!40619 () Bool)

(assert (=> d!14696 (=> (not res!40619) (not e!32005))))

(declare-fun lt!74731 () (_ BitVec 64))

(declare-fun lt!74732 () (_ BitVec 64))

(declare-fun lt!74734 () (_ BitVec 64))

(assert (=> d!14696 (= res!40619 (= lt!74734 (bvsub lt!74732 lt!74731)))))

(assert (=> d!14696 (or (= (bvand lt!74732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74731 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74732 lt!74731) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!14696 (= lt!74731 (remainingBits!0 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74643)))) ((_ sign_extend 32) (currentByte!2907 (_2!2383 lt!74643))) ((_ sign_extend 32) (currentBit!2902 (_2!2383 lt!74643)))))))

(declare-fun lt!74733 () (_ BitVec 64))

(declare-fun lt!74729 () (_ BitVec 64))

(assert (=> d!14696 (= lt!74732 (bvmul lt!74733 lt!74729))))

(assert (=> d!14696 (or (= lt!74733 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!74729 (bvsdiv (bvmul lt!74733 lt!74729) lt!74733)))))

(assert (=> d!14696 (= lt!74729 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14696 (= lt!74733 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74643)))))))

(assert (=> d!14696 (= lt!74734 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2907 (_2!2383 lt!74643))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2902 (_2!2383 lt!74643)))))))

(assert (=> d!14696 (invariant!0 (currentBit!2902 (_2!2383 lt!74643)) (currentByte!2907 (_2!2383 lt!74643)) (size!1044 (buf!1396 (_2!2383 lt!74643))))))

(assert (=> d!14696 (= (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74643))) (currentByte!2907 (_2!2383 lt!74643)) (currentBit!2902 (_2!2383 lt!74643))) lt!74734)))

(declare-fun b!48309 () Bool)

(declare-fun res!40620 () Bool)

(assert (=> b!48309 (=> (not res!40620) (not e!32005))))

(assert (=> b!48309 (= res!40620 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!74734))))

(declare-fun b!48310 () Bool)

(declare-fun lt!74730 () (_ BitVec 64))

(assert (=> b!48310 (= e!32005 (bvsle lt!74734 (bvmul lt!74730 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48310 (or (= lt!74730 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!74730 #b0000000000000000000000000000000000000000000000000000000000001000) lt!74730)))))

(assert (=> b!48310 (= lt!74730 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74643)))))))

(assert (= (and d!14696 res!40619) b!48309))

(assert (= (and b!48309 res!40620) b!48310))

(declare-fun m!75041 () Bool)

(assert (=> d!14696 m!75041))

(assert (=> d!14696 m!74967))

(assert (=> b!48258 d!14696))

(declare-fun d!14698 () Bool)

(assert (=> d!14698 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 thiss!1379))) ((_ sign_extend 32) (currentByte!2907 thiss!1379)) ((_ sign_extend 32) (currentBit!2902 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1044 (buf!1396 thiss!1379))) ((_ sign_extend 32) (currentByte!2907 thiss!1379)) ((_ sign_extend 32) (currentBit!2902 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3776 () Bool)

(assert (= bs!3776 d!14698))

(declare-fun m!75043 () Bool)

(assert (=> bs!3776 m!75043))

(assert (=> b!48260 d!14698))

(declare-fun d!14700 () Bool)

(assert (=> d!14700 (= (bitAt!0 (buf!1396 (_1!2384 lt!74628)) lt!74641) (not (= (bvand ((_ sign_extend 24) (select (arr!1567 (buf!1396 (_1!2384 lt!74628))) ((_ extract 31 0) (bvsdiv lt!74641 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!74641 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3777 () Bool)

(assert (= bs!3777 d!14700))

(declare-fun m!75045 () Bool)

(assert (=> bs!3777 m!75045))

(declare-fun m!75047 () Bool)

(assert (=> bs!3777 m!75047))

(assert (=> b!48259 d!14700))

(declare-fun d!14702 () Bool)

(assert (=> d!14702 (= (bitAt!0 (buf!1396 (_1!2384 lt!74644)) lt!74641) (not (= (bvand ((_ sign_extend 24) (select (arr!1567 (buf!1396 (_1!2384 lt!74644))) ((_ extract 31 0) (bvsdiv lt!74641 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!74641 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3778 () Bool)

(assert (= bs!3778 d!14702))

(declare-fun m!75049 () Bool)

(assert (=> bs!3778 m!75049))

(assert (=> bs!3778 m!75047))

(assert (=> b!48259 d!14702))

(declare-fun d!14704 () Bool)

(assert (=> d!14704 (= (invariant!0 (currentBit!2902 (_2!2383 lt!74643)) (currentByte!2907 (_2!2383 lt!74643)) (size!1044 (buf!1396 (_2!2383 lt!74640)))) (and (bvsge (currentBit!2902 (_2!2383 lt!74643)) #b00000000000000000000000000000000) (bvslt (currentBit!2902 (_2!2383 lt!74643)) #b00000000000000000000000000001000) (bvsge (currentByte!2907 (_2!2383 lt!74643)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2907 (_2!2383 lt!74643)) (size!1044 (buf!1396 (_2!2383 lt!74640)))) (and (= (currentBit!2902 (_2!2383 lt!74643)) #b00000000000000000000000000000000) (= (currentByte!2907 (_2!2383 lt!74643)) (size!1044 (buf!1396 (_2!2383 lt!74640))))))))))

(assert (=> b!48270 d!14704))

(declare-fun d!14706 () Bool)

(declare-fun res!40628 () Bool)

(declare-fun e!32010 () Bool)

(assert (=> d!14706 (=> (not res!40628) (not e!32010))))

(assert (=> d!14706 (= res!40628 (= (size!1044 (buf!1396 thiss!1379)) (size!1044 (buf!1396 (_2!2383 lt!74643)))))))

(assert (=> d!14706 (= (isPrefixOf!0 thiss!1379 (_2!2383 lt!74643)) e!32010)))

(declare-fun b!48317 () Bool)

(declare-fun res!40629 () Bool)

(assert (=> b!48317 (=> (not res!40629) (not e!32010))))

(assert (=> b!48317 (= res!40629 (bvsle (bitIndex!0 (size!1044 (buf!1396 thiss!1379)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379)) (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74643))) (currentByte!2907 (_2!2383 lt!74643)) (currentBit!2902 (_2!2383 lt!74643)))))))

(declare-fun b!48318 () Bool)

(declare-fun e!32011 () Bool)

(assert (=> b!48318 (= e!32010 e!32011)))

(declare-fun res!40627 () Bool)

(assert (=> b!48318 (=> res!40627 e!32011)))

(assert (=> b!48318 (= res!40627 (= (size!1044 (buf!1396 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!48319 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2306 array!2306 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!48319 (= e!32011 (arrayBitRangesEq!0 (buf!1396 thiss!1379) (buf!1396 (_2!2383 lt!74643)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1044 (buf!1396 thiss!1379)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379))))))

(assert (= (and d!14706 res!40628) b!48317))

(assert (= (and b!48317 res!40629) b!48318))

(assert (= (and b!48318 (not res!40627)) b!48319))

(assert (=> b!48317 m!74993))

(assert (=> b!48317 m!74913))

(assert (=> b!48319 m!74993))

(assert (=> b!48319 m!74993))

(declare-fun m!75051 () Bool)

(assert (=> b!48319 m!75051))

(assert (=> b!48261 d!14706))

(declare-fun d!14708 () Bool)

(assert (=> d!14708 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74643)))) ((_ sign_extend 32) (currentByte!2907 (_2!2383 lt!74643))) ((_ sign_extend 32) (currentBit!2902 (_2!2383 lt!74643))) lt!74635) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74643)))) ((_ sign_extend 32) (currentByte!2907 (_2!2383 lt!74643))) ((_ sign_extend 32) (currentBit!2902 (_2!2383 lt!74643)))) lt!74635))))

(declare-fun bs!3779 () Bool)

(assert (= bs!3779 d!14708))

(assert (=> bs!3779 m!75041))

(assert (=> b!48261 d!14708))

(declare-fun d!14710 () Bool)

(declare-fun e!32014 () Bool)

(assert (=> d!14710 e!32014))

(declare-fun res!40632 () Bool)

(assert (=> d!14710 (=> (not res!40632) (not e!32014))))

(assert (=> d!14710 (= res!40632 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!74737 () Unit!3382)

(declare-fun choose!27 (BitStream!1814 BitStream!1814 (_ BitVec 64) (_ BitVec 64)) Unit!3382)

(assert (=> d!14710 (= lt!74737 (choose!27 thiss!1379 (_2!2383 lt!74643) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!14710 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!14710 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2383 lt!74643) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!74737)))

(declare-fun b!48322 () Bool)

(assert (=> b!48322 (= e!32014 (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74643)))) ((_ sign_extend 32) (currentByte!2907 (_2!2383 lt!74643))) ((_ sign_extend 32) (currentBit!2902 (_2!2383 lt!74643))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!14710 res!40632) b!48322))

(declare-fun m!75053 () Bool)

(assert (=> d!14710 m!75053))

(declare-fun m!75055 () Bool)

(assert (=> b!48322 m!75055))

(assert (=> b!48261 d!14710))

(declare-fun b!48340 () Bool)

(declare-fun res!40653 () Bool)

(declare-fun e!32024 () Bool)

(assert (=> b!48340 (=> (not res!40653) (not e!32024))))

(declare-fun lt!74771 () tuple2!4568)

(assert (=> b!48340 (= res!40653 (= (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74771))) (currentByte!2907 (_2!2383 lt!74771)) (currentBit!2902 (_2!2383 lt!74771))) (bvadd (bitIndex!0 (size!1044 (buf!1396 thiss!1379)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!48341 () Bool)

(declare-fun res!40650 () Bool)

(declare-fun e!32026 () Bool)

(assert (=> b!48341 (=> (not res!40650) (not e!32026))))

(declare-fun lt!74766 () (_ BitVec 64))

(declare-fun lt!74772 () (_ BitVec 64))

(declare-fun lt!74763 () tuple2!4568)

(assert (=> b!48341 (= res!40650 (= (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74763))) (currentByte!2907 (_2!2383 lt!74763)) (currentBit!2902 (_2!2383 lt!74763))) (bvadd lt!74772 lt!74766)))))

(assert (=> b!48341 (or (not (= (bvand lt!74772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74766 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!74772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!74772 lt!74766) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48341 (= lt!74766 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!48341 (= lt!74772 (bitIndex!0 (size!1044 (buf!1396 thiss!1379)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379)))))

(declare-fun b!48342 () Bool)

(declare-fun e!32025 () Bool)

(assert (=> b!48342 (= e!32026 e!32025)))

(declare-fun res!40649 () Bool)

(assert (=> b!48342 (=> (not res!40649) (not e!32025))))

(declare-datatypes ((tuple2!4580 0))(
  ( (tuple2!4581 (_1!2389 BitStream!1814) (_2!2389 Bool)) )
))
(declare-fun lt!74773 () tuple2!4580)

(declare-fun lt!74767 () (_ BitVec 8))

(assert (=> b!48342 (= res!40649 (and (= (_2!2389 lt!74773) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1567 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!74767)) #b00000000000000000000000000000000))) (= (_1!2389 lt!74773) (_2!2383 lt!74763))))))

(declare-datatypes ((tuple2!4582 0))(
  ( (tuple2!4583 (_1!2390 array!2306) (_2!2390 BitStream!1814)) )
))
(declare-fun lt!74762 () tuple2!4582)

(declare-fun lt!74770 () BitStream!1814)

(declare-fun readBits!0 (BitStream!1814 (_ BitVec 64)) tuple2!4582)

(assert (=> b!48342 (= lt!74762 (readBits!0 lt!74770 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1814) tuple2!4580)

(assert (=> b!48342 (= lt!74773 (readBitPure!0 lt!74770))))

(declare-fun readerFrom!0 (BitStream!1814 (_ BitVec 32) (_ BitVec 32)) BitStream!1814)

(assert (=> b!48342 (= lt!74770 (readerFrom!0 (_2!2383 lt!74763) (currentBit!2902 thiss!1379) (currentByte!2907 thiss!1379)))))

(declare-fun b!48343 () Bool)

(declare-fun res!40651 () Bool)

(assert (=> b!48343 (=> (not res!40651) (not e!32026))))

(assert (=> b!48343 (= res!40651 (isPrefixOf!0 thiss!1379 (_2!2383 lt!74763)))))

(declare-fun d!14712 () Bool)

(assert (=> d!14712 e!32026))

(declare-fun res!40655 () Bool)

(assert (=> d!14712 (=> (not res!40655) (not e!32026))))

(assert (=> d!14712 (= res!40655 (= (size!1044 (buf!1396 (_2!2383 lt!74763))) (size!1044 (buf!1396 thiss!1379))))))

(declare-fun lt!74764 () array!2306)

(assert (=> d!14712 (= lt!74767 (select (arr!1567 lt!74764) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!14712 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1044 lt!74764)))))

(assert (=> d!14712 (= lt!74764 (array!2307 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!74768 () tuple2!4568)

(assert (=> d!14712 (= lt!74763 (tuple2!4569 (_1!2383 lt!74768) (_2!2383 lt!74768)))))

(assert (=> d!14712 (= lt!74768 lt!74771)))

(assert (=> d!14712 e!32024))

(declare-fun res!40656 () Bool)

(assert (=> d!14712 (=> (not res!40656) (not e!32024))))

(assert (=> d!14712 (= res!40656 (= (size!1044 (buf!1396 thiss!1379)) (size!1044 (buf!1396 (_2!2383 lt!74771)))))))

(declare-fun lt!74765 () Bool)

(declare-fun appendBit!0 (BitStream!1814 Bool) tuple2!4568)

(assert (=> d!14712 (= lt!74771 (appendBit!0 thiss!1379 lt!74765))))

(assert (=> d!14712 (= lt!74765 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1567 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!14712 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!14712 (= (appendBitFromByte!0 thiss!1379 (select (arr!1567 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!74763)))

(declare-fun b!48344 () Bool)

(assert (=> b!48344 (= e!32025 (= (bitIndex!0 (size!1044 (buf!1396 (_1!2389 lt!74773))) (currentByte!2907 (_1!2389 lt!74773)) (currentBit!2902 (_1!2389 lt!74773))) (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74763))) (currentByte!2907 (_2!2383 lt!74763)) (currentBit!2902 (_2!2383 lt!74763)))))))

(declare-fun b!48345 () Bool)

(declare-fun res!40652 () Bool)

(assert (=> b!48345 (=> (not res!40652) (not e!32024))))

(assert (=> b!48345 (= res!40652 (isPrefixOf!0 thiss!1379 (_2!2383 lt!74771)))))

(declare-fun b!48346 () Bool)

(declare-fun e!32023 () Bool)

(assert (=> b!48346 (= e!32024 e!32023)))

(declare-fun res!40654 () Bool)

(assert (=> b!48346 (=> (not res!40654) (not e!32023))))

(declare-fun lt!74769 () tuple2!4580)

(assert (=> b!48346 (= res!40654 (and (= (_2!2389 lt!74769) lt!74765) (= (_1!2389 lt!74769) (_2!2383 lt!74771))))))

(assert (=> b!48346 (= lt!74769 (readBitPure!0 (readerFrom!0 (_2!2383 lt!74771) (currentBit!2902 thiss!1379) (currentByte!2907 thiss!1379))))))

(declare-fun b!48347 () Bool)

(assert (=> b!48347 (= e!32023 (= (bitIndex!0 (size!1044 (buf!1396 (_1!2389 lt!74769))) (currentByte!2907 (_1!2389 lt!74769)) (currentBit!2902 (_1!2389 lt!74769))) (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74771))) (currentByte!2907 (_2!2383 lt!74771)) (currentBit!2902 (_2!2383 lt!74771)))))))

(assert (= (and d!14712 res!40656) b!48340))

(assert (= (and b!48340 res!40653) b!48345))

(assert (= (and b!48345 res!40652) b!48346))

(assert (= (and b!48346 res!40654) b!48347))

(assert (= (and d!14712 res!40655) b!48341))

(assert (= (and b!48341 res!40650) b!48343))

(assert (= (and b!48343 res!40651) b!48342))

(assert (= (and b!48342 res!40649) b!48344))

(declare-fun m!75057 () Bool)

(assert (=> b!48347 m!75057))

(declare-fun m!75059 () Bool)

(assert (=> b!48347 m!75059))

(assert (=> b!48340 m!75059))

(assert (=> b!48340 m!74993))

(declare-fun m!75061 () Bool)

(assert (=> b!48343 m!75061))

(declare-fun m!75063 () Bool)

(assert (=> d!14712 m!75063))

(declare-fun m!75065 () Bool)

(assert (=> d!14712 m!75065))

(declare-fun m!75067 () Bool)

(assert (=> d!14712 m!75067))

(declare-fun m!75069 () Bool)

(assert (=> b!48344 m!75069))

(declare-fun m!75071 () Bool)

(assert (=> b!48344 m!75071))

(declare-fun m!75073 () Bool)

(assert (=> b!48345 m!75073))

(declare-fun m!75075 () Bool)

(assert (=> b!48346 m!75075))

(assert (=> b!48346 m!75075))

(declare-fun m!75077 () Bool)

(assert (=> b!48346 m!75077))

(assert (=> b!48341 m!75071))

(assert (=> b!48341 m!74993))

(declare-fun m!75079 () Bool)

(assert (=> b!48342 m!75079))

(declare-fun m!75081 () Bool)

(assert (=> b!48342 m!75081))

(declare-fun m!75083 () Bool)

(assert (=> b!48342 m!75083))

(assert (=> b!48261 d!14712))

(declare-fun d!14714 () Bool)

(declare-fun res!40658 () Bool)

(declare-fun e!32027 () Bool)

(assert (=> d!14714 (=> (not res!40658) (not e!32027))))

(assert (=> d!14714 (= res!40658 (= (size!1044 (buf!1396 thiss!1379)) (size!1044 (buf!1396 thiss!1379))))))

(assert (=> d!14714 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!32027)))

(declare-fun b!48348 () Bool)

(declare-fun res!40659 () Bool)

(assert (=> b!48348 (=> (not res!40659) (not e!32027))))

(assert (=> b!48348 (= res!40659 (bvsle (bitIndex!0 (size!1044 (buf!1396 thiss!1379)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379)) (bitIndex!0 (size!1044 (buf!1396 thiss!1379)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379))))))

(declare-fun b!48349 () Bool)

(declare-fun e!32028 () Bool)

(assert (=> b!48349 (= e!32027 e!32028)))

(declare-fun res!40657 () Bool)

(assert (=> b!48349 (=> res!40657 e!32028)))

(assert (=> b!48349 (= res!40657 (= (size!1044 (buf!1396 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!48350 () Bool)

(assert (=> b!48350 (= e!32028 (arrayBitRangesEq!0 (buf!1396 thiss!1379) (buf!1396 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1044 (buf!1396 thiss!1379)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379))))))

(assert (= (and d!14714 res!40658) b!48348))

(assert (= (and b!48348 res!40659) b!48349))

(assert (= (and b!48349 (not res!40657)) b!48350))

(assert (=> b!48348 m!74993))

(assert (=> b!48348 m!74993))

(assert (=> b!48350 m!74993))

(assert (=> b!48350 m!74993))

(declare-fun m!75085 () Bool)

(assert (=> b!48350 m!75085))

(assert (=> b!48272 d!14714))

(declare-fun d!14716 () Bool)

(assert (=> d!14716 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!74776 () Unit!3382)

(declare-fun choose!11 (BitStream!1814) Unit!3382)

(assert (=> d!14716 (= lt!74776 (choose!11 thiss!1379))))

(assert (=> d!14716 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!74776)))

(declare-fun bs!3781 () Bool)

(assert (= bs!3781 d!14716))

(assert (=> bs!3781 m!74989))

(declare-fun m!75087 () Bool)

(assert (=> bs!3781 m!75087))

(assert (=> b!48272 d!14716))

(declare-fun d!14718 () Bool)

(declare-fun e!32029 () Bool)

(assert (=> d!14718 e!32029))

(declare-fun res!40660 () Bool)

(assert (=> d!14718 (=> (not res!40660) (not e!32029))))

(declare-fun lt!74779 () (_ BitVec 64))

(declare-fun lt!74782 () (_ BitVec 64))

(declare-fun lt!74780 () (_ BitVec 64))

(assert (=> d!14718 (= res!40660 (= lt!74782 (bvsub lt!74780 lt!74779)))))

(assert (=> d!14718 (or (= (bvand lt!74780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74779 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74780 lt!74779) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14718 (= lt!74779 (remainingBits!0 ((_ sign_extend 32) (size!1044 (buf!1396 thiss!1379))) ((_ sign_extend 32) (currentByte!2907 thiss!1379)) ((_ sign_extend 32) (currentBit!2902 thiss!1379))))))

(declare-fun lt!74781 () (_ BitVec 64))

(declare-fun lt!74777 () (_ BitVec 64))

(assert (=> d!14718 (= lt!74780 (bvmul lt!74781 lt!74777))))

(assert (=> d!14718 (or (= lt!74781 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!74777 (bvsdiv (bvmul lt!74781 lt!74777) lt!74781)))))

(assert (=> d!14718 (= lt!74777 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14718 (= lt!74781 ((_ sign_extend 32) (size!1044 (buf!1396 thiss!1379))))))

(assert (=> d!14718 (= lt!74782 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2907 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2902 thiss!1379))))))

(assert (=> d!14718 (invariant!0 (currentBit!2902 thiss!1379) (currentByte!2907 thiss!1379) (size!1044 (buf!1396 thiss!1379)))))

(assert (=> d!14718 (= (bitIndex!0 (size!1044 (buf!1396 thiss!1379)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379)) lt!74782)))

(declare-fun b!48351 () Bool)

(declare-fun res!40661 () Bool)

(assert (=> b!48351 (=> (not res!40661) (not e!32029))))

(assert (=> b!48351 (= res!40661 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!74782))))

(declare-fun b!48352 () Bool)

(declare-fun lt!74778 () (_ BitVec 64))

(assert (=> b!48352 (= e!32029 (bvsle lt!74782 (bvmul lt!74778 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48352 (or (= lt!74778 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!74778 #b0000000000000000000000000000000000000000000000000000000000001000) lt!74778)))))

(assert (=> b!48352 (= lt!74778 ((_ sign_extend 32) (size!1044 (buf!1396 thiss!1379))))))

(assert (= (and d!14718 res!40660) b!48351))

(assert (= (and b!48351 res!40661) b!48352))

(assert (=> d!14718 m!75043))

(declare-fun m!75089 () Bool)

(assert (=> d!14718 m!75089))

(assert (=> b!48272 d!14718))

(declare-fun d!14720 () Bool)

(declare-fun e!32030 () Bool)

(assert (=> d!14720 e!32030))

(declare-fun res!40662 () Bool)

(assert (=> d!14720 (=> (not res!40662) (not e!32030))))

(declare-fun lt!74786 () (_ BitVec 64))

(declare-fun lt!74785 () (_ BitVec 64))

(declare-fun lt!74788 () (_ BitVec 64))

(assert (=> d!14720 (= res!40662 (= lt!74788 (bvsub lt!74786 lt!74785)))))

(assert (=> d!14720 (or (= (bvand lt!74786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74785 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74786 lt!74785) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14720 (= lt!74785 (remainingBits!0 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74640)))) ((_ sign_extend 32) (currentByte!2907 (_2!2383 lt!74640))) ((_ sign_extend 32) (currentBit!2902 (_2!2383 lt!74640)))))))

(declare-fun lt!74787 () (_ BitVec 64))

(declare-fun lt!74783 () (_ BitVec 64))

(assert (=> d!14720 (= lt!74786 (bvmul lt!74787 lt!74783))))

(assert (=> d!14720 (or (= lt!74787 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!74783 (bvsdiv (bvmul lt!74787 lt!74783) lt!74787)))))

(assert (=> d!14720 (= lt!74783 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14720 (= lt!74787 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74640)))))))

(assert (=> d!14720 (= lt!74788 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2907 (_2!2383 lt!74640))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2902 (_2!2383 lt!74640)))))))

(assert (=> d!14720 (invariant!0 (currentBit!2902 (_2!2383 lt!74640)) (currentByte!2907 (_2!2383 lt!74640)) (size!1044 (buf!1396 (_2!2383 lt!74640))))))

(assert (=> d!14720 (= (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74640))) (currentByte!2907 (_2!2383 lt!74640)) (currentBit!2902 (_2!2383 lt!74640))) lt!74788)))

(declare-fun b!48353 () Bool)

(declare-fun res!40663 () Bool)

(assert (=> b!48353 (=> (not res!40663) (not e!32030))))

(assert (=> b!48353 (= res!40663 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!74788))))

(declare-fun b!48354 () Bool)

(declare-fun lt!74784 () (_ BitVec 64))

(assert (=> b!48354 (= e!32030 (bvsle lt!74788 (bvmul lt!74784 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48354 (or (= lt!74784 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!74784 #b0000000000000000000000000000000000000000000000000000000000001000) lt!74784)))))

(assert (=> b!48354 (= lt!74784 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74640)))))))

(assert (= (and d!14720 res!40662) b!48353))

(assert (= (and b!48353 res!40663) b!48354))

(declare-fun m!75091 () Bool)

(assert (=> d!14720 m!75091))

(assert (=> d!14720 m!74925))

(assert (=> b!48271 d!14720))

(declare-fun d!14722 () Bool)

(assert (=> d!14722 (= (head!367 (byteArrayBitContentToList!0 (_2!2383 lt!74640) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!663 (byteArrayBitContentToList!0 (_2!2383 lt!74640) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!48273 d!14722))

(declare-fun d!14724 () Bool)

(declare-fun c!3363 () Bool)

(assert (=> d!14724 (= c!3363 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32033 () List!548)

(assert (=> d!14724 (= (byteArrayBitContentToList!0 (_2!2383 lt!74640) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!32033)))

(declare-fun b!48359 () Bool)

(assert (=> b!48359 (= e!32033 Nil!545)))

(declare-fun b!48360 () Bool)

(assert (=> b!48360 (= e!32033 (Cons!544 (not (= (bvand ((_ sign_extend 24) (select (arr!1567 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2383 lt!74640) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14724 c!3363) b!48359))

(assert (= (and d!14724 (not c!3363)) b!48360))

(assert (=> b!48360 m!74919))

(assert (=> b!48360 m!75067))

(declare-fun m!75093 () Bool)

(assert (=> b!48360 m!75093))

(assert (=> b!48273 d!14724))

(declare-fun d!14726 () Bool)

(assert (=> d!14726 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1567 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3782 () Bool)

(assert (= bs!3782 d!14726))

(assert (=> bs!3782 m!74919))

(assert (=> bs!3782 m!75067))

(assert (=> b!48273 d!14726))

(declare-fun d!14728 () Bool)

(assert (=> d!14728 (= (array_inv!960 (buf!1396 thiss!1379)) (bvsge (size!1044 (buf!1396 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!48264 d!14728))

(declare-fun d!14730 () Bool)

(assert (=> d!14730 (= (head!367 lt!74633) (h!663 lt!74633))))

(assert (=> b!48274 d!14730))

(declare-fun d!14732 () Bool)

(declare-fun size!1046 (List!548) Int)

(assert (=> d!14732 (= (length!243 lt!74633) (size!1046 lt!74633))))

(declare-fun bs!3783 () Bool)

(assert (= bs!3783 d!14732))

(declare-fun m!75095 () Bool)

(assert (=> bs!3783 m!75095))

(assert (=> b!48265 d!14732))

(declare-fun d!14734 () Bool)

(assert (=> d!14734 (= (head!367 (byteArrayBitContentToList!0 (_2!2383 lt!74643) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!663 (byteArrayBitContentToList!0 (_2!2383 lt!74643) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!48256 d!14734))

(declare-fun d!14736 () Bool)

(declare-fun c!3364 () Bool)

(assert (=> d!14736 (= c!3364 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32034 () List!548)

(assert (=> d!14736 (= (byteArrayBitContentToList!0 (_2!2383 lt!74643) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!32034)))

(declare-fun b!48361 () Bool)

(assert (=> b!48361 (= e!32034 Nil!545)))

(declare-fun b!48362 () Bool)

(assert (=> b!48362 (= e!32034 (Cons!544 (not (= (bvand ((_ sign_extend 24) (select (arr!1567 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2383 lt!74643) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14736 c!3364) b!48361))

(assert (= (and d!14736 (not c!3364)) b!48362))

(assert (=> b!48362 m!74919))

(assert (=> b!48362 m!75067))

(declare-fun m!75097 () Bool)

(assert (=> b!48362 m!75097))

(assert (=> b!48256 d!14736))

(declare-fun d!14738 () Bool)

(assert (=> d!14738 (= (head!367 (bitStreamReadBitsIntoList!0 (_2!2383 lt!74643) (_1!2384 lt!74642) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!663 (bitStreamReadBitsIntoList!0 (_2!2383 lt!74643) (_1!2384 lt!74642) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!48256 d!14738))

(declare-datatypes ((tuple2!4584 0))(
  ( (tuple2!4585 (_1!2391 List!548) (_2!2391 BitStream!1814)) )
))
(declare-fun e!32039 () tuple2!4584)

(declare-fun b!48372 () Bool)

(declare-fun lt!74797 () (_ BitVec 64))

(declare-datatypes ((tuple2!4586 0))(
  ( (tuple2!4587 (_1!2392 Bool) (_2!2392 BitStream!1814)) )
))
(declare-fun lt!74796 () tuple2!4586)

(assert (=> b!48372 (= e!32039 (tuple2!4585 (Cons!544 (_1!2392 lt!74796) (bitStreamReadBitsIntoList!0 (_2!2383 lt!74643) (_2!2392 lt!74796) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!74797))) (_2!2392 lt!74796)))))

(declare-fun readBit!0 (BitStream!1814) tuple2!4586)

(assert (=> b!48372 (= lt!74796 (readBit!0 (_1!2384 lt!74642)))))

(assert (=> b!48372 (= lt!74797 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!48374 () Bool)

(declare-fun e!32040 () Bool)

(declare-fun lt!74795 () List!548)

(assert (=> b!48374 (= e!32040 (> (length!243 lt!74795) 0))))

(declare-fun b!48373 () Bool)

(declare-fun isEmpty!141 (List!548) Bool)

(assert (=> b!48373 (= e!32040 (isEmpty!141 lt!74795))))

(declare-fun d!14740 () Bool)

(assert (=> d!14740 e!32040))

(declare-fun c!3370 () Bool)

(assert (=> d!14740 (= c!3370 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14740 (= lt!74795 (_1!2391 e!32039))))

(declare-fun c!3369 () Bool)

(assert (=> d!14740 (= c!3369 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14740 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14740 (= (bitStreamReadBitsIntoList!0 (_2!2383 lt!74643) (_1!2384 lt!74642) #b0000000000000000000000000000000000000000000000000000000000000001) lt!74795)))

(declare-fun b!48371 () Bool)

(assert (=> b!48371 (= e!32039 (tuple2!4585 Nil!545 (_1!2384 lt!74642)))))

(assert (= (and d!14740 c!3369) b!48371))

(assert (= (and d!14740 (not c!3369)) b!48372))

(assert (= (and d!14740 c!3370) b!48373))

(assert (= (and d!14740 (not c!3370)) b!48374))

(declare-fun m!75099 () Bool)

(assert (=> b!48372 m!75099))

(declare-fun m!75101 () Bool)

(assert (=> b!48372 m!75101))

(declare-fun m!75103 () Bool)

(assert (=> b!48374 m!75103))

(declare-fun m!75105 () Bool)

(assert (=> b!48373 m!75105))

(assert (=> b!48256 d!14740))

(declare-fun d!14742 () Bool)

(assert (=> d!14742 (= (array_inv!960 srcBuffer!2) (bvsge (size!1044 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!9642 d!14742))

(declare-fun d!14744 () Bool)

(assert (=> d!14744 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2902 thiss!1379) (currentByte!2907 thiss!1379) (size!1044 (buf!1396 thiss!1379))))))

(declare-fun bs!3784 () Bool)

(assert (= bs!3784 d!14744))

(assert (=> bs!3784 m!75089))

(assert (=> start!9642 d!14744))

(declare-fun d!14746 () Bool)

(assert (=> d!14746 (= (invariant!0 (currentBit!2902 (_2!2383 lt!74643)) (currentByte!2907 (_2!2383 lt!74643)) (size!1044 (buf!1396 (_2!2383 lt!74643)))) (and (bvsge (currentBit!2902 (_2!2383 lt!74643)) #b00000000000000000000000000000000) (bvslt (currentBit!2902 (_2!2383 lt!74643)) #b00000000000000000000000000001000) (bvsge (currentByte!2907 (_2!2383 lt!74643)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2907 (_2!2383 lt!74643)) (size!1044 (buf!1396 (_2!2383 lt!74643)))) (and (= (currentBit!2902 (_2!2383 lt!74643)) #b00000000000000000000000000000000) (= (currentByte!2907 (_2!2383 lt!74643)) (size!1044 (buf!1396 (_2!2383 lt!74643))))))))))

(assert (=> b!48266 d!14746))

(declare-fun d!14748 () Bool)

(assert (=> d!14748 (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74640)))) ((_ sign_extend 32) (currentByte!2907 (_2!2383 lt!74643))) ((_ sign_extend 32) (currentBit!2902 (_2!2383 lt!74643))) lt!74635)))

(declare-fun lt!74800 () Unit!3382)

(declare-fun choose!9 (BitStream!1814 array!2306 (_ BitVec 64) BitStream!1814) Unit!3382)

(assert (=> d!14748 (= lt!74800 (choose!9 (_2!2383 lt!74643) (buf!1396 (_2!2383 lt!74640)) lt!74635 (BitStream!1815 (buf!1396 (_2!2383 lt!74640)) (currentByte!2907 (_2!2383 lt!74643)) (currentBit!2902 (_2!2383 lt!74643)))))))

(assert (=> d!14748 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2383 lt!74643) (buf!1396 (_2!2383 lt!74640)) lt!74635) lt!74800)))

(declare-fun bs!3785 () Bool)

(assert (= bs!3785 d!14748))

(assert (=> bs!3785 m!74983))

(declare-fun m!75107 () Bool)

(assert (=> bs!3785 m!75107))

(assert (=> b!48257 d!14748))

(declare-fun b!48376 () Bool)

(declare-fun lt!74803 () (_ BitVec 64))

(declare-fun lt!74802 () tuple2!4586)

(declare-fun e!32041 () tuple2!4584)

(assert (=> b!48376 (= e!32041 (tuple2!4585 (Cons!544 (_1!2392 lt!74802) (bitStreamReadBitsIntoList!0 (_2!2383 lt!74640) (_2!2392 lt!74802) (bvsub lt!74635 lt!74803))) (_2!2392 lt!74802)))))

(assert (=> b!48376 (= lt!74802 (readBit!0 (_1!2384 lt!74628)))))

(assert (=> b!48376 (= lt!74803 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!48378 () Bool)

(declare-fun e!32042 () Bool)

(declare-fun lt!74801 () List!548)

(assert (=> b!48378 (= e!32042 (> (length!243 lt!74801) 0))))

(declare-fun b!48377 () Bool)

(assert (=> b!48377 (= e!32042 (isEmpty!141 lt!74801))))

(declare-fun d!14750 () Bool)

(assert (=> d!14750 e!32042))

(declare-fun c!3372 () Bool)

(assert (=> d!14750 (= c!3372 (= lt!74635 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14750 (= lt!74801 (_1!2391 e!32041))))

(declare-fun c!3371 () Bool)

(assert (=> d!14750 (= c!3371 (= lt!74635 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14750 (bvsge lt!74635 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14750 (= (bitStreamReadBitsIntoList!0 (_2!2383 lt!74640) (_1!2384 lt!74628) lt!74635) lt!74801)))

(declare-fun b!48375 () Bool)

(assert (=> b!48375 (= e!32041 (tuple2!4585 Nil!545 (_1!2384 lt!74628)))))

(assert (= (and d!14750 c!3371) b!48375))

(assert (= (and d!14750 (not c!3371)) b!48376))

(assert (= (and d!14750 c!3372) b!48377))

(assert (= (and d!14750 (not c!3372)) b!48378))

(declare-fun m!75109 () Bool)

(assert (=> b!48376 m!75109))

(declare-fun m!75111 () Bool)

(assert (=> b!48376 m!75111))

(declare-fun m!75113 () Bool)

(assert (=> b!48378 m!75113))

(declare-fun m!75115 () Bool)

(assert (=> b!48377 m!75115))

(assert (=> b!48257 d!14750))

(declare-fun lt!74806 () (_ BitVec 64))

(declare-fun b!48380 () Bool)

(declare-fun lt!74805 () tuple2!4586)

(declare-fun e!32043 () tuple2!4584)

(assert (=> b!48380 (= e!32043 (tuple2!4585 (Cons!544 (_1!2392 lt!74805) (bitStreamReadBitsIntoList!0 (_2!2383 lt!74640) (_2!2392 lt!74805) (bvsub (bvsub to!314 i!635) lt!74806))) (_2!2392 lt!74805)))))

(assert (=> b!48380 (= lt!74805 (readBit!0 (_1!2384 lt!74644)))))

(assert (=> b!48380 (= lt!74806 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!48382 () Bool)

(declare-fun e!32044 () Bool)

(declare-fun lt!74804 () List!548)

(assert (=> b!48382 (= e!32044 (> (length!243 lt!74804) 0))))

(declare-fun b!48381 () Bool)

(assert (=> b!48381 (= e!32044 (isEmpty!141 lt!74804))))

(declare-fun d!14752 () Bool)

(assert (=> d!14752 e!32044))

(declare-fun c!3374 () Bool)

(assert (=> d!14752 (= c!3374 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14752 (= lt!74804 (_1!2391 e!32043))))

(declare-fun c!3373 () Bool)

(assert (=> d!14752 (= c!3373 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14752 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14752 (= (bitStreamReadBitsIntoList!0 (_2!2383 lt!74640) (_1!2384 lt!74644) (bvsub to!314 i!635)) lt!74804)))

(declare-fun b!48379 () Bool)

(assert (=> b!48379 (= e!32043 (tuple2!4585 Nil!545 (_1!2384 lt!74644)))))

(assert (= (and d!14752 c!3373) b!48379))

(assert (= (and d!14752 (not c!3373)) b!48380))

(assert (= (and d!14752 c!3374) b!48381))

(assert (= (and d!14752 (not c!3374)) b!48382))

(declare-fun m!75117 () Bool)

(assert (=> b!48380 m!75117))

(declare-fun m!75119 () Bool)

(assert (=> b!48380 m!75119))

(declare-fun m!75121 () Bool)

(assert (=> b!48382 m!75121))

(declare-fun m!75123 () Bool)

(assert (=> b!48381 m!75123))

(assert (=> b!48257 d!14752))

(declare-fun b!48393 () Bool)

(declare-fun res!40671 () Bool)

(declare-fun e!32050 () Bool)

(assert (=> b!48393 (=> (not res!40671) (not e!32050))))

(declare-fun lt!74848 () tuple2!4570)

(assert (=> b!48393 (= res!40671 (isPrefixOf!0 (_2!2384 lt!74848) (_2!2383 lt!74640)))))

(declare-fun b!48394 () Bool)

(declare-fun e!32049 () Unit!3382)

(declare-fun lt!74861 () Unit!3382)

(assert (=> b!48394 (= e!32049 lt!74861)))

(declare-fun lt!74849 () (_ BitVec 64))

(assert (=> b!48394 (= lt!74849 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!74862 () (_ BitVec 64))

(assert (=> b!48394 (= lt!74862 (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74643))) (currentByte!2907 (_2!2383 lt!74643)) (currentBit!2902 (_2!2383 lt!74643))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2306 array!2306 (_ BitVec 64) (_ BitVec 64)) Unit!3382)

(assert (=> b!48394 (= lt!74861 (arrayBitRangesEqSymmetric!0 (buf!1396 (_2!2383 lt!74643)) (buf!1396 (_2!2383 lt!74640)) lt!74849 lt!74862))))

(assert (=> b!48394 (arrayBitRangesEq!0 (buf!1396 (_2!2383 lt!74640)) (buf!1396 (_2!2383 lt!74643)) lt!74849 lt!74862)))

(declare-fun b!48395 () Bool)

(declare-fun Unit!3394 () Unit!3382)

(assert (=> b!48395 (= e!32049 Unit!3394)))

(declare-fun lt!74854 () (_ BitVec 64))

(declare-fun b!48396 () Bool)

(declare-fun lt!74857 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1814 (_ BitVec 64)) BitStream!1814)

(assert (=> b!48396 (= e!32050 (= (_1!2384 lt!74848) (withMovedBitIndex!0 (_2!2384 lt!74848) (bvsub lt!74854 lt!74857))))))

(assert (=> b!48396 (or (= (bvand lt!74854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74857 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74854 lt!74857) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48396 (= lt!74857 (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74640))) (currentByte!2907 (_2!2383 lt!74640)) (currentBit!2902 (_2!2383 lt!74640))))))

(assert (=> b!48396 (= lt!74854 (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74643))) (currentByte!2907 (_2!2383 lt!74643)) (currentBit!2902 (_2!2383 lt!74643))))))

(declare-fun d!14754 () Bool)

(assert (=> d!14754 e!32050))

(declare-fun res!40670 () Bool)

(assert (=> d!14754 (=> (not res!40670) (not e!32050))))

(assert (=> d!14754 (= res!40670 (isPrefixOf!0 (_1!2384 lt!74848) (_2!2384 lt!74848)))))

(declare-fun lt!74863 () BitStream!1814)

(assert (=> d!14754 (= lt!74848 (tuple2!4571 lt!74863 (_2!2383 lt!74640)))))

(declare-fun lt!74856 () Unit!3382)

(declare-fun lt!74865 () Unit!3382)

(assert (=> d!14754 (= lt!74856 lt!74865)))

(assert (=> d!14754 (isPrefixOf!0 lt!74863 (_2!2383 lt!74640))))

(assert (=> d!14754 (= lt!74865 (lemmaIsPrefixTransitive!0 lt!74863 (_2!2383 lt!74640) (_2!2383 lt!74640)))))

(declare-fun lt!74847 () Unit!3382)

(declare-fun lt!74858 () Unit!3382)

(assert (=> d!14754 (= lt!74847 lt!74858)))

(assert (=> d!14754 (isPrefixOf!0 lt!74863 (_2!2383 lt!74640))))

(assert (=> d!14754 (= lt!74858 (lemmaIsPrefixTransitive!0 lt!74863 (_2!2383 lt!74643) (_2!2383 lt!74640)))))

(declare-fun lt!74864 () Unit!3382)

(assert (=> d!14754 (= lt!74864 e!32049)))

(declare-fun c!3377 () Bool)

(assert (=> d!14754 (= c!3377 (not (= (size!1044 (buf!1396 (_2!2383 lt!74643))) #b00000000000000000000000000000000)))))

(declare-fun lt!74855 () Unit!3382)

(declare-fun lt!74852 () Unit!3382)

(assert (=> d!14754 (= lt!74855 lt!74852)))

(assert (=> d!14754 (isPrefixOf!0 (_2!2383 lt!74640) (_2!2383 lt!74640))))

(assert (=> d!14754 (= lt!74852 (lemmaIsPrefixRefl!0 (_2!2383 lt!74640)))))

(declare-fun lt!74853 () Unit!3382)

(declare-fun lt!74850 () Unit!3382)

(assert (=> d!14754 (= lt!74853 lt!74850)))

(assert (=> d!14754 (= lt!74850 (lemmaIsPrefixRefl!0 (_2!2383 lt!74640)))))

(declare-fun lt!74859 () Unit!3382)

(declare-fun lt!74851 () Unit!3382)

(assert (=> d!14754 (= lt!74859 lt!74851)))

(assert (=> d!14754 (isPrefixOf!0 lt!74863 lt!74863)))

(assert (=> d!14754 (= lt!74851 (lemmaIsPrefixRefl!0 lt!74863))))

(declare-fun lt!74860 () Unit!3382)

(declare-fun lt!74866 () Unit!3382)

(assert (=> d!14754 (= lt!74860 lt!74866)))

(assert (=> d!14754 (isPrefixOf!0 (_2!2383 lt!74643) (_2!2383 lt!74643))))

(assert (=> d!14754 (= lt!74866 (lemmaIsPrefixRefl!0 (_2!2383 lt!74643)))))

(assert (=> d!14754 (= lt!74863 (BitStream!1815 (buf!1396 (_2!2383 lt!74640)) (currentByte!2907 (_2!2383 lt!74643)) (currentBit!2902 (_2!2383 lt!74643))))))

(assert (=> d!14754 (isPrefixOf!0 (_2!2383 lt!74643) (_2!2383 lt!74640))))

(assert (=> d!14754 (= (reader!0 (_2!2383 lt!74643) (_2!2383 lt!74640)) lt!74848)))

(declare-fun b!48397 () Bool)

(declare-fun res!40672 () Bool)

(assert (=> b!48397 (=> (not res!40672) (not e!32050))))

(assert (=> b!48397 (= res!40672 (isPrefixOf!0 (_1!2384 lt!74848) (_2!2383 lt!74643)))))

(assert (= (and d!14754 c!3377) b!48394))

(assert (= (and d!14754 (not c!3377)) b!48395))

(assert (= (and d!14754 res!40670) b!48397))

(assert (= (and b!48397 res!40672) b!48393))

(assert (= (and b!48393 res!40671) b!48396))

(declare-fun m!75125 () Bool)

(assert (=> b!48393 m!75125))

(declare-fun m!75127 () Bool)

(assert (=> b!48396 m!75127))

(assert (=> b!48396 m!74971))

(assert (=> b!48396 m!74913))

(declare-fun m!75129 () Bool)

(assert (=> d!14754 m!75129))

(declare-fun m!75131 () Bool)

(assert (=> d!14754 m!75131))

(declare-fun m!75133 () Bool)

(assert (=> d!14754 m!75133))

(declare-fun m!75135 () Bool)

(assert (=> d!14754 m!75135))

(declare-fun m!75137 () Bool)

(assert (=> d!14754 m!75137))

(declare-fun m!75139 () Bool)

(assert (=> d!14754 m!75139))

(declare-fun m!75141 () Bool)

(assert (=> d!14754 m!75141))

(declare-fun m!75143 () Bool)

(assert (=> d!14754 m!75143))

(declare-fun m!75145 () Bool)

(assert (=> d!14754 m!75145))

(assert (=> d!14754 m!74955))

(declare-fun m!75147 () Bool)

(assert (=> d!14754 m!75147))

(assert (=> b!48394 m!74913))

(declare-fun m!75149 () Bool)

(assert (=> b!48394 m!75149))

(declare-fun m!75151 () Bool)

(assert (=> b!48394 m!75151))

(declare-fun m!75153 () Bool)

(assert (=> b!48397 m!75153))

(assert (=> b!48257 d!14754))

(declare-fun d!14756 () Bool)

(assert (=> d!14756 (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74640)))) ((_ sign_extend 32) (currentByte!2907 thiss!1379)) ((_ sign_extend 32) (currentBit!2902 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!74871 () Unit!3382)

(assert (=> d!14756 (= lt!74871 (choose!9 thiss!1379 (buf!1396 (_2!2383 lt!74640)) (bvsub to!314 i!635) (BitStream!1815 (buf!1396 (_2!2383 lt!74640)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379))))))

(assert (=> d!14756 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1396 (_2!2383 lt!74640)) (bvsub to!314 i!635)) lt!74871)))

(declare-fun bs!3786 () Bool)

(assert (= bs!3786 d!14756))

(assert (=> bs!3786 m!74979))

(declare-fun m!75155 () Bool)

(assert (=> bs!3786 m!75155))

(assert (=> b!48257 d!14756))

(declare-fun d!14758 () Bool)

(assert (=> d!14758 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74640)))) ((_ sign_extend 32) (currentByte!2907 (_2!2383 lt!74643))) ((_ sign_extend 32) (currentBit!2902 (_2!2383 lt!74643))) lt!74635) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74640)))) ((_ sign_extend 32) (currentByte!2907 (_2!2383 lt!74643))) ((_ sign_extend 32) (currentBit!2902 (_2!2383 lt!74643)))) lt!74635))))

(declare-fun bs!3787 () Bool)

(assert (= bs!3787 d!14758))

(declare-fun m!75157 () Bool)

(assert (=> bs!3787 m!75157))

(assert (=> b!48257 d!14758))

(declare-fun b!48400 () Bool)

(declare-fun res!40674 () Bool)

(declare-fun e!32052 () Bool)

(assert (=> b!48400 (=> (not res!40674) (not e!32052))))

(declare-fun lt!74877 () tuple2!4570)

(assert (=> b!48400 (= res!40674 (isPrefixOf!0 (_2!2384 lt!74877) (_2!2383 lt!74640)))))

(declare-fun b!48401 () Bool)

(declare-fun e!32051 () Unit!3382)

(declare-fun lt!74890 () Unit!3382)

(assert (=> b!48401 (= e!32051 lt!74890)))

(declare-fun lt!74878 () (_ BitVec 64))

(assert (=> b!48401 (= lt!74878 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!74891 () (_ BitVec 64))

(assert (=> b!48401 (= lt!74891 (bitIndex!0 (size!1044 (buf!1396 thiss!1379)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379)))))

(assert (=> b!48401 (= lt!74890 (arrayBitRangesEqSymmetric!0 (buf!1396 thiss!1379) (buf!1396 (_2!2383 lt!74640)) lt!74878 lt!74891))))

(assert (=> b!48401 (arrayBitRangesEq!0 (buf!1396 (_2!2383 lt!74640)) (buf!1396 thiss!1379) lt!74878 lt!74891)))

(declare-fun b!48402 () Bool)

(declare-fun Unit!3395 () Unit!3382)

(assert (=> b!48402 (= e!32051 Unit!3395)))

(declare-fun lt!74883 () (_ BitVec 64))

(declare-fun lt!74886 () (_ BitVec 64))

(declare-fun b!48403 () Bool)

(assert (=> b!48403 (= e!32052 (= (_1!2384 lt!74877) (withMovedBitIndex!0 (_2!2384 lt!74877) (bvsub lt!74883 lt!74886))))))

(assert (=> b!48403 (or (= (bvand lt!74883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74886 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74883 lt!74886) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48403 (= lt!74886 (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74640))) (currentByte!2907 (_2!2383 lt!74640)) (currentBit!2902 (_2!2383 lt!74640))))))

(assert (=> b!48403 (= lt!74883 (bitIndex!0 (size!1044 (buf!1396 thiss!1379)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379)))))

(declare-fun d!14760 () Bool)

(assert (=> d!14760 e!32052))

(declare-fun res!40673 () Bool)

(assert (=> d!14760 (=> (not res!40673) (not e!32052))))

(assert (=> d!14760 (= res!40673 (isPrefixOf!0 (_1!2384 lt!74877) (_2!2384 lt!74877)))))

(declare-fun lt!74892 () BitStream!1814)

(assert (=> d!14760 (= lt!74877 (tuple2!4571 lt!74892 (_2!2383 lt!74640)))))

(declare-fun lt!74885 () Unit!3382)

(declare-fun lt!74894 () Unit!3382)

(assert (=> d!14760 (= lt!74885 lt!74894)))

(assert (=> d!14760 (isPrefixOf!0 lt!74892 (_2!2383 lt!74640))))

(assert (=> d!14760 (= lt!74894 (lemmaIsPrefixTransitive!0 lt!74892 (_2!2383 lt!74640) (_2!2383 lt!74640)))))

(declare-fun lt!74876 () Unit!3382)

(declare-fun lt!74887 () Unit!3382)

(assert (=> d!14760 (= lt!74876 lt!74887)))

(assert (=> d!14760 (isPrefixOf!0 lt!74892 (_2!2383 lt!74640))))

(assert (=> d!14760 (= lt!74887 (lemmaIsPrefixTransitive!0 lt!74892 thiss!1379 (_2!2383 lt!74640)))))

(declare-fun lt!74893 () Unit!3382)

(assert (=> d!14760 (= lt!74893 e!32051)))

(declare-fun c!3378 () Bool)

(assert (=> d!14760 (= c!3378 (not (= (size!1044 (buf!1396 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!74884 () Unit!3382)

(declare-fun lt!74881 () Unit!3382)

(assert (=> d!14760 (= lt!74884 lt!74881)))

(assert (=> d!14760 (isPrefixOf!0 (_2!2383 lt!74640) (_2!2383 lt!74640))))

(assert (=> d!14760 (= lt!74881 (lemmaIsPrefixRefl!0 (_2!2383 lt!74640)))))

(declare-fun lt!74882 () Unit!3382)

(declare-fun lt!74879 () Unit!3382)

(assert (=> d!14760 (= lt!74882 lt!74879)))

(assert (=> d!14760 (= lt!74879 (lemmaIsPrefixRefl!0 (_2!2383 lt!74640)))))

(declare-fun lt!74888 () Unit!3382)

(declare-fun lt!74880 () Unit!3382)

(assert (=> d!14760 (= lt!74888 lt!74880)))

(assert (=> d!14760 (isPrefixOf!0 lt!74892 lt!74892)))

(assert (=> d!14760 (= lt!74880 (lemmaIsPrefixRefl!0 lt!74892))))

(declare-fun lt!74889 () Unit!3382)

(declare-fun lt!74895 () Unit!3382)

(assert (=> d!14760 (= lt!74889 lt!74895)))

(assert (=> d!14760 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!14760 (= lt!74895 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!14760 (= lt!74892 (BitStream!1815 (buf!1396 (_2!2383 lt!74640)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379)))))

(assert (=> d!14760 (isPrefixOf!0 thiss!1379 (_2!2383 lt!74640))))

(assert (=> d!14760 (= (reader!0 thiss!1379 (_2!2383 lt!74640)) lt!74877)))

(declare-fun b!48404 () Bool)

(declare-fun res!40675 () Bool)

(assert (=> b!48404 (=> (not res!40675) (not e!32052))))

(assert (=> b!48404 (= res!40675 (isPrefixOf!0 (_1!2384 lt!74877) thiss!1379))))

(assert (= (and d!14760 c!3378) b!48401))

(assert (= (and d!14760 (not c!3378)) b!48402))

(assert (= (and d!14760 res!40673) b!48404))

(assert (= (and b!48404 res!40675) b!48400))

(assert (= (and b!48400 res!40674) b!48403))

(declare-fun m!75159 () Bool)

(assert (=> b!48400 m!75159))

(declare-fun m!75161 () Bool)

(assert (=> b!48403 m!75161))

(assert (=> b!48403 m!74971))

(assert (=> b!48403 m!74993))

(assert (=> d!14760 m!75129))

(declare-fun m!75163 () Bool)

(assert (=> d!14760 m!75163))

(declare-fun m!75165 () Bool)

(assert (=> d!14760 m!75165))

(declare-fun m!75167 () Bool)

(assert (=> d!14760 m!75167))

(assert (=> d!14760 m!75137))

(declare-fun m!75169 () Bool)

(assert (=> d!14760 m!75169))

(assert (=> d!14760 m!74991))

(declare-fun m!75171 () Bool)

(assert (=> d!14760 m!75171))

(assert (=> d!14760 m!74989))

(assert (=> d!14760 m!74947))

(declare-fun m!75173 () Bool)

(assert (=> d!14760 m!75173))

(assert (=> b!48401 m!74993))

(declare-fun m!75175 () Bool)

(assert (=> b!48401 m!75175))

(declare-fun m!75177 () Bool)

(assert (=> b!48401 m!75177))

(declare-fun m!75179 () Bool)

(assert (=> b!48404 m!75179))

(assert (=> b!48257 d!14760))

(declare-fun d!14762 () Bool)

(assert (=> d!14762 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74640)))) ((_ sign_extend 32) (currentByte!2907 thiss!1379)) ((_ sign_extend 32) (currentBit!2902 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74640)))) ((_ sign_extend 32) (currentByte!2907 thiss!1379)) ((_ sign_extend 32) (currentBit!2902 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3788 () Bool)

(assert (= bs!3788 d!14762))

(declare-fun m!75181 () Bool)

(assert (=> bs!3788 m!75181))

(assert (=> b!48257 d!14762))

(declare-fun d!14764 () Bool)

(declare-fun res!40677 () Bool)

(declare-fun e!32055 () Bool)

(assert (=> d!14764 (=> (not res!40677) (not e!32055))))

(assert (=> d!14764 (= res!40677 (= (size!1044 (buf!1396 (_2!2383 lt!74643))) (size!1044 (buf!1396 (_2!2383 lt!74640)))))))

(assert (=> d!14764 (= (isPrefixOf!0 (_2!2383 lt!74643) (_2!2383 lt!74640)) e!32055)))

(declare-fun b!48407 () Bool)

(declare-fun res!40678 () Bool)

(assert (=> b!48407 (=> (not res!40678) (not e!32055))))

(assert (=> b!48407 (= res!40678 (bvsle (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74643))) (currentByte!2907 (_2!2383 lt!74643)) (currentBit!2902 (_2!2383 lt!74643))) (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74640))) (currentByte!2907 (_2!2383 lt!74640)) (currentBit!2902 (_2!2383 lt!74640)))))))

(declare-fun b!48408 () Bool)

(declare-fun e!32056 () Bool)

(assert (=> b!48408 (= e!32055 e!32056)))

(declare-fun res!40676 () Bool)

(assert (=> b!48408 (=> res!40676 e!32056)))

(assert (=> b!48408 (= res!40676 (= (size!1044 (buf!1396 (_2!2383 lt!74643))) #b00000000000000000000000000000000))))

(declare-fun b!48409 () Bool)

(assert (=> b!48409 (= e!32056 (arrayBitRangesEq!0 (buf!1396 (_2!2383 lt!74643)) (buf!1396 (_2!2383 lt!74640)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74643))) (currentByte!2907 (_2!2383 lt!74643)) (currentBit!2902 (_2!2383 lt!74643)))))))

(assert (= (and d!14764 res!40677) b!48407))

(assert (= (and b!48407 res!40678) b!48408))

(assert (= (and b!48408 (not res!40676)) b!48409))

(assert (=> b!48407 m!74913))

(assert (=> b!48407 m!74971))

(assert (=> b!48409 m!74913))

(assert (=> b!48409 m!74913))

(declare-fun m!75183 () Bool)

(assert (=> b!48409 m!75183))

(assert (=> b!48268 d!14764))

(declare-fun b!48410 () Bool)

(declare-fun res!40680 () Bool)

(declare-fun e!32058 () Bool)

(assert (=> b!48410 (=> (not res!40680) (not e!32058))))

(declare-fun lt!74919 () tuple2!4570)

(assert (=> b!48410 (= res!40680 (isPrefixOf!0 (_2!2384 lt!74919) (_2!2383 lt!74643)))))

(declare-fun b!48411 () Bool)

(declare-fun e!32057 () Unit!3382)

(declare-fun lt!74932 () Unit!3382)

(assert (=> b!48411 (= e!32057 lt!74932)))

(declare-fun lt!74920 () (_ BitVec 64))

(assert (=> b!48411 (= lt!74920 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!74933 () (_ BitVec 64))

(assert (=> b!48411 (= lt!74933 (bitIndex!0 (size!1044 (buf!1396 thiss!1379)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379)))))

(assert (=> b!48411 (= lt!74932 (arrayBitRangesEqSymmetric!0 (buf!1396 thiss!1379) (buf!1396 (_2!2383 lt!74643)) lt!74920 lt!74933))))

(assert (=> b!48411 (arrayBitRangesEq!0 (buf!1396 (_2!2383 lt!74643)) (buf!1396 thiss!1379) lt!74920 lt!74933)))

(declare-fun b!48412 () Bool)

(declare-fun Unit!3396 () Unit!3382)

(assert (=> b!48412 (= e!32057 Unit!3396)))

(declare-fun b!48413 () Bool)

(declare-fun lt!74928 () (_ BitVec 64))

(declare-fun lt!74925 () (_ BitVec 64))

(assert (=> b!48413 (= e!32058 (= (_1!2384 lt!74919) (withMovedBitIndex!0 (_2!2384 lt!74919) (bvsub lt!74925 lt!74928))))))

(assert (=> b!48413 (or (= (bvand lt!74925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74928 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74925 lt!74928) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48413 (= lt!74928 (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74643))) (currentByte!2907 (_2!2383 lt!74643)) (currentBit!2902 (_2!2383 lt!74643))))))

(assert (=> b!48413 (= lt!74925 (bitIndex!0 (size!1044 (buf!1396 thiss!1379)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379)))))

(declare-fun d!14766 () Bool)

(assert (=> d!14766 e!32058))

(declare-fun res!40679 () Bool)

(assert (=> d!14766 (=> (not res!40679) (not e!32058))))

(assert (=> d!14766 (= res!40679 (isPrefixOf!0 (_1!2384 lt!74919) (_2!2384 lt!74919)))))

(declare-fun lt!74934 () BitStream!1814)

(assert (=> d!14766 (= lt!74919 (tuple2!4571 lt!74934 (_2!2383 lt!74643)))))

(declare-fun lt!74927 () Unit!3382)

(declare-fun lt!74936 () Unit!3382)

(assert (=> d!14766 (= lt!74927 lt!74936)))

(assert (=> d!14766 (isPrefixOf!0 lt!74934 (_2!2383 lt!74643))))

(assert (=> d!14766 (= lt!74936 (lemmaIsPrefixTransitive!0 lt!74934 (_2!2383 lt!74643) (_2!2383 lt!74643)))))

(declare-fun lt!74918 () Unit!3382)

(declare-fun lt!74929 () Unit!3382)

(assert (=> d!14766 (= lt!74918 lt!74929)))

(assert (=> d!14766 (isPrefixOf!0 lt!74934 (_2!2383 lt!74643))))

(assert (=> d!14766 (= lt!74929 (lemmaIsPrefixTransitive!0 lt!74934 thiss!1379 (_2!2383 lt!74643)))))

(declare-fun lt!74935 () Unit!3382)

(assert (=> d!14766 (= lt!74935 e!32057)))

(declare-fun c!3381 () Bool)

(assert (=> d!14766 (= c!3381 (not (= (size!1044 (buf!1396 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!74926 () Unit!3382)

(declare-fun lt!74923 () Unit!3382)

(assert (=> d!14766 (= lt!74926 lt!74923)))

(assert (=> d!14766 (isPrefixOf!0 (_2!2383 lt!74643) (_2!2383 lt!74643))))

(assert (=> d!14766 (= lt!74923 (lemmaIsPrefixRefl!0 (_2!2383 lt!74643)))))

(declare-fun lt!74924 () Unit!3382)

(declare-fun lt!74921 () Unit!3382)

(assert (=> d!14766 (= lt!74924 lt!74921)))

(assert (=> d!14766 (= lt!74921 (lemmaIsPrefixRefl!0 (_2!2383 lt!74643)))))

(declare-fun lt!74930 () Unit!3382)

(declare-fun lt!74922 () Unit!3382)

(assert (=> d!14766 (= lt!74930 lt!74922)))

(assert (=> d!14766 (isPrefixOf!0 lt!74934 lt!74934)))

(assert (=> d!14766 (= lt!74922 (lemmaIsPrefixRefl!0 lt!74934))))

(declare-fun lt!74931 () Unit!3382)

(declare-fun lt!74937 () Unit!3382)

(assert (=> d!14766 (= lt!74931 lt!74937)))

(assert (=> d!14766 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!14766 (= lt!74937 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!14766 (= lt!74934 (BitStream!1815 (buf!1396 (_2!2383 lt!74643)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379)))))

(assert (=> d!14766 (isPrefixOf!0 thiss!1379 (_2!2383 lt!74643))))

(assert (=> d!14766 (= (reader!0 thiss!1379 (_2!2383 lt!74643)) lt!74919)))

(declare-fun b!48414 () Bool)

(declare-fun res!40681 () Bool)

(assert (=> b!48414 (=> (not res!40681) (not e!32058))))

(assert (=> b!48414 (= res!40681 (isPrefixOf!0 (_1!2384 lt!74919) thiss!1379))))

(assert (= (and d!14766 c!3381) b!48411))

(assert (= (and d!14766 (not c!3381)) b!48412))

(assert (= (and d!14766 res!40679) b!48414))

(assert (= (and b!48414 res!40681) b!48410))

(assert (= (and b!48410 res!40680) b!48413))

(declare-fun m!75185 () Bool)

(assert (=> b!48410 m!75185))

(declare-fun m!75187 () Bool)

(assert (=> b!48413 m!75187))

(assert (=> b!48413 m!74913))

(assert (=> b!48413 m!74993))

(assert (=> d!14766 m!75145))

(declare-fun m!75189 () Bool)

(assert (=> d!14766 m!75189))

(declare-fun m!75191 () Bool)

(assert (=> d!14766 m!75191))

(declare-fun m!75193 () Bool)

(assert (=> d!14766 m!75193))

(assert (=> d!14766 m!75141))

(declare-fun m!75195 () Bool)

(assert (=> d!14766 m!75195))

(assert (=> d!14766 m!74991))

(declare-fun m!75197 () Bool)

(assert (=> d!14766 m!75197))

(assert (=> d!14766 m!74989))

(assert (=> d!14766 m!74921))

(declare-fun m!75199 () Bool)

(assert (=> d!14766 m!75199))

(assert (=> b!48411 m!74993))

(declare-fun m!75201 () Bool)

(assert (=> b!48411 m!75201))

(declare-fun m!75203 () Bool)

(assert (=> b!48411 m!75203))

(declare-fun m!75205 () Bool)

(assert (=> b!48414 m!75205))

(assert (=> b!48268 d!14766))

(declare-fun d!14768 () Bool)

(assert (=> d!14768 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74643)))) ((_ sign_extend 32) (currentByte!2907 thiss!1379)) ((_ sign_extend 32) (currentBit!2902 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74643)))) ((_ sign_extend 32) (currentByte!2907 thiss!1379)) ((_ sign_extend 32) (currentBit!2902 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3789 () Bool)

(assert (= bs!3789 d!14768))

(declare-fun m!75207 () Bool)

(assert (=> bs!3789 m!75207))

(assert (=> b!48268 d!14768))

(declare-fun d!14770 () Bool)

(assert (=> d!14770 (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74643)))) ((_ sign_extend 32) (currentByte!2907 thiss!1379)) ((_ sign_extend 32) (currentBit!2902 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!74958 () Unit!3382)

(assert (=> d!14770 (= lt!74958 (choose!9 thiss!1379 (buf!1396 (_2!2383 lt!74643)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1815 (buf!1396 (_2!2383 lt!74643)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379))))))

(assert (=> d!14770 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1396 (_2!2383 lt!74643)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!74958)))

(declare-fun bs!3790 () Bool)

(assert (= bs!3790 d!14770))

(assert (=> bs!3790 m!74951))

(declare-fun m!75209 () Bool)

(assert (=> bs!3790 m!75209))

(assert (=> b!48268 d!14770))

(declare-fun d!14772 () Bool)

(assert (=> d!14772 (isPrefixOf!0 thiss!1379 (_2!2383 lt!74640))))

(declare-fun lt!74987 () Unit!3382)

(declare-fun choose!30 (BitStream!1814 BitStream!1814 BitStream!1814) Unit!3382)

(assert (=> d!14772 (= lt!74987 (choose!30 thiss!1379 (_2!2383 lt!74643) (_2!2383 lt!74640)))))

(assert (=> d!14772 (isPrefixOf!0 thiss!1379 (_2!2383 lt!74643))))

(assert (=> d!14772 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2383 lt!74643) (_2!2383 lt!74640)) lt!74987)))

(declare-fun bs!3791 () Bool)

(assert (= bs!3791 d!14772))

(assert (=> bs!3791 m!74947))

(declare-fun m!75211 () Bool)

(assert (=> bs!3791 m!75211))

(assert (=> bs!3791 m!74921))

(assert (=> b!48268 d!14772))

(declare-fun d!14774 () Bool)

(declare-fun res!40683 () Bool)

(declare-fun e!32059 () Bool)

(assert (=> d!14774 (=> (not res!40683) (not e!32059))))

(assert (=> d!14774 (= res!40683 (= (size!1044 (buf!1396 thiss!1379)) (size!1044 (buf!1396 (_2!2383 lt!74640)))))))

(assert (=> d!14774 (= (isPrefixOf!0 thiss!1379 (_2!2383 lt!74640)) e!32059)))

(declare-fun b!48415 () Bool)

(declare-fun res!40684 () Bool)

(assert (=> b!48415 (=> (not res!40684) (not e!32059))))

(assert (=> b!48415 (= res!40684 (bvsle (bitIndex!0 (size!1044 (buf!1396 thiss!1379)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379)) (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74640))) (currentByte!2907 (_2!2383 lt!74640)) (currentBit!2902 (_2!2383 lt!74640)))))))

(declare-fun b!48416 () Bool)

(declare-fun e!32060 () Bool)

(assert (=> b!48416 (= e!32059 e!32060)))

(declare-fun res!40682 () Bool)

(assert (=> b!48416 (=> res!40682 e!32060)))

(assert (=> b!48416 (= res!40682 (= (size!1044 (buf!1396 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!48417 () Bool)

(assert (=> b!48417 (= e!32060 (arrayBitRangesEq!0 (buf!1396 thiss!1379) (buf!1396 (_2!2383 lt!74640)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1044 (buf!1396 thiss!1379)) (currentByte!2907 thiss!1379) (currentBit!2902 thiss!1379))))))

(assert (= (and d!14774 res!40683) b!48415))

(assert (= (and b!48415 res!40684) b!48416))

(assert (= (and b!48416 (not res!40682)) b!48417))

(assert (=> b!48415 m!74993))

(assert (=> b!48415 m!74971))

(assert (=> b!48417 m!74993))

(assert (=> b!48417 m!74993))

(declare-fun m!75213 () Bool)

(assert (=> b!48417 m!75213))

(assert (=> b!48268 d!14774))

(declare-fun b!48539 () Bool)

(declare-fun e!32120 () tuple2!4568)

(declare-fun lt!75289 () tuple2!4568)

(declare-fun Unit!3397 () Unit!3382)

(assert (=> b!48539 (= e!32120 (tuple2!4569 Unit!3397 (_2!2383 lt!75289)))))

(declare-fun lt!75285 () tuple2!4568)

(assert (=> b!48539 (= lt!75285 (appendBitFromByte!0 (_2!2383 lt!74643) (select (arr!1567 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!75296 () (_ BitVec 64))

(assert (=> b!48539 (= lt!75296 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!75299 () (_ BitVec 64))

(assert (=> b!48539 (= lt!75299 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!75293 () Unit!3382)

(assert (=> b!48539 (= lt!75293 (validateOffsetBitsIneqLemma!0 (_2!2383 lt!74643) (_2!2383 lt!75285) lt!75296 lt!75299))))

(assert (=> b!48539 (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!75285)))) ((_ sign_extend 32) (currentByte!2907 (_2!2383 lt!75285))) ((_ sign_extend 32) (currentBit!2902 (_2!2383 lt!75285))) (bvsub lt!75296 lt!75299))))

(declare-fun lt!75268 () Unit!3382)

(assert (=> b!48539 (= lt!75268 lt!75293)))

(declare-fun lt!75297 () tuple2!4570)

(assert (=> b!48539 (= lt!75297 (reader!0 (_2!2383 lt!74643) (_2!2383 lt!75285)))))

(declare-fun lt!75304 () (_ BitVec 64))

(assert (=> b!48539 (= lt!75304 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!75277 () Unit!3382)

(assert (=> b!48539 (= lt!75277 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2383 lt!74643) (buf!1396 (_2!2383 lt!75285)) lt!75304))))

(assert (=> b!48539 (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!75285)))) ((_ sign_extend 32) (currentByte!2907 (_2!2383 lt!74643))) ((_ sign_extend 32) (currentBit!2902 (_2!2383 lt!74643))) lt!75304)))

(declare-fun lt!75281 () Unit!3382)

(assert (=> b!48539 (= lt!75281 lt!75277)))

(assert (=> b!48539 (= (head!367 (byteArrayBitContentToList!0 (_2!2383 lt!75285) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!367 (bitStreamReadBitsIntoList!0 (_2!2383 lt!75285) (_1!2384 lt!75297) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!75292 () Unit!3382)

(declare-fun Unit!3398 () Unit!3382)

(assert (=> b!48539 (= lt!75292 Unit!3398)))

(assert (=> b!48539 (= lt!75289 (appendBitsMSBFirstLoop!0 (_2!2383 lt!75285) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!75280 () Unit!3382)

(assert (=> b!48539 (= lt!75280 (lemmaIsPrefixTransitive!0 (_2!2383 lt!74643) (_2!2383 lt!75285) (_2!2383 lt!75289)))))

(assert (=> b!48539 (isPrefixOf!0 (_2!2383 lt!74643) (_2!2383 lt!75289))))

(declare-fun lt!75278 () Unit!3382)

(assert (=> b!48539 (= lt!75278 lt!75280)))

(assert (=> b!48539 (= (size!1044 (buf!1396 (_2!2383 lt!75289))) (size!1044 (buf!1396 (_2!2383 lt!74643))))))

(declare-fun lt!75275 () Unit!3382)

(declare-fun Unit!3399 () Unit!3382)

(assert (=> b!48539 (= lt!75275 Unit!3399)))

(assert (=> b!48539 (= (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!75289))) (currentByte!2907 (_2!2383 lt!75289)) (currentBit!2902 (_2!2383 lt!75289))) (bvsub (bvadd (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74643))) (currentByte!2907 (_2!2383 lt!74643)) (currentBit!2902 (_2!2383 lt!74643))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!75302 () Unit!3382)

(declare-fun Unit!3400 () Unit!3382)

(assert (=> b!48539 (= lt!75302 Unit!3400)))

(assert (=> b!48539 (= (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!75289))) (currentByte!2907 (_2!2383 lt!75289)) (currentBit!2902 (_2!2383 lt!75289))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!75285))) (currentByte!2907 (_2!2383 lt!75285)) (currentBit!2902 (_2!2383 lt!75285))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!75286 () Unit!3382)

(declare-fun Unit!3401 () Unit!3382)

(assert (=> b!48539 (= lt!75286 Unit!3401)))

(declare-fun lt!75310 () tuple2!4570)

(declare-fun call!607 () tuple2!4570)

(assert (=> b!48539 (= lt!75310 call!607)))

(declare-fun lt!75298 () (_ BitVec 64))

(assert (=> b!48539 (= lt!75298 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!75301 () Unit!3382)

(assert (=> b!48539 (= lt!75301 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2383 lt!74643) (buf!1396 (_2!2383 lt!75289)) lt!75298))))

(assert (=> b!48539 (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!75289)))) ((_ sign_extend 32) (currentByte!2907 (_2!2383 lt!74643))) ((_ sign_extend 32) (currentBit!2902 (_2!2383 lt!74643))) lt!75298)))

(declare-fun lt!75273 () Unit!3382)

(assert (=> b!48539 (= lt!75273 lt!75301)))

(declare-fun lt!75306 () tuple2!4570)

(assert (=> b!48539 (= lt!75306 (reader!0 (_2!2383 lt!75285) (_2!2383 lt!75289)))))

(declare-fun lt!75307 () (_ BitVec 64))

(assert (=> b!48539 (= lt!75307 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!75272 () Unit!3382)

(assert (=> b!48539 (= lt!75272 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2383 lt!75285) (buf!1396 (_2!2383 lt!75289)) lt!75307))))

(assert (=> b!48539 (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!75289)))) ((_ sign_extend 32) (currentByte!2907 (_2!2383 lt!75285))) ((_ sign_extend 32) (currentBit!2902 (_2!2383 lt!75285))) lt!75307)))

(declare-fun lt!75284 () Unit!3382)

(assert (=> b!48539 (= lt!75284 lt!75272)))

(declare-fun lt!75288 () List!548)

(assert (=> b!48539 (= lt!75288 (byteArrayBitContentToList!0 (_2!2383 lt!75289) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!75295 () List!548)

(assert (=> b!48539 (= lt!75295 (byteArrayBitContentToList!0 (_2!2383 lt!75289) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!75303 () List!548)

(assert (=> b!48539 (= lt!75303 (bitStreamReadBitsIntoList!0 (_2!2383 lt!75289) (_1!2384 lt!75310) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!75294 () List!548)

(assert (=> b!48539 (= lt!75294 (bitStreamReadBitsIntoList!0 (_2!2383 lt!75289) (_1!2384 lt!75306) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!75290 () (_ BitVec 64))

(assert (=> b!48539 (= lt!75290 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!75271 () Unit!3382)

(assert (=> b!48539 (= lt!75271 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2383 lt!75289) (_2!2383 lt!75289) (_1!2384 lt!75310) (_1!2384 lt!75306) lt!75290 lt!75303))))

(assert (=> b!48539 (= (bitStreamReadBitsIntoList!0 (_2!2383 lt!75289) (_1!2384 lt!75306) (bvsub lt!75290 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!234 lt!75303))))

(declare-fun lt!75308 () Unit!3382)

(assert (=> b!48539 (= lt!75308 lt!75271)))

(declare-fun lt!75270 () Unit!3382)

(declare-fun lt!75300 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2306 array!2306 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3382)

(assert (=> b!48539 (= lt!75270 (arrayBitRangesEqImpliesEq!0 (buf!1396 (_2!2383 lt!75285)) (buf!1396 (_2!2383 lt!75289)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!75300 (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!75285))) (currentByte!2907 (_2!2383 lt!75285)) (currentBit!2902 (_2!2383 lt!75285)))))))

(assert (=> b!48539 (= (bitAt!0 (buf!1396 (_2!2383 lt!75285)) lt!75300) (bitAt!0 (buf!1396 (_2!2383 lt!75289)) lt!75300))))

(declare-fun lt!75282 () Unit!3382)

(assert (=> b!48539 (= lt!75282 lt!75270)))

(declare-fun d!14776 () Bool)

(declare-fun e!32121 () Bool)

(assert (=> d!14776 e!32121))

(declare-fun res!40772 () Bool)

(assert (=> d!14776 (=> (not res!40772) (not e!32121))))

(declare-fun lt!75267 () (_ BitVec 64))

(declare-fun lt!75291 () tuple2!4568)

(assert (=> d!14776 (= res!40772 (= (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!75291))) (currentByte!2907 (_2!2383 lt!75291)) (currentBit!2902 (_2!2383 lt!75291))) (bvsub lt!75267 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!14776 (or (= (bvand lt!75267 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!75267 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!75267 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!75279 () (_ BitVec 64))

(assert (=> d!14776 (= lt!75267 (bvadd lt!75279 to!314))))

(assert (=> d!14776 (or (not (= (bvand lt!75279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!75279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!75279 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14776 (= lt!75279 (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74643))) (currentByte!2907 (_2!2383 lt!74643)) (currentBit!2902 (_2!2383 lt!74643))))))

(assert (=> d!14776 (= lt!75291 e!32120)))

(declare-fun c!3401 () Bool)

(assert (=> d!14776 (= c!3401 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!75269 () Unit!3382)

(declare-fun lt!75283 () Unit!3382)

(assert (=> d!14776 (= lt!75269 lt!75283)))

(assert (=> d!14776 (isPrefixOf!0 (_2!2383 lt!74643) (_2!2383 lt!74643))))

(assert (=> d!14776 (= lt!75283 (lemmaIsPrefixRefl!0 (_2!2383 lt!74643)))))

(assert (=> d!14776 (= lt!75300 (bitIndex!0 (size!1044 (buf!1396 (_2!2383 lt!74643))) (currentByte!2907 (_2!2383 lt!74643)) (currentBit!2902 (_2!2383 lt!74643))))))

(assert (=> d!14776 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14776 (= (appendBitsMSBFirstLoop!0 (_2!2383 lt!74643) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!75291)))

(declare-fun b!48540 () Bool)

(declare-fun res!40767 () Bool)

(assert (=> b!48540 (=> (not res!40767) (not e!32121))))

(assert (=> b!48540 (= res!40767 (= (size!1044 (buf!1396 (_2!2383 lt!75291))) (size!1044 (buf!1396 (_2!2383 lt!74643)))))))

(declare-fun b!48541 () Bool)

(declare-fun Unit!3402 () Unit!3382)

(assert (=> b!48541 (= e!32120 (tuple2!4569 Unit!3402 (_2!2383 lt!74643)))))

(assert (=> b!48541 (= (size!1044 (buf!1396 (_2!2383 lt!74643))) (size!1044 (buf!1396 (_2!2383 lt!74643))))))

(declare-fun lt!75276 () Unit!3382)

(declare-fun Unit!3403 () Unit!3382)

(assert (=> b!48541 (= lt!75276 Unit!3403)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1814 array!2306 array!2306 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!48541 (checkByteArrayBitContent!0 (_2!2383 lt!74643) srcBuffer!2 (_1!2390 (readBits!0 (_1!2384 call!607) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!48542 () Bool)

(declare-fun res!40770 () Bool)

(assert (=> b!48542 (=> (not res!40770) (not e!32121))))

(assert (=> b!48542 (= res!40770 (isPrefixOf!0 (_2!2383 lt!74643) (_2!2383 lt!75291)))))

(declare-fun bm!604 () Bool)

(assert (=> bm!604 (= call!607 (reader!0 (_2!2383 lt!74643) (ite c!3401 (_2!2383 lt!75289) (_2!2383 lt!74643))))))

(declare-fun b!48543 () Bool)

(declare-fun res!40769 () Bool)

(assert (=> b!48543 (=> (not res!40769) (not e!32121))))

(assert (=> b!48543 (= res!40769 (invariant!0 (currentBit!2902 (_2!2383 lt!75291)) (currentByte!2907 (_2!2383 lt!75291)) (size!1044 (buf!1396 (_2!2383 lt!75291)))))))

(declare-fun lt!75274 () tuple2!4570)

(declare-fun b!48544 () Bool)

(assert (=> b!48544 (= e!32121 (= (bitStreamReadBitsIntoList!0 (_2!2383 lt!75291) (_1!2384 lt!75274) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2383 lt!75291) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!48544 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48544 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!75287 () Unit!3382)

(declare-fun lt!75309 () Unit!3382)

(assert (=> b!48544 (= lt!75287 lt!75309)))

(declare-fun lt!75305 () (_ BitVec 64))

(assert (=> b!48544 (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!75291)))) ((_ sign_extend 32) (currentByte!2907 (_2!2383 lt!74643))) ((_ sign_extend 32) (currentBit!2902 (_2!2383 lt!74643))) lt!75305)))

(assert (=> b!48544 (= lt!75309 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2383 lt!74643) (buf!1396 (_2!2383 lt!75291)) lt!75305))))

(declare-fun e!32119 () Bool)

(assert (=> b!48544 e!32119))

(declare-fun res!40771 () Bool)

(assert (=> b!48544 (=> (not res!40771) (not e!32119))))

(assert (=> b!48544 (= res!40771 (and (= (size!1044 (buf!1396 (_2!2383 lt!74643))) (size!1044 (buf!1396 (_2!2383 lt!75291)))) (bvsge lt!75305 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48544 (= lt!75305 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!48544 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48544 (= lt!75274 (reader!0 (_2!2383 lt!74643) (_2!2383 lt!75291)))))

(declare-fun b!48545 () Bool)

(assert (=> b!48545 (= e!32119 (validate_offset_bits!1 ((_ sign_extend 32) (size!1044 (buf!1396 (_2!2383 lt!74643)))) ((_ sign_extend 32) (currentByte!2907 (_2!2383 lt!74643))) ((_ sign_extend 32) (currentBit!2902 (_2!2383 lt!74643))) lt!75305))))

(declare-fun b!48546 () Bool)

(declare-fun res!40768 () Bool)

(assert (=> b!48546 (=> (not res!40768) (not e!32121))))

(assert (=> b!48546 (= res!40768 (= (size!1044 (buf!1396 (_2!2383 lt!74643))) (size!1044 (buf!1396 (_2!2383 lt!75291)))))))

(assert (= (and d!14776 c!3401) b!48539))

(assert (= (and d!14776 (not c!3401)) b!48541))

(assert (= (or b!48539 b!48541) bm!604))

(assert (= (and d!14776 res!40772) b!48543))

(assert (= (and b!48543 res!40769) b!48546))

(assert (= (and b!48546 res!40768) b!48542))

(assert (= (and b!48542 res!40770) b!48540))

(assert (= (and b!48540 res!40767) b!48544))

(assert (= (and b!48544 res!40771) b!48545))

(declare-fun m!75441 () Bool)

(assert (=> d!14776 m!75441))

(assert (=> d!14776 m!74913))

(assert (=> d!14776 m!75145))

(assert (=> d!14776 m!75141))

(declare-fun m!75443 () Bool)

(assert (=> b!48542 m!75443))

(declare-fun m!75445 () Bool)

(assert (=> b!48544 m!75445))

(declare-fun m!75447 () Bool)

(assert (=> b!48544 m!75447))

(declare-fun m!75449 () Bool)

(assert (=> b!48544 m!75449))

(declare-fun m!75451 () Bool)

(assert (=> b!48544 m!75451))

(declare-fun m!75453 () Bool)

(assert (=> b!48544 m!75453))

(declare-fun m!75455 () Bool)

(assert (=> b!48545 m!75455))

(declare-fun m!75457 () Bool)

(assert (=> bm!604 m!75457))

(declare-fun m!75459 () Bool)

(assert (=> b!48539 m!75459))

(declare-fun m!75461 () Bool)

(assert (=> b!48539 m!75461))

(declare-fun m!75463 () Bool)

(assert (=> b!48539 m!75463))

(declare-fun m!75465 () Bool)

(assert (=> b!48539 m!75465))

(declare-fun m!75467 () Bool)

(assert (=> b!48539 m!75467))

(assert (=> b!48539 m!75467))

(declare-fun m!75469 () Bool)

(assert (=> b!48539 m!75469))

(declare-fun m!75471 () Bool)

(assert (=> b!48539 m!75471))

(declare-fun m!75473 () Bool)

(assert (=> b!48539 m!75473))

(declare-fun m!75475 () Bool)

(assert (=> b!48539 m!75475))

(declare-fun m!75477 () Bool)

(assert (=> b!48539 m!75477))

(declare-fun m!75479 () Bool)

(assert (=> b!48539 m!75479))

(declare-fun m!75481 () Bool)

(assert (=> b!48539 m!75481))

(declare-fun m!75483 () Bool)

(assert (=> b!48539 m!75483))

(declare-fun m!75485 () Bool)

(assert (=> b!48539 m!75485))

(declare-fun m!75487 () Bool)

(assert (=> b!48539 m!75487))

(declare-fun m!75489 () Bool)

(assert (=> b!48539 m!75489))

(declare-fun m!75491 () Bool)

(assert (=> b!48539 m!75491))

(assert (=> b!48539 m!74913))

(declare-fun m!75493 () Bool)

(assert (=> b!48539 m!75493))

(declare-fun m!75495 () Bool)

(assert (=> b!48539 m!75495))

(declare-fun m!75497 () Bool)

(assert (=> b!48539 m!75497))

(declare-fun m!75499 () Bool)

(assert (=> b!48539 m!75499))

(declare-fun m!75501 () Bool)

(assert (=> b!48539 m!75501))

(declare-fun m!75503 () Bool)

(assert (=> b!48539 m!75503))

(declare-fun m!75505 () Bool)

(assert (=> b!48539 m!75505))

(declare-fun m!75507 () Bool)

(assert (=> b!48539 m!75507))

(declare-fun m!75509 () Bool)

(assert (=> b!48539 m!75509))

(declare-fun m!75511 () Bool)

(assert (=> b!48539 m!75511))

(declare-fun m!75513 () Bool)

(assert (=> b!48539 m!75513))

(declare-fun m!75515 () Bool)

(assert (=> b!48539 m!75515))

(assert (=> b!48539 m!75481))

(assert (=> b!48539 m!75511))

(declare-fun m!75517 () Bool)

(assert (=> b!48539 m!75517))

(assert (=> b!48539 m!75477))

(declare-fun m!75519 () Bool)

(assert (=> b!48539 m!75519))

(declare-fun m!75521 () Bool)

(assert (=> b!48541 m!75521))

(declare-fun m!75523 () Bool)

(assert (=> b!48541 m!75523))

(declare-fun m!75525 () Bool)

(assert (=> b!48543 m!75525))

(assert (=> b!48268 d!14776))

(declare-fun d!14846 () Bool)

(assert (=> d!14846 (= (invariant!0 (currentBit!2902 (_2!2383 lt!74640)) (currentByte!2907 (_2!2383 lt!74640)) (size!1044 (buf!1396 (_2!2383 lt!74640)))) (and (bvsge (currentBit!2902 (_2!2383 lt!74640)) #b00000000000000000000000000000000) (bvslt (currentBit!2902 (_2!2383 lt!74640)) #b00000000000000000000000000001000) (bvsge (currentByte!2907 (_2!2383 lt!74640)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2907 (_2!2383 lt!74640)) (size!1044 (buf!1396 (_2!2383 lt!74640)))) (and (= (currentBit!2902 (_2!2383 lt!74640)) #b00000000000000000000000000000000) (= (currentByte!2907 (_2!2383 lt!74640)) (size!1044 (buf!1396 (_2!2383 lt!74640))))))))))

(assert (=> b!48267 d!14846))

(push 1)

(assert (not d!14716))

(assert (not b!48541))

(assert (not b!48411))

(assert (not d!14776))

(assert (not b!48542))

(assert (not b!48360))

(assert (not b!48394))

(assert (not d!14696))

(assert (not b!48404))

(assert (not d!14754))

(assert (not b!48397))

(assert (not b!48410))

(assert (not d!14770))

(assert (not d!14744))

(assert (not b!48343))

(assert (not d!14766))

(assert (not d!14758))

(assert (not b!48543))

(assert (not d!14756))

(assert (not d!14760))

(assert (not b!48407))

(assert (not d!14772))

(assert (not b!48362))

(assert (not d!14698))

(assert (not b!48344))

(assert (not b!48317))

(assert (not b!48347))

(assert (not b!48400))

(assert (not b!48381))

(assert (not d!14720))

(assert (not b!48414))

(assert (not d!14708))

(assert (not b!48403))

(assert (not b!48304))

(assert (not b!48319))

(assert (not d!14748))

(assert (not bm!604))

(assert (not b!48340))

(assert (not b!48378))

(assert (not d!14762))

(assert (not b!48545))

(assert (not b!48380))

(assert (not b!48544))

(assert (not b!48417))

(assert (not d!14694))

(assert (not b!48342))

(assert (not b!48372))

(assert (not b!48382))

(assert (not b!48346))

(assert (not d!14768))

(assert (not b!48374))

(assert (not d!14710))

(assert (not d!14718))

(assert (not b!48341))

(assert (not b!48396))

(assert (not b!48401))

(assert (not d!14712))

(assert (not b!48373))

(assert (not b!48350))

(assert (not b!48413))

(assert (not b!48322))

(assert (not b!48345))

(assert (not b!48539))

(assert (not b!48415))

(assert (not b!48377))

(assert (not b!48393))

(assert (not b!48409))

(assert (not b!48376))

(assert (not b!48348))

(assert (not d!14732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

