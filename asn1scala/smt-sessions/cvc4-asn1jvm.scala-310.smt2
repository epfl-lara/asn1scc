; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6378 () Bool)

(assert start!6378)

(declare-fun b!30050 () Bool)

(declare-fun res!25887 () Bool)

(declare-fun e!20078 () Bool)

(assert (=> b!30050 (=> res!25887 e!20078)))

(declare-datatypes ((List!386 0))(
  ( (Nil!383) (Cons!382 (h!501 Bool) (t!1136 List!386)) )
))
(declare-fun lt!43357 () List!386)

(declare-fun length!112 (List!386) Int)

(assert (=> b!30050 (= res!25887 (<= (length!112 lt!43357) 0))))

(declare-fun b!30051 () Bool)

(declare-fun res!25892 () Bool)

(declare-fun e!20072 () Bool)

(assert (=> b!30051 (=> res!25892 e!20072)))

(declare-datatypes ((array!1782 0))(
  ( (array!1783 (arr!1240 (Array (_ BitVec 32) (_ BitVec 8))) (size!777 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1370 0))(
  ( (BitStream!1371 (buf!1105 array!1782) (currentByte!2448 (_ BitVec 32)) (currentBit!2443 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2323 0))(
  ( (Unit!2324) )
))
(declare-datatypes ((tuple2!3178 0))(
  ( (tuple2!3179 (_1!1676 Unit!2323) (_2!1676 BitStream!1370)) )
))
(declare-fun lt!43361 () tuple2!3178)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!30051 (= res!25892 (not (invariant!0 (currentBit!2443 (_2!1676 lt!43361)) (currentByte!2448 (_2!1676 lt!43361)) (size!777 (buf!1105 (_2!1676 lt!43361))))))))

(declare-fun b!30052 () Bool)

(declare-fun e!20069 () Bool)

(declare-fun e!20071 () Bool)

(assert (=> b!30052 (= e!20069 (not e!20071))))

(declare-fun res!25883 () Bool)

(assert (=> b!30052 (=> res!25883 e!20071)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!30052 (= res!25883 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1370)

(declare-fun isPrefixOf!0 (BitStream!1370 BitStream!1370) Bool)

(assert (=> b!30052 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!43365 () Unit!2323)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1370) Unit!2323)

(assert (=> b!30052 (= lt!43365 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!43366 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!30052 (= lt!43366 (bitIndex!0 (size!777 (buf!1105 thiss!1379)) (currentByte!2448 thiss!1379) (currentBit!2443 thiss!1379)))))

(declare-fun b!30053 () Bool)

(declare-fun res!25885 () Bool)

(assert (=> b!30053 (=> (not res!25885) (not e!20069))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!30053 (= res!25885 (validate_offset_bits!1 ((_ sign_extend 32) (size!777 (buf!1105 thiss!1379))) ((_ sign_extend 32) (currentByte!2448 thiss!1379)) ((_ sign_extend 32) (currentBit!2443 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!30054 () Bool)

(declare-fun res!25894 () Bool)

(declare-fun e!20080 () Bool)

(assert (=> b!30054 (=> res!25894 e!20080)))

(declare-fun lt!43349 () tuple2!3178)

(assert (=> b!30054 (= res!25894 (not (invariant!0 (currentBit!2443 (_2!1676 lt!43349)) (currentByte!2448 (_2!1676 lt!43349)) (size!777 (buf!1105 (_2!1676 lt!43361))))))))

(declare-fun b!30055 () Bool)

(declare-fun e!20076 () Bool)

(assert (=> b!30055 (= e!20078 e!20076)))

(declare-fun res!25884 () Bool)

(assert (=> b!30055 (=> res!25884 e!20076)))

(declare-fun lt!43356 () List!386)

(declare-fun lt!43364 () List!386)

(assert (=> b!30055 (= res!25884 (not (= lt!43356 lt!43364)))))

(assert (=> b!30055 (= lt!43364 lt!43356)))

(declare-fun tail!103 (List!386) List!386)

(assert (=> b!30055 (= lt!43356 (tail!103 lt!43357))))

(declare-datatypes ((tuple2!3180 0))(
  ( (tuple2!3181 (_1!1677 BitStream!1370) (_2!1677 BitStream!1370)) )
))
(declare-fun lt!43354 () tuple2!3180)

(declare-fun lt!43363 () tuple2!3180)

(declare-fun lt!43353 () Unit!2323)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1370 BitStream!1370 BitStream!1370 BitStream!1370 (_ BitVec 64) List!386) Unit!2323)

(assert (=> b!30055 (= lt!43353 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1676 lt!43361) (_2!1676 lt!43361) (_1!1677 lt!43363) (_1!1677 lt!43354) (bvsub to!314 i!635) lt!43357))))

(declare-fun b!30056 () Bool)

(declare-fun res!25893 () Bool)

(assert (=> b!30056 (=> res!25893 e!20076)))

(declare-fun bitAt!0 (array!1782 (_ BitVec 64)) Bool)

(assert (=> b!30056 (= res!25893 (not (= (bitAt!0 (buf!1105 (_1!1677 lt!43363)) lt!43366) (bitAt!0 (buf!1105 (_1!1677 lt!43354)) lt!43366))))))

(declare-fun b!30057 () Bool)

(declare-fun e!20079 () Bool)

(assert (=> b!30057 (= e!20079 e!20072)))

(declare-fun res!25898 () Bool)

(assert (=> b!30057 (=> res!25898 e!20072)))

(declare-fun lt!43350 () (_ BitVec 64))

(assert (=> b!30057 (= res!25898 (not (= lt!43350 (bvsub (bvadd lt!43366 to!314) i!635))))))

(assert (=> b!30057 (= lt!43350 (bitIndex!0 (size!777 (buf!1105 (_2!1676 lt!43361))) (currentByte!2448 (_2!1676 lt!43361)) (currentBit!2443 (_2!1676 lt!43361))))))

(declare-fun b!30059 () Bool)

(declare-fun e!20073 () Bool)

(declare-fun array_inv!738 (array!1782) Bool)

(assert (=> b!30059 (= e!20073 (array_inv!738 (buf!1105 thiss!1379)))))

(declare-fun b!30060 () Bool)

(declare-fun e!20075 () Bool)

(assert (=> b!30060 (= e!20075 (= lt!43350 (bvsub (bvsub (bvadd (bitIndex!0 (size!777 (buf!1105 (_2!1676 lt!43349))) (currentByte!2448 (_2!1676 lt!43349)) (currentBit!2443 (_2!1676 lt!43349))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!30061 () Bool)

(declare-fun e!20068 () Bool)

(assert (=> b!30061 (= e!20071 e!20068)))

(declare-fun res!25897 () Bool)

(assert (=> b!30061 (=> res!25897 e!20068)))

(assert (=> b!30061 (= res!25897 (not (isPrefixOf!0 thiss!1379 (_2!1676 lt!43349))))))

(declare-fun lt!43359 () (_ BitVec 64))

(assert (=> b!30061 (validate_offset_bits!1 ((_ sign_extend 32) (size!777 (buf!1105 (_2!1676 lt!43349)))) ((_ sign_extend 32) (currentByte!2448 (_2!1676 lt!43349))) ((_ sign_extend 32) (currentBit!2443 (_2!1676 lt!43349))) lt!43359)))

(assert (=> b!30061 (= lt!43359 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!43351 () Unit!2323)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1370 BitStream!1370 (_ BitVec 64) (_ BitVec 64)) Unit!2323)

(assert (=> b!30061 (= lt!43351 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1676 lt!43349) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1782)

(declare-fun appendBitFromByte!0 (BitStream!1370 (_ BitVec 8) (_ BitVec 32)) tuple2!3178)

(assert (=> b!30061 (= lt!43349 (appendBitFromByte!0 thiss!1379 (select (arr!1240 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun e!20070 () Bool)

(declare-fun b!30062 () Bool)

(declare-fun lt!43360 () tuple2!3180)

(declare-fun head!223 (List!386) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1370 array!1782 (_ BitVec 64) (_ BitVec 64)) List!386)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1370 BitStream!1370 (_ BitVec 64)) List!386)

(assert (=> b!30062 (= e!20070 (= (head!223 (byteArrayBitContentToList!0 (_2!1676 lt!43349) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!223 (bitStreamReadBitsIntoList!0 (_2!1676 lt!43349) (_1!1677 lt!43360) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!30063 () Bool)

(assert (=> b!30063 (= e!20080 e!20078)))

(declare-fun res!25895 () Bool)

(assert (=> b!30063 (=> res!25895 e!20078)))

(assert (=> b!30063 (= res!25895 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!30063 (= lt!43364 (bitStreamReadBitsIntoList!0 (_2!1676 lt!43361) (_1!1677 lt!43354) lt!43359))))

(assert (=> b!30063 (= lt!43357 (bitStreamReadBitsIntoList!0 (_2!1676 lt!43361) (_1!1677 lt!43363) (bvsub to!314 i!635)))))

(assert (=> b!30063 (validate_offset_bits!1 ((_ sign_extend 32) (size!777 (buf!1105 (_2!1676 lt!43361)))) ((_ sign_extend 32) (currentByte!2448 (_2!1676 lt!43349))) ((_ sign_extend 32) (currentBit!2443 (_2!1676 lt!43349))) lt!43359)))

(declare-fun lt!43352 () Unit!2323)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1370 array!1782 (_ BitVec 64)) Unit!2323)

(assert (=> b!30063 (= lt!43352 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1676 lt!43349) (buf!1105 (_2!1676 lt!43361)) lt!43359))))

(declare-fun reader!0 (BitStream!1370 BitStream!1370) tuple2!3180)

(assert (=> b!30063 (= lt!43354 (reader!0 (_2!1676 lt!43349) (_2!1676 lt!43361)))))

(assert (=> b!30063 (validate_offset_bits!1 ((_ sign_extend 32) (size!777 (buf!1105 (_2!1676 lt!43361)))) ((_ sign_extend 32) (currentByte!2448 thiss!1379)) ((_ sign_extend 32) (currentBit!2443 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!43358 () Unit!2323)

(assert (=> b!30063 (= lt!43358 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1105 (_2!1676 lt!43361)) (bvsub to!314 i!635)))))

(assert (=> b!30063 (= lt!43363 (reader!0 thiss!1379 (_2!1676 lt!43361)))))

(declare-fun res!25891 () Bool)

(assert (=> start!6378 (=> (not res!25891) (not e!20069))))

(assert (=> start!6378 (= res!25891 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!777 srcBuffer!2))))))))

(assert (=> start!6378 e!20069))

(assert (=> start!6378 true))

(assert (=> start!6378 (array_inv!738 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1370) Bool)

(assert (=> start!6378 (and (inv!12 thiss!1379) e!20073)))

(declare-fun b!30058 () Bool)

(declare-fun res!25890 () Bool)

(assert (=> b!30058 (=> res!25890 e!20080)))

(assert (=> b!30058 (= res!25890 (not (invariant!0 (currentBit!2443 (_2!1676 lt!43349)) (currentByte!2448 (_2!1676 lt!43349)) (size!777 (buf!1105 (_2!1676 lt!43349))))))))

(declare-fun b!30064 () Bool)

(assert (=> b!30064 (= e!20072 e!20080)))

(declare-fun res!25889 () Bool)

(assert (=> b!30064 (=> res!25889 e!20080)))

(assert (=> b!30064 (= res!25889 (not (= (size!777 (buf!1105 (_2!1676 lt!43349))) (size!777 (buf!1105 (_2!1676 lt!43361))))))))

(assert (=> b!30064 e!20075))

(declare-fun res!25899 () Bool)

(assert (=> b!30064 (=> (not res!25899) (not e!20075))))

(assert (=> b!30064 (= res!25899 (= (size!777 (buf!1105 (_2!1676 lt!43361))) (size!777 (buf!1105 thiss!1379))))))

(declare-fun b!30065 () Bool)

(assert (=> b!30065 (= e!20068 e!20079)))

(declare-fun res!25888 () Bool)

(assert (=> b!30065 (=> res!25888 e!20079)))

(assert (=> b!30065 (= res!25888 (not (isPrefixOf!0 (_2!1676 lt!43349) (_2!1676 lt!43361))))))

(assert (=> b!30065 (isPrefixOf!0 thiss!1379 (_2!1676 lt!43361))))

(declare-fun lt!43355 () Unit!2323)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1370 BitStream!1370 BitStream!1370) Unit!2323)

(assert (=> b!30065 (= lt!43355 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1676 lt!43349) (_2!1676 lt!43361)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1370 array!1782 (_ BitVec 64) (_ BitVec 64)) tuple2!3178)

(assert (=> b!30065 (= lt!43361 (appendBitsMSBFirstLoop!0 (_2!1676 lt!43349) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!30065 e!20070))

(declare-fun res!25896 () Bool)

(assert (=> b!30065 (=> (not res!25896) (not e!20070))))

(assert (=> b!30065 (= res!25896 (validate_offset_bits!1 ((_ sign_extend 32) (size!777 (buf!1105 (_2!1676 lt!43349)))) ((_ sign_extend 32) (currentByte!2448 thiss!1379)) ((_ sign_extend 32) (currentBit!2443 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!43362 () Unit!2323)

(assert (=> b!30065 (= lt!43362 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1105 (_2!1676 lt!43349)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!30065 (= lt!43360 (reader!0 thiss!1379 (_2!1676 lt!43349)))))

(declare-fun b!30066 () Bool)

(declare-fun res!25886 () Bool)

(assert (=> b!30066 (=> res!25886 e!20072)))

(assert (=> b!30066 (= res!25886 (not (= (size!777 (buf!1105 thiss!1379)) (size!777 (buf!1105 (_2!1676 lt!43361))))))))

(declare-fun b!30067 () Bool)

(assert (=> b!30067 (= e!20076 (not (= lt!43357 Nil!383)))))

(assert (= (and start!6378 res!25891) b!30053))

(assert (= (and b!30053 res!25885) b!30052))

(assert (= (and b!30052 (not res!25883)) b!30061))

(assert (= (and b!30061 (not res!25897)) b!30065))

(assert (= (and b!30065 res!25896) b!30062))

(assert (= (and b!30065 (not res!25888)) b!30057))

(assert (= (and b!30057 (not res!25898)) b!30051))

(assert (= (and b!30051 (not res!25892)) b!30066))

(assert (= (and b!30066 (not res!25886)) b!30064))

(assert (= (and b!30064 res!25899) b!30060))

(assert (= (and b!30064 (not res!25889)) b!30058))

(assert (= (and b!30058 (not res!25890)) b!30054))

(assert (= (and b!30054 (not res!25894)) b!30063))

(assert (= (and b!30063 (not res!25895)) b!30050))

(assert (= (and b!30050 (not res!25887)) b!30055))

(assert (= (and b!30055 (not res!25884)) b!30056))

(assert (= (and b!30056 (not res!25893)) b!30067))

(assert (= start!6378 b!30059))

(declare-fun m!43703 () Bool)

(assert (=> b!30052 m!43703))

(declare-fun m!43705 () Bool)

(assert (=> b!30052 m!43705))

(declare-fun m!43707 () Bool)

(assert (=> b!30052 m!43707))

(declare-fun m!43709 () Bool)

(assert (=> b!30054 m!43709))

(declare-fun m!43711 () Bool)

(assert (=> b!30065 m!43711))

(declare-fun m!43713 () Bool)

(assert (=> b!30065 m!43713))

(declare-fun m!43715 () Bool)

(assert (=> b!30065 m!43715))

(declare-fun m!43717 () Bool)

(assert (=> b!30065 m!43717))

(declare-fun m!43719 () Bool)

(assert (=> b!30065 m!43719))

(declare-fun m!43721 () Bool)

(assert (=> b!30065 m!43721))

(declare-fun m!43723 () Bool)

(assert (=> b!30065 m!43723))

(declare-fun m!43725 () Bool)

(assert (=> b!30060 m!43725))

(declare-fun m!43727 () Bool)

(assert (=> b!30059 m!43727))

(declare-fun m!43729 () Bool)

(assert (=> b!30057 m!43729))

(declare-fun m!43731 () Bool)

(assert (=> b!30053 m!43731))

(declare-fun m!43733 () Bool)

(assert (=> b!30051 m!43733))

(declare-fun m!43735 () Bool)

(assert (=> b!30058 m!43735))

(declare-fun m!43737 () Bool)

(assert (=> b!30050 m!43737))

(declare-fun m!43739 () Bool)

(assert (=> start!6378 m!43739))

(declare-fun m!43741 () Bool)

(assert (=> start!6378 m!43741))

(declare-fun m!43743 () Bool)

(assert (=> b!30056 m!43743))

(declare-fun m!43745 () Bool)

(assert (=> b!30056 m!43745))

(declare-fun m!43747 () Bool)

(assert (=> b!30061 m!43747))

(declare-fun m!43749 () Bool)

(assert (=> b!30061 m!43749))

(declare-fun m!43751 () Bool)

(assert (=> b!30061 m!43751))

(declare-fun m!43753 () Bool)

(assert (=> b!30061 m!43753))

(assert (=> b!30061 m!43747))

(declare-fun m!43755 () Bool)

(assert (=> b!30061 m!43755))

(declare-fun m!43757 () Bool)

(assert (=> b!30062 m!43757))

(assert (=> b!30062 m!43757))

(declare-fun m!43759 () Bool)

(assert (=> b!30062 m!43759))

(declare-fun m!43761 () Bool)

(assert (=> b!30062 m!43761))

(assert (=> b!30062 m!43761))

(declare-fun m!43763 () Bool)

(assert (=> b!30062 m!43763))

(declare-fun m!43765 () Bool)

(assert (=> b!30055 m!43765))

(declare-fun m!43767 () Bool)

(assert (=> b!30055 m!43767))

(declare-fun m!43769 () Bool)

(assert (=> b!30063 m!43769))

(declare-fun m!43771 () Bool)

(assert (=> b!30063 m!43771))

(declare-fun m!43773 () Bool)

(assert (=> b!30063 m!43773))

(declare-fun m!43775 () Bool)

(assert (=> b!30063 m!43775))

(declare-fun m!43777 () Bool)

(assert (=> b!30063 m!43777))

(declare-fun m!43779 () Bool)

(assert (=> b!30063 m!43779))

(declare-fun m!43781 () Bool)

(assert (=> b!30063 m!43781))

(declare-fun m!43783 () Bool)

(assert (=> b!30063 m!43783))

(push 1)

(assert (not b!30053))

(assert (not start!6378))

(assert (not b!30063))

(assert (not b!30054))

(assert (not b!30051))

(assert (not b!30059))

(assert (not b!30061))

(assert (not b!30056))

(assert (not b!30060))

(assert (not b!30055))

(assert (not b!30057))

(assert (not b!30062))

(assert (not b!30052))

(assert (not b!30065))

(assert (not b!30058))

(assert (not b!30050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8616 () Bool)

(assert (=> d!8616 (= (invariant!0 (currentBit!2443 (_2!1676 lt!43361)) (currentByte!2448 (_2!1676 lt!43361)) (size!777 (buf!1105 (_2!1676 lt!43361)))) (and (bvsge (currentBit!2443 (_2!1676 lt!43361)) #b00000000000000000000000000000000) (bvslt (currentBit!2443 (_2!1676 lt!43361)) #b00000000000000000000000000001000) (bvsge (currentByte!2448 (_2!1676 lt!43361)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2448 (_2!1676 lt!43361)) (size!777 (buf!1105 (_2!1676 lt!43361)))) (and (= (currentBit!2443 (_2!1676 lt!43361)) #b00000000000000000000000000000000) (= (currentByte!2448 (_2!1676 lt!43361)) (size!777 (buf!1105 (_2!1676 lt!43361))))))))))

(assert (=> b!30051 d!8616))

(declare-fun d!8618 () Bool)

(assert (=> d!8618 (= (array_inv!738 srcBuffer!2) (bvsge (size!777 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6378 d!8618))

(declare-fun d!8620 () Bool)

(assert (=> d!8620 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2443 thiss!1379) (currentByte!2448 thiss!1379) (size!777 (buf!1105 thiss!1379))))))

(declare-fun bs!2423 () Bool)

(assert (= bs!2423 d!8620))

(declare-fun m!43901 () Bool)

(assert (=> bs!2423 m!43901))

(assert (=> start!6378 d!8620))

(declare-fun d!8622 () Bool)

(declare-fun size!780 (List!386) Int)

(assert (=> d!8622 (= (length!112 lt!43357) (size!780 lt!43357))))

(declare-fun bs!2424 () Bool)

(assert (= bs!2424 d!8622))

(declare-fun m!43903 () Bool)

(assert (=> bs!2424 m!43903))

(assert (=> b!30050 d!8622))

(declare-fun d!8624 () Bool)

(declare-fun res!25942 () Bool)

(declare-fun e!20119 () Bool)

(assert (=> d!8624 (=> (not res!25942) (not e!20119))))

(assert (=> d!8624 (= res!25942 (= (size!777 (buf!1105 thiss!1379)) (size!777 (buf!1105 (_2!1676 lt!43349)))))))

(assert (=> d!8624 (= (isPrefixOf!0 thiss!1379 (_2!1676 lt!43349)) e!20119)))

(declare-fun b!30136 () Bool)

(declare-fun res!25943 () Bool)

(assert (=> b!30136 (=> (not res!25943) (not e!20119))))

(assert (=> b!30136 (= res!25943 (bvsle (bitIndex!0 (size!777 (buf!1105 thiss!1379)) (currentByte!2448 thiss!1379) (currentBit!2443 thiss!1379)) (bitIndex!0 (size!777 (buf!1105 (_2!1676 lt!43349))) (currentByte!2448 (_2!1676 lt!43349)) (currentBit!2443 (_2!1676 lt!43349)))))))

(declare-fun b!30137 () Bool)

(declare-fun e!20118 () Bool)

(assert (=> b!30137 (= e!20119 e!20118)))

(declare-fun res!25944 () Bool)

(assert (=> b!30137 (=> res!25944 e!20118)))

(assert (=> b!30137 (= res!25944 (= (size!777 (buf!1105 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!30138 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1782 array!1782 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!30138 (= e!20118 (arrayBitRangesEq!0 (buf!1105 thiss!1379) (buf!1105 (_2!1676 lt!43349)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!777 (buf!1105 thiss!1379)) (currentByte!2448 thiss!1379) (currentBit!2443 thiss!1379))))))

(assert (= (and d!8624 res!25942) b!30136))

(assert (= (and b!30136 res!25943) b!30137))

(assert (= (and b!30137 (not res!25944)) b!30138))

(assert (=> b!30136 m!43707))

(assert (=> b!30136 m!43725))

(assert (=> b!30138 m!43707))

(assert (=> b!30138 m!43707))

(declare-fun m!43905 () Bool)

(assert (=> b!30138 m!43905))

(assert (=> b!30061 d!8624))

(declare-fun d!8626 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!8626 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!777 (buf!1105 (_2!1676 lt!43349)))) ((_ sign_extend 32) (currentByte!2448 (_2!1676 lt!43349))) ((_ sign_extend 32) (currentBit!2443 (_2!1676 lt!43349))) lt!43359) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!777 (buf!1105 (_2!1676 lt!43349)))) ((_ sign_extend 32) (currentByte!2448 (_2!1676 lt!43349))) ((_ sign_extend 32) (currentBit!2443 (_2!1676 lt!43349)))) lt!43359))))

(declare-fun bs!2425 () Bool)

(assert (= bs!2425 d!8626))

(declare-fun m!43907 () Bool)

(assert (=> bs!2425 m!43907))

(assert (=> b!30061 d!8626))

(declare-fun d!8628 () Bool)

(declare-fun e!20122 () Bool)

(assert (=> d!8628 e!20122))

(declare-fun res!25947 () Bool)

(assert (=> d!8628 (=> (not res!25947) (not e!20122))))

(assert (=> d!8628 (= res!25947 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!43495 () Unit!2323)

(declare-fun choose!27 (BitStream!1370 BitStream!1370 (_ BitVec 64) (_ BitVec 64)) Unit!2323)

(assert (=> d!8628 (= lt!43495 (choose!27 thiss!1379 (_2!1676 lt!43349) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!8628 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!8628 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1676 lt!43349) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!43495)))

(declare-fun b!30141 () Bool)

(assert (=> b!30141 (= e!20122 (validate_offset_bits!1 ((_ sign_extend 32) (size!777 (buf!1105 (_2!1676 lt!43349)))) ((_ sign_extend 32) (currentByte!2448 (_2!1676 lt!43349))) ((_ sign_extend 32) (currentBit!2443 (_2!1676 lt!43349))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!8628 res!25947) b!30141))

(declare-fun m!43909 () Bool)

(assert (=> d!8628 m!43909))

(declare-fun m!43911 () Bool)

(assert (=> b!30141 m!43911))

(assert (=> b!30061 d!8628))

(declare-fun b!30159 () Bool)

(declare-fun res!25971 () Bool)

(declare-fun e!20134 () Bool)

(assert (=> b!30159 (=> (not res!25971) (not e!20134))))

(declare-fun lt!43531 () tuple2!3178)

(assert (=> b!30159 (= res!25971 (= (bitIndex!0 (size!777 (buf!1105 (_2!1676 lt!43531))) (currentByte!2448 (_2!1676 lt!43531)) (currentBit!2443 (_2!1676 lt!43531))) (bvadd (bitIndex!0 (size!777 (buf!1105 thiss!1379)) (currentByte!2448 thiss!1379) (currentBit!2443 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!30160 () Bool)

(declare-fun res!25969 () Bool)

(assert (=> b!30160 (=> (not res!25969) (not e!20134))))

(assert (=> b!30160 (= res!25969 (isPrefixOf!0 thiss!1379 (_2!1676 lt!43531)))))

(declare-fun d!8630 () Bool)

(declare-fun e!20132 () Bool)

(assert (=> d!8630 e!20132))

(declare-fun res!25967 () Bool)

(assert (=> d!8630 (=> (not res!25967) (not e!20132))))

(declare-fun lt!43520 () tuple2!3178)

(assert (=> d!8630 (= res!25967 (= (size!777 (buf!1105 (_2!1676 lt!43520))) (size!777 (buf!1105 thiss!1379))))))

(declare-fun lt!43529 () (_ BitVec 8))

(declare-fun lt!43527 () array!1782)

(assert (=> d!8630 (= lt!43529 (select (arr!1240 lt!43527) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!8630 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!777 lt!43527)))))

(assert (=> d!8630 (= lt!43527 (array!1783 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!43521 () tuple2!3178)

(assert (=> d!8630 (= lt!43520 (tuple2!3179 (_1!1676 lt!43521) (_2!1676 lt!43521)))))

(assert (=> d!8630 (= lt!43521 lt!43531)))

(assert (=> d!8630 e!20134))

(declare-fun res!25964 () Bool)

(assert (=> d!8630 (=> (not res!25964) (not e!20134))))

(assert (=> d!8630 (= res!25964 (= (size!777 (buf!1105 thiss!1379)) (size!777 (buf!1105 (_2!1676 lt!43531)))))))

(declare-fun lt!43524 () Bool)

(declare-fun appendBit!0 (BitStream!1370 Bool) tuple2!3178)

(assert (=> d!8630 (= lt!43531 (appendBit!0 thiss!1379 lt!43524))))

(assert (=> d!8630 (= lt!43524 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1240 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!8630 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!8630 (= (appendBitFromByte!0 thiss!1379 (select (arr!1240 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!43520)))

(declare-fun b!30161 () Bool)

(declare-fun res!25970 () Bool)

(assert (=> b!30161 (=> (not res!25970) (not e!20132))))

(assert (=> b!30161 (= res!25970 (isPrefixOf!0 thiss!1379 (_2!1676 lt!43520)))))

(declare-fun b!30162 () Bool)

(declare-fun e!20131 () Bool)

(declare-datatypes ((tuple2!3198 0))(
  ( (tuple2!3199 (_1!1686 BitStream!1370) (_2!1686 Bool)) )
))
(declare-fun lt!43528 () tuple2!3198)

(assert (=> b!30162 (= e!20131 (= (bitIndex!0 (size!777 (buf!1105 (_1!1686 lt!43528))) (currentByte!2448 (_1!1686 lt!43528)) (currentBit!2443 (_1!1686 lt!43528))) (bitIndex!0 (size!777 (buf!1105 (_2!1676 lt!43531))) (currentByte!2448 (_2!1676 lt!43531)) (currentBit!2443 (_2!1676 lt!43531)))))))

(declare-fun b!30163 () Bool)

(declare-fun e!20133 () Bool)

(declare-fun lt!43530 () tuple2!3198)

(assert (=> b!30163 (= e!20133 (= (bitIndex!0 (size!777 (buf!1105 (_1!1686 lt!43530))) (currentByte!2448 (_1!1686 lt!43530)) (currentBit!2443 (_1!1686 lt!43530))) (bitIndex!0 (size!777 (buf!1105 (_2!1676 lt!43520))) (currentByte!2448 (_2!1676 lt!43520)) (currentBit!2443 (_2!1676 lt!43520)))))))

(declare-fun b!30164 () Bool)

(declare-fun res!25966 () Bool)

(assert (=> b!30164 (=> (not res!25966) (not e!20132))))

(declare-fun lt!43522 () (_ BitVec 64))

(declare-fun lt!43526 () (_ BitVec 64))

(assert (=> b!30164 (= res!25966 (= (bitIndex!0 (size!777 (buf!1105 (_2!1676 lt!43520))) (currentByte!2448 (_2!1676 lt!43520)) (currentBit!2443 (_2!1676 lt!43520))) (bvadd lt!43522 lt!43526)))))

(assert (=> b!30164 (or (not (= (bvand lt!43522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!43526 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!43522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!43522 lt!43526) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30164 (= lt!43526 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!30164 (= lt!43522 (bitIndex!0 (size!777 (buf!1105 thiss!1379)) (currentByte!2448 thiss!1379) (currentBit!2443 thiss!1379)))))

(declare-fun b!30165 () Bool)

(assert (=> b!30165 (= e!20134 e!20131)))

(declare-fun res!25968 () Bool)

(assert (=> b!30165 (=> (not res!25968) (not e!20131))))

(assert (=> b!30165 (= res!25968 (and (= (_2!1686 lt!43528) lt!43524) (= (_1!1686 lt!43528) (_2!1676 lt!43531))))))

(declare-fun readBitPure!0 (BitStream!1370) tuple2!3198)

(declare-fun readerFrom!0 (BitStream!1370 (_ BitVec 32) (_ BitVec 32)) BitStream!1370)

(assert (=> b!30165 (= lt!43528 (readBitPure!0 (readerFrom!0 (_2!1676 lt!43531) (currentBit!2443 thiss!1379) (currentByte!2448 thiss!1379))))))

(declare-fun b!30166 () Bool)

(assert (=> b!30166 (= e!20132 e!20133)))

(declare-fun res!25965 () Bool)

(assert (=> b!30166 (=> (not res!25965) (not e!20133))))

(assert (=> b!30166 (= res!25965 (and (= (_2!1686 lt!43530) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1240 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!43529)) #b00000000000000000000000000000000))) (= (_1!1686 lt!43530) (_2!1676 lt!43520))))))

(declare-datatypes ((tuple2!3200 0))(
  ( (tuple2!3201 (_1!1687 array!1782) (_2!1687 BitStream!1370)) )
))
(declare-fun lt!43523 () tuple2!3200)

(declare-fun lt!43525 () BitStream!1370)

(declare-fun readBits!0 (BitStream!1370 (_ BitVec 64)) tuple2!3200)

(assert (=> b!30166 (= lt!43523 (readBits!0 lt!43525 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!30166 (= lt!43530 (readBitPure!0 lt!43525))))

(assert (=> b!30166 (= lt!43525 (readerFrom!0 (_2!1676 lt!43520) (currentBit!2443 thiss!1379) (currentByte!2448 thiss!1379)))))

(assert (= (and d!8630 res!25964) b!30159))

(assert (= (and b!30159 res!25971) b!30160))

(assert (= (and b!30160 res!25969) b!30165))

(assert (= (and b!30165 res!25968) b!30162))

(assert (= (and d!8630 res!25967) b!30164))

(assert (= (and b!30164 res!25966) b!30161))

(assert (= (and b!30161 res!25970) b!30166))

(assert (= (and b!30166 res!25965) b!30163))

(declare-fun m!43913 () Bool)

(assert (=> b!30163 m!43913))

(declare-fun m!43915 () Bool)

(assert (=> b!30163 m!43915))

(declare-fun m!43917 () Bool)

(assert (=> b!30161 m!43917))

(declare-fun m!43919 () Bool)

(assert (=> b!30159 m!43919))

(assert (=> b!30159 m!43707))

(declare-fun m!43921 () Bool)

(assert (=> b!30160 m!43921))

(assert (=> b!30164 m!43915))

(assert (=> b!30164 m!43707))

(declare-fun m!43923 () Bool)

(assert (=> b!30162 m!43923))

(assert (=> b!30162 m!43919))

(declare-fun m!43925 () Bool)

(assert (=> b!30165 m!43925))

(assert (=> b!30165 m!43925))

(declare-fun m!43927 () Bool)

(assert (=> b!30165 m!43927))

(declare-fun m!43929 () Bool)

(assert (=> b!30166 m!43929))

(declare-fun m!43931 () Bool)

(assert (=> b!30166 m!43931))

(declare-fun m!43933 () Bool)

(assert (=> b!30166 m!43933))

(declare-fun m!43935 () Bool)

(assert (=> d!8630 m!43935))

(declare-fun m!43937 () Bool)

(assert (=> d!8630 m!43937))

(declare-fun m!43939 () Bool)

(assert (=> d!8630 m!43939))

(assert (=> b!30061 d!8630))

(declare-fun d!8632 () Bool)

(declare-fun e!20137 () Bool)

(assert (=> d!8632 e!20137))

(declare-fun res!25977 () Bool)

(assert (=> d!8632 (=> (not res!25977) (not e!20137))))

(declare-fun lt!43549 () (_ BitVec 64))

(declare-fun lt!43544 () (_ BitVec 64))

(declare-fun lt!43548 () (_ BitVec 64))

(assert (=> d!8632 (= res!25977 (= lt!43548 (bvsub lt!43549 lt!43544)))))

(assert (=> d!8632 (or (= (bvand lt!43549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!43544 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!43549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!43549 lt!43544) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8632 (= lt!43544 (remainingBits!0 ((_ sign_extend 32) (size!777 (buf!1105 (_2!1676 lt!43349)))) ((_ sign_extend 32) (currentByte!2448 (_2!1676 lt!43349))) ((_ sign_extend 32) (currentBit!2443 (_2!1676 lt!43349)))))))

(declare-fun lt!43546 () (_ BitVec 64))

(declare-fun lt!43545 () (_ BitVec 64))

(assert (=> d!8632 (= lt!43549 (bvmul lt!43546 lt!43545))))

(assert (=> d!8632 (or (= lt!43546 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!43545 (bvsdiv (bvmul lt!43546 lt!43545) lt!43546)))))

(assert (=> d!8632 (= lt!43545 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8632 (= lt!43546 ((_ sign_extend 32) (size!777 (buf!1105 (_2!1676 lt!43349)))))))

(assert (=> d!8632 (= lt!43548 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2448 (_2!1676 lt!43349))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2443 (_2!1676 lt!43349)))))))

(assert (=> d!8632 (invariant!0 (currentBit!2443 (_2!1676 lt!43349)) (currentByte!2448 (_2!1676 lt!43349)) (size!777 (buf!1105 (_2!1676 lt!43349))))))

(assert (=> d!8632 (= (bitIndex!0 (size!777 (buf!1105 (_2!1676 lt!43349))) (currentByte!2448 (_2!1676 lt!43349)) (currentBit!2443 (_2!1676 lt!43349))) lt!43548)))

(declare-fun b!30171 () Bool)

(declare-fun res!25976 () Bool)

(assert (=> b!30171 (=> (not res!25976) (not e!20137))))

(assert (=> b!30171 (= res!25976 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!43548))))

(declare-fun b!30172 () Bool)

(declare-fun lt!43547 () (_ BitVec 64))

(assert (=> b!30172 (= e!20137 (bvsle lt!43548 (bvmul lt!43547 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!30172 (or (= lt!43547 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!43547 #b0000000000000000000000000000000000000000000000000000000000001000) lt!43547)))))

(assert (=> b!30172 (= lt!43547 ((_ sign_extend 32) (size!777 (buf!1105 (_2!1676 lt!43349)))))))

(assert (= (and d!8632 res!25977) b!30171))

(assert (= (and b!30171 res!25976) b!30172))

(assert (=> d!8632 m!43907))

(assert (=> d!8632 m!43735))

(assert (=> b!30060 d!8632))

(declare-fun d!8634 () Bool)

(assert (=> d!8634 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!777 (buf!1105 thiss!1379))) ((_ sign_extend 32) (currentByte!2448 thiss!1379)) ((_ sign_extend 32) (currentBit!2443 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!777 (buf!1105 thiss!1379))) ((_ sign_extend 32) (currentByte!2448 thiss!1379)) ((_ sign_extend 32) (currentBit!2443 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2426 () Bool)

(assert (= bs!2426 d!8634))

(declare-fun m!43941 () Bool)

(assert (=> bs!2426 m!43941))

(assert (=> b!30053 d!8634))

(declare-fun d!8636 () Bool)

(declare-fun res!25978 () Bool)

(declare-fun e!20139 () Bool)

(assert (=> d!8636 (=> (not res!25978) (not e!20139))))

(assert (=> d!8636 (= res!25978 (= (size!777 (buf!1105 thiss!1379)) (size!777 (buf!1105 thiss!1379))))))

(assert (=> d!8636 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!20139)))

(declare-fun b!30173 () Bool)

(declare-fun res!25979 () Bool)

(assert (=> b!30173 (=> (not res!25979) (not e!20139))))

(assert (=> b!30173 (= res!25979 (bvsle (bitIndex!0 (size!777 (buf!1105 thiss!1379)) (currentByte!2448 thiss!1379) (currentBit!2443 thiss!1379)) (bitIndex!0 (size!777 (buf!1105 thiss!1379)) (currentByte!2448 thiss!1379) (currentBit!2443 thiss!1379))))))

(declare-fun b!30174 () Bool)

(declare-fun e!20138 () Bool)

(assert (=> b!30174 (= e!20139 e!20138)))

(declare-fun res!25980 () Bool)

(assert (=> b!30174 (=> res!25980 e!20138)))

(assert (=> b!30174 (= res!25980 (= (size!777 (buf!1105 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!30175 () Bool)

(assert (=> b!30175 (= e!20138 (arrayBitRangesEq!0 (buf!1105 thiss!1379) (buf!1105 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!777 (buf!1105 thiss!1379)) (currentByte!2448 thiss!1379) (currentBit!2443 thiss!1379))))))

(assert (= (and d!8636 res!25978) b!30173))

(assert (= (and b!30173 res!25979) b!30174))

(assert (= (and b!30174 (not res!25980)) b!30175))

(assert (=> b!30173 m!43707))

(assert (=> b!30173 m!43707))

(assert (=> b!30175 m!43707))

(assert (=> b!30175 m!43707))

(declare-fun m!43943 () Bool)

(assert (=> b!30175 m!43943))

(assert (=> b!30052 d!8636))

(declare-fun d!8638 () Bool)

(assert (=> d!8638 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!43552 () Unit!2323)

(declare-fun choose!11 (BitStream!1370) Unit!2323)

(assert (=> d!8638 (= lt!43552 (choose!11 thiss!1379))))

(assert (=> d!8638 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!43552)))

(declare-fun bs!2428 () Bool)

(assert (= bs!2428 d!8638))

(assert (=> bs!2428 m!43703))

(declare-fun m!43945 () Bool)

(assert (=> bs!2428 m!43945))

(assert (=> b!30052 d!8638))

(declare-fun d!8640 () Bool)

(declare-fun e!20140 () Bool)

(assert (=> d!8640 e!20140))

(declare-fun res!25982 () Bool)

(assert (=> d!8640 (=> (not res!25982) (not e!20140))))

(declare-fun lt!43558 () (_ BitVec 64))

(declare-fun lt!43553 () (_ BitVec 64))

(declare-fun lt!43557 () (_ BitVec 64))

(assert (=> d!8640 (= res!25982 (= lt!43557 (bvsub lt!43558 lt!43553)))))

(assert (=> d!8640 (or (= (bvand lt!43558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!43553 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!43558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!43558 lt!43553) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8640 (= lt!43553 (remainingBits!0 ((_ sign_extend 32) (size!777 (buf!1105 thiss!1379))) ((_ sign_extend 32) (currentByte!2448 thiss!1379)) ((_ sign_extend 32) (currentBit!2443 thiss!1379))))))

(declare-fun lt!43555 () (_ BitVec 64))

(declare-fun lt!43554 () (_ BitVec 64))

(assert (=> d!8640 (= lt!43558 (bvmul lt!43555 lt!43554))))

(assert (=> d!8640 (or (= lt!43555 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!43554 (bvsdiv (bvmul lt!43555 lt!43554) lt!43555)))))

(assert (=> d!8640 (= lt!43554 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8640 (= lt!43555 ((_ sign_extend 32) (size!777 (buf!1105 thiss!1379))))))

(assert (=> d!8640 (= lt!43557 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2448 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2443 thiss!1379))))))

(assert (=> d!8640 (invariant!0 (currentBit!2443 thiss!1379) (currentByte!2448 thiss!1379) (size!777 (buf!1105 thiss!1379)))))

(assert (=> d!8640 (= (bitIndex!0 (size!777 (buf!1105 thiss!1379)) (currentByte!2448 thiss!1379) (currentBit!2443 thiss!1379)) lt!43557)))

(declare-fun b!30176 () Bool)

(declare-fun res!25981 () Bool)

(assert (=> b!30176 (=> (not res!25981) (not e!20140))))

(assert (=> b!30176 (= res!25981 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!43557))))

