; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9280 () Bool)

(assert start!9280)

(declare-fun b!46221 () Bool)

(declare-fun res!39071 () Bool)

(declare-fun e!30744 () Bool)

(assert (=> b!46221 (=> res!39071 e!30744)))

(declare-datatypes ((List!541 0))(
  ( (Nil!538) (Cons!537 (h!656 Bool) (t!1291 List!541)) )
))
(declare-fun lt!71163 () List!541)

(declare-fun length!236 (List!541) Int)

(assert (=> b!46221 (= res!39071 (<= (length!236 lt!71163) 0))))

(declare-fun b!46222 () Bool)

(declare-fun e!30748 () Bool)

(declare-fun e!30740 () Bool)

(assert (=> b!46222 (= e!30748 (not e!30740))))

(declare-fun res!39057 () Bool)

(assert (=> b!46222 (=> res!39057 e!30740)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!46222 (= res!39057 (bvsge i!635 to!314))))

(declare-datatypes ((array!2286 0))(
  ( (array!2287 (arr!1548 (Array (_ BitVec 32) (_ BitVec 8))) (size!1031 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1800 0))(
  ( (BitStream!1801 (buf!1380 array!2286) (currentByte!2879 (_ BitVec 32)) (currentBit!2874 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1800)

(declare-fun isPrefixOf!0 (BitStream!1800 BitStream!1800) Bool)

(assert (=> b!46222 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3275 0))(
  ( (Unit!3276) )
))
(declare-fun lt!71172 () Unit!3275)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1800) Unit!3275)

(assert (=> b!46222 (= lt!71172 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!71165 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!46222 (= lt!71165 (bitIndex!0 (size!1031 (buf!1380 thiss!1379)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379)))))

(declare-datatypes ((tuple2!4492 0))(
  ( (tuple2!4493 (_1!2339 Unit!3275) (_2!2339 BitStream!1800)) )
))
(declare-fun lt!71170 () tuple2!4492)

(declare-fun e!30741 () Bool)

(declare-fun b!46223 () Bool)

(declare-fun lt!71173 () (_ BitVec 64))

(assert (=> b!46223 (= e!30741 (= lt!71173 (bvsub (bvsub (bvadd (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71170))) (currentByte!2879 (_2!2339 lt!71170)) (currentBit!2874 (_2!2339 lt!71170))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!46224 () Bool)

(declare-fun e!30742 () Bool)

(assert (=> b!46224 (= e!30744 e!30742)))

(declare-fun res!39062 () Bool)

(assert (=> b!46224 (=> res!39062 e!30742)))

(declare-fun lt!71162 () List!541)

(declare-fun lt!71157 () List!541)

(assert (=> b!46224 (= res!39062 (not (= lt!71162 lt!71157)))))

(assert (=> b!46224 (= lt!71157 lt!71162)))

(declare-fun tail!227 (List!541) List!541)

(assert (=> b!46224 (= lt!71162 (tail!227 lt!71163))))

(declare-datatypes ((tuple2!4494 0))(
  ( (tuple2!4495 (_1!2340 BitStream!1800) (_2!2340 BitStream!1800)) )
))
(declare-fun lt!71166 () tuple2!4494)

(declare-fun lt!71156 () tuple2!4492)

(declare-fun lt!71164 () Unit!3275)

(declare-fun lt!71159 () tuple2!4494)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1800 BitStream!1800 BitStream!1800 BitStream!1800 (_ BitVec 64) List!541) Unit!3275)

(assert (=> b!46224 (= lt!71164 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2339 lt!71156) (_2!2339 lt!71156) (_1!2340 lt!71159) (_1!2340 lt!71166) (bvsub to!314 i!635) lt!71163))))

(declare-fun b!46225 () Bool)

(declare-fun res!39067 () Bool)

(declare-fun e!30745 () Bool)

(assert (=> b!46225 (=> res!39067 e!30745)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!46225 (= res!39067 (not (invariant!0 (currentBit!2874 (_2!2339 lt!71170)) (currentByte!2879 (_2!2339 lt!71170)) (size!1031 (buf!1380 (_2!2339 lt!71170))))))))

(declare-fun b!46226 () Bool)

(declare-fun res!39059 () Bool)

(assert (=> b!46226 (=> res!39059 e!30745)))

(assert (=> b!46226 (= res!39059 (not (invariant!0 (currentBit!2874 (_2!2339 lt!71170)) (currentByte!2879 (_2!2339 lt!71170)) (size!1031 (buf!1380 (_2!2339 lt!71156))))))))

(declare-fun srcBuffer!2 () array!2286)

(declare-fun e!30743 () Bool)

(declare-fun lt!71160 () tuple2!4494)

(declare-fun b!46227 () Bool)

(declare-fun head!360 (List!541) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1800 array!2286 (_ BitVec 64) (_ BitVec 64)) List!541)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1800 BitStream!1800 (_ BitVec 64)) List!541)

(assert (=> b!46227 (= e!30743 (= (head!360 (byteArrayBitContentToList!0 (_2!2339 lt!71170) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!360 (bitStreamReadBitsIntoList!0 (_2!2339 lt!71170) (_1!2340 lt!71160) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!46228 () Bool)

(assert (=> b!46228 (= e!30745 e!30744)))

(declare-fun res!39060 () Bool)

(assert (=> b!46228 (=> res!39060 e!30744)))

(assert (=> b!46228 (= res!39060 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!71161 () (_ BitVec 64))

(assert (=> b!46228 (= lt!71157 (bitStreamReadBitsIntoList!0 (_2!2339 lt!71156) (_1!2340 lt!71166) lt!71161))))

(assert (=> b!46228 (= lt!71163 (bitStreamReadBitsIntoList!0 (_2!2339 lt!71156) (_1!2340 lt!71159) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!46228 (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71156)))) ((_ sign_extend 32) (currentByte!2879 (_2!2339 lt!71170))) ((_ sign_extend 32) (currentBit!2874 (_2!2339 lt!71170))) lt!71161)))

(declare-fun lt!71158 () Unit!3275)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1800 array!2286 (_ BitVec 64)) Unit!3275)

(assert (=> b!46228 (= lt!71158 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2339 lt!71170) (buf!1380 (_2!2339 lt!71156)) lt!71161))))

(declare-fun reader!0 (BitStream!1800 BitStream!1800) tuple2!4494)

(assert (=> b!46228 (= lt!71166 (reader!0 (_2!2339 lt!71170) (_2!2339 lt!71156)))))

(assert (=> b!46228 (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71156)))) ((_ sign_extend 32) (currentByte!2879 thiss!1379)) ((_ sign_extend 32) (currentBit!2874 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!71171 () Unit!3275)

(assert (=> b!46228 (= lt!71171 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1380 (_2!2339 lt!71156)) (bvsub to!314 i!635)))))

(assert (=> b!46228 (= lt!71159 (reader!0 thiss!1379 (_2!2339 lt!71156)))))

(declare-fun b!46229 () Bool)

(declare-fun res!39072 () Bool)

(declare-fun e!30751 () Bool)

(assert (=> b!46229 (=> res!39072 e!30751)))

(assert (=> b!46229 (= res!39072 (not (invariant!0 (currentBit!2874 (_2!2339 lt!71156)) (currentByte!2879 (_2!2339 lt!71156)) (size!1031 (buf!1380 (_2!2339 lt!71156))))))))

(declare-fun b!46230 () Bool)

(declare-fun bitAt!0 (array!2286 (_ BitVec 64)) Bool)

(assert (=> b!46230 (= e!30742 (= (bitAt!0 (buf!1380 (_1!2340 lt!71159)) lt!71165) (bitAt!0 (buf!1380 (_1!2340 lt!71166)) lt!71165)))))

(declare-fun b!46231 () Bool)

(assert (=> b!46231 (= e!30751 e!30745)))

(declare-fun res!39058 () Bool)

(assert (=> b!46231 (=> res!39058 e!30745)))

(assert (=> b!46231 (= res!39058 (not (= (size!1031 (buf!1380 (_2!2339 lt!71170))) (size!1031 (buf!1380 (_2!2339 lt!71156))))))))

(assert (=> b!46231 e!30741))

(declare-fun res!39064 () Bool)

(assert (=> b!46231 (=> (not res!39064) (not e!30741))))

(assert (=> b!46231 (= res!39064 (= (size!1031 (buf!1380 (_2!2339 lt!71156))) (size!1031 (buf!1380 thiss!1379))))))

(declare-fun b!46232 () Bool)

(declare-fun e!30750 () Bool)

(assert (=> b!46232 (= e!30740 e!30750)))

(declare-fun res!39068 () Bool)

(assert (=> b!46232 (=> res!39068 e!30750)))

(assert (=> b!46232 (= res!39068 (not (isPrefixOf!0 thiss!1379 (_2!2339 lt!71170))))))

(assert (=> b!46232 (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71170)))) ((_ sign_extend 32) (currentByte!2879 (_2!2339 lt!71170))) ((_ sign_extend 32) (currentBit!2874 (_2!2339 lt!71170))) lt!71161)))

(assert (=> b!46232 (= lt!71161 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!71168 () Unit!3275)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1800 BitStream!1800 (_ BitVec 64) (_ BitVec 64)) Unit!3275)

(assert (=> b!46232 (= lt!71168 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2339 lt!71170) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1800 (_ BitVec 8) (_ BitVec 32)) tuple2!4492)

(assert (=> b!46232 (= lt!71170 (appendBitFromByte!0 thiss!1379 (select (arr!1548 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!46233 () Bool)

(declare-fun e!30746 () Bool)

(declare-fun array_inv!953 (array!2286) Bool)

(assert (=> b!46233 (= e!30746 (array_inv!953 (buf!1380 thiss!1379)))))

(declare-fun res!39070 () Bool)

(assert (=> start!9280 (=> (not res!39070) (not e!30748))))

(assert (=> start!9280 (= res!39070 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1031 srcBuffer!2))))))))

(assert (=> start!9280 e!30748))

(assert (=> start!9280 true))

(assert (=> start!9280 (array_inv!953 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1800) Bool)

(assert (=> start!9280 (and (inv!12 thiss!1379) e!30746)))

(declare-fun b!46234 () Bool)

(declare-fun e!30747 () Bool)

(assert (=> b!46234 (= e!30750 e!30747)))

(declare-fun res!39065 () Bool)

(assert (=> b!46234 (=> res!39065 e!30747)))

(assert (=> b!46234 (= res!39065 (not (isPrefixOf!0 (_2!2339 lt!71170) (_2!2339 lt!71156))))))

(assert (=> b!46234 (isPrefixOf!0 thiss!1379 (_2!2339 lt!71156))))

(declare-fun lt!71167 () Unit!3275)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1800 BitStream!1800 BitStream!1800) Unit!3275)

(assert (=> b!46234 (= lt!71167 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2339 lt!71170) (_2!2339 lt!71156)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1800 array!2286 (_ BitVec 64) (_ BitVec 64)) tuple2!4492)

