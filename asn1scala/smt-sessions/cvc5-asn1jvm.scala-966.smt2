; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27300 () Bool)

(assert start!27300)

(declare-fun b!140185 () Bool)

(declare-fun e!93429 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((array!6393 0))(
  ( (array!6394 (arr!3600 (Array (_ BitVec 32) (_ BitVec 8))) (size!2893 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6393)

(assert (=> b!140185 (= e!93429 (bvsge from!447 (size!2893 arr!237)))))

(declare-fun b!140187 () Bool)

(declare-fun res!116876 () Bool)

(assert (=> b!140187 (=> (not res!116876) (not e!93429))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((BitStream!5044 0))(
  ( (BitStream!5045 (buf!3314 array!6393) (currentByte!6156 (_ BitVec 32)) (currentBit!6151 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5044)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140187 (= res!116876 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2893 (buf!3314 thiss!1634))) ((_ sign_extend 32) (currentByte!6156 thiss!1634)) ((_ sign_extend 32) (currentBit!6151 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140188 () Bool)

(declare-fun e!93427 () Bool)

(declare-fun array_inv!2682 (array!6393) Bool)

(assert (=> b!140188 (= e!93427 (array_inv!2682 (buf!3314 thiss!1634)))))

(declare-fun b!140189 () Bool)

(declare-fun res!116877 () Bool)

(assert (=> b!140189 (=> (not res!116877) (not e!93429))))

(assert (=> b!140189 (= res!116877 (bvslt from!447 to!404))))

(declare-fun res!116875 () Bool)

(assert (=> start!27300 (=> (not res!116875) (not e!93429))))

(assert (=> start!27300 (= res!116875 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2893 arr!237))))))

(assert (=> start!27300 e!93429))

(assert (=> start!27300 true))

(assert (=> start!27300 (array_inv!2682 arr!237)))

(declare-fun inv!12 (BitStream!5044) Bool)

(assert (=> start!27300 (and (inv!12 thiss!1634) e!93427)))

(declare-fun b!140186 () Bool)

(declare-fun res!116878 () Bool)

(assert (=> b!140186 (=> (not res!116878) (not e!93429))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140186 (= res!116878 (invariant!0 (currentBit!6151 thiss!1634) (currentByte!6156 thiss!1634) (size!2893 (buf!3314 thiss!1634))))))

(assert (= (and start!27300 res!116875) b!140187))

(assert (= (and b!140187 res!116876) b!140189))

(assert (= (and b!140189 res!116877) b!140186))

(assert (= (and b!140186 res!116878) b!140185))

(assert (= start!27300 b!140188))

(declare-fun m!215993 () Bool)

(assert (=> b!140187 m!215993))

(declare-fun m!215995 () Bool)

(assert (=> b!140188 m!215995))

(declare-fun m!215997 () Bool)

(assert (=> start!27300 m!215997))

(declare-fun m!215999 () Bool)

(assert (=> start!27300 m!215999))

(declare-fun m!216001 () Bool)

(assert (=> b!140186 m!216001))

(push 1)

(assert (not b!140186))

(assert (not b!140187))

(assert (not start!27300))

(assert (not b!140188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

