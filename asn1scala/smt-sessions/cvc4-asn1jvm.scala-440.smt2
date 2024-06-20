; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11836 () Bool)

(assert start!11836)

(declare-fun b!59160 () Bool)

(declare-fun e!39334 () Bool)

(declare-fun e!39330 () Bool)

(assert (=> b!59160 (= e!39334 e!39330)))

(declare-fun res!49217 () Bool)

(assert (=> b!59160 (=> res!49217 e!39330)))

(declare-datatypes ((array!2693 0))(
  ( (array!2694 (arr!1786 (Array (_ BitVec 32) (_ BitVec 8))) (size!1222 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2132 0))(
  ( (BitStream!2133 (buf!1603 array!2693) (currentByte!3221 (_ BitVec 32)) (currentBit!3216 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4067 0))(
  ( (Unit!4068) )
))
(declare-datatypes ((tuple2!5386 0))(
  ( (tuple2!5387 (_1!2804 Unit!4067) (_2!2804 BitStream!2132)) )
))
(declare-fun lt!92965 () tuple2!5386)

(declare-fun lt!92968 () tuple2!5386)

(declare-fun isPrefixOf!0 (BitStream!2132 BitStream!2132) Bool)

(assert (=> b!59160 (= res!49217 (not (isPrefixOf!0 (_2!2804 lt!92965) (_2!2804 lt!92968))))))

(declare-fun thiss!1379 () BitStream!2132)

(assert (=> b!59160 (isPrefixOf!0 thiss!1379 (_2!2804 lt!92968))))

(declare-fun lt!92964 () Unit!4067)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2132 BitStream!2132 BitStream!2132) Unit!4067)

(assert (=> b!59160 (= lt!92964 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2804 lt!92965) (_2!2804 lt!92968)))))

(declare-fun srcBuffer!2 () array!2693)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2132 array!2693 (_ BitVec 64) (_ BitVec 64)) tuple2!5386)