(assert (=> b!46234 (= lt!71156 (appendBitsMSBFirstLoop!0 (_2!2339 lt!71170) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!46234 e!30743))

(declare-fun res!39061 () Bool)

(assert (=> b!46234 (=> (not res!39061) (not e!30743))))

(assert (=> b!46234 (= res!39061 (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71170)))) ((_ sign_extend 32) (currentByte!2879 thiss!1379)) ((_ sign_extend 32) (currentBit!2874 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!71169 () Unit!3275)

(assert (=> b!46234 (= lt!71169 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1380 (_2!2339 lt!71170)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!46234 (= lt!71160 (reader!0 thiss!1379 (_2!2339 lt!71170)))))

(declare-fun b!46235 () Bool)

(declare-fun res!39063 () Bool)

(assert (=> b!46235 (=> (not res!39063) (not e!30748))))

(assert (=> b!46235 (= res!39063 (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 thiss!1379))) ((_ sign_extend 32) (currentByte!2879 thiss!1379)) ((_ sign_extend 32) (currentBit!2874 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!46236 () Bool)

(declare-fun res!39069 () Bool)

(assert (=> b!46236 (=> res!39069 e!30751)))

(assert (=> b!46236 (= res!39069 (not (= (size!1031 (buf!1380 thiss!1379)) (size!1031 (buf!1380 (_2!2339 lt!71156))))))))

(declare-fun b!46237 () Bool)

(assert (=> b!46237 (= e!30747 e!30751)))

(declare-fun res!39066 () Bool)

(assert (=> b!46237 (=> res!39066 e!30751)))

(assert (=> b!46237 (= res!39066 (not (= lt!71173 (bvsub (bvadd lt!71165 to!314) i!635))))))

(assert (=> b!46237 (= lt!71173 (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71156))) (currentByte!2879 (_2!2339 lt!71156)) (currentBit!2874 (_2!2339 lt!71156))))))

(assert (= (and start!9280 res!39070) b!46235))

(assert (= (and b!46235 res!39063) b!46222))

(assert (= (and b!46222 (not res!39057)) b!46232))

(assert (= (and b!46232 (not res!39068)) b!46234))

(assert (= (and b!46234 res!39061) b!46227))

(assert (= (and b!46234 (not res!39065)) b!46237))

(assert (= (and b!46237 (not res!39066)) b!46229))

(assert (= (and b!46229 (not res!39072)) b!46236))

(assert (= (and b!46236 (not res!39069)) b!46231))

(assert (= (and b!46231 res!39064) b!46223))

(assert (= (and b!46231 (not res!39058)) b!46225))

(assert (= (and b!46225 (not res!39067)) b!46226))

(assert (= (and b!46226 (not res!39059)) b!46228))

(assert (= (and b!46228 (not res!39060)) b!46221))

(assert (= (and b!46221 (not res!39071)) b!46224))

(assert (= (and b!46224 (not res!39062)) b!46230))

(assert (= start!9280 b!46233))

(declare-fun m!70709 () Bool)

(assert (=> b!46226 m!70709))

(declare-fun m!70711 () Bool)

(assert (=> b!46228 m!70711))

(declare-fun m!70713 () Bool)

(assert (=> b!46228 m!70713))

(declare-fun m!70715 () Bool)

(assert (=> b!46228 m!70715))

(declare-fun m!70717 () Bool)

(assert (=> b!46228 m!70717))

(declare-fun m!70719 () Bool)

(assert (=> b!46228 m!70719))

(declare-fun m!70721 () Bool)

(assert (=> b!46228 m!70721))

(declare-fun m!70723 () Bool)

(assert (=> b!46228 m!70723))

(declare-fun m!70725 () Bool)

(assert (=> b!46228 m!70725))

(declare-fun m!70727 () Bool)

(assert (=> b!46232 m!70727))

(declare-fun m!70729 () Bool)

(assert (=> b!46232 m!70729))

(declare-fun m!70731 () Bool)

(assert (=> b!46232 m!70731))

(assert (=> b!46232 m!70729))

(declare-fun m!70733 () Bool)

(assert (=> b!46232 m!70733))

(declare-fun m!70735 () Bool)

(assert (=> b!46232 m!70735))

(declare-fun m!70737 () Bool)

(assert (=> b!46237 m!70737))

(declare-fun m!70739 () Bool)

(assert (=> b!46224 m!70739))

(declare-fun m!70741 () Bool)

(assert (=> b!46224 m!70741))

(declare-fun m!70743 () Bool)

(assert (=> b!46222 m!70743))

(declare-fun m!70745 () Bool)

(assert (=> b!46222 m!70745))

(declare-fun m!70747 () Bool)

(assert (=> b!46222 m!70747))

(declare-fun m!70749 () Bool)

(assert (=> b!46221 m!70749))

(declare-fun m!70751 () Bool)

(assert (=> b!46223 m!70751))

(declare-fun m!70753 () Bool)

(assert (=> b!46225 m!70753))

(declare-fun m!70755 () Bool)

(assert (=> b!46235 m!70755))

(declare-fun m!70757 () Bool)

(assert (=> b!46229 m!70757))

(declare-fun m!70759 () Bool)

(assert (=> b!46234 m!70759))

(declare-fun m!70761 () Bool)

(assert (=> b!46234 m!70761))

(declare-fun m!70763 () Bool)

(assert (=> b!46234 m!70763))

(declare-fun m!70765 () Bool)

(assert (=> b!46234 m!70765))

(declare-fun m!70767 () Bool)

(assert (=> b!46234 m!70767))

(declare-fun m!70769 () Bool)

(assert (=> b!46234 m!70769))

(declare-fun m!70771 () Bool)

(assert (=> b!46234 m!70771))

(declare-fun m!70773 () Bool)

(assert (=> b!46233 m!70773))

(declare-fun m!70775 () Bool)

(assert (=> b!46230 m!70775))

(declare-fun m!70777 () Bool)

(assert (=> b!46230 m!70777))

(declare-fun m!70779 () Bool)

(assert (=> b!46227 m!70779))

(assert (=> b!46227 m!70779))

(declare-fun m!70781 () Bool)

(assert (=> b!46227 m!70781))

(declare-fun m!70783 () Bool)

(assert (=> b!46227 m!70783))

(assert (=> b!46227 m!70783))

(declare-fun m!70785 () Bool)

(assert (=> b!46227 m!70785))

(declare-fun m!70787 () Bool)

(assert (=> start!9280 m!70787))

(declare-fun m!70789 () Bool)

(assert (=> start!9280 m!70789))

(check-sat (not start!9280) (not b!46237) (not b!46233) (not b!46224) (not b!46230) (not b!46226) (not b!46227) (not b!46223) (not b!46222) (not b!46228) (not b!46235) (not b!46232) (not b!46229) (not b!46225) (not b!46234) (not b!46221))
(check-sat)
(get-model)

(declare-fun d!13432 () Bool)

(declare-fun size!1033 (List!541) Int)

(assert (=> d!13432 (= (length!236 lt!71163) (size!1033 lt!71163))))

(declare-fun bs!3550 () Bool)

(assert (= bs!3550 d!13432))

(declare-fun m!70873 () Bool)

(assert (=> bs!3550 m!70873))

(assert (=> b!46221 d!13432))

(declare-fun d!13434 () Bool)

(declare-fun res!39127 () Bool)

(declare-fun e!30797 () Bool)

(assert (=> d!13434 (=> (not res!39127) (not e!30797))))

(assert (=> d!13434 (= res!39127 (= (size!1031 (buf!1380 thiss!1379)) (size!1031 (buf!1380 (_2!2339 lt!71170)))))))

(assert (=> d!13434 (= (isPrefixOf!0 thiss!1379 (_2!2339 lt!71170)) e!30797)))

(declare-fun b!46295 () Bool)

(declare-fun res!39129 () Bool)

(assert (=> b!46295 (=> (not res!39129) (not e!30797))))

(assert (=> b!46295 (= res!39129 (bvsle (bitIndex!0 (size!1031 (buf!1380 thiss!1379)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379)) (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71170))) (currentByte!2879 (_2!2339 lt!71170)) (currentBit!2874 (_2!2339 lt!71170)))))))

(declare-fun b!46296 () Bool)

(declare-fun e!30796 () Bool)

(assert (=> b!46296 (= e!30797 e!30796)))

(declare-fun res!39128 () Bool)

(assert (=> b!46296 (=> res!39128 e!30796)))

(assert (=> b!46296 (= res!39128 (= (size!1031 (buf!1380 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!46297 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2286 array!2286 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!46297 (= e!30796 (arrayBitRangesEq!0 (buf!1380 thiss!1379) (buf!1380 (_2!2339 lt!71170)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1031 (buf!1380 thiss!1379)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379))))))

(assert (= (and d!13434 res!39127) b!46295))

(assert (= (and b!46295 res!39129) b!46296))

(assert (= (and b!46296 (not res!39128)) b!46297))

(assert (=> b!46295 m!70747))

(assert (=> b!46295 m!70751))

(assert (=> b!46297 m!70747))

(assert (=> b!46297 m!70747))

(declare-fun m!70875 () Bool)

(assert (=> b!46297 m!70875))

(assert (=> b!46232 d!13434))

(declare-fun d!13436 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!13436 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71170)))) ((_ sign_extend 32) (currentByte!2879 (_2!2339 lt!71170))) ((_ sign_extend 32) (currentBit!2874 (_2!2339 lt!71170))) lt!71161) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71170)))) ((_ sign_extend 32) (currentByte!2879 (_2!2339 lt!71170))) ((_ sign_extend 32) (currentBit!2874 (_2!2339 lt!71170)))) lt!71161))))

(declare-fun bs!3551 () Bool)

(assert (= bs!3551 d!13436))

(declare-fun m!70877 () Bool)

(assert (=> bs!3551 m!70877))

(assert (=> b!46232 d!13436))

(declare-fun d!13438 () Bool)

(declare-fun e!30800 () Bool)

(assert (=> d!13438 e!30800))

(declare-fun res!39132 () Bool)

(assert (=> d!13438 (=> (not res!39132) (not e!30800))))

(assert (=> d!13438 (= res!39132 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!71230 () Unit!3275)

(declare-fun choose!27 (BitStream!1800 BitStream!1800 (_ BitVec 64) (_ BitVec 64)) Unit!3275)

(assert (=> d!13438 (= lt!71230 (choose!27 thiss!1379 (_2!2339 lt!71170) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!13438 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!13438 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2339 lt!71170) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!71230)))

(declare-fun b!46300 () Bool)

(assert (=> b!46300 (= e!30800 (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71170)))) ((_ sign_extend 32) (currentByte!2879 (_2!2339 lt!71170))) ((_ sign_extend 32) (currentBit!2874 (_2!2339 lt!71170))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!13438 res!39132) b!46300))

(declare-fun m!70879 () Bool)

(assert (=> d!13438 m!70879))

(declare-fun m!70881 () Bool)

(assert (=> b!46300 m!70881))

(assert (=> b!46232 d!13438))

(declare-fun b!46318 () Bool)

(declare-fun res!39152 () Bool)

(declare-fun e!30809 () Bool)

(assert (=> b!46318 (=> (not res!39152) (not e!30809))))

(declare-fun lt!71258 () (_ BitVec 64))

(declare-fun lt!71255 () tuple2!4492)

(declare-fun lt!71264 () (_ BitVec 64))

(assert (=> b!46318 (= res!39152 (= (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71255))) (currentByte!2879 (_2!2339 lt!71255)) (currentBit!2874 (_2!2339 lt!71255))) (bvadd lt!71258 lt!71264)))))

