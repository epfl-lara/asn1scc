; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6914 () Bool)

(assert start!6914)

(declare-fun b!33178 () Bool)

(declare-fun e!21994 () Bool)

(declare-datatypes ((array!1850 0))(
  ( (array!1851 (arr!1292 (Array (_ BitVec 32) (_ BitVec 8))) (size!817 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1426 0))(
  ( (BitStream!1427 (buf!1145 array!1850) (currentByte!2512 (_ BitVec 32)) (currentBit!2507 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1426)

(declare-fun array_inv!766 (array!1850) Bool)

(assert (=> b!33178 (= e!21994 (array_inv!766 (buf!1145 thiss!1379)))))

(declare-fun res!28400 () Bool)

(declare-fun e!21997 () Bool)

(assert (=> start!6914 (=> (not res!28400) (not e!21997))))

(declare-fun srcBuffer!2 () array!1850)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!6914 (= res!28400 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!817 srcBuffer!2))))))))

(assert (=> start!6914 e!21997))

(assert (=> start!6914 true))

(assert (=> start!6914 (array_inv!766 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1426) Bool)

(assert (=> start!6914 (and (inv!12 thiss!1379) e!21994)))

(declare-fun b!33179 () Bool)

(declare-fun res!28405 () Bool)

(assert (=> b!33179 (=> (not res!28405) (not e!21997))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33179 (= res!28405 (validate_offset_bits!1 ((_ sign_extend 32) (size!817 (buf!1145 thiss!1379))) ((_ sign_extend 32) (currentByte!2512 thiss!1379)) ((_ sign_extend 32) (currentBit!2507 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!33180 () Bool)

(declare-fun e!21988 () Bool)

(assert (=> b!33180 (= e!21988 true)))

(declare-datatypes ((List!414 0))(
  ( (Nil!411) (Cons!410 (h!529 Bool) (t!1164 List!414)) )
))
(declare-fun lt!48874 () List!414)

(declare-fun lt!48879 () List!414)

(declare-fun tail!131 (List!414) List!414)

(assert (=> b!33180 (= lt!48874 (tail!131 lt!48879))))

(declare-datatypes ((tuple2!3382 0))(
  ( (tuple2!3383 (_1!1778 BitStream!1426) (_2!1778 BitStream!1426)) )
))
(declare-fun lt!48884 () tuple2!3382)

(declare-fun lt!48889 () tuple2!3382)

(declare-datatypes ((Unit!2489 0))(
  ( (Unit!2490) )
))
(declare-datatypes ((tuple2!3384 0))(
  ( (tuple2!3385 (_1!1779 Unit!2489) (_2!1779 BitStream!1426)) )
))
(declare-fun lt!48881 () tuple2!3384)

(declare-fun lt!48888 () Unit!2489)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1426 BitStream!1426 BitStream!1426 BitStream!1426 (_ BitVec 64) List!414) Unit!2489)

(assert (=> b!33180 (= lt!48888 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1779 lt!48881) (_2!1779 lt!48881) (_1!1778 lt!48889) (_1!1778 lt!48884) (bvsub to!314 i!635) lt!48879))))

(declare-fun b!33181 () Bool)

(declare-fun e!21995 () Bool)

(declare-fun e!21986 () Bool)

(assert (=> b!33181 (= e!21995 e!21986)))

(declare-fun res!28403 () Bool)

(assert (=> b!33181 (=> res!28403 e!21986)))

(declare-fun lt!48880 () tuple2!3384)

(declare-fun isPrefixOf!0 (BitStream!1426 BitStream!1426) Bool)

(assert (=> b!33181 (= res!28403 (not (isPrefixOf!0 (_2!1779 lt!48880) (_2!1779 lt!48881))))))

(assert (=> b!33181 (isPrefixOf!0 thiss!1379 (_2!1779 lt!48881))))

(declare-fun lt!48877 () Unit!2489)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1426 BitStream!1426 BitStream!1426) Unit!2489)

(assert (=> b!33181 (= lt!48877 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1779 lt!48880) (_2!1779 lt!48881)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1426 array!1850 (_ BitVec 64) (_ BitVec 64)) tuple2!3384)

