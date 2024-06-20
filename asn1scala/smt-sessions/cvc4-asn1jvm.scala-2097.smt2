; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53244 () Bool)

(assert start!53244)

(declare-fun b!247297 () Bool)

(declare-fun e!171299 () Bool)

(declare-fun e!171296 () Bool)

(assert (=> b!247297 (= e!171299 (not e!171296))))

(declare-fun res!206952 () Bool)

(assert (=> b!247297 (=> res!206952 e!171296)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!247297 (= res!206952 (not (= nBits!297 from!289)))))

(declare-datatypes ((array!13473 0))(
  ( (array!13474 (arr!6894 (Array (_ BitVec 32) (_ BitVec 8))) (size!5907 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10736 0))(
  ( (BitStream!10737 (buf!6391 array!13473) (currentByte!11793 (_ BitVec 32)) (currentBit!11788 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10736)

(declare-fun isPrefixOf!0 (BitStream!10736 BitStream!10736) Bool)

(assert (=> b!247297 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17932 0))(
  ( (Unit!17933) )
))
(declare-fun lt!385809 () Unit!17932)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10736) Unit!17932)

(assert (=> b!247297 (= lt!385809 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247298 () Bool)

(declare-fun e!171298 () Bool)

(declare-fun array_inv!5648 (array!13473) Bool)

(assert (=> b!247298 (= e!171298 (array_inv!5648 (buf!6391 thiss!1005)))))

(declare-fun b!247299 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!247299 (= e!171296 (invariant!0 (currentBit!11788 thiss!1005) (currentByte!11793 thiss!1005) (size!5907 (buf!6391 thiss!1005))))))

(declare-fun b!247300 () Bool)

(declare-fun res!206951 () Bool)

(assert (=> b!247300 (=> (not res!206951) (not e!171299))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247300 (= res!206951 (validate_offset_bits!1 ((_ sign_extend 32) (size!5907 (buf!6391 thiss!1005))) ((_ sign_extend 32) (currentByte!11793 thiss!1005)) ((_ sign_extend 32) (currentBit!11788 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!206950 () Bool)

(assert (=> start!53244 (=> (not res!206950) (not e!171299))))

(assert (=> start!53244 (= res!206950 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53244 e!171299))

(assert (=> start!53244 true))

(declare-fun inv!12 (BitStream!10736) Bool)

(assert (=> start!53244 (and (inv!12 thiss!1005) e!171298)))

(declare-fun b!247301 () Bool)

(declare-fun res!206949 () Bool)

(assert (=> b!247301 (=> (not res!206949) (not e!171299))))

(assert (=> b!247301 (= res!206949 (bvsge from!289 nBits!297))))

(assert (= (and start!53244 res!206950) b!247300))

(assert (= (and b!247300 res!206951) b!247301))

(assert (= (and b!247301 res!206949) b!247297))

(assert (= (and b!247297 (not res!206952)) b!247299))

(assert (= start!53244 b!247298))

(declare-fun m!373043 () Bool)

(assert (=> b!247297 m!373043))

(declare-fun m!373045 () Bool)

(assert (=> b!247297 m!373045))

(declare-fun m!373047 () Bool)

(assert (=> b!247298 m!373047))

(declare-fun m!373049 () Bool)

(assert (=> b!247299 m!373049))

(declare-fun m!373051 () Bool)

(assert (=> start!53244 m!373051))

(declare-fun m!373053 () Bool)

(assert (=> b!247300 m!373053))

(push 1)

(assert (not start!53244))

(assert (not b!247297))

(assert (not b!247298))

(assert (not b!247300))

(assert (not b!247299))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82846 () Bool)

(assert (=> d!82846 (= (invariant!0 (currentBit!11788 thiss!1005) (currentByte!11793 thiss!1005) (size!5907 (buf!6391 thiss!1005))) (and (bvsge (currentBit!11788 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11788 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11793 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11793 thiss!1005) (size!5907 (buf!6391 thiss!1005))) (and (= (currentBit!11788 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11793 thiss!1005) (size!5907 (buf!6391 thiss!1005)))))))))

(assert (=> b!247299 d!82846))

(declare-fun d!82852 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!82852 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5907 (buf!6391 thiss!1005))) ((_ sign_extend 32) (currentByte!11793 thiss!1005)) ((_ sign_extend 32) (currentBit!11788 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5907 (buf!6391 thiss!1005))) ((_ sign_extend 32) (currentByte!11793 thiss!1005)) ((_ sign_extend 32) (currentBit!11788 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20975 () Bool)

(assert (= bs!20975 d!82852))

(declare-fun m!373057 () Bool)

(assert (=> bs!20975 m!373057))

(assert (=> b!247300 d!82852))

(declare-fun d!82854 () Bool)

(assert (=> d!82854 (= (array_inv!5648 (buf!6391 thiss!1005)) (bvsge (size!5907 (buf!6391 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!247298 d!82854))

(declare-fun d!82856 () Bool)

(assert (=> d!82856 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11788 thiss!1005) (currentByte!11793 thiss!1005) (size!5907 (buf!6391 thiss!1005))))))

(declare-fun bs!20976 () Bool)

(assert (= bs!20976 d!82856))

(assert (=> bs!20976 m!373049))

(assert (=> start!53244 d!82856))

(declare-fun d!82858 () Bool)

(declare-fun res!206978 () Bool)

(declare-fun e!171316 () Bool)

(assert (=> d!82858 (=> (not res!206978) (not e!171316))))

(assert (=> d!82858 (= res!206978 (= (size!5907 (buf!6391 thiss!1005)) (size!5907 (buf!6391 thiss!1005))))))

(assert (=> d!82858 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!171316)))

(declare-fun b!247326 () Bool)

(declare-fun res!206979 () Bool)

(assert (=> b!247326 (=> (not res!206979) (not e!171316))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247326 (= res!206979 (bvsle (bitIndex!0 (size!5907 (buf!6391 thiss!1005)) (currentByte!11793 thiss!1005) (currentBit!11788 thiss!1005)) (bitIndex!0 (size!5907 (buf!6391 thiss!1005)) (currentByte!11793 thiss!1005) (currentBit!11788 thiss!1005))))))

