; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11832 () Bool)

(assert start!11832)

(declare-fun b!59076 () Bool)

(declare-fun e!39269 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!2689 0))(
  ( (array!2690 (arr!1784 (Array (_ BitVec 32) (_ BitVec 8))) (size!1220 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2128 0))(
  ( (BitStream!2129 (buf!1601 array!2689) (currentByte!3219 (_ BitVec 32)) (currentBit!3214 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4063 0))(
  ( (Unit!4064) )
))
(declare-datatypes ((tuple2!5378 0))(
  ( (tuple2!5379 (_1!2800 Unit!4063) (_2!2800 BitStream!2128)) )
))
(declare-fun lt!92887 () tuple2!5378)

(declare-fun lt!92888 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59076 (= e!39269 (= lt!92888 (bvsub (bvsub (bvadd (bitIndex!0 (size!1220 (buf!1601 (_2!2800 lt!92887))) (currentByte!3219 (_2!2800 lt!92887)) (currentBit!3214 (_2!2800 lt!92887))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!59077 () Bool)

(declare-fun e!39267 () Bool)

(declare-fun e!39262 () Bool)

(assert (=> b!59077 (= e!39267 e!39262)))

(declare-fun res!49128 () Bool)

(assert (=> b!59077 (=> res!49128 e!39262)))

(declare-fun lt!92892 () tuple2!5378)

(assert (=> b!59077 (= res!49128 (not (= (size!1220 (buf!1601 (_2!2800 lt!92887))) (size!1220 (buf!1601 (_2!2800 lt!92892))))))))

(assert (=> b!59077 e!39269))

(declare-fun res!49138 () Bool)

(assert (=> b!59077 (=> (not res!49138) (not e!39269))))

(declare-fun thiss!1379 () BitStream!2128)

(assert (=> b!59077 (= res!49138 (= (size!1220 (buf!1601 (_2!2800 lt!92892))) (size!1220 (buf!1601 thiss!1379))))))

(declare-fun b!59078 () Bool)

(declare-fun e!39259 () Bool)

(declare-fun e!39263 () Bool)

(assert (=> b!59078 (= e!39259 e!39263)))

(declare-fun res!49135 () Bool)

(assert (=> b!59078 (=> res!49135 e!39263)))

(declare-fun isPrefixOf!0 (BitStream!2128 BitStream!2128) Bool)

(assert (=> b!59078 (= res!49135 (not (isPrefixOf!0 thiss!1379 (_2!2800 lt!92887))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59078 (validate_offset_bits!1 ((_ sign_extend 32) (size!1220 (buf!1601 (_2!2800 lt!92887)))) ((_ sign_extend 32) (currentByte!3219 (_2!2800 lt!92887))) ((_ sign_extend 32) (currentBit!3214 (_2!2800 lt!92887))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92889 () Unit!4063)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2128 BitStream!2128 (_ BitVec 64) (_ BitVec 64)) Unit!4063)

(assert (=> b!59078 (= lt!92889 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2800 lt!92887) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2689)

(declare-fun appendBitFromByte!0 (BitStream!2128 (_ BitVec 8) (_ BitVec 32)) tuple2!5378)

(assert (=> b!59078 (= lt!92887 (appendBitFromByte!0 thiss!1379 (select (arr!1784 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!59079 () Bool)

(declare-fun res!49131 () Bool)

(assert (=> b!59079 (=> res!49131 e!39262)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59079 (= res!49131 (not (invariant!0 (currentBit!3214 (_2!2800 lt!92887)) (currentByte!3219 (_2!2800 lt!92887)) (size!1220 (buf!1601 (_2!2800 lt!92887))))))))

(declare-fun b!59080 () Bool)

(declare-fun res!49133 () Bool)

(assert (=> b!59080 (=> res!49133 e!39267)))

(assert (=> b!59080 (= res!49133 (not (invariant!0 (currentBit!3214 (_2!2800 lt!92892)) (currentByte!3219 (_2!2800 lt!92892)) (size!1220 (buf!1601 (_2!2800 lt!92892))))))))

(declare-fun b!59081 () Bool)

(declare-fun res!49140 () Bool)

(assert (=> b!59081 (=> res!49140 e!39267)))

(assert (=> b!59081 (= res!49140 (not (= (size!1220 (buf!1601 thiss!1379)) (size!1220 (buf!1601 (_2!2800 lt!92892))))))))

(declare-fun b!59082 () Bool)

(declare-fun e!39264 () Bool)

(assert (=> b!59082 (= e!39264 e!39267)))

(declare-fun res!49136 () Bool)

(assert (=> b!59082 (=> res!49136 e!39267)))

(declare-fun lt!92885 () (_ BitVec 64))

(assert (=> b!59082 (= res!49136 (not (= lt!92888 (bvsub (bvadd lt!92885 to!314) i!635))))))

(assert (=> b!59082 (= lt!92888 (bitIndex!0 (size!1220 (buf!1601 (_2!2800 lt!92892))) (currentByte!3219 (_2!2800 lt!92892)) (currentBit!3214 (_2!2800 lt!92892))))))

(declare-fun res!49132 () Bool)

(declare-fun e!39265 () Bool)

(assert (=> start!11832 (=> (not res!49132) (not e!39265))))

(assert (=> start!11832 (= res!49132 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1220 srcBuffer!2))))))))

(assert (=> start!11832 e!39265))

(assert (=> start!11832 true))

(declare-fun array_inv!1123 (array!2689) Bool)

(assert (=> start!11832 (array_inv!1123 srcBuffer!2)))

(declare-fun e!39261 () Bool)

(declare-fun inv!12 (BitStream!2128) Bool)

(assert (=> start!11832 (and (inv!12 thiss!1379) e!39261)))

(declare-fun b!59083 () Bool)

(assert (=> b!59083 (= e!39265 (not e!39259))))

(declare-fun res!49134 () Bool)

(assert (=> b!59083 (=> res!49134 e!39259)))

(assert (=> b!59083 (= res!49134 (bvsge i!635 to!314))))

(assert (=> b!59083 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92886 () Unit!4063)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2128) Unit!4063)

(assert (=> b!59083 (= lt!92886 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!59083 (= lt!92885 (bitIndex!0 (size!1220 (buf!1601 thiss!1379)) (currentByte!3219 thiss!1379) (currentBit!3214 thiss!1379)))))

(declare-fun b!59084 () Bool)

(assert (=> b!59084 (= e!39262 true)))

(declare-datatypes ((tuple2!5380 0))(
  ( (tuple2!5381 (_1!2801 BitStream!2128) (_2!2801 BitStream!2128)) )
))
(declare-fun lt!92893 () tuple2!5380)

(declare-fun reader!0 (BitStream!2128 BitStream!2128) tuple2!5380)

(assert (=> b!59084 (= lt!92893 (reader!0 (_2!2800 lt!92887) (_2!2800 lt!92892)))))

(assert (=> b!59084 (validate_offset_bits!1 ((_ sign_extend 32) (size!1220 (buf!1601 (_2!2800 lt!92892)))) ((_ sign_extend 32) (currentByte!3219 thiss!1379)) ((_ sign_extend 32) (currentBit!3214 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!92895 () Unit!4063)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2128 array!2689 (_ BitVec 64)) Unit!4063)

(assert (=> b!59084 (= lt!92895 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1601 (_2!2800 lt!92892)) (bvsub to!314 i!635)))))

(declare-fun lt!92891 () tuple2!5380)

(assert (=> b!59084 (= lt!92891 (reader!0 thiss!1379 (_2!2800 lt!92892)))))

(declare-fun b!59085 () Bool)

(declare-fun res!49130 () Bool)

(assert (=> b!59085 (=> res!49130 e!39262)))

(assert (=> b!59085 (= res!49130 (not (invariant!0 (currentBit!3214 (_2!2800 lt!92887)) (currentByte!3219 (_2!2800 lt!92887)) (size!1220 (buf!1601 (_2!2800 lt!92892))))))))

(declare-fun b!59086 () Bool)

(declare-fun lt!92894 () tuple2!5380)

(declare-fun e!39266 () Bool)

(declare-datatypes ((List!639 0))(
  ( (Nil!636) (Cons!635 (h!754 Bool) (t!1389 List!639)) )
))
(declare-fun head!458 (List!639) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2128 array!2689 (_ BitVec 64) (_ BitVec 64)) List!639)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2128 BitStream!2128 (_ BitVec 64)) List!639)

(assert (=> b!59086 (= e!39266 (= (head!458 (byteArrayBitContentToList!0 (_2!2800 lt!92887) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!458 (bitStreamReadBitsIntoList!0 (_2!2800 lt!92887) (_1!2801 lt!92894) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59087 () Bool)

(assert (=> b!59087 (= e!39263 e!39264)))

(declare-fun res!49137 () Bool)

(assert (=> b!59087 (=> res!49137 e!39264)))

(assert (=> b!59087 (= res!49137 (not (isPrefixOf!0 (_2!2800 lt!92887) (_2!2800 lt!92892))))))

(assert (=> b!59087 (isPrefixOf!0 thiss!1379 (_2!2800 lt!92892))))

(declare-fun lt!92890 () Unit!4063)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2128 BitStream!2128 BitStream!2128) Unit!4063)

(assert (=> b!59087 (= lt!92890 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2800 lt!92887) (_2!2800 lt!92892)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2128 array!2689 (_ BitVec 64) (_ BitVec 64)) tuple2!5378)

(assert (=> b!59087 (= lt!92892 (appendBitsMSBFirstLoop!0 (_2!2800 lt!92887) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!59087 e!39266))

(declare-fun res!49129 () Bool)

(assert (=> b!59087 (=> (not res!49129) (not e!39266))))

(assert (=> b!59087 (= res!49129 (validate_offset_bits!1 ((_ sign_extend 32) (size!1220 (buf!1601 (_2!2800 lt!92887)))) ((_ sign_extend 32) (currentByte!3219 thiss!1379)) ((_ sign_extend 32) (currentBit!3214 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92896 () Unit!4063)

(assert (=> b!59087 (= lt!92896 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1601 (_2!2800 lt!92887)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!59087 (= lt!92894 (reader!0 thiss!1379 (_2!2800 lt!92887)))))

(declare-fun b!59088 () Bool)

(assert (=> b!59088 (= e!39261 (array_inv!1123 (buf!1601 thiss!1379)))))

(declare-fun b!59089 () Bool)

(declare-fun res!49139 () Bool)

(assert (=> b!59089 (=> (not res!49139) (not e!39265))))

(assert (=> b!59089 (= res!49139 (validate_offset_bits!1 ((_ sign_extend 32) (size!1220 (buf!1601 thiss!1379))) ((_ sign_extend 32) (currentByte!3219 thiss!1379)) ((_ sign_extend 32) (currentBit!3214 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!11832 res!49132) b!59089))

(assert (= (and b!59089 res!49139) b!59083))

(assert (= (and b!59083 (not res!49134)) b!59078))

(assert (= (and b!59078 (not res!49135)) b!59087))

(assert (= (and b!59087 res!49129) b!59086))

(assert (= (and b!59087 (not res!49137)) b!59082))

(assert (= (and b!59082 (not res!49136)) b!59080))

(assert (= (and b!59080 (not res!49133)) b!59081))

(assert (= (and b!59081 (not res!49140)) b!59077))

(assert (= (and b!59077 res!49138) b!59076))

(assert (= (and b!59077 (not res!49128)) b!59079))

(assert (= (and b!59079 (not res!49131)) b!59085))

(assert (= (and b!59085 (not res!49130)) b!59084))

(assert (= start!11832 b!59088))

(declare-fun m!93025 () Bool)

(assert (=> b!59088 m!93025))

(declare-fun m!93027 () Bool)

(assert (=> start!11832 m!93027))

(declare-fun m!93029 () Bool)

(assert (=> start!11832 m!93029))

(declare-fun m!93031 () Bool)

(assert (=> b!59085 m!93031))

(declare-fun m!93033 () Bool)

(assert (=> b!59083 m!93033))

(declare-fun m!93035 () Bool)

(assert (=> b!59083 m!93035))

(declare-fun m!93037 () Bool)

(assert (=> b!59083 m!93037))

(declare-fun m!93039 () Bool)

(assert (=> b!59086 m!93039))

(assert (=> b!59086 m!93039))

(declare-fun m!93041 () Bool)

(assert (=> b!59086 m!93041))

(declare-fun m!93043 () Bool)

(assert (=> b!59086 m!93043))

(assert (=> b!59086 m!93043))

(declare-fun m!93045 () Bool)

(assert (=> b!59086 m!93045))

(declare-fun m!93047 () Bool)

(assert (=> b!59076 m!93047))

(declare-fun m!93049 () Bool)

(assert (=> b!59079 m!93049))

(declare-fun m!93051 () Bool)

(assert (=> b!59089 m!93051))

(declare-fun m!93053 () Bool)

(assert (=> b!59080 m!93053))

(declare-fun m!93055 () Bool)

(assert (=> b!59078 m!93055))

(declare-fun m!93057 () Bool)

(assert (=> b!59078 m!93057))

(declare-fun m!93059 () Bool)

(assert (=> b!59078 m!93059))

(declare-fun m!93061 () Bool)

(assert (=> b!59078 m!93061))

(declare-fun m!93063 () Bool)

(assert (=> b!59078 m!93063))

(assert (=> b!59078 m!93059))

(declare-fun m!93065 () Bool)

(assert (=> b!59082 m!93065))

(declare-fun m!93067 () Bool)

(assert (=> b!59087 m!93067))

(declare-fun m!93069 () Bool)

(assert (=> b!59087 m!93069))

(declare-fun m!93071 () Bool)

(assert (=> b!59087 m!93071))

(declare-fun m!93073 () Bool)

(assert (=> b!59087 m!93073))

(declare-fun m!93075 () Bool)

(assert (=> b!59087 m!93075))

(declare-fun m!93077 () Bool)

(assert (=> b!59087 m!93077))

(declare-fun m!93079 () Bool)

(assert (=> b!59087 m!93079))

(declare-fun m!93081 () Bool)

(assert (=> b!59084 m!93081))

(declare-fun m!93083 () Bool)

(assert (=> b!59084 m!93083))

(declare-fun m!93085 () Bool)

(assert (=> b!59084 m!93085))

(declare-fun m!93087 () Bool)

(assert (=> b!59084 m!93087))

(push 1)

