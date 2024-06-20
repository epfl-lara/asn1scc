; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13918 () Bool)

(assert start!13918)

(declare-fun b!71218 () Bool)

(declare-fun e!46393 () Bool)

(declare-fun e!46402 () Bool)

(assert (=> b!71218 (= e!46393 (not e!46402))))

(declare-fun res!58746 () Bool)

(assert (=> b!71218 (=> res!58746 e!46402)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!71218 (= res!58746 (bvsge i!635 to!314))))

(declare-datatypes ((array!2930 0))(
  ( (array!2931 (arr!1954 (Array (_ BitVec 32) (_ BitVec 8))) (size!1366 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2318 0))(
  ( (BitStream!2319 (buf!1747 array!2930) (currentByte!3467 (_ BitVec 32)) (currentBit!3462 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2318)

(declare-fun isPrefixOf!0 (BitStream!2318 BitStream!2318) Bool)

(assert (=> b!71218 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4761 0))(
  ( (Unit!4762) )
))
(declare-fun lt!114933 () Unit!4761)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2318) Unit!4761)

(assert (=> b!71218 (= lt!114933 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!114932 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!71218 (= lt!114932 (bitIndex!0 (size!1366 (buf!1747 thiss!1379)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379)))))

(declare-fun b!71219 () Bool)

(declare-fun res!58732 () Bool)

(declare-fun e!46392 () Bool)

(assert (=> b!71219 (=> res!58732 e!46392)))

(declare-datatypes ((tuple2!6168 0))(
  ( (tuple2!6169 (_1!3198 BitStream!2318) (_2!3198 BitStream!2318)) )
))
(declare-fun lt!114910 () tuple2!6168)

(declare-fun lt!114930 () Bool)

(declare-datatypes ((tuple2!6170 0))(
  ( (tuple2!6171 (_1!3199 BitStream!2318) (_2!3199 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2318) tuple2!6170)

(assert (=> b!71219 (= res!58732 (not (= (_2!3199 (readBitPure!0 (_1!3198 lt!114910))) lt!114930)))))

(declare-fun b!71221 () Bool)

(declare-fun res!58741 () Bool)

(assert (=> b!71221 (=> (not res!58741) (not e!46393))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!71221 (= res!58741 (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 thiss!1379))) ((_ sign_extend 32) (currentByte!3467 thiss!1379)) ((_ sign_extend 32) (currentBit!3462 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!71222 () Bool)

(declare-fun e!46388 () Bool)

(declare-fun array_inv!1218 (array!2930) Bool)

(assert (=> b!71222 (= e!46388 (array_inv!1218 (buf!1747 thiss!1379)))))

(declare-fun b!71223 () Bool)

(declare-fun e!46403 () Bool)

(assert (=> b!71223 (= e!46403 e!46392)))

(declare-fun res!58738 () Bool)

(assert (=> b!71223 (=> res!58738 e!46392)))

(declare-fun lt!114935 () Bool)

(assert (=> b!71223 (= res!58738 (not (= lt!114935 lt!114930)))))

(declare-fun lt!114917 () Bool)

(assert (=> b!71223 (= lt!114917 lt!114935)))

(declare-datatypes ((tuple2!6172 0))(
  ( (tuple2!6173 (_1!3200 Unit!4761) (_2!3200 BitStream!2318)) )
))
(declare-fun lt!114924 () tuple2!6172)

(declare-fun bitAt!0 (array!2930 (_ BitVec 64)) Bool)

(assert (=> b!71223 (= lt!114935 (bitAt!0 (buf!1747 (_2!3200 lt!114924)) lt!114932))))

(declare-fun lt!114926 () (_ BitVec 64))

(declare-fun lt!114928 () Unit!4761)

(declare-fun lt!114916 () tuple2!6172)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2930 array!2930 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4761)

(assert (=> b!71223 (= lt!114928 (arrayBitRangesEqImpliesEq!0 (buf!1747 (_2!3200 lt!114916)) (buf!1747 (_2!3200 lt!114924)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!114932 lt!114926))))

(declare-fun b!71224 () Bool)

(declare-fun e!46395 () Bool)

(assert (=> b!71224 (= e!46402 e!46395)))

(declare-fun res!58736 () Bool)

(assert (=> b!71224 (=> res!58736 e!46395)))

(assert (=> b!71224 (= res!58736 (not (isPrefixOf!0 thiss!1379 (_2!3200 lt!114916))))))

(declare-fun lt!114929 () (_ BitVec 64))

(assert (=> b!71224 (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114916)))) ((_ sign_extend 32) (currentByte!3467 (_2!3200 lt!114916))) ((_ sign_extend 32) (currentBit!3462 (_2!3200 lt!114916))) lt!114929)))

(assert (=> b!71224 (= lt!114929 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!114913 () Unit!4761)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2318 BitStream!2318 (_ BitVec 64) (_ BitVec 64)) Unit!4761)

(assert (=> b!71224 (= lt!114913 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3200 lt!114916) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2930)

(declare-fun appendBitFromByte!0 (BitStream!2318 (_ BitVec 8) (_ BitVec 32)) tuple2!6172)

(assert (=> b!71224 (= lt!114916 (appendBitFromByte!0 thiss!1379 (select (arr!1954 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!71225 () Bool)

(declare-fun e!46390 () Bool)

(declare-fun e!46389 () Bool)

(assert (=> b!71225 (= e!46390 e!46389)))

(declare-fun res!58745 () Bool)

(assert (=> b!71225 (=> res!58745 e!46389)))

(declare-datatypes ((List!734 0))(
  ( (Nil!731) (Cons!730 (h!849 Bool) (t!1484 List!734)) )
))
(declare-fun lt!114931 () List!734)

(declare-fun lt!114936 () List!734)

(assert (=> b!71225 (= res!58745 (not (= lt!114931 lt!114936)))))

(assert (=> b!71225 (= lt!114936 lt!114931)))

(declare-fun lt!114914 () List!734)

(declare-fun tail!338 (List!734) List!734)

(assert (=> b!71225 (= lt!114931 (tail!338 lt!114914))))

(declare-fun lt!114920 () tuple2!6168)

(declare-fun lt!114922 () Unit!4761)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2318 BitStream!2318 BitStream!2318 BitStream!2318 (_ BitVec 64) List!734) Unit!4761)

(assert (=> b!71225 (= lt!114922 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3200 lt!114924) (_2!3200 lt!114924) (_1!3198 lt!114910) (_1!3198 lt!114920) (bvsub to!314 i!635) lt!114914))))

(declare-fun b!71226 () Bool)

(declare-fun res!58737 () Bool)

(declare-fun e!46400 () Bool)

(assert (=> b!71226 (=> res!58737 e!46400)))

(assert (=> b!71226 (= res!58737 (not (= (size!1366 (buf!1747 thiss!1379)) (size!1366 (buf!1747 (_2!3200 lt!114924))))))))

(declare-fun b!71227 () Bool)

(declare-fun res!58735 () Bool)

(assert (=> b!71227 (=> res!58735 e!46400)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!71227 (= res!58735 (not (invariant!0 (currentBit!3462 (_2!3200 lt!114924)) (currentByte!3467 (_2!3200 lt!114924)) (size!1366 (buf!1747 (_2!3200 lt!114924))))))))

(declare-fun b!71228 () Bool)

(declare-fun e!46391 () Bool)

(assert (=> b!71228 (= e!46391 e!46390)))

(declare-fun res!58733 () Bool)

(assert (=> b!71228 (=> res!58733 e!46390)))

(assert (=> b!71228 (= res!58733 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2318 BitStream!2318 (_ BitVec 64)) List!734)

(assert (=> b!71228 (= lt!114936 (bitStreamReadBitsIntoList!0 (_2!3200 lt!114924) (_1!3198 lt!114920) lt!114929))))

(assert (=> b!71228 (= lt!114914 (bitStreamReadBitsIntoList!0 (_2!3200 lt!114924) (_1!3198 lt!114910) (bvsub to!314 i!635)))))

(assert (=> b!71228 (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114924)))) ((_ sign_extend 32) (currentByte!3467 (_2!3200 lt!114916))) ((_ sign_extend 32) (currentBit!3462 (_2!3200 lt!114916))) lt!114929)))

(declare-fun lt!114934 () Unit!4761)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2318 array!2930 (_ BitVec 64)) Unit!4761)

(assert (=> b!71228 (= lt!114934 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3200 lt!114916) (buf!1747 (_2!3200 lt!114924)) lt!114929))))

(declare-fun reader!0 (BitStream!2318 BitStream!2318) tuple2!6168)

(assert (=> b!71228 (= lt!114920 (reader!0 (_2!3200 lt!114916) (_2!3200 lt!114924)))))

(assert (=> b!71228 (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114924)))) ((_ sign_extend 32) (currentByte!3467 thiss!1379)) ((_ sign_extend 32) (currentBit!3462 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!114918 () Unit!4761)

(assert (=> b!71228 (= lt!114918 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1747 (_2!3200 lt!114924)) (bvsub to!314 i!635)))))

(assert (=> b!71228 (= lt!114910 (reader!0 thiss!1379 (_2!3200 lt!114924)))))

(declare-fun b!71229 () Bool)

(declare-fun res!58726 () Bool)

(assert (=> b!71229 (=> res!58726 e!46390)))

(declare-fun length!362 (List!734) Int)

(assert (=> b!71229 (= res!58726 (<= (length!362 lt!114914) 0))))

(declare-fun b!71230 () Bool)

(declare-fun e!46397 () Bool)

(assert (=> b!71230 (= e!46389 e!46397)))

(declare-fun res!58744 () Bool)

(assert (=> b!71230 (=> res!58744 e!46397)))

(declare-fun lt!114927 () Bool)

(assert (=> b!71230 (= res!58744 (not (= lt!114927 (bitAt!0 (buf!1747 (_1!3198 lt!114920)) lt!114932))))))

(assert (=> b!71230 (= lt!114927 (bitAt!0 (buf!1747 (_1!3198 lt!114910)) lt!114932))))

(declare-fun b!71231 () Bool)

(declare-fun res!58734 () Bool)

(assert (=> b!71231 (=> res!58734 e!46391)))

(assert (=> b!71231 (= res!58734 (not (invariant!0 (currentBit!3462 (_2!3200 lt!114916)) (currentByte!3467 (_2!3200 lt!114916)) (size!1366 (buf!1747 (_2!3200 lt!114916))))))))

(declare-fun b!71232 () Bool)

(declare-fun e!46396 () Bool)

(assert (=> b!71232 (= e!46397 e!46396)))

(declare-fun res!58740 () Bool)

(assert (=> b!71232 (=> res!58740 e!46396)))

(declare-fun lt!114915 () Bool)

(assert (=> b!71232 (= res!58740 (not (= lt!114915 lt!114927)))))

(declare-fun head!553 (List!734) Bool)

(assert (=> b!71232 (= lt!114915 (head!553 lt!114914))))

(declare-fun b!71233 () Bool)

(declare-fun e!46401 () Bool)

(assert (=> b!71233 (= e!46395 e!46401)))

(declare-fun res!58729 () Bool)

(assert (=> b!71233 (=> res!58729 e!46401)))

(assert (=> b!71233 (= res!58729 (not (isPrefixOf!0 (_2!3200 lt!114916) (_2!3200 lt!114924))))))

(assert (=> b!71233 (isPrefixOf!0 thiss!1379 (_2!3200 lt!114924))))

(declare-fun lt!114919 () Unit!4761)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2318 BitStream!2318 BitStream!2318) Unit!4761)

(assert (=> b!71233 (= lt!114919 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3200 lt!114916) (_2!3200 lt!114924)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2318 array!2930 (_ BitVec 64) (_ BitVec 64)) tuple2!6172)

