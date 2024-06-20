; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72068 () Bool)

(assert start!72068)

(declare-fun b!323145 () Bool)

(declare-fun res!265268 () Bool)

(declare-fun e!232822 () Bool)

(assert (=> b!323145 (=> (not res!265268) (not e!232822))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!323145 (= res!265268 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!323146 () Bool)

(declare-fun e!232823 () Bool)

(declare-datatypes ((array!20632 0))(
  ( (array!20633 (arr!10072 (Array (_ BitVec 32) (_ BitVec 8))) (size!8980 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14122 0))(
  ( (BitStream!14123 (buf!8122 array!20632) (currentByte!14987 (_ BitVec 32)) (currentBit!14982 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14122)

(declare-fun array_inv!8532 (array!20632) Bool)

(assert (=> b!323146 (= e!232823 (array_inv!8532 (buf!8122 thiss!1793)))))

(declare-fun lt!445799 () (_ BitVec 64))

(declare-fun b!323147 () Bool)

(declare-fun lt!445797 () (_ BitVec 64))

(declare-fun lt!445798 () (_ BitVec 64))

(assert (=> b!323147 (= e!232822 (and (= lt!445797 (bvand lt!445799 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!445797 (bvand (bvadd lt!445798 lt!445799) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!323147 (= lt!445797 (bvand lt!445798 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323147 (= lt!445798 (bitIndex!0 (size!8980 (buf!8122 thiss!1793)) (currentByte!14987 thiss!1793) (currentBit!14982 thiss!1793)))))

(declare-fun b!323149 () Bool)

(declare-fun e!232821 () Bool)

(assert (=> b!323149 (= e!232821 e!232822)))

(declare-fun res!265270 () Bool)

(assert (=> b!323149 (=> (not res!265270) (not e!232822))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323149 (= res!265270 (validate_offset_bits!1 ((_ sign_extend 32) (size!8980 (buf!8122 thiss!1793))) ((_ sign_extend 32) (currentByte!14987 thiss!1793)) ((_ sign_extend 32) (currentBit!14982 thiss!1793)) lt!445799))))

(assert (=> b!323149 (= lt!445799 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!323148 () Bool)

(declare-fun res!265267 () Bool)

(assert (=> b!323148 (=> (not res!265267) (not e!232822))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323148 (= res!265267 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!265269 () Bool)

(assert (=> start!72068 (=> (not res!265269) (not e!232821))))

(assert (=> start!72068 (= res!265269 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72068 e!232821))

(assert (=> start!72068 true))

(declare-fun inv!12 (BitStream!14122) Bool)

(assert (=> start!72068 (and (inv!12 thiss!1793) e!232823)))

(assert (= (and start!72068 res!265269) b!323149))

(assert (= (and b!323149 res!265270) b!323148))

(assert (= (and b!323148 res!265267) b!323145))

(assert (= (and b!323145 res!265268) b!323147))

(assert (= start!72068 b!323146))

(declare-fun m!461319 () Bool)

(assert (=> b!323148 m!461319))

(declare-fun m!461321 () Bool)

(assert (=> b!323149 m!461321))

(declare-fun m!461323 () Bool)

(assert (=> start!72068 m!461323))

(declare-fun m!461325 () Bool)

(assert (=> b!323147 m!461325))

(declare-fun m!461327 () Bool)

(assert (=> b!323146 m!461327))

(push 1)

(assert (not b!323148))

(assert (not b!323146))

(assert (not start!72068))

(assert (not b!323149))

(assert (not b!323147))

(check-sat)

(pop 1)

(push 1)

(check-sat)

