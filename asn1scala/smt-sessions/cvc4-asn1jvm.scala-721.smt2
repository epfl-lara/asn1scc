; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20216 () Bool)

(assert start!20216)

(declare-fun b!101169 () Bool)

(declare-fun res!83104 () Bool)

(declare-fun e!66146 () Bool)

(assert (=> b!101169 (=> (not res!83104) (not e!66146))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101169 (= res!83104 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!101170 () Bool)

(declare-fun res!83102 () Bool)

(assert (=> b!101170 (=> (not res!83102) (not e!66146))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!101170 (= res!83102 (bvslt i!615 nBits!396))))

(declare-fun b!101171 () Bool)

(assert (=> b!101171 (= e!66146 (not true))))

(declare-datatypes ((array!4747 0))(
  ( (array!4748 (arr!2759 (Array (_ BitVec 32) (_ BitVec 8))) (size!2166 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3806 0))(
  ( (BitStream!3807 (buf!2523 array!4747) (currentByte!4990 (_ BitVec 32)) (currentBit!4985 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8176 0))(
  ( (tuple2!8177 (_1!4343 BitStream!3806) (_2!4343 BitStream!3806)) )
))
(declare-fun lt!146916 () tuple2!8176)

(declare-fun lt!146923 () Bool)

(declare-datatypes ((tuple2!8178 0))(
  ( (tuple2!8179 (_1!4344 BitStream!3806) (_2!4344 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3806) tuple2!8178)

(assert (=> b!101171 (= (_2!4344 (readBitPure!0 (_1!4343 lt!146916))) lt!146923)))

(declare-fun lt!146914 () tuple2!8176)

(declare-datatypes ((Unit!6204 0))(
  ( (Unit!6205) )
))
(declare-datatypes ((tuple2!8180 0))(
  ( (tuple2!8181 (_1!4345 Unit!6204) (_2!4345 BitStream!3806)) )
))
(declare-fun lt!146921 () tuple2!8180)

(declare-fun lt!146920 () tuple2!8180)

(declare-fun reader!0 (BitStream!3806 BitStream!3806) tuple2!8176)

(assert (=> b!101171 (= lt!146914 (reader!0 (_2!4345 lt!146921) (_2!4345 lt!146920)))))

(declare-fun thiss!1305 () BitStream!3806)

(assert (=> b!101171 (= lt!146916 (reader!0 thiss!1305 (_2!4345 lt!146920)))))

(declare-fun e!66145 () Bool)

(assert (=> b!101171 e!66145))

(declare-fun res!83101 () Bool)

(assert (=> b!101171 (=> (not res!83101) (not e!66145))))

(declare-fun lt!146919 () tuple2!8178)

(declare-fun lt!146922 () tuple2!8178)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101171 (= res!83101 (= (bitIndex!0 (size!2166 (buf!2523 (_1!4344 lt!146919))) (currentByte!4990 (_1!4344 lt!146919)) (currentBit!4985 (_1!4344 lt!146919))) (bitIndex!0 (size!2166 (buf!2523 (_1!4344 lt!146922))) (currentByte!4990 (_1!4344 lt!146922)) (currentBit!4985 (_1!4344 lt!146922)))))))

(declare-fun lt!146912 () Unit!6204)

(declare-fun lt!146917 () BitStream!3806)

(declare-fun readBitPrefixLemma!0 (BitStream!3806 BitStream!3806) Unit!6204)

(assert (=> b!101171 (= lt!146912 (readBitPrefixLemma!0 lt!146917 (_2!4345 lt!146920)))))

(assert (=> b!101171 (= lt!146922 (readBitPure!0 (BitStream!3807 (buf!2523 (_2!4345 lt!146920)) (currentByte!4990 thiss!1305) (currentBit!4985 thiss!1305))))))

(assert (=> b!101171 (= lt!146919 (readBitPure!0 lt!146917))))

(assert (=> b!101171 (= lt!146917 (BitStream!3807 (buf!2523 (_2!4345 lt!146921)) (currentByte!4990 thiss!1305) (currentBit!4985 thiss!1305)))))

(declare-fun e!66147 () Bool)

(assert (=> b!101171 e!66147))

(declare-fun res!83103 () Bool)

(assert (=> b!101171 (=> (not res!83103) (not e!66147))))

(declare-fun isPrefixOf!0 (BitStream!3806 BitStream!3806) Bool)

(assert (=> b!101171 (= res!83103 (isPrefixOf!0 thiss!1305 (_2!4345 lt!146920)))))

(declare-fun lt!146911 () Unit!6204)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3806 BitStream!3806 BitStream!3806) Unit!6204)

(assert (=> b!101171 (= lt!146911 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4345 lt!146921) (_2!4345 lt!146920)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3806 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8180)

(assert (=> b!101171 (= lt!146920 (appendNLeastSignificantBitsLoop!0 (_2!4345 lt!146921) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!66149 () Bool)

(assert (=> b!101171 e!66149))

(declare-fun res!83111 () Bool)

(assert (=> b!101171 (=> (not res!83111) (not e!66149))))

(assert (=> b!101171 (= res!83111 (= (size!2166 (buf!2523 thiss!1305)) (size!2166 (buf!2523 (_2!4345 lt!146921)))))))

(declare-fun appendBit!0 (BitStream!3806 Bool) tuple2!8180)

(assert (=> b!101171 (= lt!146921 (appendBit!0 thiss!1305 lt!146923))))

(assert (=> b!101171 (= lt!146923 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101172 () Bool)

(declare-fun e!66143 () Bool)

(declare-fun e!66150 () Bool)

(assert (=> b!101172 (= e!66143 e!66150)))

(declare-fun res!83106 () Bool)

(assert (=> b!101172 (=> (not res!83106) (not e!66150))))

(declare-fun lt!146915 () tuple2!8178)

(assert (=> b!101172 (= res!83106 (and (= (_2!4344 lt!146915) lt!146923) (= (_1!4344 lt!146915) (_2!4345 lt!146921))))))

(declare-fun readerFrom!0 (BitStream!3806 (_ BitVec 32) (_ BitVec 32)) BitStream!3806)

(assert (=> b!101172 (= lt!146915 (readBitPure!0 (readerFrom!0 (_2!4345 lt!146921) (currentBit!4985 thiss!1305) (currentByte!4990 thiss!1305))))))

(declare-fun b!101173 () Bool)

(declare-fun lt!146918 () (_ BitVec 64))

(assert (=> b!101173 (= e!66150 (= (bitIndex!0 (size!2166 (buf!2523 (_1!4344 lt!146915))) (currentByte!4990 (_1!4344 lt!146915)) (currentBit!4985 (_1!4344 lt!146915))) lt!146918))))

(declare-fun b!101174 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101174 (= e!66147 (invariant!0 (currentBit!4985 thiss!1305) (currentByte!4990 thiss!1305) (size!2166 (buf!2523 (_2!4345 lt!146920)))))))

(declare-fun b!101175 () Bool)

(assert (=> b!101175 (= e!66145 (= (_2!4344 lt!146919) (_2!4344 lt!146922)))))

(declare-fun b!101176 () Bool)

(assert (=> b!101176 (= e!66149 e!66143)))

(declare-fun res!83107 () Bool)

(assert (=> b!101176 (=> (not res!83107) (not e!66143))))

(declare-fun lt!146913 () (_ BitVec 64))

(assert (=> b!101176 (= res!83107 (= lt!146918 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!146913)))))

(assert (=> b!101176 (= lt!146918 (bitIndex!0 (size!2166 (buf!2523 (_2!4345 lt!146921))) (currentByte!4990 (_2!4345 lt!146921)) (currentBit!4985 (_2!4345 lt!146921))))))

(assert (=> b!101176 (= lt!146913 (bitIndex!0 (size!2166 (buf!2523 thiss!1305)) (currentByte!4990 thiss!1305) (currentBit!4985 thiss!1305)))))

(declare-fun b!101177 () Bool)

(declare-fun res!83105 () Bool)

(assert (=> b!101177 (=> (not res!83105) (not e!66143))))

(assert (=> b!101177 (= res!83105 (isPrefixOf!0 thiss!1305 (_2!4345 lt!146921)))))

(declare-fun b!101178 () Bool)

(declare-fun res!83110 () Bool)

(assert (=> b!101178 (=> (not res!83110) (not e!66146))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101178 (= res!83110 (validate_offset_bits!1 ((_ sign_extend 32) (size!2166 (buf!2523 thiss!1305))) ((_ sign_extend 32) (currentByte!4990 thiss!1305)) ((_ sign_extend 32) (currentBit!4985 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun res!83108 () Bool)

(assert (=> start!20216 (=> (not res!83108) (not e!66146))))

(assert (=> start!20216 (= res!83108 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20216 e!66146))

(assert (=> start!20216 true))

(declare-fun e!66148 () Bool)

(declare-fun inv!12 (BitStream!3806) Bool)

(assert (=> start!20216 (and (inv!12 thiss!1305) e!66148)))

(declare-fun b!101179 () Bool)

(declare-fun res!83109 () Bool)

(assert (=> b!101179 (=> (not res!83109) (not e!66147))))

(assert (=> b!101179 (= res!83109 (invariant!0 (currentBit!4985 thiss!1305) (currentByte!4990 thiss!1305) (size!2166 (buf!2523 (_2!4345 lt!146921)))))))

(declare-fun b!101180 () Bool)

(declare-fun array_inv!1968 (array!4747) Bool)

(assert (=> b!101180 (= e!66148 (array_inv!1968 (buf!2523 thiss!1305)))))

(assert (= (and start!20216 res!83108) b!101178))

(assert (= (and b!101178 res!83110) b!101169))

(assert (= (and b!101169 res!83104) b!101170))

(assert (= (and b!101170 res!83102) b!101171))

(assert (= (and b!101171 res!83111) b!101176))

(assert (= (and b!101176 res!83107) b!101177))

(assert (= (and b!101177 res!83105) b!101172))

(assert (= (and b!101172 res!83106) b!101173))

(assert (= (and b!101171 res!83103) b!101179))

(assert (= (and b!101179 res!83109) b!101174))

(assert (= (and b!101171 res!83101) b!101175))

(assert (= start!20216 b!101180))

(declare-fun m!147163 () Bool)

(assert (=> b!101171 m!147163))

(declare-fun m!147165 () Bool)

(assert (=> b!101171 m!147165))

(declare-fun m!147167 () Bool)

(assert (=> b!101171 m!147167))

(declare-fun m!147169 () Bool)

(assert (=> b!101171 m!147169))

(declare-fun m!147171 () Bool)

(assert (=> b!101171 m!147171))

(declare-fun m!147173 () Bool)

(assert (=> b!101171 m!147173))

(declare-fun m!147175 () Bool)

(assert (=> b!101171 m!147175))

(declare-fun m!147177 () Bool)

(assert (=> b!101171 m!147177))

(declare-fun m!147179 () Bool)

(assert (=> b!101171 m!147179))

(declare-fun m!147181 () Bool)

(assert (=> b!101171 m!147181))

(declare-fun m!147183 () Bool)

(assert (=> b!101171 m!147183))

(declare-fun m!147185 () Bool)

(assert (=> b!101171 m!147185))

(declare-fun m!147187 () Bool)

(assert (=> b!101180 m!147187))

(declare-fun m!147189 () Bool)

(assert (=> b!101174 m!147189))

(declare-fun m!147191 () Bool)

(assert (=> b!101179 m!147191))

(declare-fun m!147193 () Bool)

(assert (=> b!101172 m!147193))

(assert (=> b!101172 m!147193))

(declare-fun m!147195 () Bool)

(assert (=> b!101172 m!147195))

(declare-fun m!147197 () Bool)

(assert (=> b!101169 m!147197))

(declare-fun m!147199 () Bool)

(assert (=> b!101177 m!147199))

(declare-fun m!147201 () Bool)

(assert (=> b!101176 m!147201))

(declare-fun m!147203 () Bool)

(assert (=> b!101176 m!147203))

(declare-fun m!147205 () Bool)

(assert (=> b!101173 m!147205))

(declare-fun m!147207 () Bool)

(assert (=> b!101178 m!147207))

(declare-fun m!147209 () Bool)

(assert (=> start!20216 m!147209))

(push 1)

(assert (not b!101178))

(assert (not b!101173))

(assert (not b!101180))

(assert (not b!101169))

(assert (not b!101177))

(assert (not b!101179))

(assert (not b!101171))

(assert (not b!101176))

(assert (not start!20216))

(assert (not b!101172))

(assert (not b!101174))

(check-sat)

(pop 1)

(push 1)