(assert (=> b!59160 (= lt!92968 (appendBitsMSBFirstLoop!0 (_2!2804 lt!92965) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!39329 () Bool)

(assert (=> b!59160 e!39329))

(declare-fun res!49218 () Bool)

(assert (=> b!59160 (=> (not res!49218) (not e!39329))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59160 (= res!49218 (validate_offset_bits!1 ((_ sign_extend 32) (size!1222 (buf!1603 (_2!2804 lt!92965)))) ((_ sign_extend 32) (currentByte!3221 thiss!1379)) ((_ sign_extend 32) (currentBit!3216 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92960 () Unit!4067)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2132 array!2693 (_ BitVec 64)) Unit!4067)

(assert (=> b!59160 (= lt!92960 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1603 (_2!2804 lt!92965)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5388 0))(
  ( (tuple2!5389 (_1!2805 BitStream!2132) (_2!2805 BitStream!2132)) )
))
(declare-fun lt!92958 () tuple2!5388)

(declare-fun reader!0 (BitStream!2132 BitStream!2132) tuple2!5388)

(assert (=> b!59160 (= lt!92958 (reader!0 thiss!1379 (_2!2804 lt!92965)))))

(declare-fun b!59161 () Bool)

(declare-fun res!49207 () Bool)

(declare-fun e!39327 () Bool)

(assert (=> b!59161 (=> res!49207 e!39327)))

(assert (=> b!59161 (= res!49207 (not (= (size!1222 (buf!1603 thiss!1379)) (size!1222 (buf!1603 (_2!2804 lt!92968))))))))

(declare-fun b!59163 () Bool)

(declare-fun res!49212 () Bool)

(declare-fun e!39335 () Bool)

(assert (=> b!59163 (=> (not res!49212) (not e!39335))))

(assert (=> b!59163 (= res!49212 (validate_offset_bits!1 ((_ sign_extend 32) (size!1222 (buf!1603 thiss!1379))) ((_ sign_extend 32) (currentByte!3221 thiss!1379)) ((_ sign_extend 32) (currentBit!3216 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59164 () Bool)

(declare-datatypes ((List!641 0))(
  ( (Nil!638) (Cons!637 (h!756 Bool) (t!1391 List!641)) )
))
(declare-fun head!460 (List!641) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2132 array!2693 (_ BitVec 64) (_ BitVec 64)) List!641)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2132 BitStream!2132 (_ BitVec 64)) List!641)

(assert (=> b!59164 (= e!39329 (= (head!460 (byteArrayBitContentToList!0 (_2!2804 lt!92965) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!460 (bitStreamReadBitsIntoList!0 (_2!2804 lt!92965) (_1!2805 lt!92958) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59165 () Bool)

(declare-fun res!49216 () Bool)

(declare-fun e!39326 () Bool)

(assert (=> b!59165 (=> res!49216 e!39326)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59165 (= res!49216 (not (invariant!0 (currentBit!3216 (_2!2804 lt!92965)) (currentByte!3221 (_2!2804 lt!92965)) (size!1222 (buf!1603 (_2!2804 lt!92965))))))))

(declare-fun b!59166 () Bool)

(declare-fun e!39332 () Bool)

(assert (=> b!59166 (= e!39335 (not e!39332))))

(declare-fun res!49208 () Bool)

(assert (=> b!59166 (=> res!49208 e!39332)))

(assert (=> b!59166 (= res!49208 (bvsge i!635 to!314))))

(assert (=> b!59166 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92961 () Unit!4067)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2132) Unit!4067)

(assert (=> b!59166 (= lt!92961 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!92959 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59166 (= lt!92959 (bitIndex!0 (size!1222 (buf!1603 thiss!1379)) (currentByte!3221 thiss!1379) (currentBit!3216 thiss!1379)))))

(declare-fun b!59167 () Bool)

(assert (=> b!59167 (= e!39326 true)))

(declare-fun lt!92962 () tuple2!5388)

(assert (=> b!59167 (= lt!92962 (reader!0 (_2!2804 lt!92965) (_2!2804 lt!92968)))))

(assert (=> b!59167 (validate_offset_bits!1 ((_ sign_extend 32) (size!1222 (buf!1603 (_2!2804 lt!92968)))) ((_ sign_extend 32) (currentByte!3221 thiss!1379)) ((_ sign_extend 32) (currentBit!3216 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!92963 () Unit!4067)

(assert (=> b!59167 (= lt!92963 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1603 (_2!2804 lt!92968)) (bvsub to!314 i!635)))))

(declare-fun lt!92967 () tuple2!5388)

(assert (=> b!59167 (= lt!92967 (reader!0 thiss!1379 (_2!2804 lt!92968)))))

(declare-fun b!59168 () Bool)

(assert (=> b!59168 (= e!39327 e!39326)))

(declare-fun res!49214 () Bool)

(assert (=> b!59168 (=> res!49214 e!39326)))

(assert (=> b!59168 (= res!49214 (not (= (size!1222 (buf!1603 (_2!2804 lt!92965))) (size!1222 (buf!1603 (_2!2804 lt!92968))))))))

(declare-fun e!39325 () Bool)

(assert (=> b!59168 e!39325))

(declare-fun res!49211 () Bool)

(assert (=> b!59168 (=> (not res!49211) (not e!39325))))

(assert (=> b!59168 (= res!49211 (= (size!1222 (buf!1603 (_2!2804 lt!92968))) (size!1222 (buf!1603 thiss!1379))))))

(declare-fun b!59169 () Bool)

(assert (=> b!59169 (= e!39330 e!39327)))

(declare-fun res!49206 () Bool)

(assert (=> b!59169 (=> res!49206 e!39327)))

(declare-fun lt!92966 () (_ BitVec 64))

(assert (=> b!59169 (= res!49206 (not (= lt!92966 (bvsub (bvadd lt!92959 to!314) i!635))))))

(assert (=> b!59169 (= lt!92966 (bitIndex!0 (size!1222 (buf!1603 (_2!2804 lt!92968))) (currentByte!3221 (_2!2804 lt!92968)) (currentBit!3216 (_2!2804 lt!92968))))))

(declare-fun b!59170 () Bool)

(declare-fun e!39328 () Bool)

(declare-fun array_inv!1125 (array!2693) Bool)

(assert (=> b!59170 (= e!39328 (array_inv!1125 (buf!1603 thiss!1379)))))

(declare-fun b!59171 () Bool)

(assert (=> b!59171 (= e!39332 e!39334)))

(declare-fun res!49210 () Bool)

(assert (=> b!59171 (=> res!49210 e!39334)))

(assert (=> b!59171 (= res!49210 (not (isPrefixOf!0 thiss!1379 (_2!2804 lt!92965))))))

(assert (=> b!59171 (validate_offset_bits!1 ((_ sign_extend 32) (size!1222 (buf!1603 (_2!2804 lt!92965)))) ((_ sign_extend 32) (currentByte!3221 (_2!2804 lt!92965))) ((_ sign_extend 32) (currentBit!3216 (_2!2804 lt!92965))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92957 () Unit!4067)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2132 BitStream!2132 (_ BitVec 64) (_ BitVec 64)) Unit!4067)

(assert (=> b!59171 (= lt!92957 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2804 lt!92965) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2132 (_ BitVec 8) (_ BitVec 32)) tuple2!5386)

(assert (=> b!59171 (= lt!92965 (appendBitFromByte!0 thiss!1379 (select (arr!1786 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!49213 () Bool)

(assert (=> start!11836 (=> (not res!49213) (not e!39335))))

(assert (=> start!11836 (= res!49213 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1222 srcBuffer!2))))))))

(assert (=> start!11836 e!39335))

(assert (=> start!11836 true))

(assert (=> start!11836 (array_inv!1125 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2132) Bool)

(assert (=> start!11836 (and (inv!12 thiss!1379) e!39328)))

(declare-fun b!59162 () Bool)

(assert (=> b!59162 (= e!39325 (= lt!92966 (bvsub (bvsub (bvadd (bitIndex!0 (size!1222 (buf!1603 (_2!2804 lt!92965))) (currentByte!3221 (_2!2804 lt!92965)) (currentBit!3216 (_2!2804 lt!92965))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!59172 () Bool)

(declare-fun res!49209 () Bool)

(assert (=> b!59172 (=> res!49209 e!39326)))

(assert (=> b!59172 (= res!49209 (not (invariant!0 (currentBit!3216 (_2!2804 lt!92965)) (currentByte!3221 (_2!2804 lt!92965)) (size!1222 (buf!1603 (_2!2804 lt!92968))))))))

(declare-fun b!59173 () Bool)

(declare-fun res!49215 () Bool)

(assert (=> b!59173 (=> res!49215 e!39327)))

(assert (=> b!59173 (= res!49215 (not (invariant!0 (currentBit!3216 (_2!2804 lt!92968)) (currentByte!3221 (_2!2804 lt!92968)) (size!1222 (buf!1603 (_2!2804 lt!92968))))))))

(assert (= (and start!11836 res!49213) b!59163))

(assert (= (and b!59163 res!49212) b!59166))

(assert (= (and b!59166 (not res!49208)) b!59171))

(assert (= (and b!59171 (not res!49210)) b!59160))

(assert (= (and b!59160 res!49218) b!59164))

(assert (= (and b!59160 (not res!49217)) b!59169))

(assert (= (and b!59169 (not res!49206)) b!59173))

(assert (= (and b!59173 (not res!49215)) b!59161))

(assert (= (and b!59161 (not res!49207)) b!59168))

(assert (= (and b!59168 res!49211) b!59162))

(assert (= (and b!59168 (not res!49214)) b!59165))

(assert (= (and b!59165 (not res!49216)) b!59172))

(assert (= (and b!59172 (not res!49209)) b!59167))

(assert (= start!11836 b!59170))

(declare-fun m!93153 () Bool)

(assert (=> b!59166 m!93153))

(declare-fun m!93155 () Bool)

(assert (=> b!59166 m!93155))

(declare-fun m!93157 () Bool)

(assert (=> b!59166 m!93157))

(declare-fun m!93159 () Bool)

(assert (=> b!59162 m!93159))

(declare-fun m!93161 () Bool)

(assert (=> b!59172 m!93161))

(declare-fun m!93163 () Bool)

(assert (=> b!59173 m!93163))

(declare-fun m!93165 () Bool)

(assert (=> b!59163 m!93165))

(declare-fun m!93167 () Bool)

(assert (=> b!59160 m!93167))

(declare-fun m!93169 () Bool)

(assert (=> b!59160 m!93169))

(declare-fun m!93171 () Bool)

(assert (=> b!59160 m!93171))

(declare-fun m!93173 () Bool)

(assert (=> b!59160 m!93173))

(declare-fun m!93175 () Bool)

(assert (=> b!59160 m!93175))

(declare-fun m!93177 () Bool)

(assert (=> b!59160 m!93177))

(declare-fun m!93179 () Bool)

(assert (=> b!59160 m!93179))

(declare-fun m!93181 () Bool)

(assert (=> b!59171 m!93181))

(declare-fun m!93183 () Bool)

(assert (=> b!59171 m!93183))

(declare-fun m!93185 () Bool)

(assert (=> b!59171 m!93185))

(assert (=> b!59171 m!93183))

(declare-fun m!93187 () Bool)

(assert (=> b!59171 m!93187))

(declare-fun m!93189 () Bool)

(assert (=> b!59171 m!93189))

(declare-fun m!93191 () Bool)

(assert (=> start!11836 m!93191))

(declare-fun m!93193 () Bool)

(assert (=> start!11836 m!93193))

(declare-fun m!93195 () Bool)

(assert (=> b!59165 m!93195))

(declare-fun m!93197 () Bool)

(assert (=> b!59169 m!93197))

(declare-fun m!93199 () Bool)

(assert (=> b!59164 m!93199))

(assert (=> b!59164 m!93199))

(declare-fun m!93201 () Bool)

(assert (=> b!59164 m!93201))

(declare-fun m!93203 () Bool)

(assert (=> b!59164 m!93203))

(assert (=> b!59164 m!93203))

(declare-fun m!93205 () Bool)

(assert (=> b!59164 m!93205))

(declare-fun m!93207 () Bool)

(assert (=> b!59170 m!93207))

(declare-fun m!93209 () Bool)

(assert (=> b!59167 m!93209))

(declare-fun m!93211 () Bool)

(assert (=> b!59167 m!93211))

(declare-fun m!93213 () Bool)

(assert (=> b!59167 m!93213))

(declare-fun m!93215 () Bool)

(assert (=> b!59167 m!93215))

(push 1)

(assert (not b!59170))

(assert (not b!59164))

(assert (not b!59166))

(assert (not b!59163))

(assert (not b!59171))

(assert (not b!59165))

(assert (not b!59167))

(assert (not b!59162))

(assert (not b!59160))

(assert (not b!59173))

(assert (not b!59169))

(assert (not b!59172))

(assert (not start!11836))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

