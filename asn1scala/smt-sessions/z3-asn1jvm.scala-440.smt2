; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11834 () Bool)

(assert start!11834)

(declare-fun b!59118 () Bool)

(declare-fun res!49176 () Bool)

(declare-fun e!39294 () Bool)

(assert (=> b!59118 (=> res!49176 e!39294)))

(declare-datatypes ((array!2691 0))(
  ( (array!2692 (arr!1785 (Array (_ BitVec 32) (_ BitVec 8))) (size!1221 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2130 0))(
  ( (BitStream!2131 (buf!1602 array!2691) (currentByte!3220 (_ BitVec 32)) (currentBit!3215 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2130)

(declare-datatypes ((Unit!4065 0))(
  ( (Unit!4066) )
))
(declare-datatypes ((tuple2!5382 0))(
  ( (tuple2!5383 (_1!2802 Unit!4065) (_2!2802 BitStream!2130)) )
))
(declare-fun lt!92931 () tuple2!5382)

(assert (=> b!59118 (= res!49176 (not (= (size!1221 (buf!1602 thiss!1379)) (size!1221 (buf!1602 (_2!2802 lt!92931))))))))

(declare-fun b!59119 () Bool)

(declare-fun e!39295 () Bool)

(declare-fun e!39299 () Bool)

(assert (=> b!59119 (= e!39295 (not e!39299))))

(declare-fun res!49170 () Bool)

(assert (=> b!59119 (=> res!49170 e!39299)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!59119 (= res!49170 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2130 BitStream!2130) Bool)

(assert (=> b!59119 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92927 () Unit!4065)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2130) Unit!4065)

(assert (=> b!59119 (= lt!92927 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!92928 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59119 (= lt!92928 (bitIndex!0 (size!1221 (buf!1602 thiss!1379)) (currentByte!3220 thiss!1379) (currentBit!3215 thiss!1379)))))

(declare-fun b!59120 () Bool)

(declare-fun res!49172 () Bool)

(declare-fun e!39297 () Bool)

(assert (=> b!59120 (=> res!49172 e!39297)))

(declare-fun lt!92925 () tuple2!5382)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59120 (= res!49172 (not (invariant!0 (currentBit!3215 (_2!2802 lt!92925)) (currentByte!3220 (_2!2802 lt!92925)) (size!1221 (buf!1602 (_2!2802 lt!92931))))))))

(declare-fun b!59121 () Bool)

(declare-fun e!39300 () Bool)

(assert (=> b!59121 (= e!39300 e!39294)))

(declare-fun res!49171 () Bool)

(assert (=> b!59121 (=> res!49171 e!39294)))

(declare-fun lt!92926 () (_ BitVec 64))

(assert (=> b!59121 (= res!49171 (not (= lt!92926 (bvsub (bvadd lt!92928 to!314) i!635))))))

(assert (=> b!59121 (= lt!92926 (bitIndex!0 (size!1221 (buf!1602 (_2!2802 lt!92931))) (currentByte!3220 (_2!2802 lt!92931)) (currentBit!3215 (_2!2802 lt!92931))))))

(declare-fun b!59123 () Bool)

(declare-fun e!39301 () Bool)

(assert (=> b!59123 (= e!39301 (= lt!92926 (bvsub (bvsub (bvadd (bitIndex!0 (size!1221 (buf!1602 (_2!2802 lt!92925))) (currentByte!3220 (_2!2802 lt!92925)) (currentBit!3215 (_2!2802 lt!92925))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun srcBuffer!2 () array!2691)

(declare-datatypes ((tuple2!5384 0))(
  ( (tuple2!5385 (_1!2803 BitStream!2130) (_2!2803 BitStream!2130)) )
))
(declare-fun lt!92930 () tuple2!5384)

(declare-fun b!59124 () Bool)

(declare-fun e!39293 () Bool)

(declare-datatypes ((List!640 0))(
  ( (Nil!637) (Cons!636 (h!755 Bool) (t!1390 List!640)) )
))
(declare-fun head!459 (List!640) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2130 array!2691 (_ BitVec 64) (_ BitVec 64)) List!640)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2130 BitStream!2130 (_ BitVec 64)) List!640)

(assert (=> b!59124 (= e!39293 (= (head!459 (byteArrayBitContentToList!0 (_2!2802 lt!92925) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!459 (bitStreamReadBitsIntoList!0 (_2!2802 lt!92925) (_1!2803 lt!92930) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59125 () Bool)

(declare-fun res!49178 () Bool)

(assert (=> b!59125 (=> res!49178 e!39294)))

(assert (=> b!59125 (= res!49178 (not (invariant!0 (currentBit!3215 (_2!2802 lt!92931)) (currentByte!3220 (_2!2802 lt!92931)) (size!1221 (buf!1602 (_2!2802 lt!92931))))))))

(declare-fun b!59126 () Bool)

(assert (=> b!59126 (= e!39297 true)))

(declare-fun lt!92922 () tuple2!5384)

(declare-fun reader!0 (BitStream!2130 BitStream!2130) tuple2!5384)

(assert (=> b!59126 (= lt!92922 (reader!0 (_2!2802 lt!92925) (_2!2802 lt!92931)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59126 (validate_offset_bits!1 ((_ sign_extend 32) (size!1221 (buf!1602 (_2!2802 lt!92931)))) ((_ sign_extend 32) (currentByte!3220 thiss!1379)) ((_ sign_extend 32) (currentBit!3215 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!92924 () Unit!4065)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2130 array!2691 (_ BitVec 64)) Unit!4065)

(assert (=> b!59126 (= lt!92924 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1602 (_2!2802 lt!92931)) (bvsub to!314 i!635)))))

(declare-fun lt!92923 () tuple2!5384)

(assert (=> b!59126 (= lt!92923 (reader!0 thiss!1379 (_2!2802 lt!92931)))))

(declare-fun b!59127 () Bool)

(declare-fun e!39292 () Bool)

(assert (=> b!59127 (= e!39292 e!39300)))

(declare-fun res!49179 () Bool)

(assert (=> b!59127 (=> res!49179 e!39300)))

(assert (=> b!59127 (= res!49179 (not (isPrefixOf!0 (_2!2802 lt!92925) (_2!2802 lt!92931))))))

(assert (=> b!59127 (isPrefixOf!0 thiss!1379 (_2!2802 lt!92931))))

(declare-fun lt!92921 () Unit!4065)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2130 BitStream!2130 BitStream!2130) Unit!4065)

(assert (=> b!59127 (= lt!92921 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2802 lt!92925) (_2!2802 lt!92931)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2130 array!2691 (_ BitVec 64) (_ BitVec 64)) tuple2!5382)

(assert (=> b!59127 (= lt!92931 (appendBitsMSBFirstLoop!0 (_2!2802 lt!92925) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!59127 e!39293))

(declare-fun res!49169 () Bool)

(assert (=> b!59127 (=> (not res!49169) (not e!39293))))

(assert (=> b!59127 (= res!49169 (validate_offset_bits!1 ((_ sign_extend 32) (size!1221 (buf!1602 (_2!2802 lt!92925)))) ((_ sign_extend 32) (currentByte!3220 thiss!1379)) ((_ sign_extend 32) (currentBit!3215 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92929 () Unit!4065)

(assert (=> b!59127 (= lt!92929 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1602 (_2!2802 lt!92925)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!59127 (= lt!92930 (reader!0 thiss!1379 (_2!2802 lt!92925)))))

(declare-fun b!59128 () Bool)

(declare-fun e!39298 () Bool)

(declare-fun array_inv!1124 (array!2691) Bool)

(assert (=> b!59128 (= e!39298 (array_inv!1124 (buf!1602 thiss!1379)))))

(declare-fun b!59129 () Bool)

(assert (=> b!59129 (= e!39299 e!39292)))

(declare-fun res!49174 () Bool)

(assert (=> b!59129 (=> res!49174 e!39292)))

(assert (=> b!59129 (= res!49174 (not (isPrefixOf!0 thiss!1379 (_2!2802 lt!92925))))))

(assert (=> b!59129 (validate_offset_bits!1 ((_ sign_extend 32) (size!1221 (buf!1602 (_2!2802 lt!92925)))) ((_ sign_extend 32) (currentByte!3220 (_2!2802 lt!92925))) ((_ sign_extend 32) (currentBit!3215 (_2!2802 lt!92925))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92932 () Unit!4065)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2130 BitStream!2130 (_ BitVec 64) (_ BitVec 64)) Unit!4065)

(assert (=> b!59129 (= lt!92932 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2802 lt!92925) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2130 (_ BitVec 8) (_ BitVec 32)) tuple2!5382)

(assert (=> b!59129 (= lt!92925 (appendBitFromByte!0 thiss!1379 (select (arr!1785 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!59130 () Bool)

(declare-fun res!49177 () Bool)

(assert (=> b!59130 (=> res!49177 e!39297)))

(assert (=> b!59130 (= res!49177 (not (invariant!0 (currentBit!3215 (_2!2802 lt!92925)) (currentByte!3220 (_2!2802 lt!92925)) (size!1221 (buf!1602 (_2!2802 lt!92925))))))))

(declare-fun b!59131 () Bool)

(assert (=> b!59131 (= e!39294 e!39297)))

(declare-fun res!49175 () Bool)

(assert (=> b!59131 (=> res!49175 e!39297)))

(assert (=> b!59131 (= res!49175 (not (= (size!1221 (buf!1602 (_2!2802 lt!92925))) (size!1221 (buf!1602 (_2!2802 lt!92931))))))))

(assert (=> b!59131 e!39301))

(declare-fun res!49173 () Bool)

(assert (=> b!59131 (=> (not res!49173) (not e!39301))))

(assert (=> b!59131 (= res!49173 (= (size!1221 (buf!1602 (_2!2802 lt!92931))) (size!1221 (buf!1602 thiss!1379))))))

(declare-fun b!59122 () Bool)

(declare-fun res!49168 () Bool)

(assert (=> b!59122 (=> (not res!49168) (not e!39295))))

(assert (=> b!59122 (= res!49168 (validate_offset_bits!1 ((_ sign_extend 32) (size!1221 (buf!1602 thiss!1379))) ((_ sign_extend 32) (currentByte!3220 thiss!1379)) ((_ sign_extend 32) (currentBit!3215 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!49167 () Bool)

(assert (=> start!11834 (=> (not res!49167) (not e!39295))))

(assert (=> start!11834 (= res!49167 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1221 srcBuffer!2))))))))

(assert (=> start!11834 e!39295))

(assert (=> start!11834 true))

(assert (=> start!11834 (array_inv!1124 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2130) Bool)

(assert (=> start!11834 (and (inv!12 thiss!1379) e!39298)))

(assert (= (and start!11834 res!49167) b!59122))

(assert (= (and b!59122 res!49168) b!59119))

(assert (= (and b!59119 (not res!49170)) b!59129))

(assert (= (and b!59129 (not res!49174)) b!59127))

(assert (= (and b!59127 res!49169) b!59124))

(assert (= (and b!59127 (not res!49179)) b!59121))

(assert (= (and b!59121 (not res!49171)) b!59125))

(assert (= (and b!59125 (not res!49178)) b!59118))

(assert (= (and b!59118 (not res!49176)) b!59131))

(assert (= (and b!59131 res!49173) b!59123))

(assert (= (and b!59131 (not res!49175)) b!59130))

(assert (= (and b!59130 (not res!49177)) b!59120))

(assert (= (and b!59120 (not res!49172)) b!59126))

(assert (= start!11834 b!59128))

(declare-fun m!93089 () Bool)

(assert (=> b!59123 m!93089))

(declare-fun m!93091 () Bool)

(assert (=> b!59119 m!93091))

(declare-fun m!93093 () Bool)

(assert (=> b!59119 m!93093))

(declare-fun m!93095 () Bool)

(assert (=> b!59119 m!93095))

(declare-fun m!93097 () Bool)

(assert (=> start!11834 m!93097))

(declare-fun m!93099 () Bool)

(assert (=> start!11834 m!93099))

(declare-fun m!93101 () Bool)

(assert (=> b!59130 m!93101))

(declare-fun m!93103 () Bool)

(assert (=> b!59125 m!93103))

(declare-fun m!93105 () Bool)

(assert (=> b!59121 m!93105))

(declare-fun m!93107 () Bool)

(assert (=> b!59124 m!93107))

(assert (=> b!59124 m!93107))

(declare-fun m!93109 () Bool)

(assert (=> b!59124 m!93109))

(declare-fun m!93111 () Bool)

(assert (=> b!59124 m!93111))

(assert (=> b!59124 m!93111))

(declare-fun m!93113 () Bool)

(assert (=> b!59124 m!93113))

(declare-fun m!93115 () Bool)

(assert (=> b!59128 m!93115))

(declare-fun m!93117 () Bool)

(assert (=> b!59129 m!93117))

(declare-fun m!93119 () Bool)

(assert (=> b!59129 m!93119))

(declare-fun m!93121 () Bool)

(assert (=> b!59129 m!93121))

(declare-fun m!93123 () Bool)

(assert (=> b!59129 m!93123))

(assert (=> b!59129 m!93119))

(declare-fun m!93125 () Bool)

(assert (=> b!59129 m!93125))

(declare-fun m!93127 () Bool)

(assert (=> b!59120 m!93127))

(declare-fun m!93129 () Bool)

(assert (=> b!59126 m!93129))

(declare-fun m!93131 () Bool)

(assert (=> b!59126 m!93131))

(declare-fun m!93133 () Bool)

(assert (=> b!59126 m!93133))

(declare-fun m!93135 () Bool)

(assert (=> b!59126 m!93135))

(declare-fun m!93137 () Bool)

(assert (=> b!59127 m!93137))

(declare-fun m!93139 () Bool)

(assert (=> b!59127 m!93139))

(declare-fun m!93141 () Bool)

(assert (=> b!59127 m!93141))

(declare-fun m!93143 () Bool)

(assert (=> b!59127 m!93143))

(declare-fun m!93145 () Bool)

(assert (=> b!59127 m!93145))

(declare-fun m!93147 () Bool)

(assert (=> b!59127 m!93147))

(declare-fun m!93149 () Bool)

(assert (=> b!59127 m!93149))

(declare-fun m!93151 () Bool)

(assert (=> b!59122 m!93151))

(check-sat (not b!59124) (not b!59123) (not b!59128) (not b!59122) (not b!59125) (not b!59121) (not start!11834) (not b!59130) (not b!59120) (not b!59119) (not b!59126) (not b!59129) (not b!59127))