(assert (=> b!46318 (or (not (= (bvand lt!71258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!71264 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!71258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!71258 lt!71264) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46318 (= lt!71264 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!46318 (= lt!71258 (bitIndex!0 (size!1031 (buf!1380 thiss!1379)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379)))))

(declare-fun b!46319 () Bool)

(declare-fun res!39151 () Bool)

(declare-fun e!30812 () Bool)

(assert (=> b!46319 (=> (not res!39151) (not e!30812))))

(declare-fun lt!71262 () tuple2!4492)

(assert (=> b!46319 (= res!39151 (= (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71262))) (currentByte!2879 (_2!2339 lt!71262)) (currentBit!2874 (_2!2339 lt!71262))) (bvadd (bitIndex!0 (size!1031 (buf!1380 thiss!1379)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!46320 () Bool)

(declare-fun e!30810 () Bool)

(assert (=> b!46320 (= e!30812 e!30810)))

(declare-fun res!39149 () Bool)

(assert (=> b!46320 (=> (not res!39149) (not e!30810))))

(declare-datatypes ((tuple2!4500 0))(
  ( (tuple2!4501 (_1!2343 BitStream!1800) (_2!2343 Bool)) )
))
(declare-fun lt!71259 () tuple2!4500)

(declare-fun lt!71260 () Bool)

(assert (=> b!46320 (= res!39149 (and (= (_2!2343 lt!71259) lt!71260) (= (_1!2343 lt!71259) (_2!2339 lt!71262))))))

(declare-fun readBitPure!0 (BitStream!1800) tuple2!4500)

(declare-fun readerFrom!0 (BitStream!1800 (_ BitVec 32) (_ BitVec 32)) BitStream!1800)

(assert (=> b!46320 (= lt!71259 (readBitPure!0 (readerFrom!0 (_2!2339 lt!71262) (currentBit!2874 thiss!1379) (currentByte!2879 thiss!1379))))))

(declare-fun d!13440 () Bool)

(assert (=> d!13440 e!30809))

(declare-fun res!39153 () Bool)

(assert (=> d!13440 (=> (not res!39153) (not e!30809))))

(assert (=> d!13440 (= res!39153 (= (size!1031 (buf!1380 (_2!2339 lt!71255))) (size!1031 (buf!1380 thiss!1379))))))

(declare-fun lt!71265 () (_ BitVec 8))

(declare-fun lt!71256 () array!2286)

(assert (=> d!13440 (= lt!71265 (select (arr!1548 lt!71256) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!13440 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1031 lt!71256)))))

(assert (=> d!13440 (= lt!71256 (array!2287 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!71263 () tuple2!4492)

(assert (=> d!13440 (= lt!71255 (tuple2!4493 (_1!2339 lt!71263) (_2!2339 lt!71263)))))

(assert (=> d!13440 (= lt!71263 lt!71262)))

(assert (=> d!13440 e!30812))

(declare-fun res!39156 () Bool)

(assert (=> d!13440 (=> (not res!39156) (not e!30812))))

(assert (=> d!13440 (= res!39156 (= (size!1031 (buf!1380 thiss!1379)) (size!1031 (buf!1380 (_2!2339 lt!71262)))))))

(declare-fun appendBit!0 (BitStream!1800 Bool) tuple2!4492)

(assert (=> d!13440 (= lt!71262 (appendBit!0 thiss!1379 lt!71260))))

(assert (=> d!13440 (= lt!71260 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1548 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!13440 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!13440 (= (appendBitFromByte!0 thiss!1379 (select (arr!1548 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!71255)))

(declare-fun b!46321 () Bool)

(declare-fun res!39150 () Bool)

(assert (=> b!46321 (=> (not res!39150) (not e!30809))))

(assert (=> b!46321 (= res!39150 (isPrefixOf!0 thiss!1379 (_2!2339 lt!71255)))))

(declare-fun b!46322 () Bool)

(assert (=> b!46322 (= e!30810 (= (bitIndex!0 (size!1031 (buf!1380 (_1!2343 lt!71259))) (currentByte!2879 (_1!2343 lt!71259)) (currentBit!2874 (_1!2343 lt!71259))) (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71262))) (currentByte!2879 (_2!2339 lt!71262)) (currentBit!2874 (_2!2339 lt!71262)))))))

(declare-fun b!46323 () Bool)

(declare-fun e!30811 () Bool)

(declare-fun lt!71261 () tuple2!4500)

(assert (=> b!46323 (= e!30811 (= (bitIndex!0 (size!1031 (buf!1380 (_1!2343 lt!71261))) (currentByte!2879 (_1!2343 lt!71261)) (currentBit!2874 (_1!2343 lt!71261))) (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71255))) (currentByte!2879 (_2!2339 lt!71255)) (currentBit!2874 (_2!2339 lt!71255)))))))

(declare-fun b!46324 () Bool)

(assert (=> b!46324 (= e!30809 e!30811)))

(declare-fun res!39154 () Bool)

(assert (=> b!46324 (=> (not res!39154) (not e!30811))))

(assert (=> b!46324 (= res!39154 (and (= (_2!2343 lt!71261) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1548 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!71265)) #b00000000000000000000000000000000))) (= (_1!2343 lt!71261) (_2!2339 lt!71255))))))

(declare-datatypes ((tuple2!4502 0))(
  ( (tuple2!4503 (_1!2344 array!2286) (_2!2344 BitStream!1800)) )
))
(declare-fun lt!71257 () tuple2!4502)

(declare-fun lt!71266 () BitStream!1800)

(declare-fun readBits!0 (BitStream!1800 (_ BitVec 64)) tuple2!4502)

(assert (=> b!46324 (= lt!71257 (readBits!0 lt!71266 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!46324 (= lt!71261 (readBitPure!0 lt!71266))))

(assert (=> b!46324 (= lt!71266 (readerFrom!0 (_2!2339 lt!71255) (currentBit!2874 thiss!1379) (currentByte!2879 thiss!1379)))))

(declare-fun b!46325 () Bool)

(declare-fun res!39155 () Bool)

(assert (=> b!46325 (=> (not res!39155) (not e!30812))))

(assert (=> b!46325 (= res!39155 (isPrefixOf!0 thiss!1379 (_2!2339 lt!71262)))))

(assert (= (and d!13440 res!39156) b!46319))

(assert (= (and b!46319 res!39151) b!46325))

(assert (= (and b!46325 res!39155) b!46320))

(assert (= (and b!46320 res!39149) b!46322))

(assert (= (and d!13440 res!39153) b!46318))

(assert (= (and b!46318 res!39152) b!46321))

(assert (= (and b!46321 res!39150) b!46324))

(assert (= (and b!46324 res!39154) b!46323))

(declare-fun m!70883 () Bool)

(assert (=> b!46324 m!70883))

(declare-fun m!70885 () Bool)

(assert (=> b!46324 m!70885))

(declare-fun m!70887 () Bool)

(assert (=> b!46324 m!70887))

(declare-fun m!70889 () Bool)

(assert (=> b!46318 m!70889))

(assert (=> b!46318 m!70747))

(declare-fun m!70891 () Bool)

(assert (=> b!46319 m!70891))

(assert (=> b!46319 m!70747))

(declare-fun m!70893 () Bool)

(assert (=> b!46320 m!70893))

(assert (=> b!46320 m!70893))

(declare-fun m!70895 () Bool)

(assert (=> b!46320 m!70895))

(declare-fun m!70897 () Bool)

(assert (=> b!46323 m!70897))

(assert (=> b!46323 m!70889))

(declare-fun m!70899 () Bool)

(assert (=> b!46322 m!70899))

(assert (=> b!46322 m!70891))

(declare-fun m!70901 () Bool)

(assert (=> b!46325 m!70901))

(declare-fun m!70903 () Bool)

(assert (=> b!46321 m!70903))

(declare-fun m!70905 () Bool)

(assert (=> d!13440 m!70905))

(declare-fun m!70907 () Bool)

(assert (=> d!13440 m!70907))

(declare-fun m!70909 () Bool)

(assert (=> d!13440 m!70909))

(assert (=> b!46232 d!13440))

(declare-fun d!13442 () Bool)

(assert (=> d!13442 (= (array_inv!953 (buf!1380 thiss!1379)) (bvsge (size!1031 (buf!1380 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!46233 d!13442))

(declare-fun d!13444 () Bool)

(declare-fun res!39157 () Bool)

(declare-fun e!30814 () Bool)

(assert (=> d!13444 (=> (not res!39157) (not e!30814))))

(assert (=> d!13444 (= res!39157 (= (size!1031 (buf!1380 thiss!1379)) (size!1031 (buf!1380 thiss!1379))))))

(assert (=> d!13444 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!30814)))

(declare-fun b!46326 () Bool)

(declare-fun res!39159 () Bool)

(assert (=> b!46326 (=> (not res!39159) (not e!30814))))

(assert (=> b!46326 (= res!39159 (bvsle (bitIndex!0 (size!1031 (buf!1380 thiss!1379)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379)) (bitIndex!0 (size!1031 (buf!1380 thiss!1379)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379))))))

(declare-fun b!46327 () Bool)

(declare-fun e!30813 () Bool)

(assert (=> b!46327 (= e!30814 e!30813)))

(declare-fun res!39158 () Bool)

(assert (=> b!46327 (=> res!39158 e!30813)))

(assert (=> b!46327 (= res!39158 (= (size!1031 (buf!1380 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!46328 () Bool)

(assert (=> b!46328 (= e!30813 (arrayBitRangesEq!0 (buf!1380 thiss!1379) (buf!1380 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1031 (buf!1380 thiss!1379)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379))))))

(assert (= (and d!13444 res!39157) b!46326))

(assert (= (and b!46326 res!39159) b!46327))

(assert (= (and b!46327 (not res!39158)) b!46328))

(assert (=> b!46326 m!70747))

(assert (=> b!46326 m!70747))

(assert (=> b!46328 m!70747))

(assert (=> b!46328 m!70747))

(declare-fun m!70911 () Bool)

(assert (=> b!46328 m!70911))

(assert (=> b!46222 d!13444))

(declare-fun d!13446 () Bool)

(assert (=> d!13446 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!71269 () Unit!3275)

(declare-fun choose!11 (BitStream!1800) Unit!3275)

(assert (=> d!13446 (= lt!71269 (choose!11 thiss!1379))))

(assert (=> d!13446 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!71269)))

(declare-fun bs!3553 () Bool)

(assert (= bs!3553 d!13446))

(assert (=> bs!3553 m!70743))

(declare-fun m!70913 () Bool)

(assert (=> bs!3553 m!70913))

(assert (=> b!46222 d!13446))

(declare-fun d!13448 () Bool)

(declare-fun e!30817 () Bool)

(assert (=> d!13448 e!30817))

(declare-fun res!39164 () Bool)

(assert (=> d!13448 (=> (not res!39164) (not e!30817))))

(declare-fun lt!71283 () (_ BitVec 64))

(declare-fun lt!71282 () (_ BitVec 64))

(declare-fun lt!71286 () (_ BitVec 64))

(assert (=> d!13448 (= res!39164 (= lt!71282 (bvsub lt!71286 lt!71283)))))

(assert (=> d!13448 (or (= (bvand lt!71286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!71283 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!71286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!71286 lt!71283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13448 (= lt!71283 (remainingBits!0 ((_ sign_extend 32) (size!1031 (buf!1380 thiss!1379))) ((_ sign_extend 32) (currentByte!2879 thiss!1379)) ((_ sign_extend 32) (currentBit!2874 thiss!1379))))))

(declare-fun lt!71287 () (_ BitVec 64))

(declare-fun lt!71284 () (_ BitVec 64))

(assert (=> d!13448 (= lt!71286 (bvmul lt!71287 lt!71284))))

(assert (=> d!13448 (or (= lt!71287 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!71284 (bvsdiv (bvmul lt!71287 lt!71284) lt!71287)))))

(assert (=> d!13448 (= lt!71284 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13448 (= lt!71287 ((_ sign_extend 32) (size!1031 (buf!1380 thiss!1379))))))

(assert (=> d!13448 (= lt!71282 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2879 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2874 thiss!1379))))))

(assert (=> d!13448 (invariant!0 (currentBit!2874 thiss!1379) (currentByte!2879 thiss!1379) (size!1031 (buf!1380 thiss!1379)))))

(assert (=> d!13448 (= (bitIndex!0 (size!1031 (buf!1380 thiss!1379)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379)) lt!71282)))

(declare-fun b!46333 () Bool)

(declare-fun res!39165 () Bool)

(assert (=> b!46333 (=> (not res!39165) (not e!30817))))

(assert (=> b!46333 (= res!39165 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!71282))))

(declare-fun b!46334 () Bool)

(declare-fun lt!71285 () (_ BitVec 64))

(assert (=> b!46334 (= e!30817 (bvsle lt!71282 (bvmul lt!71285 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!46334 (or (= lt!71285 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!71285 #b0000000000000000000000000000000000000000000000000000000000001000) lt!71285)))))

(assert (=> b!46334 (= lt!71285 ((_ sign_extend 32) (size!1031 (buf!1380 thiss!1379))))))

(assert (= (and d!13448 res!39164) b!46333))

(assert (= (and b!46333 res!39165) b!46334))

(declare-fun m!70915 () Bool)

(assert (=> d!13448 m!70915))

(declare-fun m!70917 () Bool)

(assert (=> d!13448 m!70917))

(assert (=> b!46222 d!13448))

(declare-fun d!13450 () Bool)

(declare-fun e!30818 () Bool)

(assert (=> d!13450 e!30818))

(declare-fun res!39166 () Bool)

(assert (=> d!13450 (=> (not res!39166) (not e!30818))))

(declare-fun lt!71292 () (_ BitVec 64))

(declare-fun lt!71289 () (_ BitVec 64))

(declare-fun lt!71288 () (_ BitVec 64))

(assert (=> d!13450 (= res!39166 (= lt!71288 (bvsub lt!71292 lt!71289)))))

(assert (=> d!13450 (or (= (bvand lt!71292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!71289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!71292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!71292 lt!71289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13450 (= lt!71289 (remainingBits!0 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71170)))) ((_ sign_extend 32) (currentByte!2879 (_2!2339 lt!71170))) ((_ sign_extend 32) (currentBit!2874 (_2!2339 lt!71170)))))))

(declare-fun lt!71293 () (_ BitVec 64))

(declare-fun lt!71290 () (_ BitVec 64))

(assert (=> d!13450 (= lt!71292 (bvmul lt!71293 lt!71290))))

(assert (=> d!13450 (or (= lt!71293 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!71290 (bvsdiv (bvmul lt!71293 lt!71290) lt!71293)))))

(assert (=> d!13450 (= lt!71290 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13450 (= lt!71293 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71170)))))))

(assert (=> d!13450 (= lt!71288 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2879 (_2!2339 lt!71170))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2874 (_2!2339 lt!71170)))))))

(assert (=> d!13450 (invariant!0 (currentBit!2874 (_2!2339 lt!71170)) (currentByte!2879 (_2!2339 lt!71170)) (size!1031 (buf!1380 (_2!2339 lt!71170))))))

(assert (=> d!13450 (= (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71170))) (currentByte!2879 (_2!2339 lt!71170)) (currentBit!2874 (_2!2339 lt!71170))) lt!71288)))

(declare-fun b!46335 () Bool)

(declare-fun res!39167 () Bool)

(assert (=> b!46335 (=> (not res!39167) (not e!30818))))

(assert (=> b!46335 (= res!39167 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!71288))))

(declare-fun b!46336 () Bool)

(declare-fun lt!71291 () (_ BitVec 64))

(assert (=> b!46336 (= e!30818 (bvsle lt!71288 (bvmul lt!71291 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!46336 (or (= lt!71291 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!71291 #b0000000000000000000000000000000000000000000000000000000000001000) lt!71291)))))

(assert (=> b!46336 (= lt!71291 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71170)))))))

(assert (= (and d!13450 res!39166) b!46335))

(assert (= (and b!46335 res!39167) b!46336))

(assert (=> d!13450 m!70877))

(assert (=> d!13450 m!70753))

(assert (=> b!46223 d!13450))

(declare-fun d!13452 () Bool)

(assert (=> d!13452 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71170)))) ((_ sign_extend 32) (currentByte!2879 thiss!1379)) ((_ sign_extend 32) (currentBit!2874 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71170)))) ((_ sign_extend 32) (currentByte!2879 thiss!1379)) ((_ sign_extend 32) (currentBit!2874 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3554 () Bool)

(assert (= bs!3554 d!13452))

(declare-fun m!70919 () Bool)

(assert (=> bs!3554 m!70919))

(assert (=> b!46234 d!13452))

(declare-fun b!46347 () Bool)

(declare-fun e!30824 () Unit!3275)

(declare-fun lt!71342 () Unit!3275)

(assert (=> b!46347 (= e!30824 lt!71342)))

(declare-fun lt!71343 () (_ BitVec 64))

(assert (=> b!46347 (= lt!71343 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71348 () (_ BitVec 64))

(assert (=> b!46347 (= lt!71348 (bitIndex!0 (size!1031 (buf!1380 thiss!1379)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2286 array!2286 (_ BitVec 64) (_ BitVec 64)) Unit!3275)

(assert (=> b!46347 (= lt!71342 (arrayBitRangesEqSymmetric!0 (buf!1380 thiss!1379) (buf!1380 (_2!2339 lt!71170)) lt!71343 lt!71348))))

(assert (=> b!46347 (arrayBitRangesEq!0 (buf!1380 (_2!2339 lt!71170)) (buf!1380 thiss!1379) lt!71343 lt!71348)))

(declare-fun b!46348 () Bool)

(declare-fun res!39176 () Bool)

(declare-fun e!30823 () Bool)

(assert (=> b!46348 (=> (not res!39176) (not e!30823))))

(declare-fun lt!71346 () tuple2!4494)

(assert (=> b!46348 (= res!39176 (isPrefixOf!0 (_1!2340 lt!71346) thiss!1379))))

(declare-fun d!13454 () Bool)

(assert (=> d!13454 e!30823))

(declare-fun res!39174 () Bool)

(assert (=> d!13454 (=> (not res!39174) (not e!30823))))

(assert (=> d!13454 (= res!39174 (isPrefixOf!0 (_1!2340 lt!71346) (_2!2340 lt!71346)))))

(declare-fun lt!71344 () BitStream!1800)

(assert (=> d!13454 (= lt!71346 (tuple2!4495 lt!71344 (_2!2339 lt!71170)))))

(declare-fun lt!71345 () Unit!3275)

(declare-fun lt!71350 () Unit!3275)

(assert (=> d!13454 (= lt!71345 lt!71350)))

(assert (=> d!13454 (isPrefixOf!0 lt!71344 (_2!2339 lt!71170))))

(assert (=> d!13454 (= lt!71350 (lemmaIsPrefixTransitive!0 lt!71344 (_2!2339 lt!71170) (_2!2339 lt!71170)))))

(declare-fun lt!71341 () Unit!3275)

(declare-fun lt!71336 () Unit!3275)

(assert (=> d!13454 (= lt!71341 lt!71336)))

(assert (=> d!13454 (isPrefixOf!0 lt!71344 (_2!2339 lt!71170))))

(assert (=> d!13454 (= lt!71336 (lemmaIsPrefixTransitive!0 lt!71344 thiss!1379 (_2!2339 lt!71170)))))

(declare-fun lt!71340 () Unit!3275)

(assert (=> d!13454 (= lt!71340 e!30824)))

(declare-fun c!3114 () Bool)

(assert (=> d!13454 (= c!3114 (not (= (size!1031 (buf!1380 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!71353 () Unit!3275)

(declare-fun lt!71339 () Unit!3275)

(assert (=> d!13454 (= lt!71353 lt!71339)))

(assert (=> d!13454 (isPrefixOf!0 (_2!2339 lt!71170) (_2!2339 lt!71170))))

(assert (=> d!13454 (= lt!71339 (lemmaIsPrefixRefl!0 (_2!2339 lt!71170)))))

(declare-fun lt!71334 () Unit!3275)

(declare-fun lt!71352 () Unit!3275)

(assert (=> d!13454 (= lt!71334 lt!71352)))

(assert (=> d!13454 (= lt!71352 (lemmaIsPrefixRefl!0 (_2!2339 lt!71170)))))

(declare-fun lt!71347 () Unit!3275)

(declare-fun lt!71349 () Unit!3275)

(assert (=> d!13454 (= lt!71347 lt!71349)))

(assert (=> d!13454 (isPrefixOf!0 lt!71344 lt!71344)))

(assert (=> d!13454 (= lt!71349 (lemmaIsPrefixRefl!0 lt!71344))))

(declare-fun lt!71335 () Unit!3275)

(declare-fun lt!71337 () Unit!3275)

(assert (=> d!13454 (= lt!71335 lt!71337)))

(assert (=> d!13454 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13454 (= lt!71337 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13454 (= lt!71344 (BitStream!1801 (buf!1380 (_2!2339 lt!71170)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379)))))

(assert (=> d!13454 (isPrefixOf!0 thiss!1379 (_2!2339 lt!71170))))

(assert (=> d!13454 (= (reader!0 thiss!1379 (_2!2339 lt!71170)) lt!71346)))

(declare-fun b!46349 () Bool)

(declare-fun res!39175 () Bool)

(assert (=> b!46349 (=> (not res!39175) (not e!30823))))

(assert (=> b!46349 (= res!39175 (isPrefixOf!0 (_2!2340 lt!71346) (_2!2339 lt!71170)))))

(declare-fun b!46350 () Bool)

(declare-fun Unit!3279 () Unit!3275)

(assert (=> b!46350 (= e!30824 Unit!3279)))

(declare-fun lt!71338 () (_ BitVec 64))

(declare-fun b!46351 () Bool)

(declare-fun lt!71351 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1800 (_ BitVec 64)) BitStream!1800)

(assert (=> b!46351 (= e!30823 (= (_1!2340 lt!71346) (withMovedBitIndex!0 (_2!2340 lt!71346) (bvsub lt!71338 lt!71351))))))

(assert (=> b!46351 (or (= (bvand lt!71338 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!71351 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!71338 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!71338 lt!71351) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46351 (= lt!71351 (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71170))) (currentByte!2879 (_2!2339 lt!71170)) (currentBit!2874 (_2!2339 lt!71170))))))

(assert (=> b!46351 (= lt!71338 (bitIndex!0 (size!1031 (buf!1380 thiss!1379)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379)))))

(assert (= (and d!13454 c!3114) b!46347))

(assert (= (and d!13454 (not c!3114)) b!46350))

(assert (= (and d!13454 res!39174) b!46348))

(assert (= (and b!46348 res!39176) b!46349))

(assert (= (and b!46349 res!39175) b!46351))

(declare-fun m!70921 () Bool)

(assert (=> b!46349 m!70921))

(declare-fun m!70923 () Bool)

(assert (=> b!46351 m!70923))

(assert (=> b!46351 m!70751))

(assert (=> b!46351 m!70747))

(assert (=> d!13454 m!70743))

(assert (=> d!13454 m!70745))

(declare-fun m!70925 () Bool)

(assert (=> d!13454 m!70925))

(declare-fun m!70927 () Bool)

(assert (=> d!13454 m!70927))

(declare-fun m!70929 () Bool)

(assert (=> d!13454 m!70929))

(declare-fun m!70931 () Bool)

(assert (=> d!13454 m!70931))

(assert (=> d!13454 m!70731))

(declare-fun m!70933 () Bool)

(assert (=> d!13454 m!70933))

(declare-fun m!70935 () Bool)

(assert (=> d!13454 m!70935))

(declare-fun m!70937 () Bool)

(assert (=> d!13454 m!70937))

(declare-fun m!70939 () Bool)

(assert (=> d!13454 m!70939))

(declare-fun m!70941 () Bool)

(assert (=> b!46348 m!70941))

(assert (=> b!46347 m!70747))

(declare-fun m!70943 () Bool)

(assert (=> b!46347 m!70943))

(declare-fun m!70945 () Bool)

(assert (=> b!46347 m!70945))

(assert (=> b!46234 d!13454))

(declare-fun d!13456 () Bool)

(declare-fun res!39177 () Bool)

(declare-fun e!30826 () Bool)

(assert (=> d!13456 (=> (not res!39177) (not e!30826))))

(assert (=> d!13456 (= res!39177 (= (size!1031 (buf!1380 thiss!1379)) (size!1031 (buf!1380 (_2!2339 lt!71156)))))))

(assert (=> d!13456 (= (isPrefixOf!0 thiss!1379 (_2!2339 lt!71156)) e!30826)))

(declare-fun b!46352 () Bool)

(declare-fun res!39179 () Bool)

(assert (=> b!46352 (=> (not res!39179) (not e!30826))))

(assert (=> b!46352 (= res!39179 (bvsle (bitIndex!0 (size!1031 (buf!1380 thiss!1379)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379)) (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71156))) (currentByte!2879 (_2!2339 lt!71156)) (currentBit!2874 (_2!2339 lt!71156)))))))

(declare-fun b!46353 () Bool)

(declare-fun e!30825 () Bool)

(assert (=> b!46353 (= e!30826 e!30825)))

(declare-fun res!39178 () Bool)

(assert (=> b!46353 (=> res!39178 e!30825)))

(assert (=> b!46353 (= res!39178 (= (size!1031 (buf!1380 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!46354 () Bool)

(assert (=> b!46354 (= e!30825 (arrayBitRangesEq!0 (buf!1380 thiss!1379) (buf!1380 (_2!2339 lt!71156)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1031 (buf!1380 thiss!1379)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379))))))

(assert (= (and d!13456 res!39177) b!46352))

(assert (= (and b!46352 res!39179) b!46353))

(assert (= (and b!46353 (not res!39178)) b!46354))

(assert (=> b!46352 m!70747))

(assert (=> b!46352 m!70737))

(assert (=> b!46354 m!70747))

(assert (=> b!46354 m!70747))

(declare-fun m!70947 () Bool)

(assert (=> b!46354 m!70947))

(assert (=> b!46234 d!13456))

(declare-fun d!13458 () Bool)

(declare-fun res!39180 () Bool)

(declare-fun e!30828 () Bool)

(assert (=> d!13458 (=> (not res!39180) (not e!30828))))

(assert (=> d!13458 (= res!39180 (= (size!1031 (buf!1380 (_2!2339 lt!71170))) (size!1031 (buf!1380 (_2!2339 lt!71156)))))))

(assert (=> d!13458 (= (isPrefixOf!0 (_2!2339 lt!71170) (_2!2339 lt!71156)) e!30828)))

(declare-fun b!46355 () Bool)

(declare-fun res!39182 () Bool)

(assert (=> b!46355 (=> (not res!39182) (not e!30828))))

(assert (=> b!46355 (= res!39182 (bvsle (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71170))) (currentByte!2879 (_2!2339 lt!71170)) (currentBit!2874 (_2!2339 lt!71170))) (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71156))) (currentByte!2879 (_2!2339 lt!71156)) (currentBit!2874 (_2!2339 lt!71156)))))))

(declare-fun b!46356 () Bool)

(declare-fun e!30827 () Bool)

(assert (=> b!46356 (= e!30828 e!30827)))

(declare-fun res!39181 () Bool)

(assert (=> b!46356 (=> res!39181 e!30827)))

(assert (=> b!46356 (= res!39181 (= (size!1031 (buf!1380 (_2!2339 lt!71170))) #b00000000000000000000000000000000))))

(declare-fun b!46357 () Bool)

(assert (=> b!46357 (= e!30827 (arrayBitRangesEq!0 (buf!1380 (_2!2339 lt!71170)) (buf!1380 (_2!2339 lt!71156)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71170))) (currentByte!2879 (_2!2339 lt!71170)) (currentBit!2874 (_2!2339 lt!71170)))))))

(assert (= (and d!13458 res!39180) b!46355))

(assert (= (and b!46355 res!39182) b!46356))

(assert (= (and b!46356 (not res!39181)) b!46357))

(assert (=> b!46355 m!70751))

(assert (=> b!46355 m!70737))

(assert (=> b!46357 m!70751))

(assert (=> b!46357 m!70751))

(declare-fun m!70949 () Bool)

(assert (=> b!46357 m!70949))

(assert (=> b!46234 d!13458))

(declare-fun d!13460 () Bool)

(assert (=> d!13460 (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71170)))) ((_ sign_extend 32) (currentByte!2879 thiss!1379)) ((_ sign_extend 32) (currentBit!2874 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!71356 () Unit!3275)

(declare-fun choose!9 (BitStream!1800 array!2286 (_ BitVec 64) BitStream!1800) Unit!3275)

(assert (=> d!13460 (= lt!71356 (choose!9 thiss!1379 (buf!1380 (_2!2339 lt!71170)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1801 (buf!1380 (_2!2339 lt!71170)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379))))))

(assert (=> d!13460 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1380 (_2!2339 lt!71170)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!71356)))

(declare-fun bs!3555 () Bool)

(assert (= bs!3555 d!13460))

(assert (=> bs!3555 m!70761))

(declare-fun m!70951 () Bool)

(assert (=> bs!3555 m!70951))

(assert (=> b!46234 d!13460))

(declare-fun d!13462 () Bool)

(assert (=> d!13462 (isPrefixOf!0 thiss!1379 (_2!2339 lt!71156))))

(declare-fun lt!71359 () Unit!3275)

(declare-fun choose!30 (BitStream!1800 BitStream!1800 BitStream!1800) Unit!3275)

(assert (=> d!13462 (= lt!71359 (choose!30 thiss!1379 (_2!2339 lt!71170) (_2!2339 lt!71156)))))

(assert (=> d!13462 (isPrefixOf!0 thiss!1379 (_2!2339 lt!71170))))

(assert (=> d!13462 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2339 lt!71170) (_2!2339 lt!71156)) lt!71359)))

(declare-fun bs!3556 () Bool)

(assert (= bs!3556 d!13462))

(assert (=> bs!3556 m!70769))

(declare-fun m!70953 () Bool)

(assert (=> bs!3556 m!70953))

(assert (=> bs!3556 m!70731))

(assert (=> b!46234 d!13462))

(declare-fun b!46501 () Bool)

(declare-fun res!39309 () Bool)

(declare-fun e!30904 () Bool)

(assert (=> b!46501 (=> (not res!39309) (not e!30904))))

(declare-fun lt!71731 () tuple2!4492)

(assert (=> b!46501 (= res!39309 (invariant!0 (currentBit!2874 (_2!2339 lt!71731)) (currentByte!2879 (_2!2339 lt!71731)) (size!1031 (buf!1380 (_2!2339 lt!71731)))))))

(declare-fun b!46502 () Bool)

(declare-fun e!30903 () tuple2!4492)

(declare-fun Unit!3280 () Unit!3275)

(assert (=> b!46502 (= e!30903 (tuple2!4493 Unit!3280 (_2!2339 lt!71170)))))

(assert (=> b!46502 (= (size!1031 (buf!1380 (_2!2339 lt!71170))) (size!1031 (buf!1380 (_2!2339 lt!71170))))))

(declare-fun lt!71702 () Unit!3275)

(declare-fun Unit!3281 () Unit!3275)

(assert (=> b!46502 (= lt!71702 Unit!3281)))

(declare-fun call!556 () tuple2!4494)

(declare-fun checkByteArrayBitContent!0 (BitStream!1800 array!2286 array!2286 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!46502 (checkByteArrayBitContent!0 (_2!2339 lt!71170) srcBuffer!2 (_1!2344 (readBits!0 (_1!2340 call!556) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!46503 () Bool)

(declare-fun e!30905 () Bool)

(declare-fun lt!71743 () (_ BitVec 64))

(assert (=> b!46503 (= e!30905 (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71170)))) ((_ sign_extend 32) (currentByte!2879 (_2!2339 lt!71170))) ((_ sign_extend 32) (currentBit!2874 (_2!2339 lt!71170))) lt!71743))))

(declare-fun b!46504 () Bool)

(declare-fun res!39310 () Bool)

(assert (=> b!46504 (=> (not res!39310) (not e!30904))))

(assert (=> b!46504 (= res!39310 (= (size!1031 (buf!1380 (_2!2339 lt!71731))) (size!1031 (buf!1380 (_2!2339 lt!71170)))))))

(declare-fun b!46505 () Bool)

(declare-fun res!39308 () Bool)

(assert (=> b!46505 (=> (not res!39308) (not e!30904))))

(assert (=> b!46505 (= res!39308 (isPrefixOf!0 (_2!2339 lt!71170) (_2!2339 lt!71731)))))

(declare-fun b!46506 () Bool)

(declare-fun lt!71741 () tuple2!4492)

(declare-fun Unit!3282 () Unit!3275)

(assert (=> b!46506 (= e!30903 (tuple2!4493 Unit!3282 (_2!2339 lt!71741)))))

(declare-fun lt!71721 () tuple2!4492)

(assert (=> b!46506 (= lt!71721 (appendBitFromByte!0 (_2!2339 lt!71170) (select (arr!1548 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!71733 () (_ BitVec 64))

(assert (=> b!46506 (= lt!71733 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!71732 () (_ BitVec 64))

(assert (=> b!46506 (= lt!71732 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!71718 () Unit!3275)

(assert (=> b!46506 (= lt!71718 (validateOffsetBitsIneqLemma!0 (_2!2339 lt!71170) (_2!2339 lt!71721) lt!71733 lt!71732))))

(assert (=> b!46506 (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71721)))) ((_ sign_extend 32) (currentByte!2879 (_2!2339 lt!71721))) ((_ sign_extend 32) (currentBit!2874 (_2!2339 lt!71721))) (bvsub lt!71733 lt!71732))))

(declare-fun lt!71722 () Unit!3275)

(assert (=> b!46506 (= lt!71722 lt!71718)))

(declare-fun lt!71717 () tuple2!4494)

(assert (=> b!46506 (= lt!71717 (reader!0 (_2!2339 lt!71170) (_2!2339 lt!71721)))))

(declare-fun lt!71723 () (_ BitVec 64))

(assert (=> b!46506 (= lt!71723 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!71712 () Unit!3275)

(assert (=> b!46506 (= lt!71712 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2339 lt!71170) (buf!1380 (_2!2339 lt!71721)) lt!71723))))

(assert (=> b!46506 (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71721)))) ((_ sign_extend 32) (currentByte!2879 (_2!2339 lt!71170))) ((_ sign_extend 32) (currentBit!2874 (_2!2339 lt!71170))) lt!71723)))

(declare-fun lt!71715 () Unit!3275)

(assert (=> b!46506 (= lt!71715 lt!71712)))

(assert (=> b!46506 (= (head!360 (byteArrayBitContentToList!0 (_2!2339 lt!71721) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!360 (bitStreamReadBitsIntoList!0 (_2!2339 lt!71721) (_1!2340 lt!71717) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!71719 () Unit!3275)

(declare-fun Unit!3283 () Unit!3275)

(assert (=> b!46506 (= lt!71719 Unit!3283)))

(assert (=> b!46506 (= lt!71741 (appendBitsMSBFirstLoop!0 (_2!2339 lt!71721) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!71734 () Unit!3275)

(assert (=> b!46506 (= lt!71734 (lemmaIsPrefixTransitive!0 (_2!2339 lt!71170) (_2!2339 lt!71721) (_2!2339 lt!71741)))))

(assert (=> b!46506 (isPrefixOf!0 (_2!2339 lt!71170) (_2!2339 lt!71741))))

(declare-fun lt!71703 () Unit!3275)

(assert (=> b!46506 (= lt!71703 lt!71734)))

(assert (=> b!46506 (= (size!1031 (buf!1380 (_2!2339 lt!71741))) (size!1031 (buf!1380 (_2!2339 lt!71170))))))

(declare-fun lt!71726 () Unit!3275)

(declare-fun Unit!3284 () Unit!3275)

(assert (=> b!46506 (= lt!71726 Unit!3284)))

(assert (=> b!46506 (= (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71741))) (currentByte!2879 (_2!2339 lt!71741)) (currentBit!2874 (_2!2339 lt!71741))) (bvsub (bvadd (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71170))) (currentByte!2879 (_2!2339 lt!71170)) (currentBit!2874 (_2!2339 lt!71170))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!71739 () Unit!3275)

(declare-fun Unit!3285 () Unit!3275)

(assert (=> b!46506 (= lt!71739 Unit!3285)))

(assert (=> b!46506 (= (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71741))) (currentByte!2879 (_2!2339 lt!71741)) (currentBit!2874 (_2!2339 lt!71741))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71721))) (currentByte!2879 (_2!2339 lt!71721)) (currentBit!2874 (_2!2339 lt!71721))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!71738 () Unit!3275)

(declare-fun Unit!3286 () Unit!3275)

(assert (=> b!46506 (= lt!71738 Unit!3286)))

(declare-fun lt!71714 () tuple2!4494)

(assert (=> b!46506 (= lt!71714 call!556)))

(declare-fun lt!71704 () (_ BitVec 64))

(assert (=> b!46506 (= lt!71704 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!71713 () Unit!3275)

(assert (=> b!46506 (= lt!71713 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2339 lt!71170) (buf!1380 (_2!2339 lt!71741)) lt!71704))))

(assert (=> b!46506 (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71741)))) ((_ sign_extend 32) (currentByte!2879 (_2!2339 lt!71170))) ((_ sign_extend 32) (currentBit!2874 (_2!2339 lt!71170))) lt!71704)))

(declare-fun lt!71709 () Unit!3275)

(assert (=> b!46506 (= lt!71709 lt!71713)))

(declare-fun lt!71716 () tuple2!4494)

(assert (=> b!46506 (= lt!71716 (reader!0 (_2!2339 lt!71721) (_2!2339 lt!71741)))))

(declare-fun lt!71708 () (_ BitVec 64))

(assert (=> b!46506 (= lt!71708 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!71735 () Unit!3275)

(assert (=> b!46506 (= lt!71735 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2339 lt!71721) (buf!1380 (_2!2339 lt!71741)) lt!71708))))

(assert (=> b!46506 (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71741)))) ((_ sign_extend 32) (currentByte!2879 (_2!2339 lt!71721))) ((_ sign_extend 32) (currentBit!2874 (_2!2339 lt!71721))) lt!71708)))

(declare-fun lt!71720 () Unit!3275)

(assert (=> b!46506 (= lt!71720 lt!71735)))

(declare-fun lt!71710 () List!541)

(assert (=> b!46506 (= lt!71710 (byteArrayBitContentToList!0 (_2!2339 lt!71741) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!71742 () List!541)

(assert (=> b!46506 (= lt!71742 (byteArrayBitContentToList!0 (_2!2339 lt!71741) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!71729 () List!541)

(assert (=> b!46506 (= lt!71729 (bitStreamReadBitsIntoList!0 (_2!2339 lt!71741) (_1!2340 lt!71714) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!71725 () List!541)

(assert (=> b!46506 (= lt!71725 (bitStreamReadBitsIntoList!0 (_2!2339 lt!71741) (_1!2340 lt!71716) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!71724 () (_ BitVec 64))

(assert (=> b!46506 (= lt!71724 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!71736 () Unit!3275)

(assert (=> b!46506 (= lt!71736 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2339 lt!71741) (_2!2339 lt!71741) (_1!2340 lt!71714) (_1!2340 lt!71716) lt!71724 lt!71729))))

(assert (=> b!46506 (= (bitStreamReadBitsIntoList!0 (_2!2339 lt!71741) (_1!2340 lt!71716) (bvsub lt!71724 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!227 lt!71729))))

(declare-fun lt!71706 () Unit!3275)

(assert (=> b!46506 (= lt!71706 lt!71736)))

(declare-fun lt!71737 () Unit!3275)

(declare-fun lt!71740 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2286 array!2286 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3275)

(assert (=> b!46506 (= lt!71737 (arrayBitRangesEqImpliesEq!0 (buf!1380 (_2!2339 lt!71721)) (buf!1380 (_2!2339 lt!71741)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!71740 (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71721))) (currentByte!2879 (_2!2339 lt!71721)) (currentBit!2874 (_2!2339 lt!71721)))))))

(assert (=> b!46506 (= (bitAt!0 (buf!1380 (_2!2339 lt!71721)) lt!71740) (bitAt!0 (buf!1380 (_2!2339 lt!71741)) lt!71740))))

(declare-fun lt!71705 () Unit!3275)

(assert (=> b!46506 (= lt!71705 lt!71737)))

(declare-fun d!13464 () Bool)

(assert (=> d!13464 e!30904))

(declare-fun res!39311 () Bool)

(assert (=> d!13464 (=> (not res!39311) (not e!30904))))

(declare-fun lt!71730 () (_ BitVec 64))

(assert (=> d!13464 (= res!39311 (= (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71731))) (currentByte!2879 (_2!2339 lt!71731)) (currentBit!2874 (_2!2339 lt!71731))) (bvsub lt!71730 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!13464 (or (= (bvand lt!71730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!71730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!71730 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!71707 () (_ BitVec 64))

(assert (=> d!13464 (= lt!71730 (bvadd lt!71707 to!314))))

(assert (=> d!13464 (or (not (= (bvand lt!71707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!71707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!71707 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13464 (= lt!71707 (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71170))) (currentByte!2879 (_2!2339 lt!71170)) (currentBit!2874 (_2!2339 lt!71170))))))

(assert (=> d!13464 (= lt!71731 e!30903)))

(declare-fun c!3123 () Bool)

(assert (=> d!13464 (= c!3123 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!71727 () Unit!3275)

(declare-fun lt!71700 () Unit!3275)

(assert (=> d!13464 (= lt!71727 lt!71700)))

(assert (=> d!13464 (isPrefixOf!0 (_2!2339 lt!71170) (_2!2339 lt!71170))))

(assert (=> d!13464 (= lt!71700 (lemmaIsPrefixRefl!0 (_2!2339 lt!71170)))))

(assert (=> d!13464 (= lt!71740 (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71170))) (currentByte!2879 (_2!2339 lt!71170)) (currentBit!2874 (_2!2339 lt!71170))))))

(assert (=> d!13464 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13464 (= (appendBitsMSBFirstLoop!0 (_2!2339 lt!71170) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!71731)))

(declare-fun bm!553 () Bool)

(assert (=> bm!553 (= call!556 (reader!0 (_2!2339 lt!71170) (ite c!3123 (_2!2339 lt!71741) (_2!2339 lt!71170))))))

(declare-fun b!46507 () Bool)

(declare-fun res!39313 () Bool)

(assert (=> b!46507 (=> (not res!39313) (not e!30904))))

(assert (=> b!46507 (= res!39313 (= (size!1031 (buf!1380 (_2!2339 lt!71170))) (size!1031 (buf!1380 (_2!2339 lt!71731)))))))

(declare-fun lt!71701 () tuple2!4494)

(declare-fun b!46508 () Bool)

(assert (=> b!46508 (= e!30904 (= (bitStreamReadBitsIntoList!0 (_2!2339 lt!71731) (_1!2340 lt!71701) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2339 lt!71731) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!46508 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46508 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!71711 () Unit!3275)

(declare-fun lt!71728 () Unit!3275)

(assert (=> b!46508 (= lt!71711 lt!71728)))

(assert (=> b!46508 (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71731)))) ((_ sign_extend 32) (currentByte!2879 (_2!2339 lt!71170))) ((_ sign_extend 32) (currentBit!2874 (_2!2339 lt!71170))) lt!71743)))

(assert (=> b!46508 (= lt!71728 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2339 lt!71170) (buf!1380 (_2!2339 lt!71731)) lt!71743))))

(assert (=> b!46508 e!30905))

(declare-fun res!39312 () Bool)

(assert (=> b!46508 (=> (not res!39312) (not e!30905))))

(assert (=> b!46508 (= res!39312 (and (= (size!1031 (buf!1380 (_2!2339 lt!71170))) (size!1031 (buf!1380 (_2!2339 lt!71731)))) (bvsge lt!71743 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46508 (= lt!71743 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!46508 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46508 (= lt!71701 (reader!0 (_2!2339 lt!71170) (_2!2339 lt!71731)))))

(assert (= (and d!13464 c!3123) b!46506))

(assert (= (and d!13464 (not c!3123)) b!46502))

(assert (= (or b!46506 b!46502) bm!553))

(assert (= (and d!13464 res!39311) b!46501))

(assert (= (and b!46501 res!39309) b!46507))

(assert (= (and b!46507 res!39313) b!46505))

(assert (= (and b!46505 res!39308) b!46504))

(assert (= (and b!46504 res!39310) b!46508))

(assert (= (and b!46508 res!39312) b!46503))

(declare-fun m!71103 () Bool)

(assert (=> bm!553 m!71103))

(declare-fun m!71105 () Bool)

(assert (=> b!46503 m!71105))

(declare-fun m!71107 () Bool)

(assert (=> b!46502 m!71107))

(declare-fun m!71109 () Bool)

(assert (=> b!46502 m!71109))

(declare-fun m!71111 () Bool)

(assert (=> b!46505 m!71111))

(declare-fun m!71113 () Bool)

(assert (=> b!46508 m!71113))

(declare-fun m!71115 () Bool)

(assert (=> b!46508 m!71115))

(declare-fun m!71117 () Bool)

(assert (=> b!46508 m!71117))

(declare-fun m!71119 () Bool)

(assert (=> b!46508 m!71119))

(declare-fun m!71121 () Bool)

(assert (=> b!46508 m!71121))

(declare-fun m!71123 () Bool)

(assert (=> d!13464 m!71123))

(assert (=> d!13464 m!70751))

(assert (=> d!13464 m!70937))

(assert (=> d!13464 m!70925))

(declare-fun m!71125 () Bool)

(assert (=> b!46501 m!71125))

(declare-fun m!71127 () Bool)

(assert (=> b!46506 m!71127))

(declare-fun m!71129 () Bool)

(assert (=> b!46506 m!71129))

(declare-fun m!71131 () Bool)

(assert (=> b!46506 m!71131))

(declare-fun m!71133 () Bool)

(assert (=> b!46506 m!71133))

(declare-fun m!71135 () Bool)

(assert (=> b!46506 m!71135))

(declare-fun m!71137 () Bool)

(assert (=> b!46506 m!71137))

(declare-fun m!71139 () Bool)

(assert (=> b!46506 m!71139))

(declare-fun m!71141 () Bool)

(assert (=> b!46506 m!71141))

(declare-fun m!71143 () Bool)

(assert (=> b!46506 m!71143))

(declare-fun m!71145 () Bool)

(assert (=> b!46506 m!71145))

(declare-fun m!71147 () Bool)

(assert (=> b!46506 m!71147))

(declare-fun m!71149 () Bool)

(assert (=> b!46506 m!71149))

(declare-fun m!71151 () Bool)

(assert (=> b!46506 m!71151))

(assert (=> b!46506 m!70751))

(declare-fun m!71153 () Bool)

(assert (=> b!46506 m!71153))

(assert (=> b!46506 m!71131))

(declare-fun m!71155 () Bool)

(assert (=> b!46506 m!71155))

(declare-fun m!71157 () Bool)

(assert (=> b!46506 m!71157))

(assert (=> b!46506 m!71145))

(declare-fun m!71159 () Bool)

(assert (=> b!46506 m!71159))

(declare-fun m!71161 () Bool)

(assert (=> b!46506 m!71161))

(declare-fun m!71163 () Bool)

(assert (=> b!46506 m!71163))

(declare-fun m!71165 () Bool)

(assert (=> b!46506 m!71165))

(declare-fun m!71167 () Bool)

(assert (=> b!46506 m!71167))

(declare-fun m!71169 () Bool)

(assert (=> b!46506 m!71169))

(declare-fun m!71171 () Bool)

(assert (=> b!46506 m!71171))

(declare-fun m!71173 () Bool)

(assert (=> b!46506 m!71173))

(declare-fun m!71175 () Bool)

(assert (=> b!46506 m!71175))

(declare-fun m!71177 () Bool)

(assert (=> b!46506 m!71177))

(assert (=> b!46506 m!71167))

(declare-fun m!71179 () Bool)

(assert (=> b!46506 m!71179))

(declare-fun m!71181 () Bool)

(assert (=> b!46506 m!71181))

(assert (=> b!46506 m!71175))

(declare-fun m!71183 () Bool)

(assert (=> b!46506 m!71183))

(declare-fun m!71185 () Bool)

(assert (=> b!46506 m!71185))

(declare-fun m!71187 () Bool)

(assert (=> b!46506 m!71187))

(assert (=> b!46234 d!13464))

(declare-fun d!13526 () Bool)

(assert (=> d!13526 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 thiss!1379))) ((_ sign_extend 32) (currentByte!2879 thiss!1379)) ((_ sign_extend 32) (currentBit!2874 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1031 (buf!1380 thiss!1379))) ((_ sign_extend 32) (currentByte!2879 thiss!1379)) ((_ sign_extend 32) (currentBit!2874 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3565 () Bool)

(assert (= bs!3565 d!13526))

(assert (=> bs!3565 m!70915))

(assert (=> b!46235 d!13526))

(declare-fun d!13528 () Bool)

(assert (=> d!13528 (= (tail!227 lt!71163) (t!1291 lt!71163))))

(assert (=> b!46224 d!13528))

(declare-fun d!13530 () Bool)

(declare-fun e!30908 () Bool)

(assert (=> d!13530 e!30908))

(declare-fun res!39316 () Bool)

(assert (=> d!13530 (=> (not res!39316) (not e!30908))))

(declare-fun lt!71749 () (_ BitVec 64))

(assert (=> d!13530 (= res!39316 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!71749 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!71749) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!13530 (= lt!71749 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!71748 () Unit!3275)

(declare-fun choose!42 (BitStream!1800 BitStream!1800 BitStream!1800 BitStream!1800 (_ BitVec 64) List!541) Unit!3275)

(assert (=> d!13530 (= lt!71748 (choose!42 (_2!2339 lt!71156) (_2!2339 lt!71156) (_1!2340 lt!71159) (_1!2340 lt!71166) (bvsub to!314 i!635) lt!71163))))

(assert (=> d!13530 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13530 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2339 lt!71156) (_2!2339 lt!71156) (_1!2340 lt!71159) (_1!2340 lt!71166) (bvsub to!314 i!635) lt!71163) lt!71748)))

(declare-fun b!46511 () Bool)

(assert (=> b!46511 (= e!30908 (= (bitStreamReadBitsIntoList!0 (_2!2339 lt!71156) (_1!2340 lt!71166) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!227 lt!71163)))))

(assert (= (and d!13530 res!39316) b!46511))

(declare-fun m!71189 () Bool)

(assert (=> d!13530 m!71189))

(declare-fun m!71191 () Bool)

(assert (=> b!46511 m!71191))

(assert (=> b!46511 m!70739))

(assert (=> b!46224 d!13530))

(declare-fun d!13532 () Bool)

(assert (=> d!13532 (= (invariant!0 (currentBit!2874 (_2!2339 lt!71170)) (currentByte!2879 (_2!2339 lt!71170)) (size!1031 (buf!1380 (_2!2339 lt!71170)))) (and (bvsge (currentBit!2874 (_2!2339 lt!71170)) #b00000000000000000000000000000000) (bvslt (currentBit!2874 (_2!2339 lt!71170)) #b00000000000000000000000000001000) (bvsge (currentByte!2879 (_2!2339 lt!71170)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2879 (_2!2339 lt!71170)) (size!1031 (buf!1380 (_2!2339 lt!71170)))) (and (= (currentBit!2874 (_2!2339 lt!71170)) #b00000000000000000000000000000000) (= (currentByte!2879 (_2!2339 lt!71170)) (size!1031 (buf!1380 (_2!2339 lt!71170))))))))))

(assert (=> b!46225 d!13532))

(declare-fun d!13534 () Bool)

(declare-fun e!30909 () Bool)

(assert (=> d!13534 e!30909))

(declare-fun res!39317 () Bool)

(assert (=> d!13534 (=> (not res!39317) (not e!30909))))

(declare-fun lt!71751 () (_ BitVec 64))

(declare-fun lt!71754 () (_ BitVec 64))

(declare-fun lt!71750 () (_ BitVec 64))

(assert (=> d!13534 (= res!39317 (= lt!71750 (bvsub lt!71754 lt!71751)))))

(assert (=> d!13534 (or (= (bvand lt!71754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!71751 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!71754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!71754 lt!71751) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13534 (= lt!71751 (remainingBits!0 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71156)))) ((_ sign_extend 32) (currentByte!2879 (_2!2339 lt!71156))) ((_ sign_extend 32) (currentBit!2874 (_2!2339 lt!71156)))))))

(declare-fun lt!71755 () (_ BitVec 64))

(declare-fun lt!71752 () (_ BitVec 64))

(assert (=> d!13534 (= lt!71754 (bvmul lt!71755 lt!71752))))

(assert (=> d!13534 (or (= lt!71755 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!71752 (bvsdiv (bvmul lt!71755 lt!71752) lt!71755)))))

(assert (=> d!13534 (= lt!71752 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13534 (= lt!71755 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71156)))))))

(assert (=> d!13534 (= lt!71750 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2879 (_2!2339 lt!71156))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2874 (_2!2339 lt!71156)))))))

(assert (=> d!13534 (invariant!0 (currentBit!2874 (_2!2339 lt!71156)) (currentByte!2879 (_2!2339 lt!71156)) (size!1031 (buf!1380 (_2!2339 lt!71156))))))

(assert (=> d!13534 (= (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71156))) (currentByte!2879 (_2!2339 lt!71156)) (currentBit!2874 (_2!2339 lt!71156))) lt!71750)))

(declare-fun b!46512 () Bool)

(declare-fun res!39318 () Bool)

(assert (=> b!46512 (=> (not res!39318) (not e!30909))))

(assert (=> b!46512 (= res!39318 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!71750))))

(declare-fun b!46513 () Bool)

(declare-fun lt!71753 () (_ BitVec 64))

(assert (=> b!46513 (= e!30909 (bvsle lt!71750 (bvmul lt!71753 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!46513 (or (= lt!71753 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!71753 #b0000000000000000000000000000000000000000000000000000000000001000) lt!71753)))))

(assert (=> b!46513 (= lt!71753 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71156)))))))

(assert (= (and d!13534 res!39317) b!46512))

(assert (= (and b!46512 res!39318) b!46513))

(declare-fun m!71193 () Bool)

(assert (=> d!13534 m!71193))

(assert (=> d!13534 m!70757))

(assert (=> b!46237 d!13534))

(declare-fun d!13536 () Bool)

(assert (=> d!13536 (= (array_inv!953 srcBuffer!2) (bvsge (size!1031 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!9280 d!13536))

(declare-fun d!13538 () Bool)

(assert (=> d!13538 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2874 thiss!1379) (currentByte!2879 thiss!1379) (size!1031 (buf!1380 thiss!1379))))))

(declare-fun bs!3566 () Bool)

(assert (= bs!3566 d!13538))

(assert (=> bs!3566 m!70917))

(assert (=> start!9280 d!13538))

(declare-fun d!13540 () Bool)

(assert (=> d!13540 (= (invariant!0 (currentBit!2874 (_2!2339 lt!71170)) (currentByte!2879 (_2!2339 lt!71170)) (size!1031 (buf!1380 (_2!2339 lt!71156)))) (and (bvsge (currentBit!2874 (_2!2339 lt!71170)) #b00000000000000000000000000000000) (bvslt (currentBit!2874 (_2!2339 lt!71170)) #b00000000000000000000000000001000) (bvsge (currentByte!2879 (_2!2339 lt!71170)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2879 (_2!2339 lt!71170)) (size!1031 (buf!1380 (_2!2339 lt!71156)))) (and (= (currentBit!2874 (_2!2339 lt!71170)) #b00000000000000000000000000000000) (= (currentByte!2879 (_2!2339 lt!71170)) (size!1031 (buf!1380 (_2!2339 lt!71156))))))))))

(assert (=> b!46226 d!13540))

(declare-fun d!13542 () Bool)

(assert (=> d!13542 (= (head!360 (byteArrayBitContentToList!0 (_2!2339 lt!71170) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!656 (byteArrayBitContentToList!0 (_2!2339 lt!71170) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!46227 d!13542))

(declare-fun d!13544 () Bool)

(declare-fun c!3126 () Bool)

(assert (=> d!13544 (= c!3126 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!30912 () List!541)

(assert (=> d!13544 (= (byteArrayBitContentToList!0 (_2!2339 lt!71170) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!30912)))

(declare-fun b!46518 () Bool)

(assert (=> b!46518 (= e!30912 Nil!538)))

(declare-fun b!46519 () Bool)

(assert (=> b!46519 (= e!30912 (Cons!537 (not (= (bvand ((_ sign_extend 24) (select (arr!1548 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2339 lt!71170) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!13544 c!3126) b!46518))

(assert (= (and d!13544 (not c!3126)) b!46519))

(assert (=> b!46519 m!70729))

(assert (=> b!46519 m!70909))

(declare-fun m!71195 () Bool)

(assert (=> b!46519 m!71195))

(assert (=> b!46227 d!13544))

(declare-fun d!13546 () Bool)

(assert (=> d!13546 (= (head!360 (bitStreamReadBitsIntoList!0 (_2!2339 lt!71170) (_1!2340 lt!71160) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!656 (bitStreamReadBitsIntoList!0 (_2!2339 lt!71170) (_1!2340 lt!71160) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!46227 d!13546))

(declare-fun b!46528 () Bool)

(declare-datatypes ((tuple2!4504 0))(
  ( (tuple2!4505 (_1!2345 List!541) (_2!2345 BitStream!1800)) )
))
(declare-fun e!30918 () tuple2!4504)

(assert (=> b!46528 (= e!30918 (tuple2!4505 Nil!538 (_1!2340 lt!71160)))))

(declare-fun b!46529 () Bool)

(declare-datatypes ((tuple2!4506 0))(
  ( (tuple2!4507 (_1!2346 Bool) (_2!2346 BitStream!1800)) )
))
(declare-fun lt!71762 () tuple2!4506)

(declare-fun lt!71763 () (_ BitVec 64))

(assert (=> b!46529 (= e!30918 (tuple2!4505 (Cons!537 (_1!2346 lt!71762) (bitStreamReadBitsIntoList!0 (_2!2339 lt!71170) (_2!2346 lt!71762) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!71763))) (_2!2346 lt!71762)))))

(declare-fun readBit!0 (BitStream!1800) tuple2!4506)

(assert (=> b!46529 (= lt!71762 (readBit!0 (_1!2340 lt!71160)))))

(assert (=> b!46529 (= lt!71763 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!46531 () Bool)

(declare-fun e!30917 () Bool)

(declare-fun lt!71764 () List!541)

(assert (=> b!46531 (= e!30917 (> (length!236 lt!71764) 0))))

(declare-fun d!13548 () Bool)

(assert (=> d!13548 e!30917))

(declare-fun c!3132 () Bool)

(assert (=> d!13548 (= c!3132 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13548 (= lt!71764 (_1!2345 e!30918))))

(declare-fun c!3131 () Bool)

(assert (=> d!13548 (= c!3131 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13548 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13548 (= (bitStreamReadBitsIntoList!0 (_2!2339 lt!71170) (_1!2340 lt!71160) #b0000000000000000000000000000000000000000000000000000000000000001) lt!71764)))

(declare-fun b!46530 () Bool)

(declare-fun isEmpty!134 (List!541) Bool)

(assert (=> b!46530 (= e!30917 (isEmpty!134 lt!71764))))

(assert (= (and d!13548 c!3131) b!46528))

(assert (= (and d!13548 (not c!3131)) b!46529))

(assert (= (and d!13548 c!3132) b!46530))

(assert (= (and d!13548 (not c!3132)) b!46531))

(declare-fun m!71197 () Bool)

(assert (=> b!46529 m!71197))

(declare-fun m!71199 () Bool)

(assert (=> b!46529 m!71199))

(declare-fun m!71201 () Bool)

(assert (=> b!46531 m!71201))

(declare-fun m!71203 () Bool)

(assert (=> b!46530 m!71203))

(assert (=> b!46227 d!13548))

(declare-fun b!46532 () Bool)

(declare-fun e!30920 () tuple2!4504)

(assert (=> b!46532 (= e!30920 (tuple2!4505 Nil!538 (_1!2340 lt!71166)))))

(declare-fun b!46533 () Bool)

(declare-fun lt!71765 () tuple2!4506)

(declare-fun lt!71766 () (_ BitVec 64))

(assert (=> b!46533 (= e!30920 (tuple2!4505 (Cons!537 (_1!2346 lt!71765) (bitStreamReadBitsIntoList!0 (_2!2339 lt!71156) (_2!2346 lt!71765) (bvsub lt!71161 lt!71766))) (_2!2346 lt!71765)))))

(assert (=> b!46533 (= lt!71765 (readBit!0 (_1!2340 lt!71166)))))

(assert (=> b!46533 (= lt!71766 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!46535 () Bool)

(declare-fun e!30919 () Bool)

(declare-fun lt!71767 () List!541)

(assert (=> b!46535 (= e!30919 (> (length!236 lt!71767) 0))))

(declare-fun d!13550 () Bool)

(assert (=> d!13550 e!30919))

(declare-fun c!3134 () Bool)

(assert (=> d!13550 (= c!3134 (= lt!71161 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13550 (= lt!71767 (_1!2345 e!30920))))

(declare-fun c!3133 () Bool)

(assert (=> d!13550 (= c!3133 (= lt!71161 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13550 (bvsge lt!71161 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13550 (= (bitStreamReadBitsIntoList!0 (_2!2339 lt!71156) (_1!2340 lt!71166) lt!71161) lt!71767)))

(declare-fun b!46534 () Bool)

(assert (=> b!46534 (= e!30919 (isEmpty!134 lt!71767))))

(assert (= (and d!13550 c!3133) b!46532))

(assert (= (and d!13550 (not c!3133)) b!46533))

(assert (= (and d!13550 c!3134) b!46534))

(assert (= (and d!13550 (not c!3134)) b!46535))

(declare-fun m!71205 () Bool)

(assert (=> b!46533 m!71205))

(declare-fun m!71207 () Bool)

(assert (=> b!46533 m!71207))

(declare-fun m!71209 () Bool)

(assert (=> b!46535 m!71209))

(declare-fun m!71211 () Bool)

(assert (=> b!46534 m!71211))

(assert (=> b!46228 d!13550))

(declare-fun b!46536 () Bool)

(declare-fun e!30922 () Unit!3275)

(declare-fun lt!71776 () Unit!3275)

(assert (=> b!46536 (= e!30922 lt!71776)))

(declare-fun lt!71777 () (_ BitVec 64))

(assert (=> b!46536 (= lt!71777 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71782 () (_ BitVec 64))

(assert (=> b!46536 (= lt!71782 (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71170))) (currentByte!2879 (_2!2339 lt!71170)) (currentBit!2874 (_2!2339 lt!71170))))))

(assert (=> b!46536 (= lt!71776 (arrayBitRangesEqSymmetric!0 (buf!1380 (_2!2339 lt!71170)) (buf!1380 (_2!2339 lt!71156)) lt!71777 lt!71782))))

(assert (=> b!46536 (arrayBitRangesEq!0 (buf!1380 (_2!2339 lt!71156)) (buf!1380 (_2!2339 lt!71170)) lt!71777 lt!71782)))

(declare-fun b!46537 () Bool)

(declare-fun res!39321 () Bool)

(declare-fun e!30921 () Bool)

(assert (=> b!46537 (=> (not res!39321) (not e!30921))))

(declare-fun lt!71780 () tuple2!4494)

(assert (=> b!46537 (= res!39321 (isPrefixOf!0 (_1!2340 lt!71780) (_2!2339 lt!71170)))))

(declare-fun d!13552 () Bool)

(assert (=> d!13552 e!30921))

(declare-fun res!39319 () Bool)

(assert (=> d!13552 (=> (not res!39319) (not e!30921))))

(assert (=> d!13552 (= res!39319 (isPrefixOf!0 (_1!2340 lt!71780) (_2!2340 lt!71780)))))

(declare-fun lt!71778 () BitStream!1800)

(assert (=> d!13552 (= lt!71780 (tuple2!4495 lt!71778 (_2!2339 lt!71156)))))

(declare-fun lt!71779 () Unit!3275)

(declare-fun lt!71784 () Unit!3275)

(assert (=> d!13552 (= lt!71779 lt!71784)))

(assert (=> d!13552 (isPrefixOf!0 lt!71778 (_2!2339 lt!71156))))

(assert (=> d!13552 (= lt!71784 (lemmaIsPrefixTransitive!0 lt!71778 (_2!2339 lt!71156) (_2!2339 lt!71156)))))

(declare-fun lt!71775 () Unit!3275)

(declare-fun lt!71770 () Unit!3275)

(assert (=> d!13552 (= lt!71775 lt!71770)))

(assert (=> d!13552 (isPrefixOf!0 lt!71778 (_2!2339 lt!71156))))

(assert (=> d!13552 (= lt!71770 (lemmaIsPrefixTransitive!0 lt!71778 (_2!2339 lt!71170) (_2!2339 lt!71156)))))

(declare-fun lt!71774 () Unit!3275)

(assert (=> d!13552 (= lt!71774 e!30922)))

(declare-fun c!3135 () Bool)

(assert (=> d!13552 (= c!3135 (not (= (size!1031 (buf!1380 (_2!2339 lt!71170))) #b00000000000000000000000000000000)))))

(declare-fun lt!71787 () Unit!3275)

(declare-fun lt!71773 () Unit!3275)

(assert (=> d!13552 (= lt!71787 lt!71773)))

(assert (=> d!13552 (isPrefixOf!0 (_2!2339 lt!71156) (_2!2339 lt!71156))))

(assert (=> d!13552 (= lt!71773 (lemmaIsPrefixRefl!0 (_2!2339 lt!71156)))))

(declare-fun lt!71768 () Unit!3275)

(declare-fun lt!71786 () Unit!3275)

(assert (=> d!13552 (= lt!71768 lt!71786)))

(assert (=> d!13552 (= lt!71786 (lemmaIsPrefixRefl!0 (_2!2339 lt!71156)))))

(declare-fun lt!71781 () Unit!3275)

(declare-fun lt!71783 () Unit!3275)

(assert (=> d!13552 (= lt!71781 lt!71783)))

(assert (=> d!13552 (isPrefixOf!0 lt!71778 lt!71778)))

(assert (=> d!13552 (= lt!71783 (lemmaIsPrefixRefl!0 lt!71778))))

(declare-fun lt!71769 () Unit!3275)

(declare-fun lt!71771 () Unit!3275)

(assert (=> d!13552 (= lt!71769 lt!71771)))

(assert (=> d!13552 (isPrefixOf!0 (_2!2339 lt!71170) (_2!2339 lt!71170))))

(assert (=> d!13552 (= lt!71771 (lemmaIsPrefixRefl!0 (_2!2339 lt!71170)))))

(assert (=> d!13552 (= lt!71778 (BitStream!1801 (buf!1380 (_2!2339 lt!71156)) (currentByte!2879 (_2!2339 lt!71170)) (currentBit!2874 (_2!2339 lt!71170))))))

(assert (=> d!13552 (isPrefixOf!0 (_2!2339 lt!71170) (_2!2339 lt!71156))))

(assert (=> d!13552 (= (reader!0 (_2!2339 lt!71170) (_2!2339 lt!71156)) lt!71780)))

(declare-fun b!46538 () Bool)

(declare-fun res!39320 () Bool)

(assert (=> b!46538 (=> (not res!39320) (not e!30921))))

(assert (=> b!46538 (= res!39320 (isPrefixOf!0 (_2!2340 lt!71780) (_2!2339 lt!71156)))))

(declare-fun b!46539 () Bool)

(declare-fun Unit!3287 () Unit!3275)

(assert (=> b!46539 (= e!30922 Unit!3287)))

(declare-fun b!46540 () Bool)

(declare-fun lt!71772 () (_ BitVec 64))

(declare-fun lt!71785 () (_ BitVec 64))

(assert (=> b!46540 (= e!30921 (= (_1!2340 lt!71780) (withMovedBitIndex!0 (_2!2340 lt!71780) (bvsub lt!71772 lt!71785))))))

(assert (=> b!46540 (or (= (bvand lt!71772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!71785 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!71772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!71772 lt!71785) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46540 (= lt!71785 (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71156))) (currentByte!2879 (_2!2339 lt!71156)) (currentBit!2874 (_2!2339 lt!71156))))))

(assert (=> b!46540 (= lt!71772 (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71170))) (currentByte!2879 (_2!2339 lt!71170)) (currentBit!2874 (_2!2339 lt!71170))))))

(assert (= (and d!13552 c!3135) b!46536))

(assert (= (and d!13552 (not c!3135)) b!46539))

(assert (= (and d!13552 res!39319) b!46537))

(assert (= (and b!46537 res!39321) b!46538))

(assert (= (and b!46538 res!39320) b!46540))

(declare-fun m!71213 () Bool)

(assert (=> b!46538 m!71213))

(declare-fun m!71215 () Bool)

(assert (=> b!46540 m!71215))

(assert (=> b!46540 m!70737))

(assert (=> b!46540 m!70751))

(assert (=> d!13552 m!70937))

(assert (=> d!13552 m!70925))

(declare-fun m!71217 () Bool)

(assert (=> d!13552 m!71217))

(declare-fun m!71219 () Bool)

(assert (=> d!13552 m!71219))

(declare-fun m!71221 () Bool)

(assert (=> d!13552 m!71221))

(declare-fun m!71223 () Bool)

(assert (=> d!13552 m!71223))

(assert (=> d!13552 m!70759))

(declare-fun m!71225 () Bool)

(assert (=> d!13552 m!71225))

(declare-fun m!71227 () Bool)

(assert (=> d!13552 m!71227))

(declare-fun m!71229 () Bool)

(assert (=> d!13552 m!71229))

(declare-fun m!71231 () Bool)

(assert (=> d!13552 m!71231))

(declare-fun m!71233 () Bool)

(assert (=> b!46537 m!71233))

(assert (=> b!46536 m!70751))

(declare-fun m!71235 () Bool)

(assert (=> b!46536 m!71235))

(declare-fun m!71237 () Bool)

(assert (=> b!46536 m!71237))

(assert (=> b!46228 d!13552))

(declare-fun d!13554 () Bool)

(assert (=> d!13554 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71156)))) ((_ sign_extend 32) (currentByte!2879 (_2!2339 lt!71170))) ((_ sign_extend 32) (currentBit!2874 (_2!2339 lt!71170))) lt!71161) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71156)))) ((_ sign_extend 32) (currentByte!2879 (_2!2339 lt!71170))) ((_ sign_extend 32) (currentBit!2874 (_2!2339 lt!71170)))) lt!71161))))

(declare-fun bs!3567 () Bool)

(assert (= bs!3567 d!13554))

(declare-fun m!71239 () Bool)

(assert (=> bs!3567 m!71239))

(assert (=> b!46228 d!13554))

(declare-fun d!13556 () Bool)

(assert (=> d!13556 (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71156)))) ((_ sign_extend 32) (currentByte!2879 thiss!1379)) ((_ sign_extend 32) (currentBit!2874 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!71788 () Unit!3275)

(assert (=> d!13556 (= lt!71788 (choose!9 thiss!1379 (buf!1380 (_2!2339 lt!71156)) (bvsub to!314 i!635) (BitStream!1801 (buf!1380 (_2!2339 lt!71156)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379))))))

(assert (=> d!13556 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1380 (_2!2339 lt!71156)) (bvsub to!314 i!635)) lt!71788)))

(declare-fun bs!3568 () Bool)

(assert (= bs!3568 d!13556))

(assert (=> bs!3568 m!70719))

(declare-fun m!71241 () Bool)

(assert (=> bs!3568 m!71241))

(assert (=> b!46228 d!13556))

(declare-fun d!13558 () Bool)

(assert (=> d!13558 (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71156)))) ((_ sign_extend 32) (currentByte!2879 (_2!2339 lt!71170))) ((_ sign_extend 32) (currentBit!2874 (_2!2339 lt!71170))) lt!71161)))

(declare-fun lt!71789 () Unit!3275)

(assert (=> d!13558 (= lt!71789 (choose!9 (_2!2339 lt!71170) (buf!1380 (_2!2339 lt!71156)) lt!71161 (BitStream!1801 (buf!1380 (_2!2339 lt!71156)) (currentByte!2879 (_2!2339 lt!71170)) (currentBit!2874 (_2!2339 lt!71170)))))))

(assert (=> d!13558 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2339 lt!71170) (buf!1380 (_2!2339 lt!71156)) lt!71161) lt!71789)))

(declare-fun bs!3569 () Bool)

(assert (= bs!3569 d!13558))

(assert (=> bs!3569 m!70723))

(declare-fun m!71243 () Bool)

(assert (=> bs!3569 m!71243))

(assert (=> b!46228 d!13558))

(declare-fun b!46541 () Bool)

(declare-fun e!30924 () tuple2!4504)

(assert (=> b!46541 (= e!30924 (tuple2!4505 Nil!538 (_1!2340 lt!71159)))))

(declare-fun b!46542 () Bool)

(declare-fun lt!71791 () (_ BitVec 64))

(declare-fun lt!71790 () tuple2!4506)

(assert (=> b!46542 (= e!30924 (tuple2!4505 (Cons!537 (_1!2346 lt!71790) (bitStreamReadBitsIntoList!0 (_2!2339 lt!71156) (_2!2346 lt!71790) (bvsub (bvsub to!314 i!635) lt!71791))) (_2!2346 lt!71790)))))

(assert (=> b!46542 (= lt!71790 (readBit!0 (_1!2340 lt!71159)))))

(assert (=> b!46542 (= lt!71791 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!46544 () Bool)

(declare-fun e!30923 () Bool)

(declare-fun lt!71792 () List!541)

(assert (=> b!46544 (= e!30923 (> (length!236 lt!71792) 0))))

(declare-fun d!13560 () Bool)

(assert (=> d!13560 e!30923))

(declare-fun c!3137 () Bool)

(assert (=> d!13560 (= c!3137 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13560 (= lt!71792 (_1!2345 e!30924))))

(declare-fun c!3136 () Bool)

(assert (=> d!13560 (= c!3136 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13560 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13560 (= (bitStreamReadBitsIntoList!0 (_2!2339 lt!71156) (_1!2340 lt!71159) (bvsub to!314 i!635)) lt!71792)))

(declare-fun b!46543 () Bool)

(assert (=> b!46543 (= e!30923 (isEmpty!134 lt!71792))))

(assert (= (and d!13560 c!3136) b!46541))

(assert (= (and d!13560 (not c!3136)) b!46542))

(assert (= (and d!13560 c!3137) b!46543))

(assert (= (and d!13560 (not c!3137)) b!46544))

(declare-fun m!71245 () Bool)

(assert (=> b!46542 m!71245))

(declare-fun m!71247 () Bool)

(assert (=> b!46542 m!71247))

(declare-fun m!71249 () Bool)

(assert (=> b!46544 m!71249))

(declare-fun m!71251 () Bool)

(assert (=> b!46543 m!71251))

(assert (=> b!46228 d!13560))

(declare-fun b!46545 () Bool)

(declare-fun e!30926 () Unit!3275)

(declare-fun lt!71801 () Unit!3275)

(assert (=> b!46545 (= e!30926 lt!71801)))

(declare-fun lt!71802 () (_ BitVec 64))

(assert (=> b!46545 (= lt!71802 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71807 () (_ BitVec 64))

(assert (=> b!46545 (= lt!71807 (bitIndex!0 (size!1031 (buf!1380 thiss!1379)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379)))))

(assert (=> b!46545 (= lt!71801 (arrayBitRangesEqSymmetric!0 (buf!1380 thiss!1379) (buf!1380 (_2!2339 lt!71156)) lt!71802 lt!71807))))

(assert (=> b!46545 (arrayBitRangesEq!0 (buf!1380 (_2!2339 lt!71156)) (buf!1380 thiss!1379) lt!71802 lt!71807)))

(declare-fun b!46546 () Bool)

(declare-fun res!39324 () Bool)

(declare-fun e!30925 () Bool)

(assert (=> b!46546 (=> (not res!39324) (not e!30925))))

(declare-fun lt!71805 () tuple2!4494)

(assert (=> b!46546 (= res!39324 (isPrefixOf!0 (_1!2340 lt!71805) thiss!1379))))

(declare-fun d!13562 () Bool)

(assert (=> d!13562 e!30925))

(declare-fun res!39322 () Bool)

(assert (=> d!13562 (=> (not res!39322) (not e!30925))))

(assert (=> d!13562 (= res!39322 (isPrefixOf!0 (_1!2340 lt!71805) (_2!2340 lt!71805)))))

(declare-fun lt!71803 () BitStream!1800)

(assert (=> d!13562 (= lt!71805 (tuple2!4495 lt!71803 (_2!2339 lt!71156)))))

(declare-fun lt!71804 () Unit!3275)

(declare-fun lt!71809 () Unit!3275)

(assert (=> d!13562 (= lt!71804 lt!71809)))

(assert (=> d!13562 (isPrefixOf!0 lt!71803 (_2!2339 lt!71156))))

(assert (=> d!13562 (= lt!71809 (lemmaIsPrefixTransitive!0 lt!71803 (_2!2339 lt!71156) (_2!2339 lt!71156)))))

(declare-fun lt!71800 () Unit!3275)

(declare-fun lt!71795 () Unit!3275)

(assert (=> d!13562 (= lt!71800 lt!71795)))

(assert (=> d!13562 (isPrefixOf!0 lt!71803 (_2!2339 lt!71156))))

(assert (=> d!13562 (= lt!71795 (lemmaIsPrefixTransitive!0 lt!71803 thiss!1379 (_2!2339 lt!71156)))))

(declare-fun lt!71799 () Unit!3275)

(assert (=> d!13562 (= lt!71799 e!30926)))

(declare-fun c!3138 () Bool)

(assert (=> d!13562 (= c!3138 (not (= (size!1031 (buf!1380 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!71812 () Unit!3275)

(declare-fun lt!71798 () Unit!3275)

(assert (=> d!13562 (= lt!71812 lt!71798)))

(assert (=> d!13562 (isPrefixOf!0 (_2!2339 lt!71156) (_2!2339 lt!71156))))

(assert (=> d!13562 (= lt!71798 (lemmaIsPrefixRefl!0 (_2!2339 lt!71156)))))

(declare-fun lt!71793 () Unit!3275)

(declare-fun lt!71811 () Unit!3275)

(assert (=> d!13562 (= lt!71793 lt!71811)))

(assert (=> d!13562 (= lt!71811 (lemmaIsPrefixRefl!0 (_2!2339 lt!71156)))))

(declare-fun lt!71806 () Unit!3275)

(declare-fun lt!71808 () Unit!3275)

(assert (=> d!13562 (= lt!71806 lt!71808)))

(assert (=> d!13562 (isPrefixOf!0 lt!71803 lt!71803)))

(assert (=> d!13562 (= lt!71808 (lemmaIsPrefixRefl!0 lt!71803))))

(declare-fun lt!71794 () Unit!3275)

(declare-fun lt!71796 () Unit!3275)

(assert (=> d!13562 (= lt!71794 lt!71796)))

(assert (=> d!13562 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13562 (= lt!71796 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13562 (= lt!71803 (BitStream!1801 (buf!1380 (_2!2339 lt!71156)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379)))))

(assert (=> d!13562 (isPrefixOf!0 thiss!1379 (_2!2339 lt!71156))))

(assert (=> d!13562 (= (reader!0 thiss!1379 (_2!2339 lt!71156)) lt!71805)))

(declare-fun b!46547 () Bool)

(declare-fun res!39323 () Bool)

(assert (=> b!46547 (=> (not res!39323) (not e!30925))))

(assert (=> b!46547 (= res!39323 (isPrefixOf!0 (_2!2340 lt!71805) (_2!2339 lt!71156)))))

(declare-fun b!46548 () Bool)

(declare-fun Unit!3288 () Unit!3275)

(assert (=> b!46548 (= e!30926 Unit!3288)))

(declare-fun lt!71810 () (_ BitVec 64))

(declare-fun b!46549 () Bool)

(declare-fun lt!71797 () (_ BitVec 64))

(assert (=> b!46549 (= e!30925 (= (_1!2340 lt!71805) (withMovedBitIndex!0 (_2!2340 lt!71805) (bvsub lt!71797 lt!71810))))))

(assert (=> b!46549 (or (= (bvand lt!71797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!71810 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!71797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!71797 lt!71810) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46549 (= lt!71810 (bitIndex!0 (size!1031 (buf!1380 (_2!2339 lt!71156))) (currentByte!2879 (_2!2339 lt!71156)) (currentBit!2874 (_2!2339 lt!71156))))))

(assert (=> b!46549 (= lt!71797 (bitIndex!0 (size!1031 (buf!1380 thiss!1379)) (currentByte!2879 thiss!1379) (currentBit!2874 thiss!1379)))))

(assert (= (and d!13562 c!3138) b!46545))

(assert (= (and d!13562 (not c!3138)) b!46548))

(assert (= (and d!13562 res!39322) b!46546))

(assert (= (and b!46546 res!39324) b!46547))

(assert (= (and b!46547 res!39323) b!46549))

(declare-fun m!71253 () Bool)

(assert (=> b!46547 m!71253))

(declare-fun m!71255 () Bool)

(assert (=> b!46549 m!71255))

(assert (=> b!46549 m!70737))

(assert (=> b!46549 m!70747))

(assert (=> d!13562 m!70743))

(assert (=> d!13562 m!70745))

(assert (=> d!13562 m!71217))

(declare-fun m!71257 () Bool)

(assert (=> d!13562 m!71257))

(declare-fun m!71259 () Bool)

(assert (=> d!13562 m!71259))

(declare-fun m!71261 () Bool)

(assert (=> d!13562 m!71261))

(assert (=> d!13562 m!70769))

(declare-fun m!71263 () Bool)

(assert (=> d!13562 m!71263))

(declare-fun m!71265 () Bool)

(assert (=> d!13562 m!71265))

(assert (=> d!13562 m!71229))

(declare-fun m!71267 () Bool)

(assert (=> d!13562 m!71267))

(declare-fun m!71269 () Bool)

(assert (=> b!46546 m!71269))

(assert (=> b!46545 m!70747))

(declare-fun m!71271 () Bool)

(assert (=> b!46545 m!71271))

(declare-fun m!71273 () Bool)

(assert (=> b!46545 m!71273))

(assert (=> b!46228 d!13562))

(declare-fun d!13564 () Bool)

(assert (=> d!13564 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71156)))) ((_ sign_extend 32) (currentByte!2879 thiss!1379)) ((_ sign_extend 32) (currentBit!2874 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1031 (buf!1380 (_2!2339 lt!71156)))) ((_ sign_extend 32) (currentByte!2879 thiss!1379)) ((_ sign_extend 32) (currentBit!2874 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3570 () Bool)

(assert (= bs!3570 d!13564))

(declare-fun m!71275 () Bool)

(assert (=> bs!3570 m!71275))

(assert (=> b!46228 d!13564))

(declare-fun d!13566 () Bool)

(assert (=> d!13566 (= (invariant!0 (currentBit!2874 (_2!2339 lt!71156)) (currentByte!2879 (_2!2339 lt!71156)) (size!1031 (buf!1380 (_2!2339 lt!71156)))) (and (bvsge (currentBit!2874 (_2!2339 lt!71156)) #b00000000000000000000000000000000) (bvslt (currentBit!2874 (_2!2339 lt!71156)) #b00000000000000000000000000001000) (bvsge (currentByte!2879 (_2!2339 lt!71156)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2879 (_2!2339 lt!71156)) (size!1031 (buf!1380 (_2!2339 lt!71156)))) (and (= (currentBit!2874 (_2!2339 lt!71156)) #b00000000000000000000000000000000) (= (currentByte!2879 (_2!2339 lt!71156)) (size!1031 (buf!1380 (_2!2339 lt!71156))))))))))

(assert (=> b!46229 d!13566))

(declare-fun d!13568 () Bool)

(assert (=> d!13568 (= (bitAt!0 (buf!1380 (_1!2340 lt!71159)) lt!71165) (not (= (bvand ((_ sign_extend 24) (select (arr!1548 (buf!1380 (_1!2340 lt!71159))) ((_ extract 31 0) (bvsdiv lt!71165 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!71165 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3571 () Bool)

(assert (= bs!3571 d!13568))

(declare-fun m!71277 () Bool)

(assert (=> bs!3571 m!71277))

(declare-fun m!71279 () Bool)

(assert (=> bs!3571 m!71279))

(assert (=> b!46230 d!13568))

(declare-fun d!13570 () Bool)

(assert (=> d!13570 (= (bitAt!0 (buf!1380 (_1!2340 lt!71166)) lt!71165) (not (= (bvand ((_ sign_extend 24) (select (arr!1548 (buf!1380 (_1!2340 lt!71166))) ((_ extract 31 0) (bvsdiv lt!71165 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!71165 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3572 () Bool)

(assert (= bs!3572 d!13570))

(declare-fun m!71281 () Bool)

(assert (=> bs!3572 m!71281))

(assert (=> bs!3572 m!71279))

(assert (=> b!46230 d!13570))

(check-sat (not b!46300) (not d!13436) (not b!46349) (not b!46505) (not d!13530) (not d!13552) (not b!46506) (not b!46519) (not b!46295) (not b!46354) (not d!13564) (not b!46325) (not d!13464) (not b!46348) (not b!46351) (not b!46328) (not d!13526) (not b!46544) (not b!46503) (not b!46549) (not b!46545) (not b!46320) (not d!13432) (not b!46540) (not b!46531) (not b!46297) (not b!46534) (not b!46352) (not b!46537) (not b!46511) (not d!13534) (not d!13446) (not d!13440) (not b!46547) (not b!46529) (not b!46322) (not b!46501) (not d!13460) (not b!46508) (not b!46355) (not d!13562) (not b!46530) (not b!46357) (not d!13438) (not b!46323) (not b!46502) (not d!13448) (not b!46324) (not d!13462) (not b!46546) (not b!46318) (not b!46542) (not b!46319) (not b!46347) (not d!13450) (not d!13452) (not b!46536) (not b!46543) (not d!13556) (not b!46533) (not b!46321) (not d!13558) (not d!13538) (not b!46535) (not b!46326) (not d!13454) (not d!13554) (not b!46538) (not bm!553))
