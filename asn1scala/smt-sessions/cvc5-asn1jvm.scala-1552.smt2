; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43608 () Bool)

(assert start!43608)

(declare-fun b!206492 () Bool)

(declare-fun res!173152 () Bool)

(declare-fun e!141191 () Bool)

(assert (=> b!206492 (=> (not res!173152) (not e!141191))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!206492 (= res!173152 (not (= i!590 nBits!348)))))

(declare-fun b!206493 () Bool)

(declare-fun e!141195 () Bool)

(declare-fun e!141188 () Bool)

(assert (=> b!206493 (= e!141195 e!141188)))

(declare-fun res!173153 () Bool)

(assert (=> b!206493 (=> (not res!173153) (not e!141188))))

(declare-datatypes ((array!10391 0))(
  ( (array!10392 (arr!5497 (Array (_ BitVec 32) (_ BitVec 8))) (size!4567 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8242 0))(
  ( (BitStream!8243 (buf!5072 array!10391) (currentByte!9590 (_ BitVec 32)) (currentBit!9585 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14728 0))(
  ( (Unit!14729) )
))
(declare-datatypes ((tuple2!17648 0))(
  ( (tuple2!17649 (_1!9479 Unit!14728) (_2!9479 BitStream!8242)) )
))
(declare-fun lt!322679 () tuple2!17648)

(declare-datatypes ((tuple2!17650 0))(
  ( (tuple2!17651 (_1!9480 BitStream!8242) (_2!9480 Bool)) )
))
(declare-fun lt!322672 () tuple2!17650)

(declare-fun lt!322681 () Bool)

(assert (=> b!206493 (= res!173153 (and (= (_2!9480 lt!322672) lt!322681) (= (_1!9480 lt!322672) (_2!9479 lt!322679))))))

(declare-fun thiss!1204 () BitStream!8242)

(declare-fun readBitPure!0 (BitStream!8242) tuple2!17650)

(declare-fun readerFrom!0 (BitStream!8242 (_ BitVec 32) (_ BitVec 32)) BitStream!8242)

(assert (=> b!206493 (= lt!322672 (readBitPure!0 (readerFrom!0 (_2!9479 lt!322679) (currentBit!9585 thiss!1204) (currentByte!9590 thiss!1204))))))

(declare-fun res!173156 () Bool)

(assert (=> start!43608 (=> (not res!173156) (not e!141191))))

(assert (=> start!43608 (= res!173156 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43608 e!141191))

(assert (=> start!43608 true))

(declare-fun e!141187 () Bool)

(declare-fun inv!12 (BitStream!8242) Bool)

(assert (=> start!43608 (and (inv!12 thiss!1204) e!141187)))

(declare-fun b!206494 () Bool)

(declare-fun e!141194 () Bool)

(declare-fun lt!322684 () tuple2!17650)

(declare-fun lt!322673 () tuple2!17650)

(assert (=> b!206494 (= e!141194 (= (_2!9480 lt!322684) (_2!9480 lt!322673)))))

(declare-fun b!206495 () Bool)

(declare-fun res!173159 () Bool)

(assert (=> b!206495 (=> (not res!173159) (not e!141191))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206495 (= res!173159 (invariant!0 (currentBit!9585 thiss!1204) (currentByte!9590 thiss!1204) (size!4567 (buf!5072 thiss!1204))))))

(declare-fun b!206496 () Bool)

(declare-fun res!173155 () Bool)

(assert (=> b!206496 (=> (not res!173155) (not e!141191))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206496 (= res!173155 (validate_offset_bits!1 ((_ sign_extend 32) (size!4567 (buf!5072 thiss!1204))) ((_ sign_extend 32) (currentByte!9590 thiss!1204)) ((_ sign_extend 32) (currentBit!9585 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!206497 () Bool)

(declare-fun res!173148 () Bool)

(declare-fun e!141192 () Bool)

(assert (=> b!206497 (=> res!173148 e!141192)))

(declare-fun lt!322676 () tuple2!17648)

(declare-fun isPrefixOf!0 (BitStream!8242 BitStream!8242) Bool)

(assert (=> b!206497 (= res!173148 (not (isPrefixOf!0 (_2!9479 lt!322679) (_2!9479 lt!322676))))))

(declare-fun b!206498 () Bool)

(declare-fun res!173160 () Bool)

(assert (=> b!206498 (=> (not res!173160) (not e!141195))))

(assert (=> b!206498 (= res!173160 (isPrefixOf!0 thiss!1204 (_2!9479 lt!322679)))))

(declare-fun b!206499 () Bool)

(declare-fun e!141193 () Bool)

(assert (=> b!206499 (= e!141193 e!141195)))

(declare-fun res!173151 () Bool)

(assert (=> b!206499 (=> (not res!173151) (not e!141195))))

(declare-fun lt!322677 () (_ BitVec 64))

(declare-fun lt!322682 () (_ BitVec 64))

(assert (=> b!206499 (= res!173151 (= lt!322677 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322682)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206499 (= lt!322677 (bitIndex!0 (size!4567 (buf!5072 (_2!9479 lt!322679))) (currentByte!9590 (_2!9479 lt!322679)) (currentBit!9585 (_2!9479 lt!322679))))))

(assert (=> b!206499 (= lt!322682 (bitIndex!0 (size!4567 (buf!5072 thiss!1204)) (currentByte!9590 thiss!1204) (currentBit!9585 thiss!1204)))))

(declare-fun b!206500 () Bool)

(declare-fun e!141189 () Bool)

(assert (=> b!206500 (= e!141189 (invariant!0 (currentBit!9585 thiss!1204) (currentByte!9590 thiss!1204) (size!4567 (buf!5072 (_2!9479 lt!322676)))))))

(declare-fun b!206501 () Bool)

(declare-fun res!173157 () Bool)

(assert (=> b!206501 (=> res!173157 e!141192)))

(declare-fun lt!322680 () (_ BitVec 64))

(declare-fun lt!322675 () (_ BitVec 64))

(assert (=> b!206501 (= res!173157 (or (not (= (size!4567 (buf!5072 (_2!9479 lt!322676))) (size!4567 (buf!5072 thiss!1204)))) (not (= lt!322675 (bvsub (bvadd lt!322680 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!206502 () Bool)

(assert (=> b!206502 (= e!141188 (= (bitIndex!0 (size!4567 (buf!5072 (_1!9480 lt!322672))) (currentByte!9590 (_1!9480 lt!322672)) (currentBit!9585 (_1!9480 lt!322672))) lt!322677))))

(declare-fun b!206503 () Bool)

(declare-fun array_inv!4308 (array!10391) Bool)

(assert (=> b!206503 (= e!141187 (array_inv!4308 (buf!5072 thiss!1204)))))

(declare-fun b!206504 () Bool)

(declare-fun e!141186 () Bool)

(assert (=> b!206504 (= e!141186 e!141192)))

(declare-fun res!173150 () Bool)

(assert (=> b!206504 (=> res!173150 e!141192)))

(declare-fun lt!322671 () (_ BitVec 64))

(assert (=> b!206504 (= res!173150 (not (= lt!322675 (bvsub (bvsub (bvadd lt!322671 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!206504 (= lt!322675 (bitIndex!0 (size!4567 (buf!5072 (_2!9479 lt!322676))) (currentByte!9590 (_2!9479 lt!322676)) (currentBit!9585 (_2!9479 lt!322676))))))

(assert (=> b!206504 (isPrefixOf!0 thiss!1204 (_2!9479 lt!322676))))

(declare-fun lt!322685 () Unit!14728)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8242 BitStream!8242 BitStream!8242) Unit!14728)

(assert (=> b!206504 (= lt!322685 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9479 lt!322679) (_2!9479 lt!322676)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8242 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17648)

(assert (=> b!206504 (= lt!322676 (appendBitsLSBFirstLoopTR!0 (_2!9479 lt!322679) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!206505 () Bool)

(assert (=> b!206505 (= e!141191 (not e!141186))))

(declare-fun res!173147 () Bool)

(assert (=> b!206505 (=> res!173147 e!141186)))

(assert (=> b!206505 (= res!173147 (not (= lt!322671 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322680))))))

(assert (=> b!206505 (= lt!322671 (bitIndex!0 (size!4567 (buf!5072 (_2!9479 lt!322679))) (currentByte!9590 (_2!9479 lt!322679)) (currentBit!9585 (_2!9479 lt!322679))))))

(assert (=> b!206505 (= lt!322680 (bitIndex!0 (size!4567 (buf!5072 thiss!1204)) (currentByte!9590 thiss!1204) (currentBit!9585 thiss!1204)))))

(assert (=> b!206505 e!141193))

(declare-fun res!173149 () Bool)

(assert (=> b!206505 (=> (not res!173149) (not e!141193))))

(assert (=> b!206505 (= res!173149 (= (size!4567 (buf!5072 thiss!1204)) (size!4567 (buf!5072 (_2!9479 lt!322679)))))))

(declare-fun appendBit!0 (BitStream!8242 Bool) tuple2!17648)

(assert (=> b!206505 (= lt!322679 (appendBit!0 thiss!1204 lt!322681))))

(assert (=> b!206505 (= lt!322681 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!206506 () Bool)

(declare-fun res!173161 () Bool)

(assert (=> b!206506 (=> res!173161 e!141192)))

(assert (=> b!206506 (= res!173161 (not (isPrefixOf!0 thiss!1204 (_2!9479 lt!322679))))))

(declare-fun b!206507 () Bool)

(declare-fun res!173154 () Bool)

(assert (=> b!206507 (=> res!173154 e!141192)))

(assert (=> b!206507 (= res!173154 (not (invariant!0 (currentBit!9585 (_2!9479 lt!322676)) (currentByte!9590 (_2!9479 lt!322676)) (size!4567 (buf!5072 (_2!9479 lt!322676))))))))

(declare-fun b!206508 () Bool)

(assert (=> b!206508 (= e!141192 true)))

(declare-datatypes ((tuple2!17652 0))(
  ( (tuple2!17653 (_1!9481 BitStream!8242) (_2!9481 BitStream!8242)) )
))
(declare-fun lt!322674 () tuple2!17652)

(assert (=> b!206508 (= (_2!9480 (readBitPure!0 (_1!9481 lt!322674))) lt!322681)))

(declare-fun lt!322670 () tuple2!17652)

(declare-fun reader!0 (BitStream!8242 BitStream!8242) tuple2!17652)

(assert (=> b!206508 (= lt!322670 (reader!0 (_2!9479 lt!322679) (_2!9479 lt!322676)))))

(assert (=> b!206508 (= lt!322674 (reader!0 thiss!1204 (_2!9479 lt!322676)))))

(assert (=> b!206508 e!141194))

(declare-fun res!173158 () Bool)

(assert (=> b!206508 (=> (not res!173158) (not e!141194))))

(assert (=> b!206508 (= res!173158 (= (bitIndex!0 (size!4567 (buf!5072 (_1!9480 lt!322684))) (currentByte!9590 (_1!9480 lt!322684)) (currentBit!9585 (_1!9480 lt!322684))) (bitIndex!0 (size!4567 (buf!5072 (_1!9480 lt!322673))) (currentByte!9590 (_1!9480 lt!322673)) (currentBit!9585 (_1!9480 lt!322673)))))))

(declare-fun lt!322678 () Unit!14728)

(declare-fun lt!322683 () BitStream!8242)

(declare-fun readBitPrefixLemma!0 (BitStream!8242 BitStream!8242) Unit!14728)

(assert (=> b!206508 (= lt!322678 (readBitPrefixLemma!0 lt!322683 (_2!9479 lt!322676)))))

(assert (=> b!206508 (= lt!322673 (readBitPure!0 (BitStream!8243 (buf!5072 (_2!9479 lt!322676)) (currentByte!9590 thiss!1204) (currentBit!9585 thiss!1204))))))

(assert (=> b!206508 (= lt!322684 (readBitPure!0 lt!322683))))

(assert (=> b!206508 e!141189))

(declare-fun res!173162 () Bool)

(assert (=> b!206508 (=> (not res!173162) (not e!141189))))

(assert (=> b!206508 (= res!173162 (invariant!0 (currentBit!9585 thiss!1204) (currentByte!9590 thiss!1204) (size!4567 (buf!5072 (_2!9479 lt!322679)))))))

(assert (=> b!206508 (= lt!322683 (BitStream!8243 (buf!5072 (_2!9479 lt!322679)) (currentByte!9590 thiss!1204) (currentBit!9585 thiss!1204)))))

(assert (= (and start!43608 res!173156) b!206496))

(assert (= (and b!206496 res!173155) b!206495))

(assert (= (and b!206495 res!173159) b!206492))

(assert (= (and b!206492 res!173152) b!206505))

(assert (= (and b!206505 res!173149) b!206499))

(assert (= (and b!206499 res!173151) b!206498))

(assert (= (and b!206498 res!173160) b!206493))

(assert (= (and b!206493 res!173153) b!206502))

(assert (= (and b!206505 (not res!173147)) b!206504))

(assert (= (and b!206504 (not res!173150)) b!206507))

(assert (= (and b!206507 (not res!173154)) b!206501))

(assert (= (and b!206501 (not res!173157)) b!206497))

(assert (= (and b!206497 (not res!173148)) b!206506))

(assert (= (and b!206506 (not res!173161)) b!206508))

(assert (= (and b!206508 res!173162) b!206500))

(assert (= (and b!206508 res!173158) b!206494))

(assert (= start!43608 b!206503))

(declare-fun m!318057 () Bool)

(assert (=> b!206496 m!318057))

(declare-fun m!318059 () Bool)

(assert (=> b!206495 m!318059))

(declare-fun m!318061 () Bool)

(assert (=> b!206506 m!318061))

(declare-fun m!318063 () Bool)

(assert (=> b!206497 m!318063))

(declare-fun m!318065 () Bool)

(assert (=> b!206507 m!318065))

(declare-fun m!318067 () Bool)

(assert (=> b!206503 m!318067))

(declare-fun m!318069 () Bool)

(assert (=> b!206502 m!318069))

(declare-fun m!318071 () Bool)

(assert (=> b!206499 m!318071))

(declare-fun m!318073 () Bool)

(assert (=> b!206499 m!318073))

(declare-fun m!318075 () Bool)

(assert (=> b!206504 m!318075))

(declare-fun m!318077 () Bool)

(assert (=> b!206504 m!318077))

(declare-fun m!318079 () Bool)

(assert (=> b!206504 m!318079))

(declare-fun m!318081 () Bool)

(assert (=> b!206504 m!318081))

(assert (=> b!206505 m!318071))

(assert (=> b!206505 m!318073))

(declare-fun m!318083 () Bool)

(assert (=> b!206505 m!318083))

(declare-fun m!318085 () Bool)

(assert (=> b!206493 m!318085))

(assert (=> b!206493 m!318085))

(declare-fun m!318087 () Bool)

(assert (=> b!206493 m!318087))

(declare-fun m!318089 () Bool)

(assert (=> b!206508 m!318089))

(declare-fun m!318091 () Bool)

(assert (=> b!206508 m!318091))

(declare-fun m!318093 () Bool)

(assert (=> b!206508 m!318093))

(declare-fun m!318095 () Bool)

(assert (=> b!206508 m!318095))

(declare-fun m!318097 () Bool)

(assert (=> b!206508 m!318097))

(declare-fun m!318099 () Bool)

(assert (=> b!206508 m!318099))

(declare-fun m!318101 () Bool)

(assert (=> b!206508 m!318101))

(declare-fun m!318103 () Bool)

(assert (=> b!206508 m!318103))

(declare-fun m!318105 () Bool)

(assert (=> b!206508 m!318105))

(declare-fun m!318107 () Bool)

(assert (=> start!43608 m!318107))

(declare-fun m!318109 () Bool)

(assert (=> b!206500 m!318109))

(assert (=> b!206498 m!318061))

(push 1)

