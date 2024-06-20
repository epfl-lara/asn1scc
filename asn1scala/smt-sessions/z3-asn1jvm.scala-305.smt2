; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6004 () Bool)

(assert start!6004)

(declare-fun b!28008 () Bool)

(declare-fun res!24292 () Bool)

(declare-fun e!18883 () Bool)

(assert (=> b!28008 (=> (not res!24292) (not e!18883))))

(declare-datatypes ((array!1741 0))(
  ( (array!1742 (arr!1215 (Array (_ BitVec 32) (_ BitVec 8))) (size!753 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1338 0))(
  ( (BitStream!1339 (buf!1080 array!1741) (currentByte!2405 (_ BitVec 32)) (currentBit!2400 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1338)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!28008 (= res!24292 (validate_offset_bits!1 ((_ sign_extend 32) (size!753 (buf!1080 thiss!1379))) ((_ sign_extend 32) (currentByte!2405 thiss!1379)) ((_ sign_extend 32) (currentBit!2400 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!28009 () Bool)

(declare-fun res!24278 () Bool)

(declare-fun e!18886 () Bool)

(assert (=> b!28009 (=> res!24278 e!18886)))

(declare-datatypes ((tuple2!3042 0))(
  ( (tuple2!3043 (_1!1608 BitStream!1338) (_2!1608 BitStream!1338)) )
))
(declare-fun lt!39514 () tuple2!3042)

(declare-datatypes ((Unit!2209 0))(
  ( (Unit!2210) )
))
(declare-datatypes ((tuple2!3044 0))(
  ( (tuple2!3045 (_1!1609 Unit!2209) (_2!1609 BitStream!1338)) )
))
(declare-fun lt!39503 () tuple2!3044)

(declare-fun isPrefixOf!0 (BitStream!1338 BitStream!1338) Bool)

(assert (=> b!28009 (= res!24278 (not (isPrefixOf!0 (_1!1608 lt!39514) (_2!1609 lt!39503))))))

(declare-fun srcBuffer!2 () array!1741)

(declare-fun lt!39512 () tuple2!3044)

(declare-fun e!18881 () Bool)

(declare-fun lt!39500 () tuple2!3042)

(declare-fun b!28010 () Bool)

(declare-datatypes ((List!370 0))(
  ( (Nil!367) (Cons!366 (h!485 Bool) (t!1120 List!370)) )
))
(declare-fun head!207 (List!370) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1338 array!1741 (_ BitVec 64) (_ BitVec 64)) List!370)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1338 BitStream!1338 (_ BitVec 64)) List!370)

(assert (=> b!28010 (= e!18881 (= (head!207 (byteArrayBitContentToList!0 (_2!1609 lt!39512) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!207 (bitStreamReadBitsIntoList!0 (_2!1609 lt!39512) (_1!1608 lt!39500) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!28011 () Bool)

(declare-fun e!18889 () Bool)

(declare-fun e!18891 () Bool)

(assert (=> b!28011 (= e!18889 e!18891)))

(declare-fun res!24280 () Bool)

(assert (=> b!28011 (=> res!24280 e!18891)))

(assert (=> b!28011 (= res!24280 (not (isPrefixOf!0 (_2!1609 lt!39512) (_2!1609 lt!39503))))))

(assert (=> b!28011 (isPrefixOf!0 thiss!1379 (_2!1609 lt!39503))))

(declare-fun lt!39513 () Unit!2209)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1338 BitStream!1338 BitStream!1338) Unit!2209)

(assert (=> b!28011 (= lt!39513 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1609 lt!39512) (_2!1609 lt!39503)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1338 array!1741 (_ BitVec 64) (_ BitVec 64)) tuple2!3044)

(assert (=> b!28011 (= lt!39503 (appendBitsMSBFirstLoop!0 (_2!1609 lt!39512) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!28011 e!18881))

(declare-fun res!24285 () Bool)

(assert (=> b!28011 (=> (not res!24285) (not e!18881))))

(assert (=> b!28011 (= res!24285 (validate_offset_bits!1 ((_ sign_extend 32) (size!753 (buf!1080 (_2!1609 lt!39512)))) ((_ sign_extend 32) (currentByte!2405 thiss!1379)) ((_ sign_extend 32) (currentBit!2400 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39505 () Unit!2209)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1338 array!1741 (_ BitVec 64)) Unit!2209)

(assert (=> b!28011 (= lt!39505 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1080 (_2!1609 lt!39512)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1338 BitStream!1338) tuple2!3042)

(assert (=> b!28011 (= lt!39500 (reader!0 thiss!1379 (_2!1609 lt!39512)))))

(declare-fun b!28012 () Bool)

(declare-fun e!18885 () Bool)

(assert (=> b!28012 (= e!18885 e!18886)))

(declare-fun res!24289 () Bool)

(assert (=> b!28012 (=> res!24289 e!18886)))

(assert (=> b!28012 (= res!24289 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!39510 () List!370)

(declare-fun lt!39508 () (_ BitVec 64))

(assert (=> b!28012 (= lt!39510 (bitStreamReadBitsIntoList!0 (_2!1609 lt!39503) (_1!1608 lt!39514) lt!39508))))

(declare-fun lt!39497 () List!370)

(declare-fun lt!39499 () tuple2!3042)

(assert (=> b!28012 (= lt!39497 (bitStreamReadBitsIntoList!0 (_2!1609 lt!39503) (_1!1608 lt!39499) (bvsub to!314 i!635)))))

(assert (=> b!28012 (validate_offset_bits!1 ((_ sign_extend 32) (size!753 (buf!1080 (_2!1609 lt!39503)))) ((_ sign_extend 32) (currentByte!2405 (_2!1609 lt!39512))) ((_ sign_extend 32) (currentBit!2400 (_2!1609 lt!39512))) lt!39508)))

(declare-fun lt!39501 () Unit!2209)

(assert (=> b!28012 (= lt!39501 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1609 lt!39512) (buf!1080 (_2!1609 lt!39503)) lt!39508))))

(assert (=> b!28012 (= lt!39514 (reader!0 (_2!1609 lt!39512) (_2!1609 lt!39503)))))

(assert (=> b!28012 (validate_offset_bits!1 ((_ sign_extend 32) (size!753 (buf!1080 (_2!1609 lt!39503)))) ((_ sign_extend 32) (currentByte!2405 thiss!1379)) ((_ sign_extend 32) (currentBit!2400 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!39506 () Unit!2209)

(assert (=> b!28012 (= lt!39506 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1080 (_2!1609 lt!39503)) (bvsub to!314 i!635)))))

(assert (=> b!28012 (= lt!39499 (reader!0 thiss!1379 (_2!1609 lt!39503)))))

(declare-fun b!28013 () Bool)

(declare-fun res!24294 () Bool)

(declare-fun e!18882 () Bool)

(assert (=> b!28013 (=> res!24294 e!18882)))

(assert (=> b!28013 (= res!24294 (not (= (size!753 (buf!1080 thiss!1379)) (size!753 (buf!1080 (_2!1609 lt!39503))))))))

(declare-fun b!28014 () Bool)

(declare-fun e!18887 () Bool)

(assert (=> b!28014 (= e!18887 e!18889)))

(declare-fun res!24276 () Bool)

(assert (=> b!28014 (=> res!24276 e!18889)))

(assert (=> b!28014 (= res!24276 (not (isPrefixOf!0 thiss!1379 (_2!1609 lt!39512))))))

(assert (=> b!28014 (validate_offset_bits!1 ((_ sign_extend 32) (size!753 (buf!1080 (_2!1609 lt!39512)))) ((_ sign_extend 32) (currentByte!2405 (_2!1609 lt!39512))) ((_ sign_extend 32) (currentBit!2400 (_2!1609 lt!39512))) lt!39508)))

(assert (=> b!28014 (= lt!39508 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39502 () Unit!2209)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1338 BitStream!1338 (_ BitVec 64) (_ BitVec 64)) Unit!2209)

(assert (=> b!28014 (= lt!39502 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1609 lt!39512) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1338 (_ BitVec 8) (_ BitVec 32)) tuple2!3044)

(assert (=> b!28014 (= lt!39512 (appendBitFromByte!0 thiss!1379 (select (arr!1215 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!28015 () Bool)

(assert (=> b!28015 (= e!18886 true)))

(declare-fun lt!39498 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!28015 (= lt!39498 (bitIndex!0 (size!753 (buf!1080 (_1!1608 lt!39514))) (currentByte!2405 (_1!1608 lt!39514)) (currentBit!2400 (_1!1608 lt!39514))))))

(declare-fun lt!39511 () (_ BitVec 64))

(assert (=> b!28015 (= lt!39511 (bitIndex!0 (size!753 (buf!1080 (_1!1608 lt!39499))) (currentByte!2405 (_1!1608 lt!39499)) (currentBit!2400 (_1!1608 lt!39499))))))

(declare-fun b!28016 () Bool)

(declare-fun res!24287 () Bool)

(assert (=> b!28016 (=> res!24287 e!18885)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!28016 (= res!24287 (not (invariant!0 (currentBit!2400 (_2!1609 lt!39512)) (currentByte!2405 (_2!1609 lt!39512)) (size!753 (buf!1080 (_2!1609 lt!39512))))))))

(declare-fun res!24277 () Bool)

(assert (=> start!6004 (=> (not res!24277) (not e!18883))))

(assert (=> start!6004 (= res!24277 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!753 srcBuffer!2))))))))

(assert (=> start!6004 e!18883))

(assert (=> start!6004 true))

(declare-fun array_inv!722 (array!1741) Bool)

(assert (=> start!6004 (array_inv!722 srcBuffer!2)))

(declare-fun e!18888 () Bool)

(declare-fun inv!12 (BitStream!1338) Bool)

(assert (=> start!6004 (and (inv!12 thiss!1379) e!18888)))

(declare-fun b!28017 () Bool)

(declare-fun res!24281 () Bool)

(assert (=> b!28017 (=> res!24281 e!18886)))

(declare-fun length!96 (List!370) Int)

(assert (=> b!28017 (= res!24281 (<= (length!96 lt!39497) 0))))

(declare-fun b!28018 () Bool)

(assert (=> b!28018 (= e!18891 e!18882)))

(declare-fun res!24283 () Bool)

(assert (=> b!28018 (=> res!24283 e!18882)))

(declare-fun lt!39504 () (_ BitVec 64))

(declare-fun lt!39509 () (_ BitVec 64))

(assert (=> b!28018 (= res!24283 (not (= lt!39504 (bvsub (bvadd lt!39509 to!314) i!635))))))

(assert (=> b!28018 (= lt!39504 (bitIndex!0 (size!753 (buf!1080 (_2!1609 lt!39503))) (currentByte!2405 (_2!1609 lt!39503)) (currentBit!2400 (_2!1609 lt!39503))))))

(declare-fun b!28019 () Bool)

(declare-fun res!24282 () Bool)

(assert (=> b!28019 (=> res!24282 e!18886)))

(assert (=> b!28019 (= res!24282 (not (isPrefixOf!0 (_1!1608 lt!39499) (_1!1608 lt!39514))))))

(declare-fun b!28020 () Bool)

(assert (=> b!28020 (= e!18882 e!18885)))

(declare-fun res!24288 () Bool)

(assert (=> b!28020 (=> res!24288 e!18885)))

(assert (=> b!28020 (= res!24288 (not (= (size!753 (buf!1080 (_2!1609 lt!39512))) (size!753 (buf!1080 (_2!1609 lt!39503))))))))

(declare-fun e!18892 () Bool)

(assert (=> b!28020 e!18892))

(declare-fun res!24284 () Bool)

(assert (=> b!28020 (=> (not res!24284) (not e!18892))))

(assert (=> b!28020 (= res!24284 (= (size!753 (buf!1080 (_2!1609 lt!39503))) (size!753 (buf!1080 thiss!1379))))))

(declare-fun b!28021 () Bool)

(assert (=> b!28021 (= e!18892 (= lt!39504 (bvsub (bvsub (bvadd (bitIndex!0 (size!753 (buf!1080 (_2!1609 lt!39512))) (currentByte!2405 (_2!1609 lt!39512)) (currentBit!2400 (_2!1609 lt!39512))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!28022 () Bool)

(declare-fun res!24293 () Bool)

(assert (=> b!28022 (=> res!24293 e!18885)))

(assert (=> b!28022 (= res!24293 (not (invariant!0 (currentBit!2400 (_2!1609 lt!39512)) (currentByte!2405 (_2!1609 lt!39512)) (size!753 (buf!1080 (_2!1609 lt!39503))))))))

(declare-fun b!28023 () Bool)

(declare-fun res!24290 () Bool)

(assert (=> b!28023 (=> res!24290 e!18882)))

(assert (=> b!28023 (= res!24290 (not (invariant!0 (currentBit!2400 (_2!1609 lt!39503)) (currentByte!2405 (_2!1609 lt!39503)) (size!753 (buf!1080 (_2!1609 lt!39503))))))))

(declare-fun b!28024 () Bool)

(assert (=> b!28024 (= e!18883 (not e!18887))))

(declare-fun res!24291 () Bool)

(assert (=> b!28024 (=> res!24291 e!18887)))

(assert (=> b!28024 (= res!24291 (bvsge i!635 to!314))))

(assert (=> b!28024 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!39507 () Unit!2209)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1338) Unit!2209)

(assert (=> b!28024 (= lt!39507 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!28024 (= lt!39509 (bitIndex!0 (size!753 (buf!1080 thiss!1379)) (currentByte!2405 thiss!1379) (currentBit!2400 thiss!1379)))))

(declare-fun b!28025 () Bool)

(declare-fun res!24286 () Bool)

(assert (=> b!28025 (=> res!24286 e!18886)))

(assert (=> b!28025 (= res!24286 (not (isPrefixOf!0 (_1!1608 lt!39499) (_2!1609 lt!39503))))))

(declare-fun b!28026 () Bool)

(declare-fun res!24279 () Bool)

(assert (=> b!28026 (=> res!24279 e!18886)))

(assert (=> b!28026 (= res!24279 (or (not (= (buf!1080 (_1!1608 lt!39499)) (buf!1080 (_1!1608 lt!39514)))) (not (= (buf!1080 (_1!1608 lt!39499)) (buf!1080 (_2!1609 lt!39503)))) (bvsge lt!39504 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!28027 () Bool)

(assert (=> b!28027 (= e!18888 (array_inv!722 (buf!1080 thiss!1379)))))

(assert (= (and start!6004 res!24277) b!28008))

(assert (= (and b!28008 res!24292) b!28024))

(assert (= (and b!28024 (not res!24291)) b!28014))

(assert (= (and b!28014 (not res!24276)) b!28011))

(assert (= (and b!28011 res!24285) b!28010))

(assert (= (and b!28011 (not res!24280)) b!28018))

(assert (= (and b!28018 (not res!24283)) b!28023))

(assert (= (and b!28023 (not res!24290)) b!28013))

(assert (= (and b!28013 (not res!24294)) b!28020))

(assert (= (and b!28020 res!24284) b!28021))

(assert (= (and b!28020 (not res!24288)) b!28016))

(assert (= (and b!28016 (not res!24287)) b!28022))

(assert (= (and b!28022 (not res!24293)) b!28012))

(assert (= (and b!28012 (not res!24289)) b!28017))

(assert (= (and b!28017 (not res!24281)) b!28025))

(assert (= (and b!28025 (not res!24286)) b!28009))

(assert (= (and b!28009 (not res!24278)) b!28019))

(assert (= (and b!28019 (not res!24282)) b!28026))

(assert (= (and b!28026 (not res!24279)) b!28015))

(assert (= start!6004 b!28027))

(declare-fun m!40113 () Bool)

(assert (=> b!28011 m!40113))

(declare-fun m!40115 () Bool)

(assert (=> b!28011 m!40115))

(declare-fun m!40117 () Bool)

(assert (=> b!28011 m!40117))

(declare-fun m!40119 () Bool)

(assert (=> b!28011 m!40119))

(declare-fun m!40121 () Bool)

(assert (=> b!28011 m!40121))

(declare-fun m!40123 () Bool)

(assert (=> b!28011 m!40123))

(declare-fun m!40125 () Bool)

(assert (=> b!28011 m!40125))

(declare-fun m!40127 () Bool)

(assert (=> b!28009 m!40127))

(declare-fun m!40129 () Bool)

(assert (=> b!28022 m!40129))

(declare-fun m!40131 () Bool)

(assert (=> start!6004 m!40131))

(declare-fun m!40133 () Bool)

(assert (=> start!6004 m!40133))

(declare-fun m!40135 () Bool)

(assert (=> b!28010 m!40135))

(assert (=> b!28010 m!40135))

(declare-fun m!40137 () Bool)

(assert (=> b!28010 m!40137))

(declare-fun m!40139 () Bool)

(assert (=> b!28010 m!40139))

(assert (=> b!28010 m!40139))

(declare-fun m!40141 () Bool)

(assert (=> b!28010 m!40141))

(declare-fun m!40143 () Bool)

(assert (=> b!28016 m!40143))

(declare-fun m!40145 () Bool)

(assert (=> b!28021 m!40145))

(declare-fun m!40147 () Bool)

(assert (=> b!28012 m!40147))

(declare-fun m!40149 () Bool)

(assert (=> b!28012 m!40149))

(declare-fun m!40151 () Bool)

(assert (=> b!28012 m!40151))

(declare-fun m!40153 () Bool)

(assert (=> b!28012 m!40153))

(declare-fun m!40155 () Bool)

(assert (=> b!28012 m!40155))

(declare-fun m!40157 () Bool)

(assert (=> b!28012 m!40157))

(declare-fun m!40159 () Bool)

(assert (=> b!28012 m!40159))

(declare-fun m!40161 () Bool)

(assert (=> b!28012 m!40161))

(declare-fun m!40163 () Bool)

(assert (=> b!28015 m!40163))

(declare-fun m!40165 () Bool)

(assert (=> b!28015 m!40165))

(declare-fun m!40167 () Bool)

(assert (=> b!28025 m!40167))

(declare-fun m!40169 () Bool)

(assert (=> b!28008 m!40169))

(declare-fun m!40171 () Bool)

(assert (=> b!28019 m!40171))

(declare-fun m!40173 () Bool)

(assert (=> b!28023 m!40173))

(declare-fun m!40175 () Bool)

(assert (=> b!28017 m!40175))

(declare-fun m!40177 () Bool)

(assert (=> b!28024 m!40177))

(declare-fun m!40179 () Bool)

(assert (=> b!28024 m!40179))

(declare-fun m!40181 () Bool)

(assert (=> b!28024 m!40181))

(declare-fun m!40183 () Bool)

(assert (=> b!28014 m!40183))

(declare-fun m!40185 () Bool)

(assert (=> b!28014 m!40185))

(declare-fun m!40187 () Bool)

(assert (=> b!28014 m!40187))

(declare-fun m!40189 () Bool)

(assert (=> b!28014 m!40189))

(declare-fun m!40191 () Bool)

(assert (=> b!28014 m!40191))

(assert (=> b!28014 m!40187))

(declare-fun m!40193 () Bool)

(assert (=> b!28018 m!40193))

(declare-fun m!40195 () Bool)

(assert (=> b!28027 m!40195))

(check-sat (not b!28009) (not b!28008) (not b!28017) (not b!28023) (not b!28016) (not b!28010) (not b!28018) (not b!28025) (not b!28021) (not b!28024) (not b!28011) (not b!28015) (not b!28022) (not b!28012) (not start!6004) (not b!28019) (not b!28014) (not b!28027))
