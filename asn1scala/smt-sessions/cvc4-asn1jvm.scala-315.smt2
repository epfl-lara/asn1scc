; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6888 () Bool)

(assert start!6888)

(declare-fun b!32549 () Bool)

(declare-fun res!27809 () Bool)

(declare-fun e!21524 () Bool)

(assert (=> b!32549 (=> (not res!27809) (not e!21524))))

(declare-datatypes ((array!1824 0))(
  ( (array!1825 (arr!1279 (Array (_ BitVec 32) (_ BitVec 8))) (size!804 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1400 0))(
  ( (BitStream!1401 (buf!1132 array!1824) (currentByte!2499 (_ BitVec 32)) (currentBit!2494 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1400)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!32549 (= res!27809 (validate_offset_bits!1 ((_ sign_extend 32) (size!804 (buf!1132 thiss!1379))) ((_ sign_extend 32) (currentByte!2499 thiss!1379)) ((_ sign_extend 32) (currentBit!2494 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!32550 () Bool)

(declare-fun e!21515 () Bool)

(declare-fun lt!48212 () (_ BitVec 64))

(assert (=> b!32550 (= e!21515 (bvslt i!635 lt!48212))))

(declare-fun b!32551 () Bool)

(declare-fun e!21525 () Bool)

(assert (=> b!32551 (= e!21524 (not e!21525))))

(declare-fun res!27819 () Bool)

(assert (=> b!32551 (=> res!27819 e!21525)))

(assert (=> b!32551 (= res!27819 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1400 BitStream!1400) Bool)

(assert (=> b!32551 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2463 0))(
  ( (Unit!2464) )
))
(declare-fun lt!48216 () Unit!2463)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1400) Unit!2463)

(assert (=> b!32551 (= lt!48216 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!48209 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!32551 (= lt!48209 (bitIndex!0 (size!804 (buf!1132 thiss!1379)) (currentByte!2499 thiss!1379) (currentBit!2494 thiss!1379)))))

(declare-fun b!32552 () Bool)

(declare-fun res!27822 () Bool)

(declare-fun e!21519 () Bool)

(assert (=> b!32552 (=> res!27822 e!21519)))

(declare-datatypes ((tuple2!3330 0))(
  ( (tuple2!3331 (_1!1752 Unit!2463) (_2!1752 BitStream!1400)) )
))
(declare-fun lt!48208 () tuple2!3330)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!32552 (= res!27822 (not (invariant!0 (currentBit!2494 (_2!1752 lt!48208)) (currentByte!2499 (_2!1752 lt!48208)) (size!804 (buf!1132 (_2!1752 lt!48208))))))))

(declare-fun b!32553 () Bool)

(declare-fun e!21518 () Bool)

(assert (=> b!32553 (= e!21519 e!21518)))

(declare-fun res!27816 () Bool)

(assert (=> b!32553 (=> res!27816 e!21518)))

(declare-fun lt!48210 () tuple2!3330)

(assert (=> b!32553 (= res!27816 (not (= (size!804 (buf!1132 (_2!1752 lt!48210))) (size!804 (buf!1132 (_2!1752 lt!48208))))))))

(declare-fun e!21529 () Bool)

(assert (=> b!32553 e!21529))

(declare-fun res!27812 () Bool)

(assert (=> b!32553 (=> (not res!27812) (not e!21529))))

(assert (=> b!32553 (= res!27812 (= (size!804 (buf!1132 (_2!1752 lt!48208))) (size!804 (buf!1132 thiss!1379))))))

(declare-fun b!32554 () Bool)

(declare-fun e!21523 () Bool)

(declare-fun array_inv!753 (array!1824) Bool)

(assert (=> b!32554 (= e!21523 (array_inv!753 (buf!1132 thiss!1379)))))

(declare-fun b!32555 () Bool)

(declare-fun e!21520 () Bool)

(assert (=> b!32555 (= e!21520 e!21519)))

(declare-fun res!27821 () Bool)

(assert (=> b!32555 (=> res!27821 e!21519)))

(declare-fun lt!48225 () (_ BitVec 64))

(assert (=> b!32555 (= res!27821 (not (= lt!48225 (bvsub (bvadd lt!48209 to!314) i!635))))))

(assert (=> b!32555 (= lt!48225 (bitIndex!0 (size!804 (buf!1132 (_2!1752 lt!48208))) (currentByte!2499 (_2!1752 lt!48208)) (currentBit!2494 (_2!1752 lt!48208))))))

(declare-fun b!32556 () Bool)

(declare-fun e!21528 () Bool)

(assert (=> b!32556 (= e!21525 e!21528)))

(declare-fun res!27813 () Bool)

(assert (=> b!32556 (=> res!27813 e!21528)))

(assert (=> b!32556 (= res!27813 (not (isPrefixOf!0 thiss!1379 (_2!1752 lt!48210))))))

(declare-fun lt!48215 () (_ BitVec 64))

(assert (=> b!32556 (validate_offset_bits!1 ((_ sign_extend 32) (size!804 (buf!1132 (_2!1752 lt!48210)))) ((_ sign_extend 32) (currentByte!2499 (_2!1752 lt!48210))) ((_ sign_extend 32) (currentBit!2494 (_2!1752 lt!48210))) lt!48215)))

(assert (=> b!32556 (= lt!48215 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48217 () Unit!2463)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1400 BitStream!1400 (_ BitVec 64) (_ BitVec 64)) Unit!2463)

(assert (=> b!32556 (= lt!48217 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1752 lt!48210) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1824)

(declare-fun appendBitFromByte!0 (BitStream!1400 (_ BitVec 8) (_ BitVec 32)) tuple2!3330)

(assert (=> b!32556 (= lt!48210 (appendBitFromByte!0 thiss!1379 (select (arr!1279 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!32557 () Bool)

(declare-fun res!27826 () Bool)

(assert (=> b!32557 (=> res!27826 e!21515)))

(declare-datatypes ((List!401 0))(
  ( (Nil!398) (Cons!397 (h!516 Bool) (t!1151 List!401)) )
))
(declare-fun lt!48218 () List!401)

(declare-fun lt!48220 () Bool)

(declare-fun head!238 (List!401) Bool)

(assert (=> b!32557 (= res!27826 (not (= (head!238 lt!48218) lt!48220)))))

(declare-fun b!32558 () Bool)

(declare-fun res!27814 () Bool)

(assert (=> b!32558 (=> res!27814 e!21519)))

(assert (=> b!32558 (= res!27814 (not (= (size!804 (buf!1132 thiss!1379)) (size!804 (buf!1132 (_2!1752 lt!48208))))))))

(declare-datatypes ((tuple2!3332 0))(
  ( (tuple2!3333 (_1!1753 BitStream!1400) (_2!1753 BitStream!1400)) )
))
(declare-fun lt!48221 () tuple2!3332)

(declare-fun b!32559 () Bool)

(declare-fun e!21526 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1400 array!1824 (_ BitVec 64) (_ BitVec 64)) List!401)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1400 BitStream!1400 (_ BitVec 64)) List!401)

(assert (=> b!32559 (= e!21526 (= (head!238 (byteArrayBitContentToList!0 (_2!1752 lt!48210) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!238 (bitStreamReadBitsIntoList!0 (_2!1752 lt!48210) (_1!1753 lt!48221) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!32560 () Bool)

(declare-fun e!21522 () Bool)

(assert (=> b!32560 (= e!21522 e!21515)))

(declare-fun res!27828 () Bool)

(assert (=> b!32560 (=> res!27828 e!21515)))

(declare-fun lt!48224 () tuple2!3332)

(declare-fun bitAt!0 (array!1824 (_ BitVec 64)) Bool)

(assert (=> b!32560 (= res!27828 (not (= lt!48220 (bitAt!0 (buf!1132 (_1!1753 lt!48224)) lt!48209))))))

(declare-fun lt!48219 () tuple2!3332)

(assert (=> b!32560 (= lt!48220 (bitAt!0 (buf!1132 (_1!1753 lt!48219)) lt!48209))))

(declare-fun b!32561 () Bool)

(declare-fun e!21516 () Bool)

(assert (=> b!32561 (= e!21516 e!21522)))

(declare-fun res!27810 () Bool)

(assert (=> b!32561 (=> res!27810 e!21522)))

(declare-fun lt!48226 () List!401)

(declare-fun lt!48211 () List!401)

(assert (=> b!32561 (= res!27810 (not (= lt!48226 lt!48211)))))

(assert (=> b!32561 (= lt!48211 lt!48226)))

(declare-fun tail!118 (List!401) List!401)

(assert (=> b!32561 (= lt!48226 (tail!118 lt!48218))))

(declare-fun lt!48223 () Unit!2463)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1400 BitStream!1400 BitStream!1400 BitStream!1400 (_ BitVec 64) List!401) Unit!2463)

(assert (=> b!32561 (= lt!48223 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1752 lt!48208) (_2!1752 lt!48208) (_1!1753 lt!48219) (_1!1753 lt!48224) (bvsub to!314 i!635) lt!48218))))

(declare-fun b!32562 () Bool)

(declare-fun res!27811 () Bool)

(assert (=> b!32562 (=> res!27811 e!21518)))

(assert (=> b!32562 (= res!27811 (not (invariant!0 (currentBit!2494 (_2!1752 lt!48210)) (currentByte!2499 (_2!1752 lt!48210)) (size!804 (buf!1132 (_2!1752 lt!48210))))))))

(declare-fun res!27818 () Bool)

(declare-fun e!21521 () Bool)

(assert (=> start!6888 (=> (not res!27818) (not e!21521))))

(assert (=> start!6888 (= res!27818 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (=> start!6888 e!21521))

(assert (=> start!6888 true))

(declare-fun inv!12 (BitStream!1400) Bool)

(assert (=> start!6888 (and (inv!12 thiss!1379) e!21523)))

(assert (=> start!6888 (array_inv!753 srcBuffer!2)))

(declare-fun b!32563 () Bool)

(declare-fun res!27825 () Bool)

(assert (=> b!32563 (=> res!27825 e!21518)))

(assert (=> b!32563 (= res!27825 (not (invariant!0 (currentBit!2494 (_2!1752 lt!48210)) (currentByte!2499 (_2!1752 lt!48210)) (size!804 (buf!1132 (_2!1752 lt!48208))))))))

(declare-fun b!32564 () Bool)

(assert (=> b!32564 (= e!21529 (= lt!48225 (bvsub (bvsub (bvadd (bitIndex!0 (size!804 (buf!1132 (_2!1752 lt!48210))) (currentByte!2499 (_2!1752 lt!48210)) (currentBit!2494 (_2!1752 lt!48210))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!32565 () Bool)

(assert (=> b!32565 (= e!21528 e!21520)))

(declare-fun res!27820 () Bool)

(assert (=> b!32565 (=> res!27820 e!21520)))

(assert (=> b!32565 (= res!27820 (not (isPrefixOf!0 (_2!1752 lt!48210) (_2!1752 lt!48208))))))

(assert (=> b!32565 (isPrefixOf!0 thiss!1379 (_2!1752 lt!48208))))

(declare-fun lt!48214 () Unit!2463)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1400 BitStream!1400 BitStream!1400) Unit!2463)

(assert (=> b!32565 (= lt!48214 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1752 lt!48210) (_2!1752 lt!48208)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1400 array!1824 (_ BitVec 64) (_ BitVec 64)) tuple2!3330)

(assert (=> b!32565 (= lt!48208 (appendBitsMSBFirstLoop!0 (_2!1752 lt!48210) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!32565 e!21526))

(declare-fun res!27823 () Bool)

(assert (=> b!32565 (=> (not res!27823) (not e!21526))))

(assert (=> b!32565 (= res!27823 (validate_offset_bits!1 ((_ sign_extend 32) (size!804 (buf!1132 (_2!1752 lt!48210)))) ((_ sign_extend 32) (currentByte!2499 thiss!1379)) ((_ sign_extend 32) (currentBit!2494 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48207 () Unit!2463)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1400 array!1824 (_ BitVec 64)) Unit!2463)

(assert (=> b!32565 (= lt!48207 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1132 (_2!1752 lt!48210)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1400 BitStream!1400) tuple2!3332)

(assert (=> b!32565 (= lt!48221 (reader!0 thiss!1379 (_2!1752 lt!48210)))))

(declare-fun b!32566 () Bool)

(declare-fun res!27827 () Bool)

(assert (=> b!32566 (=> res!27827 e!21516)))

(declare-fun length!127 (List!401) Int)

(assert (=> b!32566 (= res!27827 (<= (length!127 lt!48218) 0))))

(declare-fun b!32567 () Bool)

(declare-fun res!27824 () Bool)

(assert (=> b!32567 (=> res!27824 e!21515)))

(assert (=> b!32567 (= res!27824 (not (= (head!238 (byteArrayBitContentToList!0 (_2!1752 lt!48208) srcBuffer!2 i!635 (bvsub to!314 i!635))) (bitAt!0 srcBuffer!2 i!635))))))

(declare-fun b!32568 () Bool)

(assert (=> b!32568 (= e!21518 e!21516)))

(declare-fun res!27817 () Bool)

(assert (=> b!32568 (=> res!27817 e!21516)))

(assert (=> b!32568 (= res!27817 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!32568 (= lt!48211 (bitStreamReadBitsIntoList!0 (_2!1752 lt!48208) (_1!1753 lt!48224) lt!48215))))

(assert (=> b!32568 (= lt!48218 (bitStreamReadBitsIntoList!0 (_2!1752 lt!48208) (_1!1753 lt!48219) (bvsub to!314 i!635)))))

(assert (=> b!32568 (validate_offset_bits!1 ((_ sign_extend 32) (size!804 (buf!1132 (_2!1752 lt!48208)))) ((_ sign_extend 32) (currentByte!2499 (_2!1752 lt!48210))) ((_ sign_extend 32) (currentBit!2494 (_2!1752 lt!48210))) lt!48215)))

(declare-fun lt!48222 () Unit!2463)

(assert (=> b!32568 (= lt!48222 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1752 lt!48210) (buf!1132 (_2!1752 lt!48208)) lt!48215))))

(assert (=> b!32568 (= lt!48224 (reader!0 (_2!1752 lt!48210) (_2!1752 lt!48208)))))

(assert (=> b!32568 (validate_offset_bits!1 ((_ sign_extend 32) (size!804 (buf!1132 (_2!1752 lt!48208)))) ((_ sign_extend 32) (currentByte!2499 thiss!1379)) ((_ sign_extend 32) (currentBit!2494 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!48213 () Unit!2463)

(assert (=> b!32568 (= lt!48213 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1132 (_2!1752 lt!48208)) (bvsub to!314 i!635)))))

(assert (=> b!32568 (= lt!48219 (reader!0 thiss!1379 (_2!1752 lt!48208)))))

(declare-fun b!32569 () Bool)

(assert (=> b!32569 (= e!21521 e!21524)))

(declare-fun res!27815 () Bool)

(assert (=> b!32569 (=> (not res!27815) (not e!21524))))

(assert (=> b!32569 (= res!27815 (bvsle to!314 lt!48212))))

(assert (=> b!32569 (= lt!48212 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!804 srcBuffer!2))))))

(assert (= (and start!6888 res!27818) b!32569))

(assert (= (and b!32569 res!27815) b!32549))

(assert (= (and b!32549 res!27809) b!32551))

(assert (= (and b!32551 (not res!27819)) b!32556))

(assert (= (and b!32556 (not res!27813)) b!32565))

(assert (= (and b!32565 res!27823) b!32559))

(assert (= (and b!32565 (not res!27820)) b!32555))

(assert (= (and b!32555 (not res!27821)) b!32552))

(assert (= (and b!32552 (not res!27822)) b!32558))

(assert (= (and b!32558 (not res!27814)) b!32553))

(assert (= (and b!32553 res!27812) b!32564))

(assert (= (and b!32553 (not res!27816)) b!32562))

(assert (= (and b!32562 (not res!27811)) b!32563))

(assert (= (and b!32563 (not res!27825)) b!32568))

(assert (= (and b!32568 (not res!27817)) b!32566))

(assert (= (and b!32566 (not res!27827)) b!32561))

(assert (= (and b!32561 (not res!27810)) b!32560))

(assert (= (and b!32560 (not res!27828)) b!32557))

(assert (= (and b!32557 (not res!27826)) b!32567))

(assert (= (and b!32567 (not res!27824)) b!32550))

(assert (= start!6888 b!32554))

(declare-fun m!48147 () Bool)

(assert (=> b!32566 m!48147))

(declare-fun m!48149 () Bool)

(assert (=> b!32564 m!48149))

(declare-fun m!48151 () Bool)

(assert (=> b!32555 m!48151))

(declare-fun m!48153 () Bool)

(assert (=> b!32556 m!48153))

(declare-fun m!48155 () Bool)

(assert (=> b!32556 m!48155))

(declare-fun m!48157 () Bool)

(assert (=> b!32556 m!48157))

(declare-fun m!48159 () Bool)

(assert (=> b!32556 m!48159))

(assert (=> b!32556 m!48155))

(declare-fun m!48161 () Bool)

(assert (=> b!32556 m!48161))

(declare-fun m!48163 () Bool)

(assert (=> b!32561 m!48163))

(declare-fun m!48165 () Bool)

(assert (=> b!32561 m!48165))

(declare-fun m!48167 () Bool)

(assert (=> b!32559 m!48167))

(assert (=> b!32559 m!48167))

(declare-fun m!48169 () Bool)

(assert (=> b!32559 m!48169))

(declare-fun m!48171 () Bool)

(assert (=> b!32559 m!48171))

(assert (=> b!32559 m!48171))

(declare-fun m!48173 () Bool)

(assert (=> b!32559 m!48173))

(declare-fun m!48175 () Bool)

(assert (=> b!32563 m!48175))

(declare-fun m!48177 () Bool)

(assert (=> b!32552 m!48177))

(declare-fun m!48179 () Bool)

(assert (=> b!32554 m!48179))

(declare-fun m!48181 () Bool)

(assert (=> start!6888 m!48181))

(declare-fun m!48183 () Bool)

(assert (=> start!6888 m!48183))

(declare-fun m!48185 () Bool)

(assert (=> b!32557 m!48185))

(declare-fun m!48187 () Bool)

(assert (=> b!32560 m!48187))

(declare-fun m!48189 () Bool)

(assert (=> b!32560 m!48189))

(declare-fun m!48191 () Bool)

(assert (=> b!32562 m!48191))

(declare-fun m!48193 () Bool)

(assert (=> b!32551 m!48193))

(declare-fun m!48195 () Bool)

(assert (=> b!32551 m!48195))

(declare-fun m!48197 () Bool)

(assert (=> b!32551 m!48197))

(declare-fun m!48199 () Bool)

(assert (=> b!32565 m!48199))

(declare-fun m!48201 () Bool)

(assert (=> b!32565 m!48201))

(declare-fun m!48203 () Bool)

(assert (=> b!32565 m!48203))

(declare-fun m!48205 () Bool)

(assert (=> b!32565 m!48205))

(declare-fun m!48207 () Bool)

(assert (=> b!32565 m!48207))

(declare-fun m!48209 () Bool)

(assert (=> b!32565 m!48209))

(declare-fun m!48211 () Bool)

(assert (=> b!32565 m!48211))

(declare-fun m!48213 () Bool)

(assert (=> b!32567 m!48213))

(assert (=> b!32567 m!48213))

(declare-fun m!48215 () Bool)

(assert (=> b!32567 m!48215))

(declare-fun m!48217 () Bool)

(assert (=> b!32567 m!48217))

(declare-fun m!48219 () Bool)

(assert (=> b!32549 m!48219))

(declare-fun m!48221 () Bool)

(assert (=> b!32568 m!48221))

(declare-fun m!48223 () Bool)

(assert (=> b!32568 m!48223))

(declare-fun m!48225 () Bool)

(assert (=> b!32568 m!48225))

(declare-fun m!48227 () Bool)

(assert (=> b!32568 m!48227))

(declare-fun m!48229 () Bool)

(assert (=> b!32568 m!48229))

(declare-fun m!48231 () Bool)

(assert (=> b!32568 m!48231))

(declare-fun m!48233 () Bool)

(assert (=> b!32568 m!48233))

(declare-fun m!48235 () Bool)

(assert (=> b!32568 m!48235))

(push 1)

(assert (not b!32565))

(assert (not b!32556))

(assert (not b!32559))

(assert (not b!32564))

(assert (not b!32560))

(assert (not b!32557))

(assert (not start!6888))

(assert (not b!32552))

(assert (not b!32568))

(assert (not b!32562))

(assert (not b!32551))

(assert (not b!32567))

(assert (not b!32563))

(assert (not b!32561))

(assert (not b!32549))

(assert (not b!32554))

(assert (not b!32566))

(assert (not b!32555))

(check-sat)

(pop 1)

(push 1)

(check-sat)

