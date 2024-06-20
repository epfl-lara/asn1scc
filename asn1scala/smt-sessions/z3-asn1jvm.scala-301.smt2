; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5980 () Bool)

(assert start!5980)

(declare-fun res!23603 () Bool)

(declare-fun e!18449 () Bool)

(assert (=> start!5980 (=> (not res!23603) (not e!18449))))

(declare-datatypes ((array!1717 0))(
  ( (array!1718 (arr!1203 (Array (_ BitVec 32) (_ BitVec 8))) (size!741 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1717)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5980 (= res!23603 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!741 srcBuffer!2))))))))

(assert (=> start!5980 e!18449))

(assert (=> start!5980 true))

(declare-fun array_inv!710 (array!1717) Bool)

(assert (=> start!5980 (array_inv!710 srcBuffer!2)))

(declare-datatypes ((BitStream!1314 0))(
  ( (BitStream!1315 (buf!1068 array!1717) (currentByte!2393 (_ BitVec 32)) (currentBit!2388 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1314)

(declare-fun e!18456 () Bool)

(declare-fun inv!12 (BitStream!1314) Bool)

(assert (=> start!5980 (and (inv!12 thiss!1379) e!18456)))

(declare-fun b!27288 () Bool)

(declare-fun res!23608 () Bool)

(declare-fun e!18458 () Bool)

(assert (=> b!27288 (=> res!23608 e!18458)))

(declare-datatypes ((Unit!2185 0))(
  ( (Unit!2186) )
))
(declare-datatypes ((tuple2!2994 0))(
  ( (tuple2!2995 (_1!1584 Unit!2185) (_2!1584 BitStream!1314)) )
))
(declare-fun lt!38855 () tuple2!2994)

(assert (=> b!27288 (= res!23608 (not (= (size!741 (buf!1068 thiss!1379)) (size!741 (buf!1068 (_2!1584 lt!38855))))))))

(declare-fun b!27289 () Bool)

(declare-fun res!23606 () Bool)

(assert (=> b!27289 (=> res!23606 e!18458)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!27289 (= res!23606 (not (invariant!0 (currentBit!2388 (_2!1584 lt!38855)) (currentByte!2393 (_2!1584 lt!38855)) (size!741 (buf!1068 (_2!1584 lt!38855))))))))

(declare-fun b!27290 () Bool)

(declare-fun e!18460 () Bool)

(declare-datatypes ((tuple2!2996 0))(
  ( (tuple2!2997 (_1!1585 BitStream!1314) (_2!1585 BitStream!1314)) )
))
(declare-fun lt!38854 () tuple2!2996)

(declare-fun lt!38852 () tuple2!2994)

(declare-datatypes ((List!358 0))(
  ( (Nil!355) (Cons!354 (h!473 Bool) (t!1108 List!358)) )
))
(declare-fun head!195 (List!358) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1314 array!1717 (_ BitVec 64) (_ BitVec 64)) List!358)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1314 BitStream!1314 (_ BitVec 64)) List!358)

(assert (=> b!27290 (= e!18460 (= (head!195 (byteArrayBitContentToList!0 (_2!1584 lt!38852) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!195 (bitStreamReadBitsIntoList!0 (_2!1584 lt!38852) (_1!1585 lt!38854) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!27291 () Bool)

(declare-fun res!23596 () Bool)

(declare-fun e!18457 () Bool)

(assert (=> b!27291 (=> res!23596 e!18457)))

(assert (=> b!27291 (= res!23596 (not (invariant!0 (currentBit!2388 (_2!1584 lt!38852)) (currentByte!2393 (_2!1584 lt!38852)) (size!741 (buf!1068 (_2!1584 lt!38855))))))))

(declare-fun b!27292 () Bool)

(declare-fun res!23609 () Bool)

(assert (=> b!27292 (=> (not res!23609) (not e!18449))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!27292 (= res!23609 (validate_offset_bits!1 ((_ sign_extend 32) (size!741 (buf!1068 thiss!1379))) ((_ sign_extend 32) (currentByte!2393 thiss!1379)) ((_ sign_extend 32) (currentBit!2388 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!27293 () Bool)

(declare-fun lt!38851 () (_ BitVec 64))

(declare-fun e!18450 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!27293 (= e!18450 (= lt!38851 (bvsub (bvsub (bvadd (bitIndex!0 (size!741 (buf!1068 (_2!1584 lt!38852))) (currentByte!2393 (_2!1584 lt!38852)) (currentBit!2388 (_2!1584 lt!38852))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!27294 () Bool)

(declare-fun e!18454 () Bool)

(declare-fun e!18452 () Bool)

(assert (=> b!27294 (= e!18454 e!18452)))

(declare-fun res!23602 () Bool)

(assert (=> b!27294 (=> res!23602 e!18452)))

(declare-fun isPrefixOf!0 (BitStream!1314 BitStream!1314) Bool)

(assert (=> b!27294 (= res!23602 (not (isPrefixOf!0 thiss!1379 (_2!1584 lt!38852))))))

(declare-fun lt!38850 () (_ BitVec 64))

(assert (=> b!27294 (validate_offset_bits!1 ((_ sign_extend 32) (size!741 (buf!1068 (_2!1584 lt!38852)))) ((_ sign_extend 32) (currentByte!2393 (_2!1584 lt!38852))) ((_ sign_extend 32) (currentBit!2388 (_2!1584 lt!38852))) lt!38850)))

(assert (=> b!27294 (= lt!38850 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38863 () Unit!2185)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1314 BitStream!1314 (_ BitVec 64) (_ BitVec 64)) Unit!2185)

(assert (=> b!27294 (= lt!38863 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1584 lt!38852) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1314 (_ BitVec 8) (_ BitVec 32)) tuple2!2994)

(assert (=> b!27294 (= lt!38852 (appendBitFromByte!0 thiss!1379 (select (arr!1203 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!27295 () Bool)

(declare-fun res!23592 () Bool)

(declare-fun e!18453 () Bool)

(assert (=> b!27295 (=> res!23592 e!18453)))

(declare-fun lt!38861 () tuple2!2996)

(assert (=> b!27295 (= res!23592 (not (isPrefixOf!0 (_1!1585 lt!38861) (_2!1584 lt!38855))))))

(declare-fun b!27296 () Bool)

(assert (=> b!27296 (= e!18453 true)))

(declare-fun lt!38858 () (_ BitVec 64))

(assert (=> b!27296 (= lt!38858 (bitIndex!0 (size!741 (buf!1068 (_1!1585 lt!38861))) (currentByte!2393 (_1!1585 lt!38861)) (currentBit!2388 (_1!1585 lt!38861))))))

(declare-fun lt!38866 () (_ BitVec 64))

(declare-fun lt!38862 () tuple2!2996)

(assert (=> b!27296 (= lt!38866 (bitIndex!0 (size!741 (buf!1068 (_1!1585 lt!38862))) (currentByte!2393 (_1!1585 lt!38862)) (currentBit!2388 (_1!1585 lt!38862))))))

(declare-fun b!27297 () Bool)

(declare-fun res!23601 () Bool)

(assert (=> b!27297 (=> res!23601 e!18453)))

(assert (=> b!27297 (= res!23601 (or (not (= (buf!1068 (_1!1585 lt!38862)) (buf!1068 (_1!1585 lt!38861)))) (not (= (buf!1068 (_1!1585 lt!38862)) (buf!1068 (_2!1584 lt!38855)))) (bvsge lt!38851 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!27298 () Bool)

(declare-fun res!23598 () Bool)

(assert (=> b!27298 (=> res!23598 e!18453)))

(assert (=> b!27298 (= res!23598 (not (isPrefixOf!0 (_1!1585 lt!38862) (_1!1585 lt!38861))))))

(declare-fun b!27299 () Bool)

(declare-fun res!23605 () Bool)

(assert (=> b!27299 (=> res!23605 e!18453)))

(assert (=> b!27299 (= res!23605 (not (isPrefixOf!0 (_1!1585 lt!38862) (_2!1584 lt!38855))))))

(declare-fun b!27300 () Bool)

(assert (=> b!27300 (= e!18457 e!18453)))

(declare-fun res!23600 () Bool)

(assert (=> b!27300 (=> res!23600 e!18453)))

(assert (=> b!27300 (= res!23600 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!38856 () List!358)

(assert (=> b!27300 (= lt!38856 (bitStreamReadBitsIntoList!0 (_2!1584 lt!38855) (_1!1585 lt!38861) lt!38850))))

(declare-fun lt!38859 () List!358)

(assert (=> b!27300 (= lt!38859 (bitStreamReadBitsIntoList!0 (_2!1584 lt!38855) (_1!1585 lt!38862) (bvsub to!314 i!635)))))

(assert (=> b!27300 (validate_offset_bits!1 ((_ sign_extend 32) (size!741 (buf!1068 (_2!1584 lt!38855)))) ((_ sign_extend 32) (currentByte!2393 (_2!1584 lt!38852))) ((_ sign_extend 32) (currentBit!2388 (_2!1584 lt!38852))) lt!38850)))

(declare-fun lt!38864 () Unit!2185)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1314 array!1717 (_ BitVec 64)) Unit!2185)

(assert (=> b!27300 (= lt!38864 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1584 lt!38852) (buf!1068 (_2!1584 lt!38855)) lt!38850))))

(declare-fun reader!0 (BitStream!1314 BitStream!1314) tuple2!2996)

(assert (=> b!27300 (= lt!38861 (reader!0 (_2!1584 lt!38852) (_2!1584 lt!38855)))))

(assert (=> b!27300 (validate_offset_bits!1 ((_ sign_extend 32) (size!741 (buf!1068 (_2!1584 lt!38855)))) ((_ sign_extend 32) (currentByte!2393 thiss!1379)) ((_ sign_extend 32) (currentBit!2388 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!38865 () Unit!2185)

(assert (=> b!27300 (= lt!38865 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1068 (_2!1584 lt!38855)) (bvsub to!314 i!635)))))

(assert (=> b!27300 (= lt!38862 (reader!0 thiss!1379 (_2!1584 lt!38855)))))

(declare-fun b!27301 () Bool)

(assert (=> b!27301 (= e!18449 (not e!18454))))

(declare-fun res!23594 () Bool)

(assert (=> b!27301 (=> res!23594 e!18454)))

(assert (=> b!27301 (= res!23594 (bvsge i!635 to!314))))

(assert (=> b!27301 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38857 () Unit!2185)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1314) Unit!2185)

(assert (=> b!27301 (= lt!38857 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!38853 () (_ BitVec 64))

(assert (=> b!27301 (= lt!38853 (bitIndex!0 (size!741 (buf!1068 thiss!1379)) (currentByte!2393 thiss!1379) (currentBit!2388 thiss!1379)))))

(declare-fun b!27302 () Bool)

(declare-fun res!23595 () Bool)

(assert (=> b!27302 (=> res!23595 e!18453)))

(declare-fun length!84 (List!358) Int)

(assert (=> b!27302 (= res!23595 (<= (length!84 lt!38859) 0))))

(declare-fun b!27303 () Bool)

(declare-fun e!18455 () Bool)

(assert (=> b!27303 (= e!18452 e!18455)))

(declare-fun res!23607 () Bool)

(assert (=> b!27303 (=> res!23607 e!18455)))

(assert (=> b!27303 (= res!23607 (not (isPrefixOf!0 (_2!1584 lt!38852) (_2!1584 lt!38855))))))

(assert (=> b!27303 (isPrefixOf!0 thiss!1379 (_2!1584 lt!38855))))

(declare-fun lt!38849 () Unit!2185)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1314 BitStream!1314 BitStream!1314) Unit!2185)

(assert (=> b!27303 (= lt!38849 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1584 lt!38852) (_2!1584 lt!38855)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1314 array!1717 (_ BitVec 64) (_ BitVec 64)) tuple2!2994)

(assert (=> b!27303 (= lt!38855 (appendBitsMSBFirstLoop!0 (_2!1584 lt!38852) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!27303 e!18460))

(declare-fun res!23610 () Bool)

(assert (=> b!27303 (=> (not res!23610) (not e!18460))))

(assert (=> b!27303 (= res!23610 (validate_offset_bits!1 ((_ sign_extend 32) (size!741 (buf!1068 (_2!1584 lt!38852)))) ((_ sign_extend 32) (currentByte!2393 thiss!1379)) ((_ sign_extend 32) (currentBit!2388 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38860 () Unit!2185)

(assert (=> b!27303 (= lt!38860 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1068 (_2!1584 lt!38852)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!27303 (= lt!38854 (reader!0 thiss!1379 (_2!1584 lt!38852)))))

(declare-fun b!27304 () Bool)

(declare-fun res!23604 () Bool)

(assert (=> b!27304 (=> res!23604 e!18457)))

(assert (=> b!27304 (= res!23604 (not (invariant!0 (currentBit!2388 (_2!1584 lt!38852)) (currentByte!2393 (_2!1584 lt!38852)) (size!741 (buf!1068 (_2!1584 lt!38852))))))))

(declare-fun b!27305 () Bool)

(assert (=> b!27305 (= e!18455 e!18458)))

(declare-fun res!23597 () Bool)

(assert (=> b!27305 (=> res!23597 e!18458)))

(assert (=> b!27305 (= res!23597 (not (= lt!38851 (bvsub (bvadd lt!38853 to!314) i!635))))))

(assert (=> b!27305 (= lt!38851 (bitIndex!0 (size!741 (buf!1068 (_2!1584 lt!38855))) (currentByte!2393 (_2!1584 lt!38855)) (currentBit!2388 (_2!1584 lt!38855))))))

(declare-fun b!27306 () Bool)

(assert (=> b!27306 (= e!18456 (array_inv!710 (buf!1068 thiss!1379)))))

(declare-fun b!27307 () Bool)

(assert (=> b!27307 (= e!18458 e!18457)))

(declare-fun res!23593 () Bool)

(assert (=> b!27307 (=> res!23593 e!18457)))

(assert (=> b!27307 (= res!23593 (not (= (size!741 (buf!1068 (_2!1584 lt!38852))) (size!741 (buf!1068 (_2!1584 lt!38855))))))))

(assert (=> b!27307 e!18450))

(declare-fun res!23599 () Bool)

(assert (=> b!27307 (=> (not res!23599) (not e!18450))))

(assert (=> b!27307 (= res!23599 (= (size!741 (buf!1068 (_2!1584 lt!38855))) (size!741 (buf!1068 thiss!1379))))))

(assert (= (and start!5980 res!23603) b!27292))

(assert (= (and b!27292 res!23609) b!27301))

(assert (= (and b!27301 (not res!23594)) b!27294))

(assert (= (and b!27294 (not res!23602)) b!27303))

(assert (= (and b!27303 res!23610) b!27290))

(assert (= (and b!27303 (not res!23607)) b!27305))

(assert (= (and b!27305 (not res!23597)) b!27289))

(assert (= (and b!27289 (not res!23606)) b!27288))

(assert (= (and b!27288 (not res!23608)) b!27307))

(assert (= (and b!27307 res!23599) b!27293))

(assert (= (and b!27307 (not res!23593)) b!27304))

(assert (= (and b!27304 (not res!23604)) b!27291))

(assert (= (and b!27291 (not res!23596)) b!27300))

(assert (= (and b!27300 (not res!23600)) b!27302))

(assert (= (and b!27302 (not res!23595)) b!27299))

(assert (= (and b!27299 (not res!23605)) b!27295))

(assert (= (and b!27295 (not res!23592)) b!27298))

(assert (= (and b!27298 (not res!23598)) b!27297))

(assert (= (and b!27297 (not res!23601)) b!27296))

(assert (= start!5980 b!27306))

(declare-fun m!39105 () Bool)

(assert (=> b!27305 m!39105))

(declare-fun m!39107 () Bool)

(assert (=> b!27299 m!39107))

(declare-fun m!39109 () Bool)

(assert (=> b!27294 m!39109))

(declare-fun m!39111 () Bool)

(assert (=> b!27294 m!39111))

(declare-fun m!39113 () Bool)

(assert (=> b!27294 m!39113))

(declare-fun m!39115 () Bool)

(assert (=> b!27294 m!39115))

(assert (=> b!27294 m!39109))

(declare-fun m!39117 () Bool)

(assert (=> b!27294 m!39117))

(declare-fun m!39119 () Bool)

(assert (=> b!27295 m!39119))

(declare-fun m!39121 () Bool)

(assert (=> b!27291 m!39121))

(declare-fun m!39123 () Bool)

(assert (=> b!27290 m!39123))

(assert (=> b!27290 m!39123))

(declare-fun m!39125 () Bool)

(assert (=> b!27290 m!39125))

(declare-fun m!39127 () Bool)

(assert (=> b!27290 m!39127))

(assert (=> b!27290 m!39127))

(declare-fun m!39129 () Bool)

(assert (=> b!27290 m!39129))

(declare-fun m!39131 () Bool)

(assert (=> b!27303 m!39131))

(declare-fun m!39133 () Bool)

(assert (=> b!27303 m!39133))

(declare-fun m!39135 () Bool)

(assert (=> b!27303 m!39135))

(declare-fun m!39137 () Bool)

(assert (=> b!27303 m!39137))

(declare-fun m!39139 () Bool)

(assert (=> b!27303 m!39139))

(declare-fun m!39141 () Bool)

(assert (=> b!27303 m!39141))

(declare-fun m!39143 () Bool)

(assert (=> b!27303 m!39143))

(declare-fun m!39145 () Bool)

(assert (=> b!27302 m!39145))

(declare-fun m!39147 () Bool)

(assert (=> b!27289 m!39147))

(declare-fun m!39149 () Bool)

(assert (=> b!27298 m!39149))

(declare-fun m!39151 () Bool)

(assert (=> b!27292 m!39151))

(declare-fun m!39153 () Bool)

(assert (=> b!27293 m!39153))

(declare-fun m!39155 () Bool)

(assert (=> start!5980 m!39155))

(declare-fun m!39157 () Bool)

(assert (=> start!5980 m!39157))

(declare-fun m!39159 () Bool)

(assert (=> b!27296 m!39159))

(declare-fun m!39161 () Bool)

(assert (=> b!27296 m!39161))

(declare-fun m!39163 () Bool)

(assert (=> b!27300 m!39163))

(declare-fun m!39165 () Bool)

(assert (=> b!27300 m!39165))

(declare-fun m!39167 () Bool)

(assert (=> b!27300 m!39167))

(declare-fun m!39169 () Bool)

(assert (=> b!27300 m!39169))

(declare-fun m!39171 () Bool)

(assert (=> b!27300 m!39171))

(declare-fun m!39173 () Bool)

(assert (=> b!27300 m!39173))

(declare-fun m!39175 () Bool)

(assert (=> b!27300 m!39175))

(declare-fun m!39177 () Bool)

(assert (=> b!27300 m!39177))

(declare-fun m!39179 () Bool)

(assert (=> b!27301 m!39179))

(declare-fun m!39181 () Bool)

(assert (=> b!27301 m!39181))

(declare-fun m!39183 () Bool)

(assert (=> b!27301 m!39183))

(declare-fun m!39185 () Bool)

(assert (=> b!27306 m!39185))

(declare-fun m!39187 () Bool)

(assert (=> b!27304 m!39187))

(check-sat (not start!5980) (not b!27293) (not b!27305) (not b!27304) (not b!27295) (not b!27291) (not b!27289) (not b!27292) (not b!27302) (not b!27294) (not b!27296) (not b!27303) (not b!27306) (not b!27290) (not b!27299) (not b!27298) (not b!27301) (not b!27300))