(assert (=> b!33181 (= lt!48881 (appendBitsMSBFirstLoop!0 (_2!1779 lt!48880) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!21993 () Bool)

(assert (=> b!33181 e!21993))

(declare-fun res!28404 () Bool)

(assert (=> b!33181 (=> (not res!28404) (not e!21993))))

(assert (=> b!33181 (= res!28404 (validate_offset_bits!1 ((_ sign_extend 32) (size!817 (buf!1145 (_2!1779 lt!48880)))) ((_ sign_extend 32) (currentByte!2512 thiss!1379)) ((_ sign_extend 32) (currentBit!2507 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48878 () Unit!2489)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1426 array!1850 (_ BitVec 64)) Unit!2489)

(assert (=> b!33181 (= lt!48878 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1145 (_2!1779 lt!48880)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48875 () tuple2!3382)

(declare-fun reader!0 (BitStream!1426 BitStream!1426) tuple2!3382)

(assert (=> b!33181 (= lt!48875 (reader!0 thiss!1379 (_2!1779 lt!48880)))))

(declare-fun b!33182 () Bool)

(declare-fun res!28411 () Bool)

(declare-fun e!21987 () Bool)

(assert (=> b!33182 (=> res!28411 e!21987)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!33182 (= res!28411 (not (invariant!0 (currentBit!2507 (_2!1779 lt!48881)) (currentByte!2512 (_2!1779 lt!48881)) (size!817 (buf!1145 (_2!1779 lt!48881))))))))

(declare-fun b!33183 () Bool)

(assert (=> b!33183 (= e!21986 e!21987)))

(declare-fun res!28410 () Bool)

(assert (=> b!33183 (=> res!28410 e!21987)))

(declare-fun lt!48873 () (_ BitVec 64))

(declare-fun lt!48885 () (_ BitVec 64))

(assert (=> b!33183 (= res!28410 (not (= lt!48873 (bvsub (bvadd lt!48885 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!33183 (= lt!48873 (bitIndex!0 (size!817 (buf!1145 (_2!1779 lt!48881))) (currentByte!2512 (_2!1779 lt!48881)) (currentBit!2507 (_2!1779 lt!48881))))))

(declare-fun b!33184 () Bool)

(declare-fun res!28402 () Bool)

(assert (=> b!33184 (=> res!28402 e!21987)))

(assert (=> b!33184 (= res!28402 (not (= (size!817 (buf!1145 thiss!1379)) (size!817 (buf!1145 (_2!1779 lt!48881))))))))

(declare-fun b!33185 () Bool)

(declare-fun res!28408 () Bool)

(declare-fun e!21990 () Bool)

(assert (=> b!33185 (=> res!28408 e!21990)))

(assert (=> b!33185 (= res!28408 (not (invariant!0 (currentBit!2507 (_2!1779 lt!48880)) (currentByte!2512 (_2!1779 lt!48880)) (size!817 (buf!1145 (_2!1779 lt!48880))))))))

(declare-fun b!33186 () Bool)

(declare-fun res!28399 () Bool)

(assert (=> b!33186 (=> res!28399 e!21990)))

(assert (=> b!33186 (= res!28399 (not (invariant!0 (currentBit!2507 (_2!1779 lt!48880)) (currentByte!2512 (_2!1779 lt!48880)) (size!817 (buf!1145 (_2!1779 lt!48881))))))))

(declare-fun b!33187 () Bool)

(declare-fun e!21989 () Bool)

(assert (=> b!33187 (= e!21997 (not e!21989))))

(declare-fun res!28406 () Bool)

(assert (=> b!33187 (=> res!28406 e!21989)))

(assert (=> b!33187 (= res!28406 (bvsge i!635 to!314))))

(assert (=> b!33187 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!48876 () Unit!2489)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1426) Unit!2489)

(assert (=> b!33187 (= lt!48876 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!33187 (= lt!48885 (bitIndex!0 (size!817 (buf!1145 thiss!1379)) (currentByte!2512 thiss!1379) (currentBit!2507 thiss!1379)))))

(declare-fun b!33188 () Bool)

(assert (=> b!33188 (= e!21989 e!21995)))

(declare-fun res!28401 () Bool)

(assert (=> b!33188 (=> res!28401 e!21995)))

(assert (=> b!33188 (= res!28401 (not (isPrefixOf!0 thiss!1379 (_2!1779 lt!48880))))))

(declare-fun lt!48883 () (_ BitVec 64))

(assert (=> b!33188 (validate_offset_bits!1 ((_ sign_extend 32) (size!817 (buf!1145 (_2!1779 lt!48880)))) ((_ sign_extend 32) (currentByte!2512 (_2!1779 lt!48880))) ((_ sign_extend 32) (currentBit!2507 (_2!1779 lt!48880))) lt!48883)))

(assert (=> b!33188 (= lt!48883 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48887 () Unit!2489)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1426 BitStream!1426 (_ BitVec 64) (_ BitVec 64)) Unit!2489)

(assert (=> b!33188 (= lt!48887 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1779 lt!48880) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1426 (_ BitVec 8) (_ BitVec 32)) tuple2!3384)

(assert (=> b!33188 (= lt!48880 (appendBitFromByte!0 thiss!1379 (select (arr!1292 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!33189 () Bool)

(declare-fun res!28407 () Bool)

(assert (=> b!33189 (=> res!28407 e!21988)))

(declare-fun length!140 (List!414) Int)

(assert (=> b!33189 (= res!28407 (<= (length!140 lt!48879) 0))))

(declare-fun b!33190 () Bool)

(declare-fun head!251 (List!414) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1426 array!1850 (_ BitVec 64) (_ BitVec 64)) List!414)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1426 BitStream!1426 (_ BitVec 64)) List!414)

(assert (=> b!33190 (= e!21993 (= (head!251 (byteArrayBitContentToList!0 (_2!1779 lt!48880) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!251 (bitStreamReadBitsIntoList!0 (_2!1779 lt!48880) (_1!1778 lt!48875) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!33191 () Bool)

(declare-fun e!21992 () Bool)

(assert (=> b!33191 (= e!21992 (= lt!48873 (bvsub (bvsub (bvadd (bitIndex!0 (size!817 (buf!1145 (_2!1779 lt!48880))) (currentByte!2512 (_2!1779 lt!48880)) (currentBit!2507 (_2!1779 lt!48880))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!33192 () Bool)

(assert (=> b!33192 (= e!21987 e!21990)))

(declare-fun res!28413 () Bool)

(assert (=> b!33192 (=> res!28413 e!21990)))

(assert (=> b!33192 (= res!28413 (not (= (size!817 (buf!1145 (_2!1779 lt!48880))) (size!817 (buf!1145 (_2!1779 lt!48881))))))))

(assert (=> b!33192 e!21992))

(declare-fun res!28412 () Bool)

(assert (=> b!33192 (=> (not res!28412) (not e!21992))))

(assert (=> b!33192 (= res!28412 (= (size!817 (buf!1145 (_2!1779 lt!48881))) (size!817 (buf!1145 thiss!1379))))))

(declare-fun b!33193 () Bool)

(assert (=> b!33193 (= e!21990 e!21988)))

(declare-fun res!28409 () Bool)

(assert (=> b!33193 (=> res!28409 e!21988)))

(assert (=> b!33193 (= res!28409 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!33193 (= lt!48874 (bitStreamReadBitsIntoList!0 (_2!1779 lt!48881) (_1!1778 lt!48884) lt!48883))))

(assert (=> b!33193 (= lt!48879 (bitStreamReadBitsIntoList!0 (_2!1779 lt!48881) (_1!1778 lt!48889) (bvsub to!314 i!635)))))

(assert (=> b!33193 (validate_offset_bits!1 ((_ sign_extend 32) (size!817 (buf!1145 (_2!1779 lt!48881)))) ((_ sign_extend 32) (currentByte!2512 (_2!1779 lt!48880))) ((_ sign_extend 32) (currentBit!2507 (_2!1779 lt!48880))) lt!48883)))

(declare-fun lt!48882 () Unit!2489)

(assert (=> b!33193 (= lt!48882 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1779 lt!48880) (buf!1145 (_2!1779 lt!48881)) lt!48883))))

(assert (=> b!33193 (= lt!48884 (reader!0 (_2!1779 lt!48880) (_2!1779 lt!48881)))))

(assert (=> b!33193 (validate_offset_bits!1 ((_ sign_extend 32) (size!817 (buf!1145 (_2!1779 lt!48881)))) ((_ sign_extend 32) (currentByte!2512 thiss!1379)) ((_ sign_extend 32) (currentBit!2507 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!48886 () Unit!2489)

(assert (=> b!33193 (= lt!48886 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1145 (_2!1779 lt!48881)) (bvsub to!314 i!635)))))

(assert (=> b!33193 (= lt!48889 (reader!0 thiss!1379 (_2!1779 lt!48881)))))

(assert (= (and start!6914 res!28400) b!33179))

(assert (= (and b!33179 res!28405) b!33187))

(assert (= (and b!33187 (not res!28406)) b!33188))

(assert (= (and b!33188 (not res!28401)) b!33181))

(assert (= (and b!33181 res!28404) b!33190))

(assert (= (and b!33181 (not res!28403)) b!33183))

(assert (= (and b!33183 (not res!28410)) b!33182))

(assert (= (and b!33182 (not res!28411)) b!33184))

(assert (= (and b!33184 (not res!28402)) b!33192))

(assert (= (and b!33192 res!28412) b!33191))

(assert (= (and b!33192 (not res!28413)) b!33185))

(assert (= (and b!33185 (not res!28408)) b!33186))

(assert (= (and b!33186 (not res!28399)) b!33193))

(assert (= (and b!33193 (not res!28409)) b!33189))

(assert (= (and b!33189 (not res!28407)) b!33180))

(assert (= start!6914 b!33178))

(declare-fun m!49173 () Bool)

(assert (=> b!33191 m!49173))

(declare-fun m!49175 () Bool)

(assert (=> start!6914 m!49175))

(declare-fun m!49177 () Bool)

(assert (=> start!6914 m!49177))

(declare-fun m!49179 () Bool)

(assert (=> b!33190 m!49179))

(assert (=> b!33190 m!49179))

(declare-fun m!49181 () Bool)

(assert (=> b!33190 m!49181))

(declare-fun m!49183 () Bool)

(assert (=> b!33190 m!49183))

(assert (=> b!33190 m!49183))

(declare-fun m!49185 () Bool)

(assert (=> b!33190 m!49185))

(declare-fun m!49187 () Bool)

(assert (=> b!33182 m!49187))

(declare-fun m!49189 () Bool)

(assert (=> b!33183 m!49189))

(declare-fun m!49191 () Bool)

(assert (=> b!33187 m!49191))

(declare-fun m!49193 () Bool)

(assert (=> b!33187 m!49193))

(declare-fun m!49195 () Bool)

(assert (=> b!33187 m!49195))

(declare-fun m!49197 () Bool)

(assert (=> b!33193 m!49197))

(declare-fun m!49199 () Bool)

(assert (=> b!33193 m!49199))

(declare-fun m!49201 () Bool)

(assert (=> b!33193 m!49201))

(declare-fun m!49203 () Bool)

(assert (=> b!33193 m!49203))

(declare-fun m!49205 () Bool)

(assert (=> b!33193 m!49205))

(declare-fun m!49207 () Bool)

(assert (=> b!33193 m!49207))

(declare-fun m!49209 () Bool)

(assert (=> b!33193 m!49209))

(declare-fun m!49211 () Bool)

(assert (=> b!33193 m!49211))

(declare-fun m!49213 () Bool)

(assert (=> b!33185 m!49213))

(declare-fun m!49215 () Bool)

(assert (=> b!33181 m!49215))

(declare-fun m!49217 () Bool)

(assert (=> b!33181 m!49217))

(declare-fun m!49219 () Bool)

(assert (=> b!33181 m!49219))

(declare-fun m!49221 () Bool)

(assert (=> b!33181 m!49221))

(declare-fun m!49223 () Bool)

(assert (=> b!33181 m!49223))

(declare-fun m!49225 () Bool)

(assert (=> b!33181 m!49225))

(declare-fun m!49227 () Bool)

(assert (=> b!33181 m!49227))

(declare-fun m!49229 () Bool)

(assert (=> b!33178 m!49229))

(declare-fun m!49231 () Bool)

(assert (=> b!33180 m!49231))

(declare-fun m!49233 () Bool)

(assert (=> b!33180 m!49233))

(declare-fun m!49235 () Bool)

(assert (=> b!33179 m!49235))

(declare-fun m!49237 () Bool)

(assert (=> b!33188 m!49237))

(declare-fun m!49239 () Bool)

(assert (=> b!33188 m!49239))

(declare-fun m!49241 () Bool)

(assert (=> b!33188 m!49241))

(declare-fun m!49243 () Bool)

(assert (=> b!33188 m!49243))

(assert (=> b!33188 m!49237))

(declare-fun m!49245 () Bool)

(assert (=> b!33188 m!49245))

(declare-fun m!49247 () Bool)

(assert (=> b!33186 m!49247))

(declare-fun m!49249 () Bool)

(assert (=> b!33189 m!49249))

(push 1)

(assert (not b!33186))

(assert (not b!33183))

(assert (not b!33191))

(assert (not b!33187))

(assert (not b!33188))

(assert (not b!33185))

(assert (not b!33178))

(assert (not b!33190))

(assert (not b!33193))

(assert (not b!33189))

(assert (not b!33182))

(assert (not b!33181))

(assert (not b!33179))

(assert (not start!6914))

(assert (not b!33180))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