(assert (=> b!71233 (= lt!114924 (appendBitsMSBFirstLoop!0 (_2!3200 lt!114916) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!46398 () Bool)

(assert (=> b!71233 e!46398))

(declare-fun res!58739 () Bool)

(assert (=> b!71233 (=> (not res!58739) (not e!46398))))

(assert (=> b!71233 (= res!58739 (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114916)))) ((_ sign_extend 32) (currentByte!3467 thiss!1379)) ((_ sign_extend 32) (currentBit!3462 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!114912 () Unit!4761)

(assert (=> b!71233 (= lt!114912 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1747 (_2!3200 lt!114916)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!114923 () tuple2!6168)

(assert (=> b!71233 (= lt!114923 (reader!0 thiss!1379 (_2!3200 lt!114916)))))

(declare-fun b!71234 () Bool)

(declare-fun e!46387 () Bool)

(assert (=> b!71234 (= e!46387 e!46403)))

(declare-fun res!58730 () Bool)

(assert (=> b!71234 (=> res!58730 e!46403)))

(assert (=> b!71234 (= res!58730 (not (= lt!114917 lt!114930)))))

(assert (=> b!71234 (= lt!114917 (bitAt!0 (buf!1747 (_2!3200 lt!114916)) lt!114932))))

(declare-fun b!71235 () Bool)

(assert (=> b!71235 (= e!46396 e!46387)))

(declare-fun res!58731 () Bool)

(assert (=> b!71235 (=> res!58731 e!46387)))

(declare-fun lt!114937 () Bool)

(assert (=> b!71235 (= res!58731 (not (= lt!114937 lt!114930)))))

(assert (=> b!71235 (= lt!114930 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun byteArrayBitContentToList!0 (BitStream!2318 array!2930 (_ BitVec 64) (_ BitVec 64)) List!734)

(assert (=> b!71235 (= lt!114937 (head!553 (byteArrayBitContentToList!0 (_2!3200 lt!114924) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun lt!114911 () (_ BitVec 64))

(declare-fun lt!114921 () (_ BitVec 64))

(declare-fun b!71236 () Bool)

(assert (=> b!71236 (= e!46392 (or (not (= lt!114915 lt!114937)) (let ((bdg!3338 (bvand lt!114921 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (= bdg!3338 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= bdg!3338 (bvand lt!114911 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!71237 () Bool)

(assert (=> b!71237 (= e!46398 (= (head!553 (byteArrayBitContentToList!0 (_2!3200 lt!114916) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!553 (bitStreamReadBitsIntoList!0 (_2!3200 lt!114916) (_1!3198 lt!114923) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!71220 () Bool)

(assert (=> b!71220 (= e!46400 e!46391)))

(declare-fun res!58742 () Bool)

(assert (=> b!71220 (=> res!58742 e!46391)))

(assert (=> b!71220 (= res!58742 (not (= (size!1366 (buf!1747 (_2!3200 lt!114916))) (size!1366 (buf!1747 (_2!3200 lt!114924))))))))

(declare-fun lt!114925 () (_ BitVec 64))

(assert (=> b!71220 (= lt!114925 (bvsub (bvsub (bvadd lt!114926 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!71220 (= lt!114926 (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!114916))) (currentByte!3467 (_2!3200 lt!114916)) (currentBit!3462 (_2!3200 lt!114916))))))

(assert (=> b!71220 (= (size!1366 (buf!1747 (_2!3200 lt!114924))) (size!1366 (buf!1747 thiss!1379)))))

(declare-fun res!58728 () Bool)

(assert (=> start!13918 (=> (not res!58728) (not e!46393))))

(assert (=> start!13918 (= res!58728 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1366 srcBuffer!2))))))))

(assert (=> start!13918 e!46393))

(assert (=> start!13918 true))

(assert (=> start!13918 (array_inv!1218 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2318) Bool)

(assert (=> start!13918 (and (inv!12 thiss!1379) e!46388)))

(declare-fun b!71238 () Bool)

(declare-fun res!58743 () Bool)

(assert (=> b!71238 (=> res!58743 e!46391)))

(assert (=> b!71238 (= res!58743 (not (invariant!0 (currentBit!3462 (_2!3200 lt!114916)) (currentByte!3467 (_2!3200 lt!114916)) (size!1366 (buf!1747 (_2!3200 lt!114924))))))))

(declare-fun b!71239 () Bool)

(assert (=> b!71239 (= e!46401 e!46400)))

(declare-fun res!58727 () Bool)

(assert (=> b!71239 (=> res!58727 e!46400)))

(assert (=> b!71239 (= res!58727 (not (= lt!114925 lt!114911)))))

(assert (=> b!71239 (= lt!114911 (bvsub lt!114921 i!635))))

(assert (=> b!71239 (= lt!114925 (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!114924))) (currentByte!3467 (_2!3200 lt!114924)) (currentBit!3462 (_2!3200 lt!114924))))))

(assert (=> b!71239 (= lt!114921 (bvadd lt!114932 to!314))))

(assert (= (and start!13918 res!58728) b!71221))

(assert (= (and b!71221 res!58741) b!71218))

(assert (= (and b!71218 (not res!58746)) b!71224))

(assert (= (and b!71224 (not res!58736)) b!71233))

(assert (= (and b!71233 res!58739) b!71237))

(assert (= (and b!71233 (not res!58729)) b!71239))

(assert (= (and b!71239 (not res!58727)) b!71227))

(assert (= (and b!71227 (not res!58735)) b!71226))

(assert (= (and b!71226 (not res!58737)) b!71220))

(assert (= (and b!71220 (not res!58742)) b!71231))

(assert (= (and b!71231 (not res!58734)) b!71238))

(assert (= (and b!71238 (not res!58743)) b!71228))

(assert (= (and b!71228 (not res!58733)) b!71229))

(assert (= (and b!71229 (not res!58726)) b!71225))

(assert (= (and b!71225 (not res!58745)) b!71230))

(assert (= (and b!71230 (not res!58744)) b!71232))

(assert (= (and b!71232 (not res!58740)) b!71235))

(assert (= (and b!71235 (not res!58731)) b!71234))

(assert (= (and b!71234 (not res!58730)) b!71223))

(assert (= (and b!71223 (not res!58738)) b!71219))

(assert (= (and b!71219 (not res!58732)) b!71236))

(assert (= start!13918 b!71222))

(declare-fun m!114179 () Bool)

(assert (=> b!71224 m!114179))

(declare-fun m!114181 () Bool)

(assert (=> b!71224 m!114181))

(declare-fun m!114183 () Bool)

(assert (=> b!71224 m!114183))

(declare-fun m!114185 () Bool)

(assert (=> b!71224 m!114185))

(assert (=> b!71224 m!114181))

(declare-fun m!114187 () Bool)

(assert (=> b!71224 m!114187))

(declare-fun m!114189 () Bool)

(assert (=> b!71234 m!114189))

(declare-fun m!114191 () Bool)

(assert (=> start!13918 m!114191))

(declare-fun m!114193 () Bool)

(assert (=> start!13918 m!114193))

(declare-fun m!114195 () Bool)

(assert (=> b!71238 m!114195))

(declare-fun m!114197 () Bool)

(assert (=> b!71232 m!114197))

(declare-fun m!114199 () Bool)

(assert (=> b!71239 m!114199))

(declare-fun m!114201 () Bool)

(assert (=> b!71228 m!114201))

(declare-fun m!114203 () Bool)

(assert (=> b!71228 m!114203))

(declare-fun m!114205 () Bool)

(assert (=> b!71228 m!114205))

(declare-fun m!114207 () Bool)

(assert (=> b!71228 m!114207))

(declare-fun m!114209 () Bool)

(assert (=> b!71228 m!114209))

(declare-fun m!114211 () Bool)

(assert (=> b!71228 m!114211))

(declare-fun m!114213 () Bool)

(assert (=> b!71228 m!114213))

(declare-fun m!114215 () Bool)

(assert (=> b!71228 m!114215))

(declare-fun m!114217 () Bool)

(assert (=> b!71221 m!114217))

(declare-fun m!114219 () Bool)

(assert (=> b!71220 m!114219))

(declare-fun m!114221 () Bool)

(assert (=> b!71222 m!114221))

(declare-fun m!114223 () Bool)

(assert (=> b!71223 m!114223))

(declare-fun m!114225 () Bool)

(assert (=> b!71223 m!114225))

(declare-fun m!114227 () Bool)

(assert (=> b!71233 m!114227))

(declare-fun m!114229 () Bool)

(assert (=> b!71233 m!114229))

(declare-fun m!114231 () Bool)

(assert (=> b!71233 m!114231))

(declare-fun m!114233 () Bool)

(assert (=> b!71233 m!114233))

(declare-fun m!114235 () Bool)

(assert (=> b!71233 m!114235))

(declare-fun m!114237 () Bool)

(assert (=> b!71233 m!114237))

(declare-fun m!114239 () Bool)

(assert (=> b!71233 m!114239))

(declare-fun m!114241 () Bool)

(assert (=> b!71225 m!114241))

(declare-fun m!114243 () Bool)

(assert (=> b!71225 m!114243))

(declare-fun m!114245 () Bool)

(assert (=> b!71229 m!114245))

(declare-fun m!114247 () Bool)

(assert (=> b!71231 m!114247))

(declare-fun m!114249 () Bool)

(assert (=> b!71235 m!114249))

(declare-fun m!114251 () Bool)

(assert (=> b!71235 m!114251))

(assert (=> b!71235 m!114251))

(declare-fun m!114253 () Bool)

(assert (=> b!71235 m!114253))

(declare-fun m!114255 () Bool)

(assert (=> b!71237 m!114255))

(assert (=> b!71237 m!114255))

(declare-fun m!114257 () Bool)

(assert (=> b!71237 m!114257))

(declare-fun m!114259 () Bool)

(assert (=> b!71237 m!114259))

(assert (=> b!71237 m!114259))

(declare-fun m!114261 () Bool)

(assert (=> b!71237 m!114261))

(declare-fun m!114263 () Bool)

(assert (=> b!71218 m!114263))

(declare-fun m!114265 () Bool)

(assert (=> b!71218 m!114265))

(declare-fun m!114267 () Bool)

(assert (=> b!71218 m!114267))

(declare-fun m!114269 () Bool)

(assert (=> b!71227 m!114269))

(declare-fun m!114271 () Bool)

(assert (=> b!71230 m!114271))

(declare-fun m!114273 () Bool)

(assert (=> b!71230 m!114273))

(declare-fun m!114275 () Bool)

(assert (=> b!71219 m!114275))

(push 1)

(assert (not b!71238))

(assert (not b!71219))

(assert (not b!71230))

(assert (not b!71237))

(assert (not b!71231))

(assert (not b!71218))

(assert (not b!71222))

(assert (not b!71234))

(assert (not b!71232))

(assert (not b!71235))

(assert (not b!71239))

(assert (not b!71227))

(assert (not b!71229))

(assert (not b!71224))

(assert (not b!71225))

(assert (not b!71233))

(assert (not b!71223))

(assert (not b!71228))

(assert (not b!71221))

(assert (not start!13918))

(assert (not b!71220))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!23016 () Bool)

(declare-fun res!58801 () Bool)

(declare-fun e!46449 () Bool)

(assert (=> d!23016 (=> (not res!58801) (not e!46449))))

(assert (=> d!23016 (= res!58801 (= (size!1366 (buf!1747 thiss!1379)) (size!1366 (buf!1747 (_2!3200 lt!114916)))))))

(assert (=> d!23016 (= (isPrefixOf!0 thiss!1379 (_2!3200 lt!114916)) e!46449)))

(declare-fun b!71325 () Bool)

(declare-fun res!58803 () Bool)

(assert (=> b!71325 (=> (not res!58803) (not e!46449))))

(assert (=> b!71325 (= res!58803 (bvsle (bitIndex!0 (size!1366 (buf!1747 thiss!1379)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379)) (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!114916))) (currentByte!3467 (_2!3200 lt!114916)) (currentBit!3462 (_2!3200 lt!114916)))))))

(declare-fun b!71326 () Bool)

(declare-fun e!46448 () Bool)

(assert (=> b!71326 (= e!46449 e!46448)))

(declare-fun res!58802 () Bool)

(assert (=> b!71326 (=> res!58802 e!46448)))

(assert (=> b!71326 (= res!58802 (= (size!1366 (buf!1747 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!71327 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2930 array!2930 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!71327 (= e!46448 (arrayBitRangesEq!0 (buf!1747 thiss!1379) (buf!1747 (_2!3200 lt!114916)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1366 (buf!1747 thiss!1379)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379))))))

(assert (= (and d!23016 res!58801) b!71325))

(assert (= (and b!71325 res!58803) b!71326))

(assert (= (and b!71326 (not res!58802)) b!71327))

(assert (=> b!71325 m!114267))

(assert (=> b!71325 m!114219))

(assert (=> b!71327 m!114267))

(assert (=> b!71327 m!114267))

(declare-fun m!114383 () Bool)

(assert (=> b!71327 m!114383))

(assert (=> b!71224 d!23016))

(declare-fun d!23018 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23018 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114916)))) ((_ sign_extend 32) (currentByte!3467 (_2!3200 lt!114916))) ((_ sign_extend 32) (currentBit!3462 (_2!3200 lt!114916))) lt!114929) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114916)))) ((_ sign_extend 32) (currentByte!3467 (_2!3200 lt!114916))) ((_ sign_extend 32) (currentBit!3462 (_2!3200 lt!114916)))) lt!114929))))

(declare-fun bs!5513 () Bool)

(assert (= bs!5513 d!23018))

(declare-fun m!114385 () Bool)

(assert (=> bs!5513 m!114385))

(assert (=> b!71224 d!23018))

(declare-fun d!23020 () Bool)

(declare-fun e!46458 () Bool)

(assert (=> d!23020 e!46458))

(declare-fun res!58817 () Bool)

(assert (=> d!23020 (=> (not res!58817) (not e!46458))))

(assert (=> d!23020 (= res!58817 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!115106 () Unit!4761)

(declare-fun choose!27 (BitStream!2318 BitStream!2318 (_ BitVec 64) (_ BitVec 64)) Unit!4761)

(assert (=> d!23020 (= lt!115106 (choose!27 thiss!1379 (_2!3200 lt!114916) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!23020 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!23020 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3200 lt!114916) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!115106)))

(declare-fun b!71341 () Bool)

(assert (=> b!71341 (= e!46458 (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114916)))) ((_ sign_extend 32) (currentByte!3467 (_2!3200 lt!114916))) ((_ sign_extend 32) (currentBit!3462 (_2!3200 lt!114916))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23020 res!58817) b!71341))

(declare-fun m!114419 () Bool)

(assert (=> d!23020 m!114419))

(declare-fun m!114421 () Bool)

(assert (=> b!71341 m!114421))

(assert (=> b!71224 d!23020))

(declare-fun b!71367 () Bool)

(declare-fun res!58842 () Bool)

(declare-fun e!46472 () Bool)

(assert (=> b!71367 (=> (not res!58842) (not e!46472))))

(declare-fun lt!115162 () (_ BitVec 64))

(declare-fun lt!115164 () tuple2!6172)

(declare-fun lt!115168 () (_ BitVec 64))

(assert (=> b!71367 (= res!58842 (= (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!115164))) (currentByte!3467 (_2!3200 lt!115164)) (currentBit!3462 (_2!3200 lt!115164))) (bvadd lt!115168 lt!115162)))))

(assert (=> b!71367 (or (not (= (bvand lt!115168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115162 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!115168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!115168 lt!115162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71367 (= lt!115162 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!71367 (= lt!115168 (bitIndex!0 (size!1366 (buf!1747 thiss!1379)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379)))))

(declare-fun b!71368 () Bool)

(declare-fun e!46473 () Bool)

(declare-fun lt!115167 () tuple2!6170)

(declare-fun lt!115159 () tuple2!6172)

(assert (=> b!71368 (= e!46473 (= (bitIndex!0 (size!1366 (buf!1747 (_1!3199 lt!115167))) (currentByte!3467 (_1!3199 lt!115167)) (currentBit!3462 (_1!3199 lt!115167))) (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!115159))) (currentByte!3467 (_2!3200 lt!115159)) (currentBit!3462 (_2!3200 lt!115159)))))))

(declare-fun b!71369 () Bool)

(declare-fun res!58841 () Bool)

(declare-fun e!46471 () Bool)

(assert (=> b!71369 (=> (not res!58841) (not e!46471))))

(assert (=> b!71369 (= res!58841 (isPrefixOf!0 thiss!1379 (_2!3200 lt!115159)))))

(declare-fun b!71370 () Bool)

(declare-fun res!58844 () Bool)

(assert (=> b!71370 (=> (not res!58844) (not e!46472))))

(assert (=> b!71370 (= res!58844 (isPrefixOf!0 thiss!1379 (_2!3200 lt!115164)))))

(declare-fun b!71372 () Bool)

(declare-fun e!46474 () Bool)

(assert (=> b!71372 (= e!46472 e!46474)))

(declare-fun res!58845 () Bool)

(assert (=> b!71372 (=> (not res!58845) (not e!46474))))

(declare-fun lt!115165 () tuple2!6170)

(declare-fun lt!115160 () (_ BitVec 8))

(assert (=> b!71372 (= res!58845 (and (= (_2!3199 lt!115165) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1954 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!115160)) #b00000000000000000000000000000000))) (= (_1!3199 lt!115165) (_2!3200 lt!115164))))))

(declare-datatypes ((tuple2!6180 0))(
  ( (tuple2!6181 (_1!3204 array!2930) (_2!3204 BitStream!2318)) )
))
(declare-fun lt!115166 () tuple2!6180)

(declare-fun lt!115163 () BitStream!2318)

(declare-fun readBits!0 (BitStream!2318 (_ BitVec 64)) tuple2!6180)

(assert (=> b!71372 (= lt!115166 (readBits!0 lt!115163 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!71372 (= lt!115165 (readBitPure!0 lt!115163))))

(declare-fun readerFrom!0 (BitStream!2318 (_ BitVec 32) (_ BitVec 32)) BitStream!2318)

(assert (=> b!71372 (= lt!115163 (readerFrom!0 (_2!3200 lt!115164) (currentBit!3462 thiss!1379) (currentByte!3467 thiss!1379)))))

(declare-fun b!71373 () Bool)

(declare-fun res!58846 () Bool)

(assert (=> b!71373 (=> (not res!58846) (not e!46471))))

(assert (=> b!71373 (= res!58846 (= (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!115159))) (currentByte!3467 (_2!3200 lt!115159)) (currentBit!3462 (_2!3200 lt!115159))) (bvadd (bitIndex!0 (size!1366 (buf!1747 thiss!1379)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!71374 () Bool)

(assert (=> b!71374 (= e!46474 (= (bitIndex!0 (size!1366 (buf!1747 (_1!3199 lt!115165))) (currentByte!3467 (_1!3199 lt!115165)) (currentBit!3462 (_1!3199 lt!115165))) (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!115164))) (currentByte!3467 (_2!3200 lt!115164)) (currentBit!3462 (_2!3200 lt!115164)))))))

(declare-fun d!23030 () Bool)

(assert (=> d!23030 e!46472))

(declare-fun res!58847 () Bool)

(assert (=> d!23030 (=> (not res!58847) (not e!46472))))

(assert (=> d!23030 (= res!58847 (= (size!1366 (buf!1747 (_2!3200 lt!115164))) (size!1366 (buf!1747 thiss!1379))))))

(declare-fun lt!115157 () array!2930)

(assert (=> d!23030 (= lt!115160 (select (arr!1954 lt!115157) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!23030 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1366 lt!115157)))))

(assert (=> d!23030 (= lt!115157 (array!2931 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!115158 () tuple2!6172)

(assert (=> d!23030 (= lt!115164 (tuple2!6173 (_1!3200 lt!115158) (_2!3200 lt!115158)))))

(assert (=> d!23030 (= lt!115158 lt!115159)))

(assert (=> d!23030 e!46471))

(declare-fun res!58840 () Bool)

(assert (=> d!23030 (=> (not res!58840) (not e!46471))))

(assert (=> d!23030 (= res!58840 (= (size!1366 (buf!1747 thiss!1379)) (size!1366 (buf!1747 (_2!3200 lt!115159)))))))

(declare-fun lt!115161 () Bool)

(declare-fun appendBit!0 (BitStream!2318 Bool) tuple2!6172)

(assert (=> d!23030 (= lt!115159 (appendBit!0 thiss!1379 lt!115161))))

(assert (=> d!23030 (= lt!115161 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1954 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!23030 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!23030 (= (appendBitFromByte!0 thiss!1379 (select (arr!1954 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!115164)))

(declare-fun b!71371 () Bool)

(assert (=> b!71371 (= e!46471 e!46473)))

(declare-fun res!58843 () Bool)

(assert (=> b!71371 (=> (not res!58843) (not e!46473))))

(assert (=> b!71371 (= res!58843 (and (= (_2!3199 lt!115167) lt!115161) (= (_1!3199 lt!115167) (_2!3200 lt!115159))))))

(assert (=> b!71371 (= lt!115167 (readBitPure!0 (readerFrom!0 (_2!3200 lt!115159) (currentBit!3462 thiss!1379) (currentByte!3467 thiss!1379))))))

(assert (= (and d!23030 res!58840) b!71373))

(assert (= (and b!71373 res!58846) b!71369))

(assert (= (and b!71369 res!58841) b!71371))

(assert (= (and b!71371 res!58843) b!71368))

(assert (= (and d!23030 res!58847) b!71367))

(assert (= (and b!71367 res!58842) b!71370))

(assert (= (and b!71370 res!58844) b!71372))

(assert (= (and b!71372 res!58845) b!71374))

(declare-fun m!114453 () Bool)

(assert (=> b!71373 m!114453))

(assert (=> b!71373 m!114267))

(declare-fun m!114455 () Bool)

(assert (=> b!71370 m!114455))

(declare-fun m!114457 () Bool)

(assert (=> b!71372 m!114457))

(declare-fun m!114459 () Bool)

(assert (=> b!71372 m!114459))

(declare-fun m!114461 () Bool)

(assert (=> b!71372 m!114461))

(declare-fun m!114463 () Bool)

(assert (=> b!71371 m!114463))

(assert (=> b!71371 m!114463))

(declare-fun m!114465 () Bool)

(assert (=> b!71371 m!114465))

(declare-fun m!114467 () Bool)

(assert (=> b!71369 m!114467))

(declare-fun m!114469 () Bool)

(assert (=> b!71368 m!114469))

(assert (=> b!71368 m!114453))

(declare-fun m!114471 () Bool)

(assert (=> b!71374 m!114471))

(declare-fun m!114473 () Bool)

(assert (=> b!71374 m!114473))

(declare-fun m!114475 () Bool)

(assert (=> d!23030 m!114475))

(declare-fun m!114477 () Bool)

(assert (=> d!23030 m!114477))

(declare-fun m!114479 () Bool)

(assert (=> d!23030 m!114479))

(assert (=> b!71367 m!114473))

(assert (=> b!71367 m!114267))

(assert (=> b!71224 d!23030))

(declare-fun d!23044 () Bool)

(assert (=> d!23044 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1954 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5521 () Bool)

(assert (= bs!5521 d!23044))

(assert (=> bs!5521 m!114181))

(assert (=> bs!5521 m!114479))

(assert (=> b!71235 d!23044))

(declare-fun d!23050 () Bool)

(assert (=> d!23050 (= (head!553 (byteArrayBitContentToList!0 (_2!3200 lt!114924) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!849 (byteArrayBitContentToList!0 (_2!3200 lt!114924) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!71235 d!23050))

(declare-fun d!23052 () Bool)

(declare-fun c!5350 () Bool)

(assert (=> d!23052 (= c!5350 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!46481 () List!734)

(assert (=> d!23052 (= (byteArrayBitContentToList!0 (_2!3200 lt!114924) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!46481)))

(declare-fun b!71385 () Bool)

(assert (=> b!71385 (= e!46481 Nil!731)))

(declare-fun b!71386 () Bool)

(assert (=> b!71386 (= e!46481 (Cons!730 (not (= (bvand ((_ sign_extend 24) (select (arr!1954 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3200 lt!114924) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!23052 c!5350) b!71385))

(assert (= (and d!23052 (not c!5350)) b!71386))

(assert (=> b!71386 m!114181))

(assert (=> b!71386 m!114479))

(declare-fun m!114487 () Bool)

(assert (=> b!71386 m!114487))

(assert (=> b!71235 d!23052))

(declare-fun d!23054 () Bool)

(assert (=> d!23054 (= (tail!338 lt!114914) (t!1484 lt!114914))))

(assert (=> b!71225 d!23054))

(declare-fun d!23056 () Bool)

(declare-fun e!46489 () Bool)

(assert (=> d!23056 e!46489))

(declare-fun res!58862 () Bool)

(assert (=> d!23056 (=> (not res!58862) (not e!46489))))

(declare-fun lt!115177 () (_ BitVec 64))

(assert (=> d!23056 (= res!58862 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115177 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!115177) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!23056 (= lt!115177 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!115176 () Unit!4761)

(declare-fun choose!42 (BitStream!2318 BitStream!2318 BitStream!2318 BitStream!2318 (_ BitVec 64) List!734) Unit!4761)

(assert (=> d!23056 (= lt!115176 (choose!42 (_2!3200 lt!114924) (_2!3200 lt!114924) (_1!3198 lt!114910) (_1!3198 lt!114920) (bvsub to!314 i!635) lt!114914))))

(assert (=> d!23056 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23056 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3200 lt!114924) (_2!3200 lt!114924) (_1!3198 lt!114910) (_1!3198 lt!114920) (bvsub to!314 i!635) lt!114914) lt!115176)))

(declare-fun b!71395 () Bool)

(assert (=> b!71395 (= e!46489 (= (bitStreamReadBitsIntoList!0 (_2!3200 lt!114924) (_1!3198 lt!114920) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!338 lt!114914)))))

(assert (= (and d!23056 res!58862) b!71395))

(declare-fun m!114497 () Bool)

(assert (=> d!23056 m!114497))

(declare-fun m!114499 () Bool)

(assert (=> b!71395 m!114499))

(assert (=> b!71395 m!114241))

(assert (=> b!71225 d!23056))

(declare-fun d!23064 () Bool)

(assert (=> d!23064 (= (bitAt!0 (buf!1747 (_2!3200 lt!114924)) lt!114932) (not (= (bvand ((_ sign_extend 24) (select (arr!1954 (buf!1747 (_2!3200 lt!114924))) ((_ extract 31 0) (bvsdiv lt!114932 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!114932 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5523 () Bool)

(assert (= bs!5523 d!23064))

(declare-fun m!114501 () Bool)

(assert (=> bs!5523 m!114501))

(declare-fun m!114503 () Bool)

(assert (=> bs!5523 m!114503))

(assert (=> b!71223 d!23064))

(declare-fun d!23066 () Bool)

(assert (=> d!23066 (= (bitAt!0 (buf!1747 (_2!3200 lt!114916)) lt!114932) (bitAt!0 (buf!1747 (_2!3200 lt!114924)) lt!114932))))

(declare-fun lt!115180 () Unit!4761)

(declare-fun choose!31 (array!2930 array!2930 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4761)

(assert (=> d!23066 (= lt!115180 (choose!31 (buf!1747 (_2!3200 lt!114916)) (buf!1747 (_2!3200 lt!114924)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!114932 lt!114926))))

(assert (=> d!23066 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!114926))))

(assert (=> d!23066 (= (arrayBitRangesEqImpliesEq!0 (buf!1747 (_2!3200 lt!114916)) (buf!1747 (_2!3200 lt!114924)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!114932 lt!114926) lt!115180)))

(declare-fun bs!5524 () Bool)

(assert (= bs!5524 d!23066))

(assert (=> bs!5524 m!114189))

(assert (=> bs!5524 m!114223))

(declare-fun m!114505 () Bool)

(assert (=> bs!5524 m!114505))

(assert (=> b!71223 d!23066))

(declare-fun d!23068 () Bool)

(assert (=> d!23068 (= (bitAt!0 (buf!1747 (_2!3200 lt!114916)) lt!114932) (not (= (bvand ((_ sign_extend 24) (select (arr!1954 (buf!1747 (_2!3200 lt!114916))) ((_ extract 31 0) (bvsdiv lt!114932 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!114932 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5525 () Bool)

(assert (= bs!5525 d!23068))

(declare-fun m!114507 () Bool)

(assert (=> bs!5525 m!114507))

(assert (=> bs!5525 m!114503))

(assert (=> b!71234 d!23068))

(declare-fun d!23070 () Bool)

(assert (=> d!23070 (= (head!553 lt!114914) (h!849 lt!114914))))

(assert (=> b!71232 d!23070))

(declare-fun d!23072 () Bool)

(assert (=> d!23072 (= (array_inv!1218 (buf!1747 thiss!1379)) (bvsge (size!1366 (buf!1747 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!71222 d!23072))

(declare-fun d!23074 () Bool)

(assert (=> d!23074 (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114916)))) ((_ sign_extend 32) (currentByte!3467 thiss!1379)) ((_ sign_extend 32) (currentBit!3462 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!115183 () Unit!4761)

(declare-fun choose!9 (BitStream!2318 array!2930 (_ BitVec 64) BitStream!2318) Unit!4761)

(assert (=> d!23074 (= lt!115183 (choose!9 thiss!1379 (buf!1747 (_2!3200 lt!114916)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2319 (buf!1747 (_2!3200 lt!114916)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379))))))

(assert (=> d!23074 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1747 (_2!3200 lt!114916)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!115183)))

(declare-fun bs!5526 () Bool)

(assert (= bs!5526 d!23074))

(assert (=> bs!5526 m!114237))

(declare-fun m!114509 () Bool)

(assert (=> bs!5526 m!114509))

(assert (=> b!71233 d!23074))

(declare-fun d!23076 () Bool)

(assert (=> d!23076 (isPrefixOf!0 thiss!1379 (_2!3200 lt!114924))))

(declare-fun lt!115186 () Unit!4761)

(declare-fun choose!30 (BitStream!2318 BitStream!2318 BitStream!2318) Unit!4761)

(assert (=> d!23076 (= lt!115186 (choose!30 thiss!1379 (_2!3200 lt!114916) (_2!3200 lt!114924)))))

(assert (=> d!23076 (isPrefixOf!0 thiss!1379 (_2!3200 lt!114916))))

(assert (=> d!23076 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3200 lt!114916) (_2!3200 lt!114924)) lt!115186)))

(declare-fun bs!5527 () Bool)

(assert (= bs!5527 d!23076))

(assert (=> bs!5527 m!114233))

(declare-fun m!114511 () Bool)

(assert (=> bs!5527 m!114511))

(assert (=> bs!5527 m!114183))

(assert (=> b!71233 d!23076))

(declare-fun b!71406 () Bool)

(declare-fun res!58870 () Bool)

(declare-fun e!46494 () Bool)

(assert (=> b!71406 (=> (not res!58870) (not e!46494))))

(declare-fun lt!115239 () tuple2!6168)

(assert (=> b!71406 (= res!58870 (isPrefixOf!0 (_2!3198 lt!115239) (_2!3200 lt!114916)))))

(declare-fun d!23078 () Bool)

(assert (=> d!23078 e!46494))

(declare-fun res!58869 () Bool)

(assert (=> d!23078 (=> (not res!58869) (not e!46494))))

(assert (=> d!23078 (= res!58869 (isPrefixOf!0 (_1!3198 lt!115239) (_2!3198 lt!115239)))))

(declare-fun lt!115236 () BitStream!2318)

(assert (=> d!23078 (= lt!115239 (tuple2!6169 lt!115236 (_2!3200 lt!114916)))))

(declare-fun lt!115231 () Unit!4761)

(declare-fun lt!115233 () Unit!4761)

(assert (=> d!23078 (= lt!115231 lt!115233)))

(assert (=> d!23078 (isPrefixOf!0 lt!115236 (_2!3200 lt!114916))))

(assert (=> d!23078 (= lt!115233 (lemmaIsPrefixTransitive!0 lt!115236 (_2!3200 lt!114916) (_2!3200 lt!114916)))))

(declare-fun lt!115243 () Unit!4761)

(declare-fun lt!115245 () Unit!4761)

(assert (=> d!23078 (= lt!115243 lt!115245)))

(assert (=> d!23078 (isPrefixOf!0 lt!115236 (_2!3200 lt!114916))))

(assert (=> d!23078 (= lt!115245 (lemmaIsPrefixTransitive!0 lt!115236 thiss!1379 (_2!3200 lt!114916)))))

(declare-fun lt!115227 () Unit!4761)

(declare-fun e!46495 () Unit!4761)

(assert (=> d!23078 (= lt!115227 e!46495)))

(declare-fun c!5353 () Bool)

(assert (=> d!23078 (= c!5353 (not (= (size!1366 (buf!1747 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!115240 () Unit!4761)

(declare-fun lt!115244 () Unit!4761)

(assert (=> d!23078 (= lt!115240 lt!115244)))

(assert (=> d!23078 (isPrefixOf!0 (_2!3200 lt!114916) (_2!3200 lt!114916))))

(assert (=> d!23078 (= lt!115244 (lemmaIsPrefixRefl!0 (_2!3200 lt!114916)))))

(declare-fun lt!115235 () Unit!4761)

(declare-fun lt!115246 () Unit!4761)

(assert (=> d!23078 (= lt!115235 lt!115246)))

(assert (=> d!23078 (= lt!115246 (lemmaIsPrefixRefl!0 (_2!3200 lt!114916)))))

(declare-fun lt!115228 () Unit!4761)

(declare-fun lt!115234 () Unit!4761)

(assert (=> d!23078 (= lt!115228 lt!115234)))

(assert (=> d!23078 (isPrefixOf!0 lt!115236 lt!115236)))

(assert (=> d!23078 (= lt!115234 (lemmaIsPrefixRefl!0 lt!115236))))

(declare-fun lt!115241 () Unit!4761)

(declare-fun lt!115237 () Unit!4761)

(assert (=> d!23078 (= lt!115241 lt!115237)))

(assert (=> d!23078 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23078 (= lt!115237 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23078 (= lt!115236 (BitStream!2319 (buf!1747 (_2!3200 lt!114916)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379)))))

(assert (=> d!23078 (isPrefixOf!0 thiss!1379 (_2!3200 lt!114916))))

(assert (=> d!23078 (= (reader!0 thiss!1379 (_2!3200 lt!114916)) lt!115239)))

(declare-fun b!71407 () Bool)

(declare-fun res!58871 () Bool)

(assert (=> b!71407 (=> (not res!58871) (not e!46494))))

(assert (=> b!71407 (= res!58871 (isPrefixOf!0 (_1!3198 lt!115239) thiss!1379))))

(declare-fun b!71408 () Bool)

(declare-fun lt!115238 () Unit!4761)

(assert (=> b!71408 (= e!46495 lt!115238)))

(declare-fun lt!115230 () (_ BitVec 64))

(assert (=> b!71408 (= lt!115230 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!115242 () (_ BitVec 64))

(assert (=> b!71408 (= lt!115242 (bitIndex!0 (size!1366 (buf!1747 thiss!1379)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2930 array!2930 (_ BitVec 64) (_ BitVec 64)) Unit!4761)

(assert (=> b!71408 (= lt!115238 (arrayBitRangesEqSymmetric!0 (buf!1747 thiss!1379) (buf!1747 (_2!3200 lt!114916)) lt!115230 lt!115242))))

(assert (=> b!71408 (arrayBitRangesEq!0 (buf!1747 (_2!3200 lt!114916)) (buf!1747 thiss!1379) lt!115230 lt!115242)))

(declare-fun b!71409 () Bool)

(declare-fun Unit!4773 () Unit!4761)

(assert (=> b!71409 (= e!46495 Unit!4773)))

(declare-fun lt!115229 () (_ BitVec 64))

(declare-fun lt!115232 () (_ BitVec 64))

(declare-fun b!71410 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2318 (_ BitVec 64)) BitStream!2318)

(assert (=> b!71410 (= e!46494 (= (_1!3198 lt!115239) (withMovedBitIndex!0 (_2!3198 lt!115239) (bvsub lt!115229 lt!115232))))))

(assert (=> b!71410 (or (= (bvand lt!115229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115232 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115229 lt!115232) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71410 (= lt!115232 (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!114916))) (currentByte!3467 (_2!3200 lt!114916)) (currentBit!3462 (_2!3200 lt!114916))))))

(assert (=> b!71410 (= lt!115229 (bitIndex!0 (size!1366 (buf!1747 thiss!1379)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379)))))

(assert (= (and d!23078 c!5353) b!71408))

(assert (= (and d!23078 (not c!5353)) b!71409))

(assert (= (and d!23078 res!58869) b!71407))

(assert (= (and b!71407 res!58871) b!71406))

(assert (= (and b!71406 res!58870) b!71410))

(declare-fun m!114513 () Bool)

(assert (=> b!71406 m!114513))

(assert (=> b!71408 m!114267))

(declare-fun m!114515 () Bool)

(assert (=> b!71408 m!114515))

(declare-fun m!114517 () Bool)

(assert (=> b!71408 m!114517))

(declare-fun m!114519 () Bool)

(assert (=> b!71407 m!114519))

(declare-fun m!114521 () Bool)

(assert (=> b!71410 m!114521))

(assert (=> b!71410 m!114219))

(assert (=> b!71410 m!114267))

(declare-fun m!114523 () Bool)

(assert (=> d!23078 m!114523))

(declare-fun m!114525 () Bool)

(assert (=> d!23078 m!114525))

(declare-fun m!114527 () Bool)

(assert (=> d!23078 m!114527))

(assert (=> d!23078 m!114263))

(declare-fun m!114529 () Bool)

(assert (=> d!23078 m!114529))

(declare-fun m!114531 () Bool)

(assert (=> d!23078 m!114531))

(assert (=> d!23078 m!114265))

(declare-fun m!114533 () Bool)

(assert (=> d!23078 m!114533))

(declare-fun m!114535 () Bool)

(assert (=> d!23078 m!114535))

(assert (=> d!23078 m!114183))

(declare-fun m!114537 () Bool)

(assert (=> d!23078 m!114537))

(assert (=> b!71233 d!23078))

(declare-fun d!23080 () Bool)

(declare-fun res!58872 () Bool)

(declare-fun e!46497 () Bool)

(assert (=> d!23080 (=> (not res!58872) (not e!46497))))

(assert (=> d!23080 (= res!58872 (= (size!1366 (buf!1747 (_2!3200 lt!114916))) (size!1366 (buf!1747 (_2!3200 lt!114924)))))))

(assert (=> d!23080 (= (isPrefixOf!0 (_2!3200 lt!114916) (_2!3200 lt!114924)) e!46497)))

(declare-fun b!71411 () Bool)

(declare-fun res!58874 () Bool)

(assert (=> b!71411 (=> (not res!58874) (not e!46497))))

(assert (=> b!71411 (= res!58874 (bvsle (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!114916))) (currentByte!3467 (_2!3200 lt!114916)) (currentBit!3462 (_2!3200 lt!114916))) (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!114924))) (currentByte!3467 (_2!3200 lt!114924)) (currentBit!3462 (_2!3200 lt!114924)))))))

(declare-fun b!71412 () Bool)

(declare-fun e!46496 () Bool)

(assert (=> b!71412 (= e!46497 e!46496)))

(declare-fun res!58873 () Bool)

(assert (=> b!71412 (=> res!58873 e!46496)))

(assert (=> b!71412 (= res!58873 (= (size!1366 (buf!1747 (_2!3200 lt!114916))) #b00000000000000000000000000000000))))

(declare-fun b!71413 () Bool)

(assert (=> b!71413 (= e!46496 (arrayBitRangesEq!0 (buf!1747 (_2!3200 lt!114916)) (buf!1747 (_2!3200 lt!114924)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!114916))) (currentByte!3467 (_2!3200 lt!114916)) (currentBit!3462 (_2!3200 lt!114916)))))))

(assert (= (and d!23080 res!58872) b!71411))

(assert (= (and b!71411 res!58874) b!71412))

(assert (= (and b!71412 (not res!58873)) b!71413))

(assert (=> b!71411 m!114219))

(assert (=> b!71411 m!114199))

(assert (=> b!71413 m!114219))

(assert (=> b!71413 m!114219))

(declare-fun m!114539 () Bool)

(assert (=> b!71413 m!114539))

(assert (=> b!71233 d!23080))

(declare-fun b!71562 () Bool)

(declare-fun res!58971 () Bool)

(declare-fun e!46568 () Bool)

(assert (=> b!71562 (=> (not res!58971) (not e!46568))))

(declare-fun lt!115695 () tuple2!6172)

(assert (=> b!71562 (= res!58971 (= (size!1366 (buf!1747 (_2!3200 lt!114916))) (size!1366 (buf!1747 (_2!3200 lt!115695)))))))

(declare-fun b!71563 () Bool)

(declare-fun res!58973 () Bool)

(assert (=> b!71563 (=> (not res!58973) (not e!46568))))

(assert (=> b!71563 (= res!58973 (invariant!0 (currentBit!3462 (_2!3200 lt!115695)) (currentByte!3467 (_2!3200 lt!115695)) (size!1366 (buf!1747 (_2!3200 lt!115695)))))))

(declare-fun b!71564 () Bool)

(declare-fun lt!115713 () tuple2!6168)

(assert (=> b!71564 (= e!46568 (= (bitStreamReadBitsIntoList!0 (_2!3200 lt!115695) (_1!3198 lt!115713) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3200 lt!115695) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!71564 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71564 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!115686 () Unit!4761)

(declare-fun lt!115701 () Unit!4761)

(assert (=> b!71564 (= lt!115686 lt!115701)))

(declare-fun lt!115697 () (_ BitVec 64))

(assert (=> b!71564 (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!115695)))) ((_ sign_extend 32) (currentByte!3467 (_2!3200 lt!114916))) ((_ sign_extend 32) (currentBit!3462 (_2!3200 lt!114916))) lt!115697)))

(assert (=> b!71564 (= lt!115701 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3200 lt!114916) (buf!1747 (_2!3200 lt!115695)) lt!115697))))

(declare-fun e!46569 () Bool)

(assert (=> b!71564 e!46569))

(declare-fun res!58969 () Bool)

(assert (=> b!71564 (=> (not res!58969) (not e!46569))))

(assert (=> b!71564 (= res!58969 (and (= (size!1366 (buf!1747 (_2!3200 lt!114916))) (size!1366 (buf!1747 (_2!3200 lt!115695)))) (bvsge lt!115697 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71564 (= lt!115697 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!71564 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71564 (= lt!115713 (reader!0 (_2!3200 lt!114916) (_2!3200 lt!115695)))))

(declare-fun b!71565 () Bool)

(declare-fun e!46570 () tuple2!6172)

(declare-fun Unit!4774 () Unit!4761)

(assert (=> b!71565 (= e!46570 (tuple2!6173 Unit!4774 (_2!3200 lt!114916)))))

(assert (=> b!71565 (= (size!1366 (buf!1747 (_2!3200 lt!114916))) (size!1366 (buf!1747 (_2!3200 lt!114916))))))

(declare-fun lt!115703 () Unit!4761)

(declare-fun Unit!4775 () Unit!4761)

(assert (=> b!71565 (= lt!115703 Unit!4775)))

(declare-fun call!931 () tuple2!6168)

(declare-fun checkByteArrayBitContent!0 (BitStream!2318 array!2930 array!2930 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!71565 (checkByteArrayBitContent!0 (_2!3200 lt!114916) srcBuffer!2 (_1!3204 (readBits!0 (_1!3198 call!931) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!23082 () Bool)

(assert (=> d!23082 e!46568))

(declare-fun res!58970 () Bool)

(assert (=> d!23082 (=> (not res!58970) (not e!46568))))

(declare-fun lt!115706 () (_ BitVec 64))

(assert (=> d!23082 (= res!58970 (= (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!115695))) (currentByte!3467 (_2!3200 lt!115695)) (currentBit!3462 (_2!3200 lt!115695))) (bvsub lt!115706 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!23082 (or (= (bvand lt!115706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115706 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!115698 () (_ BitVec 64))

(assert (=> d!23082 (= lt!115706 (bvadd lt!115698 to!314))))

(assert (=> d!23082 (or (not (= (bvand lt!115698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!115698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!115698 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23082 (= lt!115698 (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!114916))) (currentByte!3467 (_2!3200 lt!114916)) (currentBit!3462 (_2!3200 lt!114916))))))

(assert (=> d!23082 (= lt!115695 e!46570)))

(declare-fun c!5381 () Bool)

(assert (=> d!23082 (= c!5381 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!115720 () Unit!4761)

(declare-fun lt!115722 () Unit!4761)

(assert (=> d!23082 (= lt!115720 lt!115722)))

(assert (=> d!23082 (isPrefixOf!0 (_2!3200 lt!114916) (_2!3200 lt!114916))))

(assert (=> d!23082 (= lt!115722 (lemmaIsPrefixRefl!0 (_2!3200 lt!114916)))))

(declare-fun lt!115688 () (_ BitVec 64))

(assert (=> d!23082 (= lt!115688 (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!114916))) (currentByte!3467 (_2!3200 lt!114916)) (currentBit!3462 (_2!3200 lt!114916))))))

(assert (=> d!23082 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23082 (= (appendBitsMSBFirstLoop!0 (_2!3200 lt!114916) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!115695)))

(declare-fun b!71566 () Bool)

(declare-fun lt!115689 () tuple2!6172)

(declare-fun Unit!4776 () Unit!4761)

(assert (=> b!71566 (= e!46570 (tuple2!6173 Unit!4776 (_2!3200 lt!115689)))))

(declare-fun lt!115694 () tuple2!6172)

(assert (=> b!71566 (= lt!115694 (appendBitFromByte!0 (_2!3200 lt!114916) (select (arr!1954 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!115707 () (_ BitVec 64))

(assert (=> b!71566 (= lt!115707 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!115714 () (_ BitVec 64))

(assert (=> b!71566 (= lt!115714 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!115680 () Unit!4761)

(assert (=> b!71566 (= lt!115680 (validateOffsetBitsIneqLemma!0 (_2!3200 lt!114916) (_2!3200 lt!115694) lt!115707 lt!115714))))

(assert (=> b!71566 (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!115694)))) ((_ sign_extend 32) (currentByte!3467 (_2!3200 lt!115694))) ((_ sign_extend 32) (currentBit!3462 (_2!3200 lt!115694))) (bvsub lt!115707 lt!115714))))

(declare-fun lt!115682 () Unit!4761)

(assert (=> b!71566 (= lt!115682 lt!115680)))

(declare-fun lt!115700 () tuple2!6168)

(assert (=> b!71566 (= lt!115700 (reader!0 (_2!3200 lt!114916) (_2!3200 lt!115694)))))

(declare-fun lt!115696 () (_ BitVec 64))

(assert (=> b!71566 (= lt!115696 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!115715 () Unit!4761)

(assert (=> b!71566 (= lt!115715 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3200 lt!114916) (buf!1747 (_2!3200 lt!115694)) lt!115696))))

(assert (=> b!71566 (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!115694)))) ((_ sign_extend 32) (currentByte!3467 (_2!3200 lt!114916))) ((_ sign_extend 32) (currentBit!3462 (_2!3200 lt!114916))) lt!115696)))

(declare-fun lt!115690 () Unit!4761)

(assert (=> b!71566 (= lt!115690 lt!115715)))

(assert (=> b!71566 (= (head!553 (byteArrayBitContentToList!0 (_2!3200 lt!115694) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!553 (bitStreamReadBitsIntoList!0 (_2!3200 lt!115694) (_1!3198 lt!115700) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!115718 () Unit!4761)

(declare-fun Unit!4777 () Unit!4761)

(assert (=> b!71566 (= lt!115718 Unit!4777)))

(assert (=> b!71566 (= lt!115689 (appendBitsMSBFirstLoop!0 (_2!3200 lt!115694) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!115702 () Unit!4761)

(assert (=> b!71566 (= lt!115702 (lemmaIsPrefixTransitive!0 (_2!3200 lt!114916) (_2!3200 lt!115694) (_2!3200 lt!115689)))))

(assert (=> b!71566 (isPrefixOf!0 (_2!3200 lt!114916) (_2!3200 lt!115689))))

(declare-fun lt!115712 () Unit!4761)

(assert (=> b!71566 (= lt!115712 lt!115702)))

(assert (=> b!71566 (= (size!1366 (buf!1747 (_2!3200 lt!115689))) (size!1366 (buf!1747 (_2!3200 lt!114916))))))

(declare-fun lt!115711 () Unit!4761)

(declare-fun Unit!4778 () Unit!4761)

(assert (=> b!71566 (= lt!115711 Unit!4778)))

(assert (=> b!71566 (= (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!115689))) (currentByte!3467 (_2!3200 lt!115689)) (currentBit!3462 (_2!3200 lt!115689))) (bvsub (bvadd (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!114916))) (currentByte!3467 (_2!3200 lt!114916)) (currentBit!3462 (_2!3200 lt!114916))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!115685 () Unit!4761)

(declare-fun Unit!4779 () Unit!4761)

(assert (=> b!71566 (= lt!115685 Unit!4779)))

(assert (=> b!71566 (= (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!115689))) (currentByte!3467 (_2!3200 lt!115689)) (currentBit!3462 (_2!3200 lt!115689))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!115694))) (currentByte!3467 (_2!3200 lt!115694)) (currentBit!3462 (_2!3200 lt!115694))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!115683 () Unit!4761)

(declare-fun Unit!4780 () Unit!4761)

(assert (=> b!71566 (= lt!115683 Unit!4780)))

(declare-fun lt!115692 () tuple2!6168)

(assert (=> b!71566 (= lt!115692 call!931)))

(declare-fun lt!115709 () (_ BitVec 64))

(assert (=> b!71566 (= lt!115709 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!115691 () Unit!4761)

(assert (=> b!71566 (= lt!115691 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3200 lt!114916) (buf!1747 (_2!3200 lt!115689)) lt!115709))))

(assert (=> b!71566 (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!115689)))) ((_ sign_extend 32) (currentByte!3467 (_2!3200 lt!114916))) ((_ sign_extend 32) (currentBit!3462 (_2!3200 lt!114916))) lt!115709)))

(declare-fun lt!115705 () Unit!4761)

(assert (=> b!71566 (= lt!115705 lt!115691)))

(declare-fun lt!115717 () tuple2!6168)

(assert (=> b!71566 (= lt!115717 (reader!0 (_2!3200 lt!115694) (_2!3200 lt!115689)))))

(declare-fun lt!115681 () (_ BitVec 64))

(assert (=> b!71566 (= lt!115681 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!115693 () Unit!4761)

(assert (=> b!71566 (= lt!115693 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3200 lt!115694) (buf!1747 (_2!3200 lt!115689)) lt!115681))))

(assert (=> b!71566 (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!115689)))) ((_ sign_extend 32) (currentByte!3467 (_2!3200 lt!115694))) ((_ sign_extend 32) (currentBit!3462 (_2!3200 lt!115694))) lt!115681)))

(declare-fun lt!115687 () Unit!4761)

(assert (=> b!71566 (= lt!115687 lt!115693)))

(declare-fun lt!115716 () List!734)

(assert (=> b!71566 (= lt!115716 (byteArrayBitContentToList!0 (_2!3200 lt!115689) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!115684 () List!734)

(assert (=> b!71566 (= lt!115684 (byteArrayBitContentToList!0 (_2!3200 lt!115689) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!115710 () List!734)

(assert (=> b!71566 (= lt!115710 (bitStreamReadBitsIntoList!0 (_2!3200 lt!115689) (_1!3198 lt!115692) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!115721 () List!734)

(assert (=> b!71566 (= lt!115721 (bitStreamReadBitsIntoList!0 (_2!3200 lt!115689) (_1!3198 lt!115717) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!115679 () (_ BitVec 64))

(assert (=> b!71566 (= lt!115679 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!115708 () Unit!4761)

(assert (=> b!71566 (= lt!115708 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3200 lt!115689) (_2!3200 lt!115689) (_1!3198 lt!115692) (_1!3198 lt!115717) lt!115679 lt!115710))))

(assert (=> b!71566 (= (bitStreamReadBitsIntoList!0 (_2!3200 lt!115689) (_1!3198 lt!115717) (bvsub lt!115679 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!338 lt!115710))))

(declare-fun lt!115699 () Unit!4761)

(assert (=> b!71566 (= lt!115699 lt!115708)))

(declare-fun lt!115704 () Unit!4761)

(assert (=> b!71566 (= lt!115704 (arrayBitRangesEqImpliesEq!0 (buf!1747 (_2!3200 lt!115694)) (buf!1747 (_2!3200 lt!115689)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!115688 (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!115694))) (currentByte!3467 (_2!3200 lt!115694)) (currentBit!3462 (_2!3200 lt!115694)))))))

(assert (=> b!71566 (= (bitAt!0 (buf!1747 (_2!3200 lt!115694)) lt!115688) (bitAt!0 (buf!1747 (_2!3200 lt!115689)) lt!115688))))

(declare-fun lt!115719 () Unit!4761)

(assert (=> b!71566 (= lt!115719 lt!115704)))

(declare-fun b!71567 () Bool)

(assert (=> b!71567 (= e!46569 (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114916)))) ((_ sign_extend 32) (currentByte!3467 (_2!3200 lt!114916))) ((_ sign_extend 32) (currentBit!3462 (_2!3200 lt!114916))) lt!115697))))

(declare-fun bm!928 () Bool)

(assert (=> bm!928 (= call!931 (reader!0 (_2!3200 lt!114916) (ite c!5381 (_2!3200 lt!115689) (_2!3200 lt!114916))))))

(declare-fun b!71568 () Bool)

(declare-fun res!58968 () Bool)

(assert (=> b!71568 (=> (not res!58968) (not e!46568))))

(assert (=> b!71568 (= res!58968 (= (size!1366 (buf!1747 (_2!3200 lt!115695))) (size!1366 (buf!1747 (_2!3200 lt!114916)))))))

(declare-fun b!71569 () Bool)

(declare-fun res!58972 () Bool)

(assert (=> b!71569 (=> (not res!58972) (not e!46568))))

(assert (=> b!71569 (= res!58972 (isPrefixOf!0 (_2!3200 lt!114916) (_2!3200 lt!115695)))))

(assert (= (and d!23082 c!5381) b!71566))

(assert (= (and d!23082 (not c!5381)) b!71565))

(assert (= (or b!71566 b!71565) bm!928))

(assert (= (and d!23082 res!58970) b!71563))

(assert (= (and b!71563 res!58973) b!71562))

(assert (= (and b!71562 res!58971) b!71569))

(assert (= (and b!71569 res!58972) b!71568))

(assert (= (and b!71568 res!58968) b!71564))

(assert (= (and b!71564 res!58969) b!71567))

(declare-fun m!114799 () Bool)

(assert (=> b!71565 m!114799))

(declare-fun m!114801 () Bool)

(assert (=> b!71565 m!114801))

(declare-fun m!114803 () Bool)

(assert (=> b!71567 m!114803))

(declare-fun m!114805 () Bool)

(assert (=> b!71566 m!114805))

(declare-fun m!114807 () Bool)

(assert (=> b!71566 m!114807))

(declare-fun m!114809 () Bool)

(assert (=> b!71566 m!114809))

(declare-fun m!114811 () Bool)

(assert (=> b!71566 m!114811))

(declare-fun m!114813 () Bool)

(assert (=> b!71566 m!114813))

(declare-fun m!114815 () Bool)

(assert (=> b!71566 m!114815))

(declare-fun m!114817 () Bool)

(assert (=> b!71566 m!114817))

(assert (=> b!71566 m!114219))

(declare-fun m!114819 () Bool)

(assert (=> b!71566 m!114819))

(declare-fun m!114821 () Bool)

(assert (=> b!71566 m!114821))

(declare-fun m!114823 () Bool)

(assert (=> b!71566 m!114823))

(declare-fun m!114825 () Bool)

(assert (=> b!71566 m!114825))

(declare-fun m!114827 () Bool)

(assert (=> b!71566 m!114827))

(declare-fun m!114829 () Bool)

(assert (=> b!71566 m!114829))

(declare-fun m!114831 () Bool)

(assert (=> b!71566 m!114831))

(declare-fun m!114833 () Bool)

(assert (=> b!71566 m!114833))

(declare-fun m!114835 () Bool)

(assert (=> b!71566 m!114835))

(declare-fun m!114837 () Bool)

(assert (=> b!71566 m!114837))

(declare-fun m!114839 () Bool)

(assert (=> b!71566 m!114839))

(assert (=> b!71566 m!114809))

(declare-fun m!114841 () Bool)

(assert (=> b!71566 m!114841))

(declare-fun m!114843 () Bool)

(assert (=> b!71566 m!114843))

(assert (=> b!71566 m!114813))

(declare-fun m!114845 () Bool)

(assert (=> b!71566 m!114845))

(declare-fun m!114847 () Bool)

(assert (=> b!71566 m!114847))

(declare-fun m!114849 () Bool)

(assert (=> b!71566 m!114849))

(declare-fun m!114851 () Bool)

(assert (=> b!71566 m!114851))

(declare-fun m!114853 () Bool)

(assert (=> b!71566 m!114853))

(declare-fun m!114855 () Bool)

(assert (=> b!71566 m!114855))

(declare-fun m!114857 () Bool)

(assert (=> b!71566 m!114857))

(assert (=> b!71566 m!114825))

(declare-fun m!114859 () Bool)

(assert (=> b!71566 m!114859))

(declare-fun m!114861 () Bool)

(assert (=> b!71566 m!114861))

(declare-fun m!114863 () Bool)

(assert (=> b!71566 m!114863))

(assert (=> b!71566 m!114863))

(declare-fun m!114865 () Bool)

(assert (=> b!71566 m!114865))

(declare-fun m!114867 () Bool)

(assert (=> b!71569 m!114867))

(declare-fun m!114869 () Bool)

(assert (=> b!71563 m!114869))

(declare-fun m!114871 () Bool)

(assert (=> b!71564 m!114871))

(declare-fun m!114873 () Bool)

(assert (=> b!71564 m!114873))

(declare-fun m!114875 () Bool)

(assert (=> b!71564 m!114875))

(declare-fun m!114877 () Bool)

(assert (=> b!71564 m!114877))

(declare-fun m!114879 () Bool)

(assert (=> b!71564 m!114879))

(declare-fun m!114881 () Bool)

(assert (=> d!23082 m!114881))

(assert (=> d!23082 m!114219))

(assert (=> d!23082 m!114535))

(assert (=> d!23082 m!114529))

(declare-fun m!114883 () Bool)

(assert (=> bm!928 m!114883))

(assert (=> b!71233 d!23082))

(declare-fun d!23168 () Bool)

(declare-fun res!58974 () Bool)

(declare-fun e!46572 () Bool)

(assert (=> d!23168 (=> (not res!58974) (not e!46572))))

(assert (=> d!23168 (= res!58974 (= (size!1366 (buf!1747 thiss!1379)) (size!1366 (buf!1747 (_2!3200 lt!114924)))))))

(assert (=> d!23168 (= (isPrefixOf!0 thiss!1379 (_2!3200 lt!114924)) e!46572)))

(declare-fun b!71570 () Bool)

(declare-fun res!58976 () Bool)

(assert (=> b!71570 (=> (not res!58976) (not e!46572))))

(assert (=> b!71570 (= res!58976 (bvsle (bitIndex!0 (size!1366 (buf!1747 thiss!1379)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379)) (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!114924))) (currentByte!3467 (_2!3200 lt!114924)) (currentBit!3462 (_2!3200 lt!114924)))))))

(declare-fun b!71571 () Bool)

(declare-fun e!46571 () Bool)

(assert (=> b!71571 (= e!46572 e!46571)))

(declare-fun res!58975 () Bool)

(assert (=> b!71571 (=> res!58975 e!46571)))

(assert (=> b!71571 (= res!58975 (= (size!1366 (buf!1747 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!71572 () Bool)

(assert (=> b!71572 (= e!46571 (arrayBitRangesEq!0 (buf!1747 thiss!1379) (buf!1747 (_2!3200 lt!114924)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1366 (buf!1747 thiss!1379)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379))))))

(assert (= (and d!23168 res!58974) b!71570))

(assert (= (and b!71570 res!58976) b!71571))

(assert (= (and b!71571 (not res!58975)) b!71572))

(assert (=> b!71570 m!114267))

(assert (=> b!71570 m!114199))

(assert (=> b!71572 m!114267))

(assert (=> b!71572 m!114267))

(declare-fun m!114885 () Bool)

(assert (=> b!71572 m!114885))

(assert (=> b!71233 d!23168))

(declare-fun d!23170 () Bool)

(assert (=> d!23170 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114916)))) ((_ sign_extend 32) (currentByte!3467 thiss!1379)) ((_ sign_extend 32) (currentBit!3462 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114916)))) ((_ sign_extend 32) (currentByte!3467 thiss!1379)) ((_ sign_extend 32) (currentBit!3462 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5540 () Bool)

(assert (= bs!5540 d!23170))

(declare-fun m!114887 () Bool)

(assert (=> bs!5540 m!114887))

(assert (=> b!71233 d!23170))

(declare-fun d!23172 () Bool)

(declare-fun e!46575 () Bool)

(assert (=> d!23172 e!46575))

(declare-fun res!58981 () Bool)

(assert (=> d!23172 (=> (not res!58981) (not e!46575))))

(declare-fun lt!115739 () (_ BitVec 64))

(declare-fun lt!115737 () (_ BitVec 64))

(declare-fun lt!115735 () (_ BitVec 64))

(assert (=> d!23172 (= res!58981 (= lt!115739 (bvsub lt!115737 lt!115735)))))

(assert (=> d!23172 (or (= (bvand lt!115737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115735 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115737 lt!115735) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23172 (= lt!115735 (remainingBits!0 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114916)))) ((_ sign_extend 32) (currentByte!3467 (_2!3200 lt!114916))) ((_ sign_extend 32) (currentBit!3462 (_2!3200 lt!114916)))))))

(declare-fun lt!115740 () (_ BitVec 64))

(declare-fun lt!115738 () (_ BitVec 64))

(assert (=> d!23172 (= lt!115737 (bvmul lt!115740 lt!115738))))

(assert (=> d!23172 (or (= lt!115740 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!115738 (bvsdiv (bvmul lt!115740 lt!115738) lt!115740)))))

(assert (=> d!23172 (= lt!115738 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23172 (= lt!115740 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114916)))))))

(assert (=> d!23172 (= lt!115739 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3467 (_2!3200 lt!114916))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3462 (_2!3200 lt!114916)))))))

(assert (=> d!23172 (invariant!0 (currentBit!3462 (_2!3200 lt!114916)) (currentByte!3467 (_2!3200 lt!114916)) (size!1366 (buf!1747 (_2!3200 lt!114916))))))

(assert (=> d!23172 (= (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!114916))) (currentByte!3467 (_2!3200 lt!114916)) (currentBit!3462 (_2!3200 lt!114916))) lt!115739)))

(declare-fun b!71577 () Bool)

(declare-fun res!58982 () Bool)

(assert (=> b!71577 (=> (not res!58982) (not e!46575))))

(assert (=> b!71577 (= res!58982 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!115739))))

(declare-fun b!71578 () Bool)

(declare-fun lt!115736 () (_ BitVec 64))

(assert (=> b!71578 (= e!46575 (bvsle lt!115739 (bvmul lt!115736 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!71578 (or (= lt!115736 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!115736 #b0000000000000000000000000000000000000000000000000000000000001000) lt!115736)))))

(assert (=> b!71578 (= lt!115736 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114916)))))))

(assert (= (and d!23172 res!58981) b!71577))

(assert (= (and b!71577 res!58982) b!71578))

(assert (=> d!23172 m!114385))

(assert (=> d!23172 m!114247))

(assert (=> b!71220 d!23172))

(declare-fun d!23174 () Bool)

(assert (=> d!23174 (= (invariant!0 (currentBit!3462 (_2!3200 lt!114916)) (currentByte!3467 (_2!3200 lt!114916)) (size!1366 (buf!1747 (_2!3200 lt!114916)))) (and (bvsge (currentBit!3462 (_2!3200 lt!114916)) #b00000000000000000000000000000000) (bvslt (currentBit!3462 (_2!3200 lt!114916)) #b00000000000000000000000000001000) (bvsge (currentByte!3467 (_2!3200 lt!114916)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3467 (_2!3200 lt!114916)) (size!1366 (buf!1747 (_2!3200 lt!114916)))) (and (= (currentBit!3462 (_2!3200 lt!114916)) #b00000000000000000000000000000000) (= (currentByte!3467 (_2!3200 lt!114916)) (size!1366 (buf!1747 (_2!3200 lt!114916))))))))))

(assert (=> b!71231 d!23174))

(declare-fun d!23176 () Bool)

(assert (=> d!23176 (= (array_inv!1218 srcBuffer!2) (bvsge (size!1366 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13918 d!23176))

(declare-fun d!23178 () Bool)

(assert (=> d!23178 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3462 thiss!1379) (currentByte!3467 thiss!1379) (size!1366 (buf!1747 thiss!1379))))))

(declare-fun bs!5541 () Bool)

(assert (= bs!5541 d!23178))

(declare-fun m!114889 () Bool)

(assert (=> bs!5541 m!114889))

(assert (=> start!13918 d!23178))

(declare-fun d!23180 () Bool)

(assert (=> d!23180 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 thiss!1379))) ((_ sign_extend 32) (currentByte!3467 thiss!1379)) ((_ sign_extend 32) (currentBit!3462 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1366 (buf!1747 thiss!1379))) ((_ sign_extend 32) (currentByte!3467 thiss!1379)) ((_ sign_extend 32) (currentBit!3462 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5542 () Bool)

(assert (= bs!5542 d!23180))

(declare-fun m!114891 () Bool)

(assert (=> bs!5542 m!114891))

(assert (=> b!71221 d!23180))

(declare-fun d!23182 () Bool)

(declare-datatypes ((tuple2!6188 0))(
  ( (tuple2!6189 (_1!3208 Bool) (_2!3208 BitStream!2318)) )
))
(declare-fun lt!115743 () tuple2!6188)

(declare-fun readBit!0 (BitStream!2318) tuple2!6188)

(assert (=> d!23182 (= lt!115743 (readBit!0 (_1!3198 lt!114910)))))

(assert (=> d!23182 (= (readBitPure!0 (_1!3198 lt!114910)) (tuple2!6171 (_2!3208 lt!115743) (_1!3208 lt!115743)))))

(declare-fun bs!5543 () Bool)

(assert (= bs!5543 d!23182))

(declare-fun m!114893 () Bool)

(assert (=> bs!5543 m!114893))

(assert (=> b!71219 d!23182))

(declare-fun d!23184 () Bool)

(assert (=> d!23184 (= (bitAt!0 (buf!1747 (_1!3198 lt!114920)) lt!114932) (not (= (bvand ((_ sign_extend 24) (select (arr!1954 (buf!1747 (_1!3198 lt!114920))) ((_ extract 31 0) (bvsdiv lt!114932 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!114932 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5544 () Bool)

(assert (= bs!5544 d!23184))

(declare-fun m!114895 () Bool)

(assert (=> bs!5544 m!114895))

(assert (=> bs!5544 m!114503))

(assert (=> b!71230 d!23184))

(declare-fun d!23186 () Bool)

(assert (=> d!23186 (= (bitAt!0 (buf!1747 (_1!3198 lt!114910)) lt!114932) (not (= (bvand ((_ sign_extend 24) (select (arr!1954 (buf!1747 (_1!3198 lt!114910))) ((_ extract 31 0) (bvsdiv lt!114932 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!114932 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5545 () Bool)

(assert (= bs!5545 d!23186))

(declare-fun m!114897 () Bool)

(assert (=> bs!5545 m!114897))

(assert (=> bs!5545 m!114503))

(assert (=> b!71230 d!23186))

(declare-fun b!71579 () Bool)

(declare-fun res!58984 () Bool)

(declare-fun e!46576 () Bool)

(assert (=> b!71579 (=> (not res!58984) (not e!46576))))

(declare-fun lt!115756 () tuple2!6168)

(assert (=> b!71579 (= res!58984 (isPrefixOf!0 (_2!3198 lt!115756) (_2!3200 lt!114924)))))

(declare-fun d!23188 () Bool)

(assert (=> d!23188 e!46576))

(declare-fun res!58983 () Bool)

(assert (=> d!23188 (=> (not res!58983) (not e!46576))))

(assert (=> d!23188 (= res!58983 (isPrefixOf!0 (_1!3198 lt!115756) (_2!3198 lt!115756)))))

(declare-fun lt!115753 () BitStream!2318)

(assert (=> d!23188 (= lt!115756 (tuple2!6169 lt!115753 (_2!3200 lt!114924)))))

(declare-fun lt!115748 () Unit!4761)

(declare-fun lt!115750 () Unit!4761)

(assert (=> d!23188 (= lt!115748 lt!115750)))

(assert (=> d!23188 (isPrefixOf!0 lt!115753 (_2!3200 lt!114924))))

(assert (=> d!23188 (= lt!115750 (lemmaIsPrefixTransitive!0 lt!115753 (_2!3200 lt!114924) (_2!3200 lt!114924)))))

(declare-fun lt!115760 () Unit!4761)

(declare-fun lt!115762 () Unit!4761)

(assert (=> d!23188 (= lt!115760 lt!115762)))

(assert (=> d!23188 (isPrefixOf!0 lt!115753 (_2!3200 lt!114924))))

(assert (=> d!23188 (= lt!115762 (lemmaIsPrefixTransitive!0 lt!115753 thiss!1379 (_2!3200 lt!114924)))))

(declare-fun lt!115744 () Unit!4761)

(declare-fun e!46577 () Unit!4761)

(assert (=> d!23188 (= lt!115744 e!46577)))

(declare-fun c!5382 () Bool)

(assert (=> d!23188 (= c!5382 (not (= (size!1366 (buf!1747 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!115757 () Unit!4761)

(declare-fun lt!115761 () Unit!4761)

(assert (=> d!23188 (= lt!115757 lt!115761)))

(assert (=> d!23188 (isPrefixOf!0 (_2!3200 lt!114924) (_2!3200 lt!114924))))

(assert (=> d!23188 (= lt!115761 (lemmaIsPrefixRefl!0 (_2!3200 lt!114924)))))

(declare-fun lt!115752 () Unit!4761)

(declare-fun lt!115763 () Unit!4761)

(assert (=> d!23188 (= lt!115752 lt!115763)))

(assert (=> d!23188 (= lt!115763 (lemmaIsPrefixRefl!0 (_2!3200 lt!114924)))))

(declare-fun lt!115745 () Unit!4761)

(declare-fun lt!115751 () Unit!4761)

(assert (=> d!23188 (= lt!115745 lt!115751)))

(assert (=> d!23188 (isPrefixOf!0 lt!115753 lt!115753)))

(assert (=> d!23188 (= lt!115751 (lemmaIsPrefixRefl!0 lt!115753))))

(declare-fun lt!115758 () Unit!4761)

(declare-fun lt!115754 () Unit!4761)

(assert (=> d!23188 (= lt!115758 lt!115754)))

(assert (=> d!23188 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23188 (= lt!115754 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23188 (= lt!115753 (BitStream!2319 (buf!1747 (_2!3200 lt!114924)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379)))))

(assert (=> d!23188 (isPrefixOf!0 thiss!1379 (_2!3200 lt!114924))))

(assert (=> d!23188 (= (reader!0 thiss!1379 (_2!3200 lt!114924)) lt!115756)))

(declare-fun b!71580 () Bool)

(declare-fun res!58985 () Bool)

(assert (=> b!71580 (=> (not res!58985) (not e!46576))))

(assert (=> b!71580 (= res!58985 (isPrefixOf!0 (_1!3198 lt!115756) thiss!1379))))

(declare-fun b!71581 () Bool)

(declare-fun lt!115755 () Unit!4761)

(assert (=> b!71581 (= e!46577 lt!115755)))

(declare-fun lt!115747 () (_ BitVec 64))

(assert (=> b!71581 (= lt!115747 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!115759 () (_ BitVec 64))

(assert (=> b!71581 (= lt!115759 (bitIndex!0 (size!1366 (buf!1747 thiss!1379)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379)))))

(assert (=> b!71581 (= lt!115755 (arrayBitRangesEqSymmetric!0 (buf!1747 thiss!1379) (buf!1747 (_2!3200 lt!114924)) lt!115747 lt!115759))))

(assert (=> b!71581 (arrayBitRangesEq!0 (buf!1747 (_2!3200 lt!114924)) (buf!1747 thiss!1379) lt!115747 lt!115759)))

(declare-fun b!71582 () Bool)

(declare-fun Unit!4783 () Unit!4761)

(assert (=> b!71582 (= e!46577 Unit!4783)))

(declare-fun lt!115746 () (_ BitVec 64))

(declare-fun b!71583 () Bool)

(declare-fun lt!115749 () (_ BitVec 64))

(assert (=> b!71583 (= e!46576 (= (_1!3198 lt!115756) (withMovedBitIndex!0 (_2!3198 lt!115756) (bvsub lt!115746 lt!115749))))))

(assert (=> b!71583 (or (= (bvand lt!115746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115749 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115746 lt!115749) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71583 (= lt!115749 (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!114924))) (currentByte!3467 (_2!3200 lt!114924)) (currentBit!3462 (_2!3200 lt!114924))))))

(assert (=> b!71583 (= lt!115746 (bitIndex!0 (size!1366 (buf!1747 thiss!1379)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379)))))

(assert (= (and d!23188 c!5382) b!71581))

(assert (= (and d!23188 (not c!5382)) b!71582))

(assert (= (and d!23188 res!58983) b!71580))

(assert (= (and b!71580 res!58985) b!71579))

(assert (= (and b!71579 res!58984) b!71583))

(declare-fun m!114899 () Bool)

(assert (=> b!71579 m!114899))

(assert (=> b!71581 m!114267))

(declare-fun m!114901 () Bool)

(assert (=> b!71581 m!114901))

(declare-fun m!114903 () Bool)

(assert (=> b!71581 m!114903))

(declare-fun m!114905 () Bool)

(assert (=> b!71580 m!114905))

(declare-fun m!114907 () Bool)

(assert (=> b!71583 m!114907))

(assert (=> b!71583 m!114199))

(assert (=> b!71583 m!114267))

(declare-fun m!114909 () Bool)

(assert (=> d!23188 m!114909))

(declare-fun m!114911 () Bool)

(assert (=> d!23188 m!114911))

(declare-fun m!114913 () Bool)

(assert (=> d!23188 m!114913))

(assert (=> d!23188 m!114263))

(declare-fun m!114915 () Bool)

(assert (=> d!23188 m!114915))

(declare-fun m!114917 () Bool)

(assert (=> d!23188 m!114917))

(assert (=> d!23188 m!114265))

(declare-fun m!114919 () Bool)

(assert (=> d!23188 m!114919))

(declare-fun m!114921 () Bool)

(assert (=> d!23188 m!114921))

(assert (=> d!23188 m!114233))

(declare-fun m!114923 () Bool)

(assert (=> d!23188 m!114923))

(assert (=> b!71228 d!23188))

(declare-fun d!23190 () Bool)

(assert (=> d!23190 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114924)))) ((_ sign_extend 32) (currentByte!3467 thiss!1379)) ((_ sign_extend 32) (currentBit!3462 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114924)))) ((_ sign_extend 32) (currentByte!3467 thiss!1379)) ((_ sign_extend 32) (currentBit!3462 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5546 () Bool)

(assert (= bs!5546 d!23190))

(declare-fun m!114925 () Bool)

(assert (=> bs!5546 m!114925))

(assert (=> b!71228 d!23190))

(declare-fun d!23192 () Bool)

(assert (=> d!23192 (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114924)))) ((_ sign_extend 32) (currentByte!3467 thiss!1379)) ((_ sign_extend 32) (currentBit!3462 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!115764 () Unit!4761)

(assert (=> d!23192 (= lt!115764 (choose!9 thiss!1379 (buf!1747 (_2!3200 lt!114924)) (bvsub to!314 i!635) (BitStream!2319 (buf!1747 (_2!3200 lt!114924)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379))))))

(assert (=> d!23192 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1747 (_2!3200 lt!114924)) (bvsub to!314 i!635)) lt!115764)))

(declare-fun bs!5547 () Bool)

(assert (= bs!5547 d!23192))

(assert (=> bs!5547 m!114201))

(declare-fun m!114927 () Bool)

(assert (=> bs!5547 m!114927))

(assert (=> b!71228 d!23192))

(declare-fun d!23194 () Bool)

(assert (=> d!23194 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114924)))) ((_ sign_extend 32) (currentByte!3467 (_2!3200 lt!114916))) ((_ sign_extend 32) (currentBit!3462 (_2!3200 lt!114916))) lt!114929) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114924)))) ((_ sign_extend 32) (currentByte!3467 (_2!3200 lt!114916))) ((_ sign_extend 32) (currentBit!3462 (_2!3200 lt!114916)))) lt!114929))))

(declare-fun bs!5548 () Bool)

(assert (= bs!5548 d!23194))

(declare-fun m!114929 () Bool)

(assert (=> bs!5548 m!114929))

(assert (=> b!71228 d!23194))

(declare-fun lt!115772 () (_ BitVec 64))

(declare-fun b!71593 () Bool)

(declare-fun lt!115771 () tuple2!6188)

(declare-datatypes ((tuple2!6190 0))(
  ( (tuple2!6191 (_1!3209 List!734) (_2!3209 BitStream!2318)) )
))
(declare-fun e!46582 () tuple2!6190)

(assert (=> b!71593 (= e!46582 (tuple2!6191 (Cons!730 (_1!3208 lt!115771) (bitStreamReadBitsIntoList!0 (_2!3200 lt!114924) (_2!3208 lt!115771) (bvsub (bvsub to!314 i!635) lt!115772))) (_2!3208 lt!115771)))))

(assert (=> b!71593 (= lt!115771 (readBit!0 (_1!3198 lt!114910)))))

(assert (=> b!71593 (= lt!115772 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!71595 () Bool)

(declare-fun e!46583 () Bool)

(declare-fun lt!115773 () List!734)

(assert (=> b!71595 (= e!46583 (> (length!362 lt!115773) 0))))

(declare-fun b!71592 () Bool)

(assert (=> b!71592 (= e!46582 (tuple2!6191 Nil!731 (_1!3198 lt!114910)))))

(declare-fun d!23196 () Bool)

(assert (=> d!23196 e!46583))

(declare-fun c!5387 () Bool)

(assert (=> d!23196 (= c!5387 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23196 (= lt!115773 (_1!3209 e!46582))))

(declare-fun c!5388 () Bool)

(assert (=> d!23196 (= c!5388 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23196 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23196 (= (bitStreamReadBitsIntoList!0 (_2!3200 lt!114924) (_1!3198 lt!114910) (bvsub to!314 i!635)) lt!115773)))

(declare-fun b!71594 () Bool)

(declare-fun isEmpty!233 (List!734) Bool)

(assert (=> b!71594 (= e!46583 (isEmpty!233 lt!115773))))

(assert (= (and d!23196 c!5388) b!71592))

(assert (= (and d!23196 (not c!5388)) b!71593))

(assert (= (and d!23196 c!5387) b!71594))

(assert (= (and d!23196 (not c!5387)) b!71595))

(declare-fun m!114931 () Bool)

(assert (=> b!71593 m!114931))

(assert (=> b!71593 m!114893))

(declare-fun m!114933 () Bool)

(assert (=> b!71595 m!114933))

(declare-fun m!114935 () Bool)

(assert (=> b!71594 m!114935))

(assert (=> b!71228 d!23196))

(declare-fun d!23198 () Bool)

(assert (=> d!23198 (validate_offset_bits!1 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114924)))) ((_ sign_extend 32) (currentByte!3467 (_2!3200 lt!114916))) ((_ sign_extend 32) (currentBit!3462 (_2!3200 lt!114916))) lt!114929)))

(declare-fun lt!115774 () Unit!4761)

(assert (=> d!23198 (= lt!115774 (choose!9 (_2!3200 lt!114916) (buf!1747 (_2!3200 lt!114924)) lt!114929 (BitStream!2319 (buf!1747 (_2!3200 lt!114924)) (currentByte!3467 (_2!3200 lt!114916)) (currentBit!3462 (_2!3200 lt!114916)))))))

(assert (=> d!23198 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3200 lt!114916) (buf!1747 (_2!3200 lt!114924)) lt!114929) lt!115774)))

(declare-fun bs!5549 () Bool)

(assert (= bs!5549 d!23198))

(assert (=> bs!5549 m!114207))

(declare-fun m!114937 () Bool)

(assert (=> bs!5549 m!114937))

(assert (=> b!71228 d!23198))

(declare-fun b!71596 () Bool)

(declare-fun res!58987 () Bool)

(declare-fun e!46584 () Bool)

(assert (=> b!71596 (=> (not res!58987) (not e!46584))))

(declare-fun lt!115787 () tuple2!6168)

(assert (=> b!71596 (= res!58987 (isPrefixOf!0 (_2!3198 lt!115787) (_2!3200 lt!114924)))))

(declare-fun d!23200 () Bool)

(assert (=> d!23200 e!46584))

(declare-fun res!58986 () Bool)

(assert (=> d!23200 (=> (not res!58986) (not e!46584))))

(assert (=> d!23200 (= res!58986 (isPrefixOf!0 (_1!3198 lt!115787) (_2!3198 lt!115787)))))

(declare-fun lt!115784 () BitStream!2318)

(assert (=> d!23200 (= lt!115787 (tuple2!6169 lt!115784 (_2!3200 lt!114924)))))

(declare-fun lt!115779 () Unit!4761)

(declare-fun lt!115781 () Unit!4761)

(assert (=> d!23200 (= lt!115779 lt!115781)))

(assert (=> d!23200 (isPrefixOf!0 lt!115784 (_2!3200 lt!114924))))

(assert (=> d!23200 (= lt!115781 (lemmaIsPrefixTransitive!0 lt!115784 (_2!3200 lt!114924) (_2!3200 lt!114924)))))

(declare-fun lt!115791 () Unit!4761)

(declare-fun lt!115793 () Unit!4761)

(assert (=> d!23200 (= lt!115791 lt!115793)))

(assert (=> d!23200 (isPrefixOf!0 lt!115784 (_2!3200 lt!114924))))

(assert (=> d!23200 (= lt!115793 (lemmaIsPrefixTransitive!0 lt!115784 (_2!3200 lt!114916) (_2!3200 lt!114924)))))

(declare-fun lt!115775 () Unit!4761)

(declare-fun e!46585 () Unit!4761)

(assert (=> d!23200 (= lt!115775 e!46585)))

(declare-fun c!5389 () Bool)

(assert (=> d!23200 (= c!5389 (not (= (size!1366 (buf!1747 (_2!3200 lt!114916))) #b00000000000000000000000000000000)))))

(declare-fun lt!115788 () Unit!4761)

(declare-fun lt!115792 () Unit!4761)

(assert (=> d!23200 (= lt!115788 lt!115792)))

(assert (=> d!23200 (isPrefixOf!0 (_2!3200 lt!114924) (_2!3200 lt!114924))))

(assert (=> d!23200 (= lt!115792 (lemmaIsPrefixRefl!0 (_2!3200 lt!114924)))))

(declare-fun lt!115783 () Unit!4761)

(declare-fun lt!115794 () Unit!4761)

(assert (=> d!23200 (= lt!115783 lt!115794)))

(assert (=> d!23200 (= lt!115794 (lemmaIsPrefixRefl!0 (_2!3200 lt!114924)))))

(declare-fun lt!115776 () Unit!4761)

(declare-fun lt!115782 () Unit!4761)

(assert (=> d!23200 (= lt!115776 lt!115782)))

(assert (=> d!23200 (isPrefixOf!0 lt!115784 lt!115784)))

(assert (=> d!23200 (= lt!115782 (lemmaIsPrefixRefl!0 lt!115784))))

(declare-fun lt!115789 () Unit!4761)

(declare-fun lt!115785 () Unit!4761)

(assert (=> d!23200 (= lt!115789 lt!115785)))

(assert (=> d!23200 (isPrefixOf!0 (_2!3200 lt!114916) (_2!3200 lt!114916))))

(assert (=> d!23200 (= lt!115785 (lemmaIsPrefixRefl!0 (_2!3200 lt!114916)))))

(assert (=> d!23200 (= lt!115784 (BitStream!2319 (buf!1747 (_2!3200 lt!114924)) (currentByte!3467 (_2!3200 lt!114916)) (currentBit!3462 (_2!3200 lt!114916))))))

(assert (=> d!23200 (isPrefixOf!0 (_2!3200 lt!114916) (_2!3200 lt!114924))))

(assert (=> d!23200 (= (reader!0 (_2!3200 lt!114916) (_2!3200 lt!114924)) lt!115787)))

(declare-fun b!71597 () Bool)

(declare-fun res!58988 () Bool)

(assert (=> b!71597 (=> (not res!58988) (not e!46584))))

(assert (=> b!71597 (= res!58988 (isPrefixOf!0 (_1!3198 lt!115787) (_2!3200 lt!114916)))))

(declare-fun b!71598 () Bool)

(declare-fun lt!115786 () Unit!4761)

(assert (=> b!71598 (= e!46585 lt!115786)))

(declare-fun lt!115778 () (_ BitVec 64))

(assert (=> b!71598 (= lt!115778 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!115790 () (_ BitVec 64))

(assert (=> b!71598 (= lt!115790 (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!114916))) (currentByte!3467 (_2!3200 lt!114916)) (currentBit!3462 (_2!3200 lt!114916))))))

(assert (=> b!71598 (= lt!115786 (arrayBitRangesEqSymmetric!0 (buf!1747 (_2!3200 lt!114916)) (buf!1747 (_2!3200 lt!114924)) lt!115778 lt!115790))))

(assert (=> b!71598 (arrayBitRangesEq!0 (buf!1747 (_2!3200 lt!114924)) (buf!1747 (_2!3200 lt!114916)) lt!115778 lt!115790)))

(declare-fun b!71599 () Bool)

(declare-fun Unit!4784 () Unit!4761)

(assert (=> b!71599 (= e!46585 Unit!4784)))

(declare-fun lt!115777 () (_ BitVec 64))

(declare-fun lt!115780 () (_ BitVec 64))

(declare-fun b!71600 () Bool)

(assert (=> b!71600 (= e!46584 (= (_1!3198 lt!115787) (withMovedBitIndex!0 (_2!3198 lt!115787) (bvsub lt!115777 lt!115780))))))

(assert (=> b!71600 (or (= (bvand lt!115777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115780 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115777 lt!115780) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71600 (= lt!115780 (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!114924))) (currentByte!3467 (_2!3200 lt!114924)) (currentBit!3462 (_2!3200 lt!114924))))))

(assert (=> b!71600 (= lt!115777 (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!114916))) (currentByte!3467 (_2!3200 lt!114916)) (currentBit!3462 (_2!3200 lt!114916))))))

(assert (= (and d!23200 c!5389) b!71598))

(assert (= (and d!23200 (not c!5389)) b!71599))

(assert (= (and d!23200 res!58986) b!71597))

(assert (= (and b!71597 res!58988) b!71596))

(assert (= (and b!71596 res!58987) b!71600))

(declare-fun m!114939 () Bool)

(assert (=> b!71596 m!114939))

(assert (=> b!71598 m!114219))

(declare-fun m!114941 () Bool)

(assert (=> b!71598 m!114941))

(declare-fun m!114943 () Bool)

(assert (=> b!71598 m!114943))

(declare-fun m!114945 () Bool)

(assert (=> b!71597 m!114945))

(declare-fun m!114947 () Bool)

(assert (=> b!71600 m!114947))

(assert (=> b!71600 m!114199))

(assert (=> b!71600 m!114219))

(declare-fun m!114949 () Bool)

(assert (=> d!23200 m!114949))

(declare-fun m!114951 () Bool)

(assert (=> d!23200 m!114951))

(declare-fun m!114953 () Bool)

(assert (=> d!23200 m!114953))

(assert (=> d!23200 m!114535))

(assert (=> d!23200 m!114915))

(declare-fun m!114955 () Bool)

(assert (=> d!23200 m!114955))

(assert (=> d!23200 m!114529))

(declare-fun m!114957 () Bool)

(assert (=> d!23200 m!114957))

(assert (=> d!23200 m!114921))

(assert (=> d!23200 m!114239))

(declare-fun m!114959 () Bool)

(assert (=> d!23200 m!114959))

(assert (=> b!71228 d!23200))

(declare-fun b!71602 () Bool)

(declare-fun lt!115796 () (_ BitVec 64))

(declare-fun lt!115795 () tuple2!6188)

(declare-fun e!46586 () tuple2!6190)

(assert (=> b!71602 (= e!46586 (tuple2!6191 (Cons!730 (_1!3208 lt!115795) (bitStreamReadBitsIntoList!0 (_2!3200 lt!114924) (_2!3208 lt!115795) (bvsub lt!114929 lt!115796))) (_2!3208 lt!115795)))))

(assert (=> b!71602 (= lt!115795 (readBit!0 (_1!3198 lt!114920)))))

(assert (=> b!71602 (= lt!115796 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!71604 () Bool)

(declare-fun e!46587 () Bool)

(declare-fun lt!115797 () List!734)

(assert (=> b!71604 (= e!46587 (> (length!362 lt!115797) 0))))

(declare-fun b!71601 () Bool)

(assert (=> b!71601 (= e!46586 (tuple2!6191 Nil!731 (_1!3198 lt!114920)))))

(declare-fun d!23202 () Bool)

(assert (=> d!23202 e!46587))

(declare-fun c!5390 () Bool)

(assert (=> d!23202 (= c!5390 (= lt!114929 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23202 (= lt!115797 (_1!3209 e!46586))))

(declare-fun c!5391 () Bool)

(assert (=> d!23202 (= c!5391 (= lt!114929 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23202 (bvsge lt!114929 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23202 (= (bitStreamReadBitsIntoList!0 (_2!3200 lt!114924) (_1!3198 lt!114920) lt!114929) lt!115797)))

(declare-fun b!71603 () Bool)

(assert (=> b!71603 (= e!46587 (isEmpty!233 lt!115797))))

(assert (= (and d!23202 c!5391) b!71601))

(assert (= (and d!23202 (not c!5391)) b!71602))

(assert (= (and d!23202 c!5390) b!71603))

(assert (= (and d!23202 (not c!5390)) b!71604))

(declare-fun m!114961 () Bool)

(assert (=> b!71602 m!114961))

(declare-fun m!114963 () Bool)

(assert (=> b!71602 m!114963))

(declare-fun m!114965 () Bool)

(assert (=> b!71604 m!114965))

(declare-fun m!114967 () Bool)

(assert (=> b!71603 m!114967))

(assert (=> b!71228 d!23202))

(declare-fun d!23204 () Bool)

(declare-fun e!46588 () Bool)

(assert (=> d!23204 e!46588))

(declare-fun res!58989 () Bool)

(assert (=> d!23204 (=> (not res!58989) (not e!46588))))

(declare-fun lt!115802 () (_ BitVec 64))

(declare-fun lt!115800 () (_ BitVec 64))

(declare-fun lt!115798 () (_ BitVec 64))

(assert (=> d!23204 (= res!58989 (= lt!115802 (bvsub lt!115800 lt!115798)))))

(assert (=> d!23204 (or (= (bvand lt!115800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115798 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115800 lt!115798) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23204 (= lt!115798 (remainingBits!0 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114924)))) ((_ sign_extend 32) (currentByte!3467 (_2!3200 lt!114924))) ((_ sign_extend 32) (currentBit!3462 (_2!3200 lt!114924)))))))

(declare-fun lt!115803 () (_ BitVec 64))

(declare-fun lt!115801 () (_ BitVec 64))

(assert (=> d!23204 (= lt!115800 (bvmul lt!115803 lt!115801))))

(assert (=> d!23204 (or (= lt!115803 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!115801 (bvsdiv (bvmul lt!115803 lt!115801) lt!115803)))))

(assert (=> d!23204 (= lt!115801 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23204 (= lt!115803 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114924)))))))

(assert (=> d!23204 (= lt!115802 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3467 (_2!3200 lt!114924))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3462 (_2!3200 lt!114924)))))))

(assert (=> d!23204 (invariant!0 (currentBit!3462 (_2!3200 lt!114924)) (currentByte!3467 (_2!3200 lt!114924)) (size!1366 (buf!1747 (_2!3200 lt!114924))))))

(assert (=> d!23204 (= (bitIndex!0 (size!1366 (buf!1747 (_2!3200 lt!114924))) (currentByte!3467 (_2!3200 lt!114924)) (currentBit!3462 (_2!3200 lt!114924))) lt!115802)))

(declare-fun b!71605 () Bool)

(declare-fun res!58990 () Bool)

(assert (=> b!71605 (=> (not res!58990) (not e!46588))))

(assert (=> b!71605 (= res!58990 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!115802))))

(declare-fun b!71606 () Bool)

(declare-fun lt!115799 () (_ BitVec 64))

(assert (=> b!71606 (= e!46588 (bvsle lt!115802 (bvmul lt!115799 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!71606 (or (= lt!115799 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!115799 #b0000000000000000000000000000000000000000000000000000000000001000) lt!115799)))))

(assert (=> b!71606 (= lt!115799 ((_ sign_extend 32) (size!1366 (buf!1747 (_2!3200 lt!114924)))))))

(assert (= (and d!23204 res!58989) b!71605))

(assert (= (and b!71605 res!58990) b!71606))

(declare-fun m!114969 () Bool)

(assert (=> d!23204 m!114969))

(assert (=> d!23204 m!114269))

(assert (=> b!71239 d!23204))

(declare-fun d!23206 () Bool)

(declare-fun res!58991 () Bool)

(declare-fun e!46590 () Bool)

(assert (=> d!23206 (=> (not res!58991) (not e!46590))))

(assert (=> d!23206 (= res!58991 (= (size!1366 (buf!1747 thiss!1379)) (size!1366 (buf!1747 thiss!1379))))))

(assert (=> d!23206 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!46590)))

(declare-fun b!71607 () Bool)

(declare-fun res!58993 () Bool)

(assert (=> b!71607 (=> (not res!58993) (not e!46590))))

(assert (=> b!71607 (= res!58993 (bvsle (bitIndex!0 (size!1366 (buf!1747 thiss!1379)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379)) (bitIndex!0 (size!1366 (buf!1747 thiss!1379)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379))))))

(declare-fun b!71608 () Bool)

(declare-fun e!46589 () Bool)

(assert (=> b!71608 (= e!46590 e!46589)))

(declare-fun res!58992 () Bool)

(assert (=> b!71608 (=> res!58992 e!46589)))

(assert (=> b!71608 (= res!58992 (= (size!1366 (buf!1747 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!71609 () Bool)

(assert (=> b!71609 (= e!46589 (arrayBitRangesEq!0 (buf!1747 thiss!1379) (buf!1747 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1366 (buf!1747 thiss!1379)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379))))))

(assert (= (and d!23206 res!58991) b!71607))

(assert (= (and b!71607 res!58993) b!71608))

(assert (= (and b!71608 (not res!58992)) b!71609))

(assert (=> b!71607 m!114267))

(assert (=> b!71607 m!114267))

(assert (=> b!71609 m!114267))

(assert (=> b!71609 m!114267))

(declare-fun m!114971 () Bool)

(assert (=> b!71609 m!114971))

(assert (=> b!71218 d!23206))

(declare-fun d!23208 () Bool)

(assert (=> d!23208 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!115806 () Unit!4761)

(declare-fun choose!11 (BitStream!2318) Unit!4761)

(assert (=> d!23208 (= lt!115806 (choose!11 thiss!1379))))

(assert (=> d!23208 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!115806)))

(declare-fun bs!5551 () Bool)

(assert (= bs!5551 d!23208))

(assert (=> bs!5551 m!114263))

(declare-fun m!114973 () Bool)

(assert (=> bs!5551 m!114973))

(assert (=> b!71218 d!23208))

(declare-fun d!23210 () Bool)

(declare-fun e!46591 () Bool)

(assert (=> d!23210 e!46591))

(declare-fun res!58994 () Bool)

(assert (=> d!23210 (=> (not res!58994) (not e!46591))))

(declare-fun lt!115809 () (_ BitVec 64))

(declare-fun lt!115811 () (_ BitVec 64))

(declare-fun lt!115807 () (_ BitVec 64))

(assert (=> d!23210 (= res!58994 (= lt!115811 (bvsub lt!115809 lt!115807)))))

(assert (=> d!23210 (or (= (bvand lt!115809 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!115807 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!115809 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!115809 lt!115807) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23210 (= lt!115807 (remainingBits!0 ((_ sign_extend 32) (size!1366 (buf!1747 thiss!1379))) ((_ sign_extend 32) (currentByte!3467 thiss!1379)) ((_ sign_extend 32) (currentBit!3462 thiss!1379))))))

(declare-fun lt!115812 () (_ BitVec 64))

(declare-fun lt!115810 () (_ BitVec 64))

(assert (=> d!23210 (= lt!115809 (bvmul lt!115812 lt!115810))))

(assert (=> d!23210 (or (= lt!115812 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!115810 (bvsdiv (bvmul lt!115812 lt!115810) lt!115812)))))

(assert (=> d!23210 (= lt!115810 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23210 (= lt!115812 ((_ sign_extend 32) (size!1366 (buf!1747 thiss!1379))))))

(assert (=> d!23210 (= lt!115811 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3467 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3462 thiss!1379))))))

(assert (=> d!23210 (invariant!0 (currentBit!3462 thiss!1379) (currentByte!3467 thiss!1379) (size!1366 (buf!1747 thiss!1379)))))

(assert (=> d!23210 (= (bitIndex!0 (size!1366 (buf!1747 thiss!1379)) (currentByte!3467 thiss!1379) (currentBit!3462 thiss!1379)) lt!115811)))

(declare-fun b!71610 () Bool)

(declare-fun res!58995 () Bool)

(assert (=> b!71610 (=> (not res!58995) (not e!46591))))

(assert (=> b!71610 (= res!58995 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!115811))))

(declare-fun b!71611 () Bool)

(declare-fun lt!115808 () (_ BitVec 64))

(assert (=> b!71611 (= e!46591 (bvsle lt!115811 (bvmul lt!115808 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!71611 (or (= lt!115808 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!115808 #b0000000000000000000000000000000000000000000000000000000000001000) lt!115808)))))

(assert (=> b!71611 (= lt!115808 ((_ sign_extend 32) (size!1366 (buf!1747 thiss!1379))))))

(assert (= (and d!23210 res!58994) b!71610))

(assert (= (and b!71610 res!58995) b!71611))

(assert (=> d!23210 m!114891))

(assert (=> d!23210 m!114889))

(assert (=> b!71218 d!23210))

(declare-fun d!23212 () Bool)

(declare-fun size!1369 (List!734) Int)

(assert (=> d!23212 (= (length!362 lt!114914) (size!1369 lt!114914))))

(declare-fun bs!5552 () Bool)

(assert (= bs!5552 d!23212))

(declare-fun m!114975 () Bool)

(assert (=> bs!5552 m!114975))

(assert (=> b!71229 d!23212))

(declare-fun d!23214 () Bool)

(assert (=> d!23214 (= (invariant!0 (currentBit!3462 (_2!3200 lt!114924)) (currentByte!3467 (_2!3200 lt!114924)) (size!1366 (buf!1747 (_2!3200 lt!114924)))) (and (bvsge (currentBit!3462 (_2!3200 lt!114924)) #b00000000000000000000000000000000) (bvslt (currentBit!3462 (_2!3200 lt!114924)) #b00000000000000000000000000001000) (bvsge (currentByte!3467 (_2!3200 lt!114924)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3467 (_2!3200 lt!114924)) (size!1366 (buf!1747 (_2!3200 lt!114924)))) (and (= (currentBit!3462 (_2!3200 lt!114924)) #b00000000000000000000000000000000) (= (currentByte!3467 (_2!3200 lt!114924)) (size!1366 (buf!1747 (_2!3200 lt!114924))))))))))

(assert (=> b!71227 d!23214))

(declare-fun d!23216 () Bool)

(assert (=> d!23216 (= (invariant!0 (currentBit!3462 (_2!3200 lt!114916)) (currentByte!3467 (_2!3200 lt!114916)) (size!1366 (buf!1747 (_2!3200 lt!114924)))) (and (bvsge (currentBit!3462 (_2!3200 lt!114916)) #b00000000000000000000000000000000) (bvslt (currentBit!3462 (_2!3200 lt!114916)) #b00000000000000000000000000001000) (bvsge (currentByte!3467 (_2!3200 lt!114916)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3467 (_2!3200 lt!114916)) (size!1366 (buf!1747 (_2!3200 lt!114924)))) (and (= (currentBit!3462 (_2!3200 lt!114916)) #b00000000000000000000000000000000) (= (currentByte!3467 (_2!3200 lt!114916)) (size!1366 (buf!1747 (_2!3200 lt!114924))))))))))

(assert (=> b!71238 d!23216))

(declare-fun d!23218 () Bool)

(assert (=> d!23218 (= (head!553 (byteArrayBitContentToList!0 (_2!3200 lt!114916) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!849 (byteArrayBitContentToList!0 (_2!3200 lt!114916) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!71237 d!23218))

(declare-fun d!23220 () Bool)

(declare-fun c!5392 () Bool)

(assert (=> d!23220 (= c!5392 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!46592 () List!734)

(assert (=> d!23220 (= (byteArrayBitContentToList!0 (_2!3200 lt!114916) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!46592)))

(declare-fun b!71612 () Bool)

(assert (=> b!71612 (= e!46592 Nil!731)))

(declare-fun b!71613 () Bool)

(assert (=> b!71613 (= e!46592 (Cons!730 (not (= (bvand ((_ sign_extend 24) (select (arr!1954 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3200 lt!114916) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!23220 c!5392) b!71612))

(assert (= (and d!23220 (not c!5392)) b!71613))

(assert (=> b!71613 m!114181))

(assert (=> b!71613 m!114479))

(declare-fun m!114977 () Bool)

(assert (=> b!71613 m!114977))

(assert (=> b!71237 d!23220))

(declare-fun d!23222 () Bool)

(assert (=> d!23222 (= (head!553 (bitStreamReadBitsIntoList!0 (_2!3200 lt!114916) (_1!3198 lt!114923) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!849 (bitStreamReadBitsIntoList!0 (_2!3200 lt!114916) (_1!3198 lt!114923) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!71237 d!23222))

(declare-fun lt!115814 () (_ BitVec 64))

(declare-fun lt!115813 () tuple2!6188)

(declare-fun e!46593 () tuple2!6190)

(declare-fun b!71615 () Bool)

(assert (=> b!71615 (= e!46593 (tuple2!6191 (Cons!730 (_1!3208 lt!115813) (bitStreamReadBitsIntoList!0 (_2!3200 lt!114916) (_2!3208 lt!115813) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!115814))) (_2!3208 lt!115813)))))

(assert (=> b!71615 (= lt!115813 (readBit!0 (_1!3198 lt!114923)))))

(assert (=> b!71615 (= lt!115814 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!71617 () Bool)

(declare-fun e!46594 () Bool)

(declare-fun lt!115815 () List!734)

(assert (=> b!71617 (= e!46594 (> (length!362 lt!115815) 0))))

(declare-fun b!71614 () Bool)

(assert (=> b!71614 (= e!46593 (tuple2!6191 Nil!731 (_1!3198 lt!114923)))))

(declare-fun d!23224 () Bool)

(assert (=> d!23224 e!46594))

(declare-fun c!5393 () Bool)

(assert (=> d!23224 (= c!5393 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23224 (= lt!115815 (_1!3209 e!46593))))

(declare-fun c!5394 () Bool)

(assert (=> d!23224 (= c!5394 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23224 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23224 (= (bitStreamReadBitsIntoList!0 (_2!3200 lt!114916) (_1!3198 lt!114923) #b0000000000000000000000000000000000000000000000000000000000000001) lt!115815)))

(declare-fun b!71616 () Bool)

(assert (=> b!71616 (= e!46594 (isEmpty!233 lt!115815))))

(assert (= (and d!23224 c!5394) b!71614))

(assert (= (and d!23224 (not c!5394)) b!71615))

(assert (= (and d!23224 c!5393) b!71616))

(assert (= (and d!23224 (not c!5393)) b!71617))

(declare-fun m!114979 () Bool)

(assert (=> b!71615 m!114979))

(declare-fun m!114981 () Bool)

(assert (=> b!71615 m!114981))

(declare-fun m!114983 () Bool)

(assert (=> b!71617 m!114983))

(declare-fun m!114985 () Bool)

(assert (=> b!71616 m!114985))

(assert (=> b!71237 d!23224))

(push 1)

(assert (not b!71563))

(assert (not b!71565))

(assert (not b!71581))

(assert (not b!71410))

(assert (not b!71386))

(assert (not b!71598))

(assert (not b!71372))

(assert (not d!23082))

(assert (not d!23076))

(assert (not b!71615))

(assert (not b!71395))

(assert (not d!23056))

(assert (not d!23198))

(assert (not d!23210))

(assert (not b!71593))

(assert (not b!71600))

(assert (not d!23020))

(assert (not b!71371))

(assert (not b!71570))

(assert (not b!71564))

(assert (not d!23192))

(assert (not d!23172))

(assert (not b!71579))

(assert (not b!71369))

(assert (not b!71567))

(assert (not b!71596))

(assert (not b!71583))

(assert (not d!23180))

(assert (not d!23078))

(assert (not b!71327))

(assert (not b!71603))

(assert (not b!71566))

(assert (not b!71580))

(assert (not d!23200))

(assert (not d!23212))

(assert (not b!71373))

(assert (not b!71374))

(assert (not b!71602))

(assert (not b!71341))

(assert (not b!71604))

(assert (not b!71408))

(assert (not d!23190))

(assert (not d!23204))

(assert (not b!71370))

(assert (not d!23170))

(assert (not d!23178))

(assert (not d!23074))

(assert (not b!71595))

(assert (not b!71616))

(assert (not d!23182))

(assert (not b!71572))

(assert (not b!71413))

(assert (not b!71367))

(assert (not b!71594))

(assert (not bm!928))

(assert (not d!23018))

(assert (not b!71617))

(assert (not b!71406))

(assert (not d!23208))

(assert (not b!71607))

(assert (not b!71609))

(assert (not d!23188))

(assert (not b!71368))

(assert (not b!71569))

(assert (not b!71613))

(assert (not b!71597))

(assert (not b!71407))

(assert (not d!23194))

(assert (not b!71411))

(assert (not b!71325))

(assert (not d!23066))

(assert (not d!23030))

(check-sat)

(pop 1)

(push 1)

(check-sat)

