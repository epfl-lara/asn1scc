; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36670 () Bool)

(assert start!36670)

(declare-fun res!140062 () Bool)

(declare-fun e!116902 () Bool)

(assert (=> start!36670 (=> (not res!140062) (not e!116902))))

(declare-fun nBits!600 () (_ BitVec 32))

(declare-datatypes ((array!8742 0))(
  ( (array!8743 (arr!4801 (Array (_ BitVec 32) (_ BitVec 8))) (size!3880 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6916 0))(
  ( (BitStream!6917 (buf!4332 array!8742) (currentByte!8196 (_ BitVec 32)) (currentBit!8191 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6916)

(assert (=> start!36670 (= res!140062 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3880 (buf!4332 thiss!1894))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8196 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8191 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3880 (buf!4332 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8196 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8191 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!36670 e!116902))

(assert (=> start!36670 true))

(declare-fun e!116903 () Bool)

(declare-fun inv!12 (BitStream!6916) Bool)

(assert (=> start!36670 (and (inv!12 thiss!1894) e!116903)))

(declare-fun b!168280 () Bool)

(declare-fun res!140063 () Bool)

(assert (=> b!168280 (=> (not res!140063) (not e!116902))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168280 (= res!140063 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8191 thiss!1894))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8196 thiss!1894))) ((_ extract 31 0) ((_ sign_extend 32) (size!3880 (buf!4332 thiss!1894))))))))

(declare-fun b!168281 () Bool)

(assert (=> b!168281 (= e!116902 (bvslt ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!168282 () Bool)

(declare-fun array_inv!3621 (array!8742) Bool)

(assert (=> b!168282 (= e!116903 (array_inv!3621 (buf!4332 thiss!1894)))))

(assert (= (and start!36670 res!140062) b!168280))

(assert (= (and b!168280 res!140063) b!168281))

(assert (= start!36670 b!168282))

(declare-fun m!267921 () Bool)

(assert (=> start!36670 m!267921))

(declare-fun m!267923 () Bool)

(assert (=> b!168280 m!267923))

(declare-fun m!267925 () Bool)

(assert (=> b!168282 m!267925))

(push 1)

(assert (not start!36670))

(assert (not b!168280))

(assert (not b!168282))

(check-sat)

