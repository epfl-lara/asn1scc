; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17762 () Bool)

(assert start!17762)

(declare-fun b!86091 () Bool)

(declare-fun res!70699 () Bool)

(declare-fun e!57290 () Bool)

(assert (=> b!86091 (=> (not res!70699) (not e!57290))))

(declare-datatypes ((array!4087 0))(
  ( (array!4088 (arr!2483 (Array (_ BitVec 32) (_ BitVec 8))) (size!1846 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3254 0))(
  ( (BitStream!3255 (buf!2236 array!4087) (currentByte!4442 (_ BitVec 32)) (currentBit!4437 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3254)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!86091 (= res!70699 (validate_offset_bits!1 ((_ sign_extend 32) (size!1846 (buf!2236 thiss!1152))) ((_ sign_extend 32) (currentByte!4442 thiss!1152)) ((_ sign_extend 32) (currentBit!4437 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!86092 () Bool)

(declare-fun e!57291 () Bool)

(declare-fun e!57288 () Bool)

(assert (=> b!86092 (= e!57291 e!57288)))

(declare-fun res!70700 () Bool)

(assert (=> b!86092 (=> (not res!70700) (not e!57288))))

(declare-fun lt!135020 () (_ BitVec 64))

(declare-fun lt!135023 () (_ BitVec 64))

(assert (=> b!86092 (= res!70700 (= lt!135020 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135023)))))

(declare-datatypes ((Unit!5708 0))(
  ( (Unit!5709) )
))
(declare-datatypes ((tuple2!7314 0))(
  ( (tuple2!7315 (_1!3877 Unit!5708) (_2!3877 BitStream!3254)) )
))
(declare-fun lt!135022 () tuple2!7314)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!86092 (= lt!135020 (bitIndex!0 (size!1846 (buf!2236 (_2!3877 lt!135022))) (currentByte!4442 (_2!3877 lt!135022)) (currentBit!4437 (_2!3877 lt!135022))))))

(declare-fun b!86093 () Bool)

(declare-fun e!57296 () Bool)

(assert (=> b!86093 (= e!57296 e!57290)))

(declare-fun res!70695 () Bool)

(assert (=> b!86093 (=> (not res!70695) (not e!57290))))

(declare-fun lt!135019 () (_ BitVec 64))

(assert (=> b!86093 (= res!70695 (= lt!135023 (bvadd lt!135019 ((_ sign_extend 32) i!576))))))

(assert (=> b!86093 (= lt!135023 (bitIndex!0 (size!1846 (buf!2236 thiss!1152)) (currentByte!4442 thiss!1152) (currentBit!4437 thiss!1152)))))

(declare-fun thiss!1151 () BitStream!3254)

(assert (=> b!86093 (= lt!135019 (bitIndex!0 (size!1846 (buf!2236 thiss!1151)) (currentByte!4442 thiss!1151) (currentBit!4437 thiss!1151)))))

(declare-fun res!70690 () Bool)

(assert (=> start!17762 (=> (not res!70690) (not e!57296))))

(assert (=> start!17762 (= res!70690 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17762 e!57296))

(declare-fun e!57295 () Bool)

(declare-fun inv!12 (BitStream!3254) Bool)

(assert (=> start!17762 (and (inv!12 thiss!1152) e!57295)))

(declare-fun e!57293 () Bool)

(assert (=> start!17762 (and (inv!12 thiss!1151) e!57293)))

(assert (=> start!17762 true))

(declare-fun b!86094 () Bool)

(declare-fun array_inv!1692 (array!4087) Bool)

(assert (=> b!86094 (= e!57295 (array_inv!1692 (buf!2236 thiss!1152)))))

(declare-fun b!86095 () Bool)

(declare-fun res!70697 () Bool)

(assert (=> b!86095 (=> (not res!70697) (not e!57288))))

(declare-fun isPrefixOf!0 (BitStream!3254 BitStream!3254) Bool)

(assert (=> b!86095 (= res!70697 (isPrefixOf!0 thiss!1152 (_2!3877 lt!135022)))))

(declare-fun b!86096 () Bool)

(declare-fun e!57292 () Bool)

(assert (=> b!86096 (= e!57292 true)))

(declare-fun v!179 () (_ BitVec 64))

(declare-datatypes ((tuple3!392 0))(
  ( (tuple3!393 (_1!3878 Unit!5708) (_2!3878 BitStream!3254) (_3!220 (_ BitVec 32))) )
))
(declare-fun lt!135024 () tuple3!392)

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3254 (_ BitVec 64) BitStream!3254 (_ BitVec 32)) tuple3!392)

(assert (=> b!86096 (= lt!135024 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3877 lt!135022) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!86097 () Bool)

(declare-fun res!70696 () Bool)

(assert (=> b!86097 (=> (not res!70696) (not e!57296))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!86097 (= res!70696 (invariant!0 (currentBit!4437 thiss!1152) (currentByte!4442 thiss!1152) (size!1846 (buf!2236 thiss!1152))))))

(declare-fun b!86098 () Bool)

(declare-fun res!70689 () Bool)

(assert (=> b!86098 (=> (not res!70689) (not e!57296))))

(assert (=> b!86098 (= res!70689 (validate_offset_bits!1 ((_ sign_extend 32) (size!1846 (buf!2236 thiss!1151))) ((_ sign_extend 32) (currentByte!4442 thiss!1151)) ((_ sign_extend 32) (currentBit!4437 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!86099 () Bool)

(declare-fun e!57297 () Bool)

(declare-datatypes ((tuple2!7316 0))(
  ( (tuple2!7317 (_1!3879 BitStream!3254) (_2!3879 Bool)) )
))
(declare-fun lt!135021 () tuple2!7316)

(assert (=> b!86099 (= e!57297 (= (bitIndex!0 (size!1846 (buf!2236 (_1!3879 lt!135021))) (currentByte!4442 (_1!3879 lt!135021)) (currentBit!4437 (_1!3879 lt!135021))) lt!135020))))

(declare-fun b!86100 () Bool)

(assert (=> b!86100 (= e!57288 e!57297)))

(declare-fun res!70698 () Bool)

(assert (=> b!86100 (=> (not res!70698) (not e!57297))))

(declare-fun lt!135018 () Bool)

(assert (=> b!86100 (= res!70698 (and (= (_2!3879 lt!135021) lt!135018) (= (_1!3879 lt!135021) (_2!3877 lt!135022))))))

(declare-fun readBitPure!0 (BitStream!3254) tuple2!7316)

(declare-fun readerFrom!0 (BitStream!3254 (_ BitVec 32) (_ BitVec 32)) BitStream!3254)

(assert (=> b!86100 (= lt!135021 (readBitPure!0 (readerFrom!0 (_2!3877 lt!135022) (currentBit!4437 thiss!1152) (currentByte!4442 thiss!1152))))))

(declare-fun b!86101 () Bool)

(declare-fun res!70691 () Bool)

(assert (=> b!86101 (=> res!70691 e!57292)))

(assert (=> b!86101 (= res!70691 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!86102 () Bool)

(declare-fun res!70694 () Bool)

(assert (=> b!86102 (=> (not res!70694) (not e!57296))))

(assert (=> b!86102 (= res!70694 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!86103 () Bool)

(declare-fun res!70692 () Bool)

(assert (=> b!86103 (=> (not res!70692) (not e!57290))))

(assert (=> b!86103 (= res!70692 (bvslt i!576 nBits!336))))

(declare-fun b!86104 () Bool)

(declare-fun res!70701 () Bool)

(assert (=> b!86104 (=> (not res!70701) (not e!57296))))

(assert (=> b!86104 (= res!70701 (invariant!0 (currentBit!4437 thiss!1151) (currentByte!4442 thiss!1151) (size!1846 (buf!2236 thiss!1151))))))

(declare-fun b!86105 () Bool)

(assert (=> b!86105 (= e!57293 (array_inv!1692 (buf!2236 thiss!1151)))))

(declare-fun b!86106 () Bool)

(assert (=> b!86106 (= e!57290 (not e!57292))))

(declare-fun res!70688 () Bool)

(assert (=> b!86106 (=> res!70688 e!57292)))

(assert (=> b!86106 (= res!70688 (not (invariant!0 (currentBit!4437 (_2!3877 lt!135022)) (currentByte!4442 (_2!3877 lt!135022)) (size!1846 (buf!2236 (_2!3877 lt!135022))))))))

(assert (=> b!86106 e!57291))

(declare-fun res!70702 () Bool)

(assert (=> b!86106 (=> (not res!70702) (not e!57291))))

(assert (=> b!86106 (= res!70702 (= (size!1846 (buf!2236 thiss!1152)) (size!1846 (buf!2236 (_2!3877 lt!135022)))))))

(declare-fun appendBit!0 (BitStream!3254 Bool) tuple2!7314)

(assert (=> b!86106 (= lt!135022 (appendBit!0 thiss!1152 lt!135018))))

(assert (=> b!86106 (= lt!135018 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!86107 () Bool)

(declare-fun res!70693 () Bool)

(assert (=> b!86107 (=> (not res!70693) (not e!57296))))

(assert (=> b!86107 (= res!70693 (and (bvsle i!576 nBits!336) (= (size!1846 (buf!2236 thiss!1152)) (size!1846 (buf!2236 thiss!1151)))))))

(assert (= (and start!17762 res!70690) b!86098))

(assert (= (and b!86098 res!70689) b!86104))

(assert (= (and b!86104 res!70701) b!86102))

(assert (= (and b!86102 res!70694) b!86097))

(assert (= (and b!86097 res!70696) b!86107))

(assert (= (and b!86107 res!70693) b!86093))

(assert (= (and b!86093 res!70695) b!86091))

(assert (= (and b!86091 res!70699) b!86103))

(assert (= (and b!86103 res!70692) b!86106))

(assert (= (and b!86106 res!70702) b!86092))

(assert (= (and b!86092 res!70700) b!86095))

(assert (= (and b!86095 res!70697) b!86100))

(assert (= (and b!86100 res!70698) b!86099))

(assert (= (and b!86106 (not res!70688)) b!86101))

(assert (= (and b!86101 (not res!70691)) b!86096))

(assert (= start!17762 b!86094))

(assert (= start!17762 b!86105))

(declare-fun m!132053 () Bool)

(assert (=> b!86096 m!132053))

(declare-fun m!132055 () Bool)

(assert (=> b!86105 m!132055))

(declare-fun m!132057 () Bool)

(assert (=> b!86098 m!132057))

(declare-fun m!132059 () Bool)

(assert (=> b!86097 m!132059))

(declare-fun m!132061 () Bool)

(assert (=> b!86093 m!132061))

(declare-fun m!132063 () Bool)

(assert (=> b!86093 m!132063))

(declare-fun m!132065 () Bool)

(assert (=> b!86100 m!132065))

(assert (=> b!86100 m!132065))

(declare-fun m!132067 () Bool)

(assert (=> b!86100 m!132067))

(declare-fun m!132069 () Bool)

(assert (=> b!86092 m!132069))

(declare-fun m!132071 () Bool)

(assert (=> b!86091 m!132071))

(declare-fun m!132073 () Bool)

(assert (=> b!86104 m!132073))

(declare-fun m!132075 () Bool)

(assert (=> b!86106 m!132075))

(declare-fun m!132077 () Bool)

(assert (=> b!86106 m!132077))

(declare-fun m!132079 () Bool)

(assert (=> b!86099 m!132079))

(declare-fun m!132081 () Bool)

(assert (=> b!86094 m!132081))

(declare-fun m!132083 () Bool)

(assert (=> b!86095 m!132083))

(declare-fun m!132085 () Bool)

(assert (=> start!17762 m!132085))

(declare-fun m!132087 () Bool)

(assert (=> start!17762 m!132087))

(push 1)

