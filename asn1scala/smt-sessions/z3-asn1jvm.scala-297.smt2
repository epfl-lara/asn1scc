; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5956 () Bool)

(assert start!5956)

(declare-fun b!26568 () Bool)

(declare-fun res!22922 () Bool)

(declare-fun e!18018 () Bool)

(assert (=> b!26568 (=> res!22922 e!18018)))

(declare-datatypes ((array!1693 0))(
  ( (array!1694 (arr!1191 (Array (_ BitVec 32) (_ BitVec 8))) (size!729 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1290 0))(
  ( (BitStream!1291 (buf!1056 array!1693) (currentByte!2381 (_ BitVec 32)) (currentBit!2376 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2946 0))(
  ( (tuple2!2947 (_1!1560 BitStream!1290) (_2!1560 BitStream!1290)) )
))
(declare-fun lt!38215 () tuple2!2946)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((Unit!2161 0))(
  ( (Unit!2162) )
))
(declare-datatypes ((tuple2!2948 0))(
  ( (tuple2!2949 (_1!1561 Unit!2161) (_2!1561 BitStream!1290)) )
))
(declare-fun lt!38214 () tuple2!2948)

(declare-fun lt!38205 () tuple2!2946)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!38203 () (_ BitVec 64))

(assert (=> b!26568 (= res!22922 (or (not (= (buf!1056 (_1!1560 lt!38205)) (buf!1056 (_1!1560 lt!38215)))) (not (= (buf!1056 (_1!1560 lt!38205)) (buf!1056 (_2!1561 lt!38214)))) (bvsge lt!38203 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!26569 () Bool)

(declare-fun e!18028 () Bool)

(declare-fun e!18021 () Bool)

(assert (=> b!26569 (= e!18028 e!18021)))

(declare-fun res!22918 () Bool)

(assert (=> b!26569 (=> res!22918 e!18021)))

(declare-fun thiss!1379 () BitStream!1290)

(declare-fun lt!38202 () tuple2!2948)

(declare-fun isPrefixOf!0 (BitStream!1290 BitStream!1290) Bool)

(assert (=> b!26569 (= res!22918 (not (isPrefixOf!0 thiss!1379 (_2!1561 lt!38202))))))

(declare-fun lt!38211 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!26569 (validate_offset_bits!1 ((_ sign_extend 32) (size!729 (buf!1056 (_2!1561 lt!38202)))) ((_ sign_extend 32) (currentByte!2381 (_2!1561 lt!38202))) ((_ sign_extend 32) (currentBit!2376 (_2!1561 lt!38202))) lt!38211)))

(assert (=> b!26569 (= lt!38211 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38209 () Unit!2161)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1290 BitStream!1290 (_ BitVec 64) (_ BitVec 64)) Unit!2161)

(assert (=> b!26569 (= lt!38209 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1561 lt!38202) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1693)

(declare-fun appendBitFromByte!0 (BitStream!1290 (_ BitVec 8) (_ BitVec 32)) tuple2!2948)

(assert (=> b!26569 (= lt!38202 (appendBitFromByte!0 thiss!1379 (select (arr!1191 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!26570 () Bool)

(declare-fun res!22926 () Bool)

(assert (=> b!26570 (=> res!22926 e!18018)))

(declare-datatypes ((List!346 0))(
  ( (Nil!343) (Cons!342 (h!461 Bool) (t!1096 List!346)) )
))
(declare-fun lt!38201 () List!346)

(declare-fun length!72 (List!346) Int)

(assert (=> b!26570 (= res!22926 (<= (length!72 lt!38201) 0))))

(declare-fun b!26571 () Bool)

(declare-fun res!22910 () Bool)

(declare-fun e!18024 () Bool)

(assert (=> b!26571 (=> res!22910 e!18024)))

(assert (=> b!26571 (= res!22910 (not (= (size!729 (buf!1056 thiss!1379)) (size!729 (buf!1056 (_2!1561 lt!38214))))))))

(declare-fun b!26572 () Bool)

(declare-fun e!18019 () Bool)

(assert (=> b!26572 (= e!18021 e!18019)))

(declare-fun res!22917 () Bool)

(assert (=> b!26572 (=> res!22917 e!18019)))

(assert (=> b!26572 (= res!22917 (not (isPrefixOf!0 (_2!1561 lt!38202) (_2!1561 lt!38214))))))

(assert (=> b!26572 (isPrefixOf!0 thiss!1379 (_2!1561 lt!38214))))

(declare-fun lt!38208 () Unit!2161)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1290 BitStream!1290 BitStream!1290) Unit!2161)

(assert (=> b!26572 (= lt!38208 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1561 lt!38202) (_2!1561 lt!38214)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1290 array!1693 (_ BitVec 64) (_ BitVec 64)) tuple2!2948)

(assert (=> b!26572 (= lt!38214 (appendBitsMSBFirstLoop!0 (_2!1561 lt!38202) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!18022 () Bool)

(assert (=> b!26572 e!18022))

(declare-fun res!22925 () Bool)

(assert (=> b!26572 (=> (not res!22925) (not e!18022))))

(assert (=> b!26572 (= res!22925 (validate_offset_bits!1 ((_ sign_extend 32) (size!729 (buf!1056 (_2!1561 lt!38202)))) ((_ sign_extend 32) (currentByte!2381 thiss!1379)) ((_ sign_extend 32) (currentBit!2376 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38210 () Unit!2161)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1290 array!1693 (_ BitVec 64)) Unit!2161)

(assert (=> b!26572 (= lt!38210 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1056 (_2!1561 lt!38202)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38218 () tuple2!2946)

(declare-fun reader!0 (BitStream!1290 BitStream!1290) tuple2!2946)

(assert (=> b!26572 (= lt!38218 (reader!0 thiss!1379 (_2!1561 lt!38202)))))

(declare-fun b!26573 () Bool)

(declare-fun head!183 (List!346) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1290 array!1693 (_ BitVec 64) (_ BitVec 64)) List!346)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1290 BitStream!1290 (_ BitVec 64)) List!346)

(assert (=> b!26573 (= e!18022 (= (head!183 (byteArrayBitContentToList!0 (_2!1561 lt!38202) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!183 (bitStreamReadBitsIntoList!0 (_2!1561 lt!38202) (_1!1560 lt!38218) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!26574 () Bool)

(declare-fun res!22913 () Bool)

(assert (=> b!26574 (=> res!22913 e!18018)))

(assert (=> b!26574 (= res!22913 (not (isPrefixOf!0 (_1!1560 lt!38205) (_2!1561 lt!38214))))))

(declare-fun b!26575 () Bool)

(declare-fun e!18023 () Bool)

(assert (=> b!26575 (= e!18023 e!18018)))

(declare-fun res!22916 () Bool)

(assert (=> b!26575 (=> res!22916 e!18018)))

(assert (=> b!26575 (= res!22916 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!38216 () List!346)

(assert (=> b!26575 (= lt!38216 (bitStreamReadBitsIntoList!0 (_2!1561 lt!38214) (_1!1560 lt!38215) lt!38211))))

(assert (=> b!26575 (= lt!38201 (bitStreamReadBitsIntoList!0 (_2!1561 lt!38214) (_1!1560 lt!38205) (bvsub to!314 i!635)))))

(assert (=> b!26575 (validate_offset_bits!1 ((_ sign_extend 32) (size!729 (buf!1056 (_2!1561 lt!38214)))) ((_ sign_extend 32) (currentByte!2381 (_2!1561 lt!38202))) ((_ sign_extend 32) (currentBit!2376 (_2!1561 lt!38202))) lt!38211)))

(declare-fun lt!38206 () Unit!2161)

(assert (=> b!26575 (= lt!38206 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1561 lt!38202) (buf!1056 (_2!1561 lt!38214)) lt!38211))))

(assert (=> b!26575 (= lt!38215 (reader!0 (_2!1561 lt!38202) (_2!1561 lt!38214)))))

(assert (=> b!26575 (validate_offset_bits!1 ((_ sign_extend 32) (size!729 (buf!1056 (_2!1561 lt!38214)))) ((_ sign_extend 32) (currentByte!2381 thiss!1379)) ((_ sign_extend 32) (currentBit!2376 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!38204 () Unit!2161)

(assert (=> b!26575 (= lt!38204 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1056 (_2!1561 lt!38214)) (bvsub to!314 i!635)))))

(assert (=> b!26575 (= lt!38205 (reader!0 thiss!1379 (_2!1561 lt!38214)))))

(declare-fun b!26576 () Bool)

(assert (=> b!26576 (= e!18019 e!18024)))

(declare-fun res!22924 () Bool)

(assert (=> b!26576 (=> res!22924 e!18024)))

(declare-fun lt!38212 () (_ BitVec 64))

(assert (=> b!26576 (= res!22924 (not (= lt!38203 (bvsub (bvadd lt!38212 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!26576 (= lt!38203 (bitIndex!0 (size!729 (buf!1056 (_2!1561 lt!38214))) (currentByte!2381 (_2!1561 lt!38214)) (currentBit!2376 (_2!1561 lt!38214))))))

(declare-fun e!18027 () Bool)

(declare-fun b!26577 () Bool)

(assert (=> b!26577 (= e!18027 (= lt!38203 (bvsub (bvsub (bvadd (bitIndex!0 (size!729 (buf!1056 (_2!1561 lt!38202))) (currentByte!2381 (_2!1561 lt!38202)) (currentBit!2376 (_2!1561 lt!38202))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!26578 () Bool)

(declare-fun res!22919 () Bool)

(declare-fun e!18020 () Bool)

(assert (=> b!26578 (=> (not res!22919) (not e!18020))))

(assert (=> b!26578 (= res!22919 (validate_offset_bits!1 ((_ sign_extend 32) (size!729 (buf!1056 thiss!1379))) ((_ sign_extend 32) (currentByte!2381 thiss!1379)) ((_ sign_extend 32) (currentBit!2376 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!26579 () Bool)

(assert (=> b!26579 (= e!18018 true)))

(declare-fun lt!38217 () (_ BitVec 64))

(assert (=> b!26579 (= lt!38217 (bitIndex!0 (size!729 (buf!1056 (_1!1560 lt!38215))) (currentByte!2381 (_1!1560 lt!38215)) (currentBit!2376 (_1!1560 lt!38215))))))

(declare-fun lt!38213 () (_ BitVec 64))

(assert (=> b!26579 (= lt!38213 (bitIndex!0 (size!729 (buf!1056 (_1!1560 lt!38205))) (currentByte!2381 (_1!1560 lt!38205)) (currentBit!2376 (_1!1560 lt!38205))))))

(declare-fun b!26580 () Bool)

(declare-fun res!22920 () Bool)

(assert (=> b!26580 (=> res!22920 e!18018)))

(assert (=> b!26580 (= res!22920 (not (isPrefixOf!0 (_1!1560 lt!38205) (_1!1560 lt!38215))))))

(declare-fun b!26581 () Bool)

(declare-fun res!22915 () Bool)

(assert (=> b!26581 (=> res!22915 e!18024)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!26581 (= res!22915 (not (invariant!0 (currentBit!2376 (_2!1561 lt!38214)) (currentByte!2381 (_2!1561 lt!38214)) (size!729 (buf!1056 (_2!1561 lt!38214))))))))

(declare-fun b!26582 () Bool)

(declare-fun e!18017 () Bool)

(declare-fun array_inv!698 (array!1693) Bool)

(assert (=> b!26582 (= e!18017 (array_inv!698 (buf!1056 thiss!1379)))))

(declare-fun b!26583 () Bool)

(declare-fun res!22923 () Bool)

(assert (=> b!26583 (=> res!22923 e!18023)))

(assert (=> b!26583 (= res!22923 (not (invariant!0 (currentBit!2376 (_2!1561 lt!38202)) (currentByte!2381 (_2!1561 lt!38202)) (size!729 (buf!1056 (_2!1561 lt!38214))))))))

(declare-fun b!26584 () Bool)

(assert (=> b!26584 (= e!18024 e!18023)))

(declare-fun res!22921 () Bool)

(assert (=> b!26584 (=> res!22921 e!18023)))

(assert (=> b!26584 (= res!22921 (not (= (size!729 (buf!1056 (_2!1561 lt!38202))) (size!729 (buf!1056 (_2!1561 lt!38214))))))))

(assert (=> b!26584 e!18027))

(declare-fun res!22912 () Bool)

(assert (=> b!26584 (=> (not res!22912) (not e!18027))))

(assert (=> b!26584 (= res!22912 (= (size!729 (buf!1056 (_2!1561 lt!38214))) (size!729 (buf!1056 thiss!1379))))))

(declare-fun b!26585 () Bool)

(declare-fun res!22911 () Bool)

(assert (=> b!26585 (=> res!22911 e!18023)))

(assert (=> b!26585 (= res!22911 (not (invariant!0 (currentBit!2376 (_2!1561 lt!38202)) (currentByte!2381 (_2!1561 lt!38202)) (size!729 (buf!1056 (_2!1561 lt!38202))))))))

(declare-fun res!22914 () Bool)

(assert (=> start!5956 (=> (not res!22914) (not e!18020))))

(assert (=> start!5956 (= res!22914 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!729 srcBuffer!2))))))))

(assert (=> start!5956 e!18020))

(assert (=> start!5956 true))

(assert (=> start!5956 (array_inv!698 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1290) Bool)

(assert (=> start!5956 (and (inv!12 thiss!1379) e!18017)))

(declare-fun b!26586 () Bool)

(assert (=> b!26586 (= e!18020 (not e!18028))))

(declare-fun res!22909 () Bool)

(assert (=> b!26586 (=> res!22909 e!18028)))

(assert (=> b!26586 (= res!22909 (bvsge i!635 to!314))))

(assert (=> b!26586 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38207 () Unit!2161)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1290) Unit!2161)

(assert (=> b!26586 (= lt!38207 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!26586 (= lt!38212 (bitIndex!0 (size!729 (buf!1056 thiss!1379)) (currentByte!2381 thiss!1379) (currentBit!2376 thiss!1379)))))

(declare-fun b!26587 () Bool)

(declare-fun res!22908 () Bool)

(assert (=> b!26587 (=> res!22908 e!18018)))

(assert (=> b!26587 (= res!22908 (not (isPrefixOf!0 (_1!1560 lt!38215) (_2!1561 lt!38214))))))

(assert (= (and start!5956 res!22914) b!26578))

(assert (= (and b!26578 res!22919) b!26586))

(assert (= (and b!26586 (not res!22909)) b!26569))

(assert (= (and b!26569 (not res!22918)) b!26572))

(assert (= (and b!26572 res!22925) b!26573))

(assert (= (and b!26572 (not res!22917)) b!26576))

(assert (= (and b!26576 (not res!22924)) b!26581))

(assert (= (and b!26581 (not res!22915)) b!26571))

(assert (= (and b!26571 (not res!22910)) b!26584))

(assert (= (and b!26584 res!22912) b!26577))

(assert (= (and b!26584 (not res!22921)) b!26585))

(assert (= (and b!26585 (not res!22911)) b!26583))

(assert (= (and b!26583 (not res!22923)) b!26575))

(assert (= (and b!26575 (not res!22916)) b!26570))

(assert (= (and b!26570 (not res!22926)) b!26574))

(assert (= (and b!26574 (not res!22913)) b!26587))

(assert (= (and b!26587 (not res!22908)) b!26580))

(assert (= (and b!26580 (not res!22920)) b!26568))

(assert (= (and b!26568 (not res!22922)) b!26579))

(assert (= start!5956 b!26582))

(declare-fun m!38097 () Bool)

(assert (=> b!26582 m!38097))

(declare-fun m!38099 () Bool)

(assert (=> b!26570 m!38099))

(declare-fun m!38101 () Bool)

(assert (=> b!26587 m!38101))

(declare-fun m!38103 () Bool)

(assert (=> b!26578 m!38103))

(declare-fun m!38105 () Bool)

(assert (=> b!26577 m!38105))

(declare-fun m!38107 () Bool)

(assert (=> b!26581 m!38107))

(declare-fun m!38109 () Bool)

(assert (=> start!5956 m!38109))

(declare-fun m!38111 () Bool)

(assert (=> start!5956 m!38111))

(declare-fun m!38113 () Bool)

(assert (=> b!26575 m!38113))

(declare-fun m!38115 () Bool)

(assert (=> b!26575 m!38115))

(declare-fun m!38117 () Bool)

(assert (=> b!26575 m!38117))

(declare-fun m!38119 () Bool)

(assert (=> b!26575 m!38119))

(declare-fun m!38121 () Bool)

(assert (=> b!26575 m!38121))

(declare-fun m!38123 () Bool)

(assert (=> b!26575 m!38123))

(declare-fun m!38125 () Bool)

(assert (=> b!26575 m!38125))

(declare-fun m!38127 () Bool)

(assert (=> b!26575 m!38127))

(declare-fun m!38129 () Bool)

(assert (=> b!26580 m!38129))

(declare-fun m!38131 () Bool)

(assert (=> b!26573 m!38131))

(assert (=> b!26573 m!38131))

(declare-fun m!38133 () Bool)

(assert (=> b!26573 m!38133))

(declare-fun m!38135 () Bool)

(assert (=> b!26573 m!38135))

(assert (=> b!26573 m!38135))

(declare-fun m!38137 () Bool)

(assert (=> b!26573 m!38137))

(declare-fun m!38139 () Bool)

(assert (=> b!26586 m!38139))

(declare-fun m!38141 () Bool)

(assert (=> b!26586 m!38141))

(declare-fun m!38143 () Bool)

(assert (=> b!26586 m!38143))

(declare-fun m!38145 () Bool)

(assert (=> b!26574 m!38145))

(declare-fun m!38147 () Bool)

(assert (=> b!26583 m!38147))

(declare-fun m!38149 () Bool)

(assert (=> b!26572 m!38149))

(declare-fun m!38151 () Bool)

(assert (=> b!26572 m!38151))

(declare-fun m!38153 () Bool)

(assert (=> b!26572 m!38153))

(declare-fun m!38155 () Bool)

(assert (=> b!26572 m!38155))

(declare-fun m!38157 () Bool)

(assert (=> b!26572 m!38157))

(declare-fun m!38159 () Bool)

(assert (=> b!26572 m!38159))

(declare-fun m!38161 () Bool)

(assert (=> b!26572 m!38161))

(declare-fun m!38163 () Bool)

(assert (=> b!26569 m!38163))

(declare-fun m!38165 () Bool)

(assert (=> b!26569 m!38165))

(declare-fun m!38167 () Bool)

(assert (=> b!26569 m!38167))

(assert (=> b!26569 m!38163))

(declare-fun m!38169 () Bool)

(assert (=> b!26569 m!38169))

(declare-fun m!38171 () Bool)

(assert (=> b!26569 m!38171))

(declare-fun m!38173 () Bool)

(assert (=> b!26579 m!38173))

(declare-fun m!38175 () Bool)

(assert (=> b!26579 m!38175))

(declare-fun m!38177 () Bool)

(assert (=> b!26576 m!38177))

(declare-fun m!38179 () Bool)

(assert (=> b!26585 m!38179))

(check-sat (not b!26578) (not b!26586) (not b!26582) (not b!26572) (not b!26569) (not b!26577) (not b!26583) (not b!26587) (not b!26579) (not b!26575) (not b!26576) (not b!26573) (not b!26585) (not b!26574) (not start!5956) (not b!26580) (not b!26581) (not b!26570))
